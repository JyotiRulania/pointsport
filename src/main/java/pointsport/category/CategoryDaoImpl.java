package pointsport.category;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

@Repository
@EnableTransactionManagement
public class CategoryDaoImpl implements CategoryDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public void insert(Category c) {
		sessionFactory.getCurrentSession().save(c);
	}

	@Transactional
	public void update(Category c) {
		sessionFactory.getCurrentSession().update(c);
	}

	@Transactional
	public void delete(int cid) {
		sessionFactory.getCurrentSession().createQuery("delete from Category where CategoryId = :cid")
		.setInteger("cid", cid).executeUpdate();
		
	}

	@Transactional
	public Category getCategory(int cid) {
	   List<Category> list = sessionFactory.getCurrentSession().createQuery("from Category where CategoryId = :cid")
			   .setInteger("cid", cid).list();
		return list.get(0);
	}

	@Transactional
	public List<Category> getCategories() {
	List<Category> list = this.getSessionFactory().getCurrentSession().createQuery("from Category").list();
		return list;
	}
	
}
