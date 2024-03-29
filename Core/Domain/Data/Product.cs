﻿namespace LudyCakeShop.Core.Domain.Data
{
    public class Product
    {
        public string ProductID { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public int QuantityAvailable { get; set; }
        public decimal UnitPrice { get; set; }
        public bool Discontinued { get; set; }
        public string QuantityPerUnit { get; set; }
        public string CategoryID { get; set; }
        public byte[] ProductImage { get; set; }
    }
}
