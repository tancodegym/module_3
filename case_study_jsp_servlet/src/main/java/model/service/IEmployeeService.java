package model.service;

import model.bean.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();
    void save(Employee employee);
    Employee findById(String id);
    void remove(String id);

    Employee getEmployeeById(String id);

    void updateEmployee(Employee employee);

    List<String> getPropertyList(Employee employee);

    List<Employee> findEmployee(int keySearch, String valueSearch);
}
