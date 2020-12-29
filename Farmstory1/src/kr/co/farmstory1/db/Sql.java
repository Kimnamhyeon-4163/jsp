package kr.co.farmstory1.db;

public class Sql {
	
	//회원관련 SQL
	public static final String SELECT_TEAMS = "SELECT * FROM `JBOARD_TEAMS`";
	public static final String INSERT_USER = "INSERT INTO `JBOARD_MEMBER` SET "
											+ "`uid`=?,"
											+ "`pass`=PASSWORD(?),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`rdate`=NOW();";
											
	public static final String SELECT_USER ="SELECT * FROM `JBOARD_MEMBER` "
										   + "WHERE "
										   + "`uid`=? AND `pass`=PASSWORD(?)";
	//게시판관련 SQL
	
	
	//기타 SQL

}
