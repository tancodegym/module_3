package model.responsitory.implement;

import model.bean.CustomerUsing;
import model.responsitory.DBConnection;
import model.responsitory.ICustormerUsingResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerUsingResponsitoryImplement implements ICustormerUsingResponsitory {
    private static final String SELECT_CUSTOMER_USING = "SELECT CU.customer_id,customer_name,CT.contract_id,contract_start_date,contract_detail_id,A.attach_service_id,attach_service_name\n" +
            "FROM customer CU JOIN contract CT on CU.customer_id = CT.customer_id\n" +
            "\t\t\t\t\t\tJOIN contract_detail CD on CT.contract_id = CD.contract_id\n" +
            "                        JOIN attach_service A on A.attach_service_id=CD.attach_service_id;";
    private static final String INSERT_CUSTOMER_USING = "";


    @Override
    public List<CustomerUsing> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<CustomerUsing> customerUsingList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_CUSTOMER_USING);
                resultSet = statement.executeQuery();
                CustomerUsing customer = null;
                while (resultSet.next()) {
                    String id = resultSet.getString("customer_id");
                    String name = resultSet.getString("customer_name");
                    int contract_id = resultSet.getInt("contract_id");
                    int contract_detail_id = resultSet.getInt("contract_detail_id");
                    String startDate = resultSet.getString("contract_start_date");
                    int attach_service_id = resultSet.getInt("attach_service_id");
                    String attach_service_name = resultSet.getString("attach_service_name");
                    customer = new CustomerUsing(id, name,contract_id,startDate,contract_detail_id,attach_service_id,attach_service_name);
                    customerUsingList.add(customer);
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
        return customerUsingList;
    }

    @Override
    public void save(CustomerUsing customerUsing) {

    }
}
