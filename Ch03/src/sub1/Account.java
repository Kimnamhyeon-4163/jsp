package sub1;

import javax.servlet.jsp.JspWriter;

public class Account {

	
	private String bank;
	private String id;
	private String name;
	private int money;
	
	public Account(String bank,String id, String name,int money) {
		 this.bank =bank;
		 this.id =id;
		 this.name=name;
		 this.money=money;
	}
	public void deposit(int _money) {
		money += _money;
	}
	public void withdraw(int _money) {
		money -= _money;
	}
	public void show(JspWriter out) throws Exception{
		out.println("<h4>현재잔액</h4>");
		out.println("<p>");
		out.println("은행명 : "+bank+"<br/>");
		out.println("은행명 : "+id+"<br/>");
		out.println("은행명 : "+name+"<br/>");
		out.println("은행명 : "+money+"<br/>");
		out.println("</p>");
	}
}
