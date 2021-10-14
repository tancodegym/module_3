package model.bean;

public class Employee  extends Person{
    private double employee_salary;
    private int position_id;
    private int education_degree_id;
    private int division_id;
    private String username;

    public Employee() {
    }

    public Employee(int id, String name, String birthday, int gender,
                    String idCard, String phone, String email, String address,
                    double employee_salary, int position_id, int education_degree_id,
                    int division_id, String username) {
        super(id, name, birthday, gender, idCard, phone, email, address);
        this.employee_salary = employee_salary;
        this.position_id = position_id;
        this.education_degree_id = education_degree_id;
        this.division_id = division_id;
        this.username = username;
    }

    public double getEmployee_salary() {
        return employee_salary;
    }

    public void setEmployee_salary(double employee_salary) {
        this.employee_salary = employee_salary;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public int getEducation_degree_id() {
        return education_degree_id;
    }

    public void setEducation_degree_id(int education_degree_id) {
        this.education_degree_id = education_degree_id;
    }

    public int getDivision_id() {
        return division_id;
    }

    public void setDivision_id(int division_id) {
        this.division_id = division_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
