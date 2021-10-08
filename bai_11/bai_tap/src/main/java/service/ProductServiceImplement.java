package service;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImplement implements ProductService{
    private static Map<Integer,Product> products;
    static{
        products = new HashMap<>();
        products.put(1,new Product(1,"Nokie",5.4,"VIP","Nokia"));
        products.put(2,new Product(2,"Samsung Galaxy Note X",20.9,"VIP","SamSung"));
        products.put(3,new Product(3,"Iphone X",19.5,"VIP","Apple"));
        products.put(4,new Product(4,"Bphone",15.7,"VIP","BP"));
        products.put(5,new Product(5,"Oppo",10.3,"VIP","Opp"));

    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(),product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
