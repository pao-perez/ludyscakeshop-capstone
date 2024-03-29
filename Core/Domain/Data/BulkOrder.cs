﻿namespace LudyCakeShop.Core.Domain.Data
{
    public class BulkOrder : BaseOrder
    {
        public string BulkOrderStatus { get; set; }
        public string CompanyName { get; set; }
        public string CompanyAddress { get; set; }
        public string CompanyEmail { get; set; }
        public string CompanyContactNumber { get; set; }
        public string CompanyContactPerson { get; set; }
    }
}
