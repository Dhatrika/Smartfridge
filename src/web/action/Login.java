package web.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import service.modules.LoginValidate;
import service.modules.LoginValidateImpl;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import dao.modules.LoginDao;
import dao.modules.LoginDaoImpl;

@SuppressWarnings("serial")
public class Login extends ActionSupport implements ServletRequestAware, ServletResponseAware{
	
	   private HttpServletRequest request;
	   private HttpServletResponse response;
	   private String password;
	   private LoginValidate loginValidate;
	   
	   public Login(){
		   
	   }
	
	public Login(LoginValidate loginValidate) {
		super();
		this.loginValidate = loginValidate;
	}

	public LoginValidate getLoginValidate() {
		return loginValidate;
	}

	public void setLoginValidate(LoginValidate loginValidate) {
		this.loginValidate = loginValidate;
	}

	public String execute() throws Exception{
		
		response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
       // LoginDao loginDao = new LoginDaoImpl();
       // LoginValidate loginValidate = new LoginValidateImpl(loginDao);
        boolean checkValidation = loginValidate.passwordValidate(password);
        if(checkValidation == true){
        	return Action.SUCCESS;
        }
        else{
        	return Action.ERROR;
        }
		
	}
	
	public String internalLoginRedirect(){
		return Action.SUCCESS;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
		
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
		
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


}
