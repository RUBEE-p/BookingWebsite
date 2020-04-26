package Users;
public class CurrentUser {

	static User current;
	
	public CurrentUser(User u) {
		current = u;
	}
	
	public CurrentUser(String username, String password, String acctNumber) {
		current = new User(username,password,acctNumber);
	}
}
