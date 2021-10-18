package model.responsitory.implement;

import model.bean.Education_Degree;
import model.responsitory.DBConnection;
import model.responsitory.IEducationResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationResponsitoryImplement implements IEducationResponsitory {
    private static String SELECT_ALL_EDUCATION = "SELECT*FROM education_degree;";
    @Override
    public List<Education_Degree> getAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Education_Degree> education_degreeList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_EDUCATION);
                resultSet = statement.executeQuery();
                Education_Degree education_degree = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("education_degree_id");
                    String name = resultSet.getString("education_degree_name");
                    education_degree  = new Education_Degree(id, name);
                    education_degreeList.add(education_degree);
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
        return education_degreeList;
    }

}
