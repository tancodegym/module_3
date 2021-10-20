package model.service.implement;

import model.bean.Employee;
import model.responsitory.IEmployeeResponsitory;
import model.responsitory.implement.EmployeeResponsitoryImplement;
import model.service.IEmployeeService;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImplement implements IEmployeeService {
    private IEmployeeResponsitory iEmployeeResponsitory = new EmployeeResponsitoryImplement();
    @Override
    public List<Employee> findAll() {
        return iEmployeeResponsitory.findAll();
    }

    @Override
    public Map<String,String> save(Employee employee) {
        Map<String, String> mapMessage = new HashMap<>();
        if(Validate.validateName(employee.getName())!=null||
                Validate.validateSalary(employee.getEmployee_salary())!=null||
                Validate.validateDateOfBirth(employee.getBirthday())!=null||
                Validate.validateIdCard(employee.getIdCard())!=null||
                Validate.validateAddress(employee.getAddress())!=null||
                Validate.validateEmail(employee.getEmail())!=null||
                Validate.validateNumberPhone(employee.getPhone())!=null){
            mapMessage.put("birthday",Validate.validateDateOfBirth(employee.getBirthday()));
            mapMessage.put("name",Validate.validateName(employee.getName()));
            mapMessage.put("email",Validate.validateEmail(employee.getEmail()));
            mapMessage.put("idCard",Validate.validateIdCard(employee.getIdCard()));
            mapMessage.put("phone",Validate.validateNumberPhone(employee.getPhone()));
            mapMessage.put("address",Validate.validateAddress(employee.getAddress()));
            mapMessage.put("salary",Validate.validateSalary(employee.getEmployee_salary()));
        }else{
            iEmployeeResponsitory.save(employee);
        }
        return  mapMessage;

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

    @Override
    public void removeAll(String allIdEmployee) {
        iEmployeeResponsitory.removeAll(allIdEmployee);
    }
}
