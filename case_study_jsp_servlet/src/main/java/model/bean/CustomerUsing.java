package model.bean;

public class CustomerUsing {
    private String customer_id;
    private String customer_name;
    private int contract_id;
    private String start_date;
    private int contract_detail_id;
    private int attach_service_id;
    private String attach_service_name;

    public CustomerUsing(String customer_id, String customer_name,
                         int contract_id,String start_date, int contract_detail_id, int attach_service_id,String attach_service_name) {
        this.customer_id = customer_id;
        this.customer_name = customer_name;
        this.contract_id = contract_id;
        this.start_date=start_date;
        this.contract_detail_id = contract_detail_id;
        this.attach_service_id = attach_service_id;
        this.attach_service_name=attach_service_name;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getAttach_service_name() {
        return attach_service_name;
    }

    public void setAttach_service_name(String attach_service_name) {
        this.attach_service_name = attach_service_name;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public int getContract_id() {
        return contract_id;
    }

    public void setContract_id(int contract_id) {
        this.contract_id = contract_id;
    }

    public int getContract_detail_id() {
        return contract_detail_id;
    }

    public void setContract_detail_id(int contract_detail_id) {
        this.contract_detail_id = contract_detail_id;
    }

    public int getAttach_service_id() {
        return attach_service_id;
    }

    public void setAttach_service_id(int attach_service_id) {
        this.attach_service_id = attach_service_id;
    }
}
