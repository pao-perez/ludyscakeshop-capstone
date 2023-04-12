﻿using LudyCakeShop.Domain;
using LudyCakeShop.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;

namespace LudyCakeShop.Controllers
{
    [Route("api/orders/history")]
    [ApiController]
    public class OrderHistoryController : ControllerBase
    {
        private readonly LCS _requestDirector;

        public OrderHistoryController() =>
            _requestDirector = new();

        [HttpGet("{customerEmail}")]
        [Produces("application/json")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(Order))]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public IActionResult Get(string customerEmail)
        {
            try
            {
                return StatusCode(200, _requestDirector.GetOrdersByCustomerEmail(customerEmail));
            }
            catch (Exception)
            {
                // TODO: log exception
                return StatusCode(500, "Server Error. The server is unable to fulfill your request at this time.");
            }
        }
    }
}