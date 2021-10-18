package model.responsitory.implement;

import model.bean.ServiceType;
import model.responsitory.DBConnection;
import model.responsitory.IServiceTypeResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeResponsitoryImplement implements IServiceTypeResponsitory{
    private static String SELECT_ALL_SERVICE_TYPE = "SELECT*FROM service_type;";
    @Override
    public List<ServiceType> getAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<ServiceType> serviceTypeList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_SERVICE_TYPE);
                resultSet = statement.executeQuery();
                ServiceType serviceType = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("service_type_id");
                    String name = resultSet.getString("service_type_name");
                    serviceType = new ServiceType(id, name);
                    serviceTypeList.add(serviceType);
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
        return serviceTypeList;
    }
}
