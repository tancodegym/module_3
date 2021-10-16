package model.bean;

public class CustomerUsing {
    private String customer_id;

    private int contract_id;
    private int contract_detail_id;
    private int attach_service_id;

    public CustomerUsing(String customer_id,  int contract_id, int contract_detail_id, int attach_service_id) {
        this.customer_id = customer_id;
        this.contract_id = contract_id;
        this.contract_detail_id = contract_detail_id;
        this.attach_service_id = attach_service_id;
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
