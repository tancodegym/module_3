package model.responsitory.implement;

import model.bean.Customer;
import model.bean.Service;
import model.responsitory.DBConnection;
import model.responsitory.IServiceResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ServiceResponsitoryImplement  implements IServiceResponsitory {
    private static final String SELECT_ALL_SERVICE = "select * from service ";
    private static final String INSERT_NEW_SERVICE = "INSERT INTO service(service_id, service_name, " +
            "service_area, service_cost, service_max_people, rent_type_id, service_type_id, " +
            "standard_room, description_other_convenience, pool_area, number_of_floors)" +
            "  VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String DELETE_SERVICE = "delete from customer where customer_id = ?;";
    private static final String SELECT_SERVICE = "SELECT*FROM customer " +
            "where customer_id=?;";
    private static final String UPDATE_SERVICE = " update customer \n" +
            "  set customer_type_id=?, customer_name = ? , customer_birthday=?,\n" +
            "  customer_gender=?,customer_id_card=?,customer_phone=?,\n" +
            "  customer_email=?,customer_address=?" +
            "  where customer_id = ? ;";
    private static  String SEARCH_SERVICE = "SELECT* FROM customer " +
            "where" ;
    @Override
    public List<Service> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Service> serviceList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_SERVICE);
                resultSet = statement.executeQuery();
                Service service = null;
                while (resultSet.next()) {
                    String id = resultSet.getString("service_id");
                    String name = resultSet.getString("service_name");
                    int area = resultSet.getInt("service_area");
                    double cost = resultSet.getInt("service_cost");
                    int people = resultSet.getInt("service_max_people");
                    int rent_type_id = resultSet.getInt("rent_type_id");
                    int service_type_id = resultSet.getInt("service_type_id");
                    String standard_room = resultSet.getString("standard_room");
                    String description = resultSet.getString("description_other_convenience");
                    double pool_area = resultSet.getInt("pool_area");
                    int number_of_floors = resultSet.getInt("number_of_floors");
                    service= new Service(id,name,area,cost,people,rent_type_id,service_type_id,
                            standard_room,description,pool_area,number_of_floors);
                    serviceList.add(service);
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
        return serviceList;
    }

    @Override
    public void save(Service service) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        List<Service> serviceList = findAll();
        String serviceId = getServiceId(serviceList);
        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_NEW_SERVICE);
                statement.setString(1, serviceId);
                statement.setString(2, service.getService_name());
                statement.setInt(3, service.getService_area());
                statement.setDouble(4, service.getService_cost());
                statement.setInt(5, service.getService_max_people());
                statement.setInt(6, service.getRent_type_id());
                statement.setInt(7, service.getService_type_id());
                statement.setString(8, service.getStandard_room());
                statement.setString(9, service.getDescription());
                statement.setDouble(10, service.getPool_area());
                statement.setInt(11, service.getNumber_of_floors());
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
    public void remove(String id) {

    }

    @Override
    public Service getServiceById(String id) {
        return null;
    }

    @Override
    public void updateService(Service service) {

    }

    @Override
    public List<Service> findService(int keySearch, String valueSearch) {
        return null;
    }
    public String getServiceId(List<Service> serviceList) {
        String idService = "";
        List<String> idList = new ArrayList<>();
        for (int i = 0; i < serviceList.size(); i++) {
            idList.add(serviceList.get(i).getService_id());
        }
        List<Integer> integerList = new ArrayList<>();
        for (String string : idList) {
            String[] array = string.split("-");
            integerList.add(Integer.valueOf(array[1]));
        }
        Collections.sort(integerList);
        if (integerList.get(integerList.size() - 1) > 998) {
            idService += "DV-" + (integerList.get(integerList.size() - 1) + 1);
        }
        if (integerList.get(integerList.size() - 1) > 98) {
            idService += "DV-0" + (integerList.get(integerList.size() - 1) + 1);
        } else if (integerList.get(integerList.size() - 1) > 8) {
            idService += "DV-00" + (integerList.get(integerList.size() - 1) + 1);
        } else if (integerList.get(integerList.size() - 1) > 0) {
            idService += "DV-000" + (integerList.get(integerList.size() - 1) + 1);
        }

        return idService;
    }

}
