package model.bean;

public class Contract {
    private int contract_id;
    private String start_date;
    private String end_date;
    private double contract_deposit;
    private double total_money;
    private String employee_id;
    private String customer_id;
    private String service_id;

    public Contract() {
    }

    public Contract(int contract_id, String start_date, String end_date, double contract_deposit,
                    double total_money, String employee_id, String customer_id, String service_id) {
        this.contract_id = contract_id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.contract_deposit = contract_deposit;
        this.total_money = total_money;
        this.employee_id = employee_id;
        this.customer_id = customer_id;
        this.service_id = service_id;
    }
    public Contract(String start_date, String end_date, double contract_deposit,
                     String employee_id, String customer_id, String service_id) {
        this.start_date = start_date;
        this.end_date = end_date;
        this.contract_deposit = contract_deposit;
        this.employee_id = employee_id;
        this.customer_id = customer_id;
        this.service_id = service_id;
    }
    public Contract(String start_date, String end_date, double contract_deposit,
                    double total_money, String employee_id, String customer_id, String service_id) {
        this.start_date = start_date;
        this.end_date = end_date;
        this.contract_deposit = contract_deposit;
        this.total_money = total_money;
        this.employee_id = employee_id;
        this.customer_id = customer_id;
        this.service_id = service_id;
    }

    public int getContract_id() {
        return contract_id;
    }

    public void setContract_id(int contract_id) {
        this.contract_id = contract_id;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public double getContract_deposit() {
        return contract_deposit;
    }

    public void setContract_deposit(double contract_deposit) {
        this.contract_deposit = contract_deposit;
    }

    public double getTotal_money() {
        return total_money;
    }

    public void setTotal_money(double total_money) {
        this.total_money = total_money;
    }

    public String getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(String employee_id) {
        this.employee_id = employee_id;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getService_id() {
        return service_id;
    }

    public void setService_id(String service_id) {
        this.service_id = service_id;
    }
}
