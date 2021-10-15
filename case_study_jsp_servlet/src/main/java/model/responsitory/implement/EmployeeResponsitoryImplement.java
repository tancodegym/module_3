package model.responsitory.implement;

import model.bean.Customer;
import model.bean.Employee;
import model.responsitory.DBConnection;
import model.responsitory.IEmployeeResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class EmployeeResponsitoryImplement implements IEmployeeResponsitory {
    private static final String SELECT_ALL_EMPLOYEE = "select * from employee ";
    private static final String INSERT_NEW_EMPLOYEE = "  INSERT INTO employee (employee_id, employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id, username)" +
            "  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String DELETE_EMPLOYEE = "delete from employee where employee_id = ?;";
    private static final String SELECT_EMPLOYEE = "SELECT*FROM employee " +
            "where employee_id=?;";

    private static final String UPDATE_EMPLOYEE = "update employee " +
            "set employee_name=?,employee_birthday=?,employee_id_card=?,employee_salary=?,employee_phone=?,employee_email=?, " +
            "employee_address=?,position_id=?,education_degree_id=?,division_id=?,username=? " +
            " where employee_id=? ;";
    private static String SEARCH_EMPLOYEE = "SELECT* FROM employee " +
            "where";

    @Override
    public List<Employee> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Employee> employeeList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
                resultSet = statement.executeQuery();
                Employee employee = null;
                while (resultSet.next()) {
                    String id = resultSet.getString("employee_id");
                    String name = resultSet.getString("employee_name");
                    String birthday = resultSet.getString("customer_birthday");
                    String idCard = resultSet.getString("employee_id_card");
                    double salary = resultSet.getInt("employee_salary");
                    String phone = resultSet.getString("employee_phone");
                    String email = resultSet.getString("employee_email");
                    String address = resultSet.getString("employee_address");
                    int position_id = resultSet.getInt("position_id");
                    int education_degree_id = resultSet.getInt("education_degree_id");
                    int division_id = resultSet.getInt("division_id");
                    String username = resultSet.getString("username");
                    employee = new Employee(id, name, birthday, idCard, phone, email, address,
                            salary, position_id, education_degree_id, division_id, username);
                    employeeList.add(employee);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return employeeList;
    }
    public String getEmployeeId(List<Employee> employeeList) {
        String idEmployee = "";
        List<String> idList = new ArrayList<>();
        for (int i = 0; i < employeeList.size(); i++) {
            idList.add(employeeList.get(i).getId());
        }
        List<Integer> integerList = new ArrayList<>();
        for (String string : idList) {
            String[] array = string.split("-");
            integerList.add(Integer.valueOf(array[1]));
        }
        Collections.sort(integerList);
        if (integerList.get(integerList.size() - 1) > 998) {
            idEmployee += "NV-" + (integerList.get(integerList.size() - 1) + 1);
        }
        if (integerList.get(integerList.size() - 1) > 98) {
            idEmployee += "NV-0" + (integerList.get(integerList.size() - 1) + 1);
        } else if (integerList.get(integerList.size() - 1) > 8) {
            idEmployee += "NV-00" + (integerList.get(integerList.size() - 1) + 1);
        } else if (integerList.get(integerList.size() - 1) > 0) {
            idEmployee += "NV-000" + (integerList.get(integerList.size() - 1) + 1);
        }

        return idEmployee;
    }

    @Override
    public void save(Employee employee) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        List<Employee> employeeList = findAll();
        String idEmployee = getEmployeeId(employeeList);
        if (connection != null) {
            try {

                statement = connection.prepareStatement(INSERT_NEW_EMPLOYEE);
                statement.setString(1, idEmployee);
                statement.setString(2, employee.getName());
                statement.setString(3, employee.getBirthday());
                statement.setString(4, employee.getIdCard());
                statement.setDouble(5,employee.getEmployee_salary());
                statement.setString(6, employee.getPhone());
                statement.setString(7, employee.getEmail());
                statement.setString(8, employee.getAddress());
                statement.setInt(9,employee.getPosition_id());
                statement.setInt(10,employee.getEducation_degree_id());
                statement.setInt(11,employee.getDivision_id());
                statement.setString(12,employee.getUsername());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public Employee findById(String id) {
        return null;
    }

    @Override
    public void remove(String id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(DELETE_EMPLOYEE);
                statement.setString(1, id);
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();

            }

        }
    }

    @Override
    public Employee getEmployeeById(String id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Employee employee = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_EMPLOYEE);
                statement.setString(1, id);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    String name = resultSet.getString("employee_name");
                    String birthday = resultSet.getString("customer_birthday");
                    String idCard = resultSet.getString("employee_id_card");
                    double salary = resultSet.getInt("employee_salary");
                    String phone = resultSet.getString("employee_phone");
                    String email = resultSet.getString("employee_email");
                    String address = resultSet.getString("employee_address");
                    int position_id = resultSet.getInt("position_id");
                    int education_degree_id = resultSet.getInt("education_degree_id");
                    int division_id = resultSet.getInt("division_id");
                    String username = resultSet.getString("username");
                    employee = new Employee(id, name, birthday, idCard, phone, email, address,
                            salary, position_id, education_degree_id, division_id, username);

                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }

        }
        return employee;
    }

    @Override
    public void updateEmployee(Employee employee) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UPDATE_EMPLOYEE);
                statement.setString(1, employee.getId());
                statement.setString(2, employee.getName());
                statement.setString(3, employee.getBirthday());
                statement.setString(4, employee.getIdCard());
                statement.setDouble(5,employee.getEmployee_salary());
                statement.setString(6, employee.getPhone());
                statement.setString(7, employee.getEmail());
                statement.setString(8, employee.getAddress());
                statement.setInt(9,employee.getPosition_id());
                statement.setInt(10,employee.getEducation_degree_id());
                statement.setInt(11,employee.getDivision_id());
                statement.setString(12,employee.getUsername());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();

            }

        }
    }

    @Override
    public List<String> getPropertyList(Employee employee) {
        return null;
    }

    @Override
    public List<Employee> findEmployee(int keySearch, String valueSearch) {
        SEARCH_EMPLOYEE = "SELECT* FROM employee " +
                "where";
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Employee> employeeList = new ArrayList<>();
        String property = "";
        int customer_type_id=0;
        int gen=-1;
        switch (keySearch) {
            case 1:
                property="customer_id";
                break;
            case 9:
                property ="customer_type_id";
                switch (valueSearch){
                    case "Platinium":
                        customer_type_id= 2;
                        break;
                    case "Diamond" :
                        customer_type_id = 1;
                        break;
                    case "Gold":
                        customer_type_id=3;
                        break;
                    case "Silver":
                        customer_type_id=4;
                        break;
                    case "Member":
                        customer_type_id=5;
                        break;
                }
                break;
            case 2:
                property ="customer_name";
                break;
            case 3:
                property="customer_birthday";
                break;
            case 4:
                property="customer_gender";
                switch (valueSearch){
                    case "Male":
                        gen=1;
                        break;
                    case "Female":
                        gen = 0;
                        break;
                    case "Other":
                        gen = 2;
                        break;
                }
                break;
            case 5:
                property="customer_id_card";
                break;
            case 6:
                property = "customer_phone";
                break;
            case 7:
                property="customer_email";
                break;
            case 8:
                property="customer_address";
                break;
            default:
                break;
        }
        SEARCH_EMPLOYEE += " "+property + "="+"?" + " ;" ;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SEARCH_EMPLOYEE);
                switch (property){
                    case "customer_type_id":
                        statement.setInt(1,customer_type_id);
                        break;
                    case "customer_gender":
                        statement.setInt(1,gen);
                        break;
                    default:
                        statement.setString(1,valueSearch);
                        break;
                }

                resultSet = statement.executeQuery();
                Customer customer = null;
                while (resultSet.next()) {
                    String id = resultSet.getString("customer_id");
                    int type_id = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, type_id);
//                    customerList.add(customer);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return null;
    }

}