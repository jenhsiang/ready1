package com.shopping.springmvc.pojo;

import java.util.Date;

public class Order_detail {
	 private Integer d_id;
	 
	 private Integer o_id;
	 
	 private Integer b_id;
	 
	 private String b_name;
	 
	 private Integer b_price;
	 
	 private Integer b_count;
	 
	 private Date createtime;
	    
	 private Date updatetime;

	 public Integer getD_id() {
	        return d_id;
	    }

	 public void setD_id(Integer d_id) {
	        this.d_id = d_id;
	    }
	 public Integer getO_id() {
	        return o_id;
	    }

	 public void setO_id(Integer o_id) {
	        this.o_id = o_id;
	    }
	 public Integer getB_id() {
	        return b_id;
	    }

	 public void setB_id(Integer b_id) {
	        this.b_id = b_id;
	    }
	 public String getB_name() {
	        return b_name;
	    }

	 public void setB_name(String b_name) {
	        this.b_name = b_name;
	    }
	 public Integer getB_price() {
	        return b_price;
	    }

	 public void setB_price(Integer b_price) {
	        this.b_price = b_price;
	    }
	 public Integer getB_count() {
	        return b_count;
	    }

	 public void setB_count(Integer b_count) {
	        this.b_count = b_count;
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

}
