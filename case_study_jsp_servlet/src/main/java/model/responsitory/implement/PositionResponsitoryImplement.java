package model.responsitory.implement;

import model.bean.Position;
import model.responsitory.DBConnection;
import model.responsitory.IPostionResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionResponsitoryImplement implements IPostionResponsitory {
    private static String SELECT_ALL_POSITION = "SELECT*FROM position;";

    @Override
    public List<Position> getAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Position> positionList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_POSITION);
                resultSet = statement.executeQuery();
                Position position = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("position_id");
                    String name = resultSet.getString("position_name");
                    position  = new Position(id, name);
                    positionList.add(position);
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
        return positionList;
    }

}
