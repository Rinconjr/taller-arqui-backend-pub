using MassTransit;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using CommunWork.Mensajes; // Importar la clase de mensaje desde CommonWork

[ApiController]
[Route("api/messages")]
public class MessagesController : ControllerBase
{
    private readonly IPublishEndpoint _publishEndpoint;

    public MessagesController(IPublishEndpoint publishEndpoint)
    {
        _publishEndpoint = publishEndpoint;
    }

    [HttpPost]
    public async Task<IActionResult> SendMessage([FromBody] MyMessage message)
    {
        if (message == null || string.IsNullOrEmpty(message.Text) || string.IsNullOrEmpty(message.Topic))
        {
            return BadRequest(new { message = "El mensaje y el t�pico no pueden estar vac�os." });
        }

        // Publicar el mensaje en RabbitMQ usando la clave de enrutamiento (t�pico)
        await _publishEndpoint.Publish(message, context =>
        {
            context.SetRoutingKey(message.Topic); // Asigna la clave de enrutamiento basada en el t�pico
        });

        return Ok(new { message = "Mensaje enviado correctamente al t�pico: " + message.Topic });
    }
}
