package model.responsitory.implement;

import model.bean.Customer;
import model.bean.CustomerType;
import model.responsitory.DBConnection;
import model.responsitory.ICustomerTypeResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeResponsitoryImplement implements ICustomerTypeResponsitory {
    private static String SELECT_ALL_CUSTOMER_TYPE = "SELECT*FROM customer_type;";
    @Override
    public List<CustomerType> getAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<CustomerType> customerTypeList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
                resultSet = statement.executeQuery();
                CustomerType customerType = null;
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
                    customerType = new CustomerType(id, name, birthday, gender, idCard, phone, email, address, type_id);
                    customerTypeList.add(customerType);
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
}
