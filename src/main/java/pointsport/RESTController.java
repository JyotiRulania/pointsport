package pointsport;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import pointsport.cartmodel.CartDAO;
import pointsport.product.ProductDAO;

@RestController
public class RESTController {

	@Autowired
	CartDAO cdao;
	
	@RequestMapping(value="/REST/fetchAllItems/",method= RequestMethod.POST)
	public ResponseEntity<String>fetchAllItems(){
		
		String username =null;
		Authentication auth =SecurityContextHolder.getContext().getAuthentication();
		if(auth !=null && !auth.getName().equals("anonymousUser")){
			System.out.println(auth.getName());
		}
		JSONArray jarr = new JSONArray();
		
		if(username !=null){
			List<Cart> list = cdao.getAllProduct();
			
			for(Cart c : list){
				if(c.getUserName().equals(username)){
					JSONObject jobj =new JSONObject();
					jobj.put("ProductName, p.);
				}
			}
		}
		return null;
	}
}
