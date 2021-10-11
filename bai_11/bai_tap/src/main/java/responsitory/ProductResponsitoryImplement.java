package responsitory;

import model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductResponsitoryImplement implements IProductResponsitory{
    private static Map<Integer,Product> products;
    static{
        products = new HashMap<>();
        products.put(0,new Product(0,"Nokie",5.4,"Version 1","Nokia"));
        products.put(1,new Product(1,"Samsung Galaxy Note X",20.9,"Version 2","SamSung"));
        products.put(2,new Product(2,"Iphone X",19.5,"Version 4","Apple"));
        products.put(3,new Product(3,"Bphone",15.7,"Version 4","BP"));
        products.put(4,new Product(4,"Oppo",10.3,"Version 5","Opp"));
    }
    @Override
    public Map<Integer,Product> findAll() {
        return products;
    }

    @Override
    public void save(Product product) {
        List<Product> productList = new ArrayList<>(products.values());
        products.put(productList.size()+1,product);
    }

    @Override
    public Product findById(int id) {
        List<Product> productList = new ArrayList<>(products.values());
        for(Product product:productList){
            if(id==product.getId()){
                return productList.get(id);
            }
        }
        return null;
//        int index = productList.indexOf(new Product(id));
//        if(index!=-1){
//            return productList.get(index);
//        }
//        return null;
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
