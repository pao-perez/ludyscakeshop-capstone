﻿namespace LudyCakeShop.Core.Domain.Data
{
    public class OrderItem
    {
        public string OrderID { get; set; }
        public string ProductID { get; set; }
        public int ItemQuantity { get; set; }
        public decimal ItemTotal { get; set; }
    }
}
