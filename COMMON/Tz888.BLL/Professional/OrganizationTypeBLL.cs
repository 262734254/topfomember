using System;
using System.Collections.Generic;
using System.Text;
using Tz888.IDAL.Professional;
using Tz888.Model.Professional;
using System.Data;
using Tz888.DALFactory;
namespace Tz888.BLL.Professional
{
    public class OrganizationTypeBLL
    {
        OrganizationTypeIDAL dal = DataAccess.CreateOrganizationInfo();
        public DataSet GetList(string strWhere)
        {
            return dal.GetList(strWhere);
        }
    }
}
