package responsitory;

import model.Product;

import java.util.List;
import java.util.Map;

public interface IProductResponsitory {
    Map<Integer,Product> findAll();

    void save(Product product);

    Product findById(int id);

    void update(int id, Product product);

    void remove(int id);
}
