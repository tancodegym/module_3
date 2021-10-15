package model.service.implement;

import model.bean.Employee;
import model.responsitory.IEmployeeResponsitory;
import model.responsitory.implement.EmployeeResponsitoryImplement;
import model.service.IEmployeeService;

import java.util.List;

public class EmployeeServiceImplement implements IEmployeeService {
    private IEmployeeResponsitory iEmployeeResponsitory = new EmployeeResponsitoryImplement();
    @Override
    public List<Employee> findAll() {
        return iEmployeeResponsitory.findAll();
    }

    @Override
    public void save(Employee employee) {
        iEmployeeResponsitory.save(employee);
    }

    @Override
    public Employee findById(String id) {
        return iEmployeeResponsitory.findById(id);
    }

    @Override
    public void remove(String id) {
        iEmployeeResponsitory.remove(id);
    }

    @Override
    public Employee getEmployeeById(String id) {
        return iEmployeeResponsitory.getEmployeeById(id);
    }

    @Override
    public void updateEmployee(Employee employee) {
        iEmployeeResponsitory.updateEmployee(employee);
    }

    @Override
    public List<String> getPropertyList(Employee employee) {
        return iEmployeeResponsitory.getPropertyList(employee);

    }

    @Override
    public List<Employee> findEmployee(int keySearch, String valueSearch) {
        return iEmployeeResponsitory.findEmployee(keySearch,valueSearch);
    }
}
