package service.modules;

import dao.modules.LoginDao;

public class LoginValidateImpl implements LoginValidate{

	private LoginDao loginDao;
	
	public LoginValidateImpl(){
		
	}
	
	public LoginValidateImpl(LoginDao loginDao) {
		super();
		this.loginDao = loginDao;
	}

	@Override
	public boolean passwordValidate(String pwd) throws Exception{
		return(loginDao.passwordValidate(pwd));
	}

	public LoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	@Override
	public String getPassword() throws Exception {
		return(loginDao.getPassword());
	}

	@Override
	public void savePassword(String newPassword) throws Exception {
		loginDao.savePassword(newPassword);
		
	}

	@Override
	public String getEmailAddress() throws Exception {
		return(loginDao.getEmailAddress());
	}

	@Override
	public void saveEmailAddress(String emailAddr) throws Exception {
		loginDao.saveEmailAddress(emailAddr);
	}

}
