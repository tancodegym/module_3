package model.bean;

public class AttachService {
    private int id;
    private String attach_service_name;
    private double cost;
    private int unit;
    private String status;

    public AttachService(int id, String attach_service_name, double cost, int unit, String status) {
        this.id = id;
        this.attach_service_name = attach_service_name;
        this.cost = cost;
        this.unit = unit;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAttach_service_name() {
        return attach_service_name;
    }

    public void setAttach_service_name(String attach_service_name) {
        this.attach_service_name = attach_service_name;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getUnit() {
        return unit;
    }

    public void setUnit(int unit) {
        this.unit = unit;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
