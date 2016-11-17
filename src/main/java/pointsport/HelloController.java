package pointsport;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pointsport.category.CategoryDAO;
import pointsport.product.ProductDAO;
import pointsport.category.Category;
import pointsport.product.*;

@Controller
public class HelloController{
	
@Autowired
CategoryDAO cdao;

@Autowired
ProductDAO pdao;
	

	@RequestMapping("/")
	public ModelAndView index(){
		//request handler method
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
	return model;
}

@RequestMapping("/login")
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
	cdao.update(c);	
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
		return model;
}

@RequestMapping(value="/AddProductToDB", method=RequestMethod.POST)
public String AddProductToDB(@ModelAttribute("Product") Product p){
   //request handler method
	ModelAndView model = new ModelAndView("Product");
	//system.out.println(p.getcname)
	pdao.insert(p);
	model.addObject("Product",new Product());
		return "redirect:/product";
}

@RequestMapping("/ProductUpdate/{pid}")
public ModelAndView ProductUpdate(@PathVariable("pid") int pid){
   //request handler method
	ModelAndView model = new ModelAndView("ProductUpdate");
	Product p = pdao.getProduct(pid);
	System.out.println(pid);
	model.addObject("Product", p);
		return model;
}

@RequestMapping(value="/UpdateProductToDB", method=RequestMethod.POST)
public String UpdateProducttoDB(@ModelAttribute("Product") Product p){
	ModelAndView model = new ModelAndView("Product");
	pdao.update(p);	
	return "redirect:/product";
}


@RequestMapping("/DeleteProductFromDB/{pid}")
public String DeleteProduct(@PathVariable("pid") int pid){
	System.out.println(pid);
	pdao.delete(pid);
	return "redirect:/product";
}

}