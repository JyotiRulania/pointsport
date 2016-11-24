package pointsport;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pointsport.category.CategoryDAO;
import pointsport.product.ProductDAO;
import pointsport.usermodel.User;
import pointsport.usermodel.UserDAO;
import pointsport.userrolemodel.UserRoleDao;
import pointsport.cartmodel.Cart;
import pointsport.cartmodel.CartDAO;
import pointsport.category.Category;
import pointsport.product.*;

@Controller
public class HelloController{
	
@Autowired
CategoryDAO cdao;

@Autowired
UserDAO udao;

@Autowired
ProductDAO pdao;

@Autowired
 UserRoleDao urdao;

@Autowired
CartDAO crdao;


@Autowired
ServletContext context;

	public String test() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && !auth.getName().equals("anonymousUser")) {
			System.out.println(auth.getName());
			// System.out.println("User present");
			return "false";
		} else {
			System.out.println("User not present");
			return "true";
		}
	
	}
	
	@RequestMapping(value = "/initiateFlow", method = RequestMethod.GET)
	public String redirect(HttpServletRequest request) {

		String retval = "";

		if (request.getUserPrincipal() == null)
			retval = "redirect:/cart?user=none";
		else
			retval = "redirect:/cart?user=" + request.getUserPrincipal().getName();

		return retval;
	}

	@RequestMapping("/")
	public ModelAndView index(){
		//request handler method
		urdao.generateUserRoles();
		ModelAndView model = new ModelAndView("index");
		return model;
		
	}
	
@RequestMapping("/index")
public ModelAndView home(){
	//request handler method
	ModelAndView model = new ModelAndView("index");
	return model;
	
}

@RequestMapping("/head-meta")
public String head_meta(){
	return "head-meta";
}

@RequestMapping("/head")
public String head(){
	return "head";
}

@RequestMapping("/aboutus")
public ModelAndView about(){
	//request handler method
	ModelAndView model = new ModelAndView("AboutUs");
	return model;
	
}
@RequestMapping("/contactus")
public ModelAndView contact(){
	//request handler method
	ModelAndView model = new ModelAndView("ContactUs");
	return model;	
}


@RequestMapping("/signup")
public ModelAndView signup(){
	//request handler method
	ModelAndView model = new ModelAndView("SignUp");
	model.addObject("User",new User());
	return model;
}
@RequestMapping(value="/AddUserToDB",method=RequestMethod.POST)
public ModelAndView AddUserToDB(@ModelAttribute("User") User p, BindingResult bind) {
	ModelAndView mav = new ModelAndView("SignUp");

	System.out.println("In User Insert");

	if (bind.hasErrors()) {
		mav.addObject("User", p);
	} else {
		if (p.getPassword().equals(p.getCPassword())) {
			List<User> list = udao.getAllUsers();

			System.out.println(list);

			boolean usermatch = false;

			for (User u : list) {
				if (p.getUsername().equals(u.getUsername())) {
					usermatch = true;
					break;
				}
			}

			if (usermatch == false) {
				udao.insertUser(p);

				mav.addObject("User", new User());

				mav.addObject("success", "success");
			} else {
				mav.addObject("User",p);

				mav.addObject("useralreadyexists", "useralreadyexists");
			}
		} else {
			mav.addObject("User", p);

			mav.addObject("passwordmismatch", "passwordmismatch");
		}

	}

	return mav;
	
}

@RequestMapping("/loginpage")
public ModelAndView login(){
	//request handler method
	ModelAndView model = new ModelAndView("login");
	return model;
}
@RequestMapping("/category")
public ModelAndView Category(){
   //request handler method
	ModelAndView model = new ModelAndView("Category");
	JSONArray jarr = new JSONArray();
	List<Category> list = cdao.getCategories();
	System.out.println(list);
	for(Category c:list)
	{
		JSONObject jobj =new JSONObject();
		
		jobj.put("CategoryId",c.getCategoryId());
		jobj.put("CategoryName",c.getCategoryName());
		jarr.add(jobj);
	}
	
	model.addObject("Categories",jarr.toJSONString());
	System.out.println(jarr.toJSONString());

		return model;

}

@RequestMapping("/addcategory")
public ModelAndView AddCategory(){
   //request handler method
	ModelAndView model = new ModelAndView("addcategory");
   model.addObject("Category",new Category());
		return model;

}
@RequestMapping(value="/AddCategoryToDB", method=RequestMethod.POST)
public String AddCategoryToDB(@ModelAttribute("Category") Category c){
   //request handler method
	ModelAndView model = new ModelAndView("Category");
	//system.out.println(c.getcname)
	cdao.insert(c);
	model.addObject("Category",new Category());
		return "redirect:/category";

}

@RequestMapping("/updatecategory/{cid}")
public ModelAndView UpdateCategory(@PathVariable("cid") int cid){
   //request handler method
	ModelAndView model = new ModelAndView("CategoryUpdate");
	Category c = cdao.getCategory(cid);
	System.out.println(cid);
	model.addObject("Category", c);
		return model;
}

@RequestMapping(value="/UpdateCategoryToDB", method=RequestMethod.POST)
public String UpdateCategorytoDB(@ModelAttribute("Category") Category c){
	ModelAndView model = new ModelAndView("Category");
	Category c_old = cdao.getCategory(c.getCategoryId());
	cdao.update(c);	
	List<Product> list = pdao.getProducts();
	for(Product p :list)
	{
		if(p.getpCategory().equals(c_old.getCategoryName()))
		{
			p.setpCategory(c.getCategoryName());
			pdao.update(p);
			}
	}
	return "redirect:/category";
}


@RequestMapping("/DeleteCategoryFromDB/{cid}")
public String DeleteCategory(@PathVariable("cid") int cid){
	System.out.println(cid);
	cdao.delete(cid);
	return "redirect:/category";
}


@RequestMapping("/product")
public ModelAndView Product(){
   //request handler method
	ModelAndView model = new ModelAndView("Product");
	JSONArray jarr = new JSONArray();
	List<Product> list = pdao.getProducts();
	System.out.println(list);
	for(Product p:list)
	{
		JSONObject jobj =new JSONObject();
		
		jobj.put("pId",p.getpId());
		jobj.put("pName",p.getpName());
		jobj.put("pCategory",p.getpCategory());
		jobj.put("pDescription",p.getpDescription());
		jobj.put("pPrice",p.getpId());
		jobj.put("pQuantity",p.getpQuantity());
		jobj.put("pImage",p.getpImage());
		jarr.add(jobj);
	}
	
	model.addObject("Product",jarr.toJSONString());
	System.out.println(jarr.toJSONString());

		return model;

}

@RequestMapping("/addproduct")
public ModelAndView AddProduct(){
   //request handler method
	ModelAndView model = new ModelAndView("addproduct");
   model.addObject("Product",new Product());
   
   List<Category> list = cdao.getCategories();
   model.addObject("AllCategories",list);
		return model;
}

@RequestMapping("/view/{productID}")
public ModelAndView addproduct1(@PathVariable("productID") int prodid) {

	ModelAndView mav = new ModelAndView("views");

	System.out.println(prodid);

	Product p = pdao.getProduct(prodid);

	if (p != null) {
		mav.addObject("ProductName", p.getpName());
		mav.addObject("ProductDescription", p.getpDescription());
		mav.addObject("ProductCategory", p.getpCategory());
		mav.addObject("ProductPrice", p.getpPrice());
		mav.addObject("ProductQty", p.getpQuantity());
		mav.addObject("ProductImg", p.getpImage());
		mav.addObject("ProductId", p.getpId());
	}

	return mav;

}

@RequestMapping(value = "/addToCart")
public String addToCart(HttpServletRequest request) {

	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	if (auth != null && !auth.getName().equals("anonymousUser")) {
		System.out.println(request.getParameter("pid"));
		System.out.println(request.getParameter("pqty"));

		int qty = 1;

		try {
			qty = Integer.parseInt(request.getParameter("pqty"));

			if (!(qty >= 1 && qty <= 10))
				throw new Exception();
		} catch (Exception e) {
			System.out.println("Invalid Qty");
		}

		Cart c = new Cart();

		c.setProductID(request.getParameter("pid"));
		c.setQty("" + qty);

		Product p = pdao.getProduct(Integer.parseInt(request.getParameter("pid")));

		c.setName(p.getpName());
		c.setPrice(p.getpPrice());

		c.setUserName(auth.getName());

		crdao.add(c);

	}

	return "redirect:initiateFlow";

}

@RequestMapping(value="/AddProductToDB" , method=RequestMethod.POST)
public String AddProductToDB( @ModelAttribute("Product") Product p ){
	ModelAndView mav = new ModelAndView("Product");
	/*System.out.println(p.getpName());*/
	pdao.insert(p);
	mav.addObject("Product", new Product());
	Product i1 = pdao.getProductWithMaxid();

	System.out.println(i1.getpId());

	try {
		String path = context.getRealPath("/");

		System.out.println(path);

		File directory = null;

		// System.out.println(ps.getProductWithMaxId());

		if (p.getProductFile().getContentType().contains("image")) {
			directory = new File(path + "\\resources\\images");

			System.out.println(directory);

			byte[] bytes = null;
			File file = null;
			bytes = p.getProductFile().getBytes();

			if (!directory.exists())
				directory.mkdirs();

			file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_"
					+ i1.getpId() + ".jpg");

			System.out.println(file.getAbsolutePath());

			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
			stream.write(bytes);
			stream.close();

		}

		i1.setpImage("resources/images/image_" + i1.getpId() + ".jpg");

		pdao.update(i1);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return "redirect:/product";
}

@RequestMapping("/updateproduct/{pid}")
public ModelAndView ProductUpdate(@PathVariable("pid") int pid){
   //request handler method
	ModelAndView model = new ModelAndView("ProductUpdate");
	Product p = pdao.getProduct(pid);
	System.out.println(pid);
	model.addObject("Product", p);
	List<Category> list = cdao.getCategories();
	model.addObject("Categories",list);
		return model;
}

@RequestMapping(value = "/UpdateProductToDB", method=RequestMethod.POST)
public String UpdateProductToDB( @ModelAttribute("Product") Product p) {

	try {
		String path = context.getRealPath("/");

		System.out.println(path);

		File directory = null;

		// System.out.println(ps.getProductWithMaxId());

		if (p.getProductFile().getContentType().contains("image")) {
			directory = new File(path + "\\resources\\images");

			System.out.println(directory);

			byte[] bytes = null;
			File file = null;
			bytes = p.getProductFile().getBytes();

			if (!directory.exists())
				directory.mkdirs();

			file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_"
					+ p.getpId() + ".jpg");

			System.out.println(file.getAbsolutePath());

			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
			stream.write(bytes);
			stream.close();

		}

		p.setpImage("resources/images/image_" + p.getpId() + ".jpg");
	pdao.update(p);
} catch (Exception e) {
	e.printStackTrace();
}

	return "redirect:/product";

}



@RequestMapping("/DeleteProductFromDB/{pid}")
public String DeleteProduct(@PathVariable("pid") int pid){
	System.out.println(pid);
	pdao.delete(pid);
	return "redirect:/product";
}

@RequestMapping("/DeleteCategory/{cid}")
public String deleteCategory(@PathVariable("cid") int cid){
	System.out.println(cid);
	Category c = cdao.getCategory(cid);
	cdao.delete(cid);
	List<Product> list = pdao.getProducts();
	for(Product p:list)
	{
		if(p.getpCategory().equals(c.getCategoryName()))
		{
			p.setpCategory("-");
			pdao.update(p);
		}
	}
	pdao.delete(cid);
	return "redirect:/product";
}
}