﻿using System;
using System.Collections.Generic;

namespace LudyCakeShop.Core.Domain.Data
{
    public class DatasourceParameter
    {
        public string StoredProcedure { get; set; }
        public IEnumerable<StoredProcedureParameter> StoredProcedureParameters { get; set; }
        public Type ClassType { get; set; }
    }
}
