package model.responsitory.implement;

import model.bean.Customer;
import model.responsitory.DBConnection;
import model.responsitory.ICustomerResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerResponsitoryImplement implements ICustomerResponsitory {
    public static final String SELECT_ALL_CUSTOMER = "select * from customer ";
    public static final String INSERT_NEW_CUSTOMER = "INSERT INTO customer (customer_type_id,customer_name," +
            "customer_birthday,customer_gender,customer_id_card,customer_phone," +
            "customer_email,customer_address)" +
            "VALUE (?,?,?,?,?,?,?,?)";
    public static final String DELETE_CUSTOMER = "delete from customer where customer_id = ?;";
    public static final String SELECT_CUSTOMER = "SELECT*FROM customer " +
            "where customer_id=?;";
    public static final String UPDATE_CUSTOMER  = " update customer \n" +
            "  set customer_type_id=?, customer_name = ? , customer_birthday=?,\n" +
            "  customer_gender=?,customer_id_card=?,customer_phone=?,\n" +
            "  customer_email=?,customer_address=?" +
            "  where customer_id = ? ;";

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
                    int id = resultSet.getInt("customer_id");
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

    @Override
    public void save(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {

                statement = connection.prepareStatement(INSERT_NEW_CUSTOMER);
                statement.setInt(1, customer.getCustomer_type_id());
                statement.setString(2, customer.getName());
                statement.setString(3, customer.getBirthday());
                statement.setInt(4, customer.getGender());
                statement.setString(5, customer.getIdCard());
                statement.setString(6, customer.getPhone());
                statement.setString(7, customer.getEmail());
                statement.setString(8, customer.getAddress());
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
    public void remove(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
//        ResultSet resultSet = null;
//        List<Customer> customerList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(DELETE_CUSTOMER);
                statement.setInt(1, id);
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
    public Customer getCustomerById(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null ;
        Customer customer = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_CUSTOMER);
                statement.setInt(1,id);
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
    public void updateCustomer(Customer customer) {
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
                statement.setInt(9, customer.getId());
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
