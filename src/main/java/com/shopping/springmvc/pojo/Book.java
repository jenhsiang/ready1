package com.shopping.springmvc.pojo;

public class Book {
    private Integer b_id;

    private String b_name;

   private Integer b_price;

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
        this.b_name = b_name == null ? null : b_name.trim();
    }
    
    public Integer getB_price() {
        return b_price;
    }

    public void setB_price(Integer b_price) {
        this.b_price = b_price;
    }

    
}