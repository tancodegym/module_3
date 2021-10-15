package model.bean;

public class ServiceType {
    private int service_type_id;
    private String service_name;

    public ServiceType(int service_type_id, String service_name) {
        this.service_type_id = service_type_id;
        this.service_name = service_name;
    }

    public ServiceType() {
    }

    public int getService_type_id() {
        return service_type_id;
    }

    public void setService_type_id(int service_type_id) {
        this.service_type_id = service_type_id;
    }

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }
}
