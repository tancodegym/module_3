package model.responsitory.implement;

import model.bean.CustomerType;
import model.bean.RentType;
import model.responsitory.DBConnection;
import model.responsitory.IRentTypeResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeResponsitoryImplement implements IRentTypeResponsitory {
    private static String SELECT_ALL_RENT_TYPE = "SELECT*FROM rent_type;";
    @Override
    public List<RentType> getAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<RentType> rentTypeList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_RENT_TYPE);
                resultSet = statement.executeQuery();
                RentType rentType = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("rent_type_id");
                    String name = resultSet.getString("rent_type_name");
                    int cost = resultSet.getInt("rent_type_cost");
                    rentType  = new RentType(id, name,cost);
                    rentTypeList.add(rentType);
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
        return rentTypeList;
    }
}
