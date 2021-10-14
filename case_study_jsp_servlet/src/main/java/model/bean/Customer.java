package model.bean;

import java.lang.reflect.Field;

public class Customer  extends Person{
    private int customer_type_id;

    public Customer() {
    }
    public Customer(int id) {
        super(id);
    }

    public Customer(int id, String name, String birthday, int gender,
                    String idCard, String phone, String email, String address, int customer_type_id) {
        super(id, name, birthday, gender, idCard, phone, email, address);
        this.customer_type_id = customer_type_id;
    }
    public Customer( String name, String birthday, int gender,
                    String idCard, String phone, String email, String address, int customer_type_id) {
        super( name, birthday, gender, idCard, phone, email, address);
        this.customer_type_id = customer_type_id;
    }
    public int getCustomer_type_id() {
        return customer_type_id;
    }

    public void setCustomer_type_id(int customer_type_id) {
        this.customer_type_id = customer_type_id;
    }
//
}
