package service;

import model.Product;
import responsitory.IProductResponsitory;
import responsitory.ProductResponsitoryImplement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImplement implements ProductService{
    private IProductResponsitory productResponsitory = new ProductResponsitoryImplement();


    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>(productResponsitory.findAll().values());
        return productList;
    }

    @Override
    public void save(Product product) {
        productResponsitory.save(product);
    }

    @Override
    public Product findById(int id) {
        return productResponsitory.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        productResponsitory.update(id,product);
    }

    @Override
    public void remove(int id) {
        productResponsitory.remove(id);
    }
}
