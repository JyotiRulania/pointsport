package pointsport.product;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
public class ProductDaoImpl implements ProductDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Transactional
	public void insert(Product p) {
		sessionFactory.getCurrentSession().save(p);
	}

	@Transactional
	public void update(Product p) {
		sessionFactory.getCurrentSession().update(p);
	}

	@Transactional
	public void delete(int pid) {
		sessionFactory.getCurrentSession().createQuery("delete from Product where pId = :pid")
		.setInteger("pid", pid).executeUpdate();
		
	}

	@Transactional
	public Product getProduct(int pid) {
	   List<Product> list = sessionFactory.getCurrentSession().createQuery("from Product where pId = :pid")
			   .setInteger("pid", pid).list();
		return list.get(0);
	}

	@Transactional
	public List<Product> getProducts() {
	List<Product> list = this.getSessionFactory().getCurrentSession().createQuery("from Product").list();
		return list;
	}
	
	@Transactional
	public Product getProductWithMaxid() {
		{

			List<Product> l = sessionFactory.getCurrentSession()
					.createQuery("from Product as p where p.pId = ( select max(a.pId) from Product as a )")
					.list();

			if (l.size() > 0) {
				return l.get(0);
			} else {
				return null;
			}
		}
		
	}	
}
