﻿using LudyCakeShop.Core.Domain.Data;
using System.Collections.Generic;

namespace LudyCakeShop.Core.Infrastructure
{
    public interface ISQLManager
    {
        public T Select<T>(DatasourceParameter datasourceParameter);
        public IEnumerable<T> SelectAll<T>(DatasourceParameter datasourceParameter);
        public bool DeleteTransaction(IEnumerable<DatasourceParameter> datasourceParameters);
        public bool DeleteAll(string storedProcedure);
        public bool UpsertTransaction(IEnumerable<DatasourceParameter> datasourceParameters);
    }
}
