package pointsport.product;
import java.util.List;
public interface ProductDAO {
	public void insert(Product p);
	public void update(Product p);
	public void delete(int pid);
	
	public Product getProduct(int pid);
	public List<Product> getProducts();
}
