package activity;

import java.sql.Connection;
import java.sql.PreparedStatement;

import dbutil.dbConnection;


public class activitymodel {
Connection conn;
	
	public void use(activities act) throws Exception {
		try {
			conn = dbConnection.getConnection();
			String sql = "INSERT INTO activities(SrNo, Name, description, organizer, category, type, level, dateofevent, GA1, GA2, GA3, GA4, GA5, GA6, GA7, GA8, GA9, GA10, GA11, GA12)"
					+"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(2, act.getActname());
			ps.setString(3, act.getActdesc());
			ps.setString(4, act.getActorg());
			ps.setString(5, act.getActcat());
			ps.setString(6, act.getActtype());
			ps.setString(7, act.getActlevel());
			ps.setString(8, act.getActdate());
			ps.setString(9, act.getGa1());
			ps.setString(10, act.getGa2());
			ps.setString(11, act.getGa3());
			ps.setString(12, act.getGa4());
			ps.setString(13, act.getGa5());
			ps.setString(14, act.getGa6());
			ps.setString(15, act.getGa7());
			ps.setString(16, act.getGa8());
			ps.setString(17, act.getGa9());
			ps.setString(18, act.getGa10());
			ps.setString(19, act.getGa11());
			ps.setString(20, act.getGa12());
			ps.execute();
			conn.close();
		}catch(Exception e) {
		}
}
}
