package model.responsitory.implement;

import model.bean.AttachService;
import model.bean.Division;
import model.responsitory.DBConnection;
import model.responsitory.IAttachServiceResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttachServiceResponsitoryImplement implements IAttachServiceResponsitory {
    private static String SELECT_ALL_ATTACH_SERVICE = "SELECT*FROM attach_service;";
    @Override
    public List<AttachService> getAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<AttachService> attachServiceList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_ATTACH_SERVICE);
                resultSet = statement.executeQuery();
                AttachService attachService = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("attach_service_id");
                    String name = resultSet.getString("attach_service_name");
                    double cost = resultSet.getDouble("attach_service_cost");
                    int unit = resultSet.getInt("attach_service_unit");
                    String status = resultSet.getString("attach_service_status");
                    attachService = new AttachService(id,name,cost,unit,status);
                    attachServiceList.add(attachService);
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
        return attachServiceList;
    }
}
