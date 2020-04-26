package Users;
public class CurrentUser {

	static User current;
	
	public CurrentUser(User u) {
		current = new User(u.getEmail(),u.getPassword(),u.getAcctNumber());
	}
	
	public CurrentUser(String username, String password, String acctNumber) {
		current = new User(username,password,acctNumber);
	}
	
	public static User getCurrentUser() {
		return current;
	}
	
	
}
