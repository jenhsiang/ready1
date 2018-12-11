package com.shopping.springmvc.pojo;

import java.util.Date;
import java.util.List;

public class Order_main {
     private Integer o_id;
	 
	 private Integer u_id;
	 
	 private Integer pay;
	 
	 private Date createtime;
	    
	 private Date updatetime;
	 
	 private List<Order_detail> order_detailList;
	 
	 public Integer getO_id() {
	        return o_id;
	    }

	 public void setO_id(Integer o_id) {
	        this.o_id = o_id;
	    }
	 public Integer getU_id() {
	        return u_id;
	    }

	 public void setU_id(Integer u_id) {
	        this.u_id = u_id;
	    }
	 public Integer getPay() {
	        return pay;
	    }

	 public void setPay(Integer pay) {
	        this.pay = pay;
	    }
	 public Date getCreatetime() {
	        return createtime;
	    }

	    public void setCreatetime(Date createtime) {
	        this.createtime = createtime;
	    }
	    
	    public Date getUpdatetime() {
	        return updatetime;
	    }

	    public void setUpdatetime(Date updatetime) {
	        this.updatetime = updatetime;
	    }
	    
	    public List<Order_detail> getOrder_detailList() {
			return order_detailList;
		}
		public void setOrder_detailList(List<Order_detail> order_detailList) {
			this.order_detailList = order_detailList;
		}
}
