package model.responsitory.implement;

import model.bean.Customer;
import model.responsitory.DBConnection;
import model.responsitory.ICustomerResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CustomerResponsitoryImplement implements ICustomerResponsitory {
    private static final String SELECT_ALL_CUSTOMER = "select * from customer ";
    private static final String INSERT_NEW_CUSTOMER = "INSERT INTO customer (customer_id,customer_type_id,customer_name," +
            "customer_birthday,customer_gender,customer_id_card,customer_phone," +
            "customer_email,customer_address)" +
            "VALUE (?,?,?,?,?,?,?,?,?)";
    private static final String DELETE_CUSTOMER = "delete from customer where customer_id = ?;";
    private static final String SELECT_CUSTOMER = "SELECT*FROM customer " +
            "where customer_id=?;";
    private static final String UPDATE_CUSTOMER = " update customer \n" +
            "  set customer_type_id=?, customer_name = ? , customer_birthday=?,\n" +
            "  customer_gender=?,customer_id_card=?,customer_phone=?,\n" +
            "  customer_email=?,customer_address=?" +
            "  where customer_id = ? ;";
    private static String SEARCH_CUSTOMER = "SELECT* FROM customer " +
            "where";

    @Override
    public List<Customer> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Customer> customerList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
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
                    customerList.add(customer);
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
        return customerList;
    }

    public String getCustomerId(List<Customer> customerList) {
        String idCustomer = "";
        List<String> idList = new ArrayList<>();
        for (int i = 0; i < customerList.size(); i++) {
            idList.add(customerList.get(i).getId());
        }
        List<Integer> integerList = new ArrayList<>();
        for (String string : idList) {
            String[] array = string.split("-");
            integerList.add(Integer.valueOf(array[1]));
        }
        Collections.sort(integerList);
        if (integerList.get(integerList.size() - 1) > 998) {
            idCustomer += "KH-" + (integerList.get(integerList.size() - 1) + 1);
        }
        if (integerList.get(integerList.size() - 1) > 98) {
            idCustomer += "KH-0" + (integerList.get(integerList.size() - 1) + 1);
        } else if (integerList.get(integerList.size() - 1) > 8) {
            idCustomer += "KH-00" + (integerList.get(integerList.size() - 1) + 1);
        } else if (integerList.get(integerList.size() - 1) > 0) {
            idCustomer += "KH-000" + (integerList.get(integerList.size() - 1) + 1);
        }

        return idCustomer;
    }

    @Override
    public void save(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        List<Customer> customerList = findAll();
        String idCustomer = getCustomerId(customerList);
        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_NEW_CUSTOMER);
                statement.setString(1, idCustomer);
                statement.setInt(2, customer.getCustomer_type_id());
                statement.setString(3, customer.getName());
                statement.setString(4, customer.getBirthday());
                statement.setInt(5, customer.getGender());
                statement.setString(6, customer.getIdCard());
                statement.setString(7, customer.getPhone());
                statement.setString(8, customer.getEmail());
                statement.setString(9, customer.getAddress());
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
    public Customer findById(int id) {
        Customer customer = new Customer();
        return customer;
    }

    @Override
    public void remove(String id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(DELETE_CUSTOMER);
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
    public Customer getCustomerById(String id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Customer customer = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_CUSTOMER);
                statement.setString(1, id);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    int type_id = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, type_id);

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
        return customer;
    }

    @Override
    public void updateCustomer(Customer customer, String customer_id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UPDATE_CUSTOMER);
                statement.setInt(1, customer.getCustomer_type_id());
                statement.setString(2, customer.getName());
                statement.setString(3, customer.getBirthday());
                statement.setInt(4, customer.getGender());
                statement.setString(5, customer.getIdCard());
                statement.setString(6, customer.getPhone());
                statement.setString(7, customer.getEmail());
                statement.setString(8, customer.getAddress());
                statement.setString(9, customer_id);
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
    public List<String> getPropertyList(Customer customer) {
//        Customer ctm= new Customer();
//        List<String> propertyList = new ArrayList<>();
//        Field[] ctmProperty = ctm.getClass().getDeclaredFields();
//        for(Field field: ctmProperty){
//            propertyList.add(field.getName());
//        }
//        Field[] ctmParentProperty = ctm.getClass().getSuperclass().getDeclaredFields();
//        for(Field field: ctmParentProperty){
//            propertyList.add(field.getName());
//        }
////        <c:forEach var="property" items="${propertyList}">
////                            <option value="${property}">${property}</option>
////                        </c:forEach>
//
//        return propertyList;
        return null;
    }

    @Override
    public List<Customer> findCustomer(int keySearch, String valueSearch) {
        SEARCH_CUSTOMER = "SELECT* FROM customer " +
                "where";
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Customer> customerList = new ArrayList<>();
        String property = "";
        int customer_type_id = 0;
        int gen = -1;
        switch (keySearch) {
            case 1:
                property = "customer_id";
                break;
            case 9:
                property = "customer_type_id";
                switch (valueSearch) {
                    case "Platinium":
                        customer_type_id = 2;
                        break;
                    case "Diamond":
                        customer_type_id = 1;
                        break;
                    case "Gold":
                        customer_type_id = 3;
                        break;
                    case "Silver":
                        customer_type_id = 4;
                        break;
                    case "Member":
                        customer_type_id = 5;
                        break;
                }
                break;
            case 2:
                property = "customer_name";
                break;
            case 3:
                property = "customer_birthday";
                break;
            case 4:
                property = "customer_gender";
                switch (valueSearch) {
                    case "Male":
                        gen = 1;
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
                property = "customer_id_card";
                break;
            case 6:
                property = "customer_phone";
                break;
            case 7:
                property = "customer_email";
                break;
            case 8:
                property = "customer_address";
                break;
            default:
                break;
        }
        SEARCH_CUSTOMER += " " + property + "=" + "?" + " ;";
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SEARCH_CUSTOMER);
                switch (property) {
                    case "customer_type_id":
                        statement.setInt(1, customer_type_id);
                        break;
                    case "customer_gender":
                        statement.setInt(1, gen);
                        break;
                    default:
                        statement.setString(1, valueSearch);
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
                    customerList.add(customer);
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
        return customerList;
    }
    @Override
    public void removeAll(String allIdCustomer) {
        List<String> idList = getListId(allIdCustomer);
        for (String string : idList) {
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = null;
            if (connection != null) {
                try {
                    statement = connection.prepareStatement(DELETE_CUSTOMER);
                    statement.setString(1, string);
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
    }
    public static List<String> getListId(String allIdCustomer) {
        String allId = allIdCustomer.substring(1);
        String[] arrayId = allId.split(",");
        List<String> idList = new ArrayList<>();
        for (String string : arrayId) {
            idList.add(string);
        }
        return idList;
    }
}
