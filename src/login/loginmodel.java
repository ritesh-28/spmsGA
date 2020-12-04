package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbutil.dbConnection;

public class loginmodel {
    Connection connection;

    public loginmodel() {
        try {
            this.connection = dbConnection.getConnection();
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        if (this.connection == null) {
            System.exit(1);
        }
    }

    public boolean isDatabaseConnected() {
        return this.connection != null;
    }
    public boolean check(String user, String pass) throws Exception
    {
        PreparedStatement pr = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM studentlists where email = ? and password = ?";
        try {
            pr = this.connection.prepareStatement(sql);
            pr.setString(1,user);
            pr.setString(2, pass);

            rs = pr.executeQuery();
            if(rs.next()) {
                return true;
            }
            return false;
        }
        catch (SQLException ex) {
            return false;
        }
        finally {
                pr.close();
                rs.close();
        }
    }
    public boolean factcheck(String user, String pass) throws Exception
    {
        PreparedStatement pr = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM facultyList where email = ? and password = ?";
        try {
            pr = this.connection.prepareStatement(sql);
            pr.setString(1,user);
            pr.setString(2, pass);

            rs = pr.executeQuery();
            if(rs.next()) {
                return true;
            }
            return false;
        }
        catch (SQLException ex) {
            return false;
        }
        finally {
                pr.close();
                rs.close();
        }
    }
}