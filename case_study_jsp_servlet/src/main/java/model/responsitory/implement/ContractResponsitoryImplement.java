package model.responsitory.implement;

import model.bean.Contract;
import model.bean.Customer;
import model.bean.Employee;
import model.responsitory.DBConnection;
import model.responsitory.IContractResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractResponsitoryImplement implements IContractResponsitory {
    private static final String SELECT_ALL_CONTRACT = "select * from contract ";
    private static final String SELECT_SERVICE_COST = "select service_cost from service where service_id=? ";
    private static final String INSERT_NEW_CONTRACT = "INSERT INTO `furama`.`contract` ( `contract_start_date`, `contract_end_date`, `contract_deposit`, `employee_id`, `customer_id`, `service_id`)" +
            " VALUES  (?, ?, ?, ?, ?, ?);\n";

    @Override
    public List<Contract> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Contract> contractList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_CONTRACT);
                resultSet = statement.executeQuery();
                Contract contract = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("contract_id");
                    String start_date = resultSet.getString("contract_start_date");
                    String end_date = resultSet.getString("contract_end_date");
                    double deposit = resultSet.getDouble("contract_deposit");
                    String employee_id = resultSet.getString("employee_id");
                    String customer_id = resultSet.getString("customer_id");
                    String service_id = resultSet.getString("service_id");
                    double total_money = getTotalMoney(service_id);
                    Contract contract1 = new Contract(id, start_date, end_date, deposit, total_money, employee_id, customer_id, service_id);
                    contractList.add(contract1);
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
        return contractList;
    }

    private double getTotalMoney(String service_id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        double cost = 0;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_SERVICE_COST);
                statement.setString(1, service_id);
                resultSet = statement.executeQuery();
                cost = resultSet.getDouble("service_cost");
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
        return cost;
    }

    @Override
    public void save(Contract contract) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_NEW_CONTRACT);
                statement.setString(1, contract.getStart_date());
                statement.setString(2, contract.getEnd_date());
                statement.setDouble(3, contract.getContract_deposit());
                statement.setString(4, contract.getEmployee_id());
                statement.setString(5, contract.getCustomer_id());
                statement.setString(6, contract.getService_id());
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
    public Contract findById(int id) {
        return null;
    }

    @Override
    public void remove(int id) {

    }

    @Override
    public Contract getContractById(int id) {
        return null;
    }

    @Override
    public void updateContract(Contract contract) {

    }

    @Override
    public List<String> getPropertyList(Contract contract) {
        return null;
    }

    @Override
    public List<Contract> findContract(int keySearch, String valueSearch) {
        return null;
    }
}
