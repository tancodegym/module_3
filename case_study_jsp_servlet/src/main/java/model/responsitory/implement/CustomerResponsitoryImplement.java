package model.responsitory.implement;

import model.bean.Customer;
import model.bean.Person;
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
    public static final String INSERT_NEW_CUSTOMER = "INSERT INTO customer (customer_id,customer_type_id,customer_name," +
            "customer_birthday,customer_gender,customer_id_card,customer_phone," +
            "customer_email,customer_address)\n" +
            "VALUE (?,?,?,?,?,?,?,?,?)";

    @Override
    public List<Customer> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet =null;
        List<Customer> customerList = new ArrayList<>();
        if(connection!=null){
            try{
                statement=connection.prepareStatement(SELECT_ALL_CUSTOMER);
                resultSet = statement.executeQuery();
                Customer customer = null;
                while(resultSet.next()){
                        int id = resultSet.getInt("customer_id");

                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
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
                statement.setInt(1, customer.getId());
                statement.setInt(2, customer.getCustomer_type_id());
                statement.setString(3, customer.getName());
                statement.setString(4, customer.getBirthday());
                statement.setInt(5, customer.getGenger());
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
         Customer customer =new Customer();
        return customer;
    }

    @Override
    public void remove(int id) {

    }
}
