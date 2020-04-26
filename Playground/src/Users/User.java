package Users;
public class User {

	private String email, password, acctNumber;

	public User(String email, String password, String acctNumber) {
		this.email = email;
		this.password = password;
		this.acctNumber = acctNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAcctNumber() {
		return acctNumber;
	}

	public void setAcctNumber(String acctNumber) {
		this.acctNumber = acctNumber;
	}

	@Override
	public String toString() {
		return "User [email=" + email + ", password=" + password + ", acctNumber=" + acctNumber + "]";
	}
}
