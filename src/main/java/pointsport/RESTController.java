package pointsport;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import pointsport.cartmodel.Cart;
import pointsport.cartmodel.CartDAO;
import pointsport.product.Product;
import pointsport.product.ProductDAO;
import pointsport.usermodel.UserDAO;

@RestController
public class RESTController {

	@Autowired
	CartDAO crdao;
	
	@Autowired
	ProductDAO pdao;

	
	@RequestMapping(value = "/REST/fetchAllItems", method = RequestMethod.POST)
	public ResponseEntity<String> fetchAllItems()
	{	
		String username = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && !auth.getName().equals("anonymousUser")) {
			System.out.println(auth.getName());
			// System.out.println("User present");
			username = auth.getName();
		} 
		
		JSONArray jarr = new JSONArray();
		
		if( username != null )
		{
			
			List<Cart> list = crdao.getAllProduct();
			System.out.println("inside get all product");
			
			for( Cart c : list )
			{
				if( c.getUserName().equals(username) )
				{
					JSONObject jobj = new JSONObject();
					
					jobj.put("ProductName", c.getName());
					jobj.put("ProductPrice", c.getPrice());
					jobj.put("ProductQty", c.getQty());
					
					Product p = pdao.getProduct(Integer.parseInt(c.getProductID()));
					
					jobj.put("ProductId", p.getpId());
					jobj.put("ProductImage", p.getpImage());
					jobj.put("CartId", c.getID());
					
					jarr.add(jobj);
				}
			}
			System.out.println(jarr.toJSONString());
		}
		
		return new ResponseEntity<String>(jarr.toJSONString(), HttpStatus.OK);
	}
	
	@CrossOrigin
	@RequestMapping(value = "/flows/deleteFromCart/", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFromCart(HttpServletRequest request, HttpServletResponse response,
			@RequestBody String inputdata, UriComponentsBuilder ucBuilder) {

		int cartId = Integer.parseInt(inputdata);

		crdao.delete(cartId);

		List<Cart> list = crdao.getAllProduct();

		JSONArray jarr = new JSONArray();

		String user = "";

		System.out.println("In Fetch All Items");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && !auth.getName().equals("anonymousUser")) {
			user = auth.getName();
		}

		for (Cart item : list) {

			if (item.getUserName().equals(user)) {
				JSONObject jobj = new JSONObject();

				jobj.put("ProductID", item.getProductID());
				jobj.put("ProductName", item.getName());
				jobj.put("ProductPrice", item.getPrice());
				Product p = pdao.getProduct(Integer.parseInt(item.getProductID()));

				jobj.put("ProductImage", p.getpImage());
				jobj.put("ProductQty", item.getQty());
				jobj.put("CartId", item.getID());

				jarr.add(jobj);
			}

		}

		System.out.println(jarr);

		return new ResponseEntity<String>(jarr.toString(), HttpStatus.CREATED);
	}
	
	
	@CrossOrigin
    @RequestMapping(value = "/flows/updateAddresses/", method = RequestMethod.POST)
    public ResponseEntity<String> updateAddresses(HttpServletRequest request, HttpServletResponse response, @RequestBody String inputdata, UriComponentsBuilder ucBuilder) 
	{
        JSONParser jpar = new JSONParser();
        
        JSONObject jobj = new JSONObject();
        
        try
        {
        	jobj = (JSONObject)jpar.parse(inputdata);
        }
		catch(Exception e)
        {
			System.out.println("ERROR READING ADDRESSES");
        }
        
        System.out.println(jobj.get("shippingAddress").toString());
        System.out.println(jobj.get("billingAddress").toString());
        
        List<Cart> list = crdao.getAllProduct();
		
		String user = "";
		
		System.out.println("In Update Addresses");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    	if (auth != null && !auth.getName().equals("anonymousUser"))
	    	{    
	    		user = auth.getName();
	    	}
		
	    	System.out.println(list);
	    	
	    	for( Cart item:list )
	    	{
			
	    		System.out.println(user);
	    		System.out.println(item.getUserName());
	    		
	    		System.out.println( item.getUserName().equals(user) );
	    		
	    		if( item.getUserName().equals(user) )
	    		{
	    			item.setAddress(jobj.get("shippingAddress").toString());
	    			item.setBillingAddress(jobj.get("billingAddress").toString());
	    			
	    			crdao.update(item);
	    		}
			
	    	}
		 
	    	JSONObject res = new JSONObject();
	    	
	    	res.put("status", "updated");
	    	
        return new ResponseEntity<String>(res.toJSONString(), HttpStatus.CREATED);
    }
	
	
	
	@CrossOrigin
    @RequestMapping(value = "/flows/deleteAllFromCart/", method = RequestMethod.POST)
    public ResponseEntity<String> deleteAllFromCart(HttpServletRequest request, HttpServletResponse response, UriComponentsBuilder ucBuilder) 
	{
        List<Cart> list = crdao.getAllProduct();
		
		String user = "";
		
		System.out.println("In Update Addresses");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    	if (auth != null && !auth.getName().equals("anonymousUser"))
	    	{    
	    		user = auth.getName();
	    	}
		
	    	System.out.println(list);
	    	
	    	for( Cart item:list )
	    	{
			
	    		if( item.getUserName().equals(user) )
	    		{
	    			crdao.delete(item.getID());
	    		}
			
	    	}
		 
	    	JSONObject res = new JSONObject();
	    	
	    	res.put("status", "updated");
	    	
        return new ResponseEntity<String>(res.toJSONString(), HttpStatus.CREATED);
    
	}
	
	
	@CrossOrigin
	@RequestMapping(value = "/flows/fetchAllItems/", method = RequestMethod.POST)
	public ResponseEntity<String> fetchAllItems(HttpServletRequest request, HttpServletResponse response,
			UriComponentsBuilder ucBuilder) {

		List<Cart> list = crdao.getAllProduct();

		JSONArray jarr = new JSONArray();

		String user = "";

		System.out.println("In Fetch All Items");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && !auth.getName().equals("anonymousUser")) {
			user = auth.getName();
		}

		for (Cart item : list) {

			if (item.getUserName().equals(user)) {
				JSONObject jobj = new JSONObject();

				jobj.put("ProductID", item.getProductID());
				jobj.put("ProductName", item.getName());
				jobj.put("ProductPrice", item.getPrice());

				Product p = pdao.getProduct(Integer.parseInt(item.getProductID()));

				/*test when product not found*/
				
				if( p == null || p.getpImage() == null )
					jobj.put("ProductImage", "");
				else

				jobj.put("ProductImage", p.getpImage());

				jobj.put("ProductQty", item.getQty());
				jobj.put("CartId", item.getID());
				jobj.put("ShippingAddress", item.getAddress());
				jobj.put("BillingAddress", item.getBillingAddress());
				

				jarr.add(jobj);
			}

		}

		System.out.println(jarr);

		return new ResponseEntity<String>(jarr.toString(), HttpStatus.CREATED);
	}
	
}