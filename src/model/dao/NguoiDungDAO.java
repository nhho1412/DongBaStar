package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class NguoiDungDAO {
	public Connection cn;
	public void KetNoi() throws Exception{
		// xac dinh hqtcsdl
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		//System.out.println("da xac dinh HQTCSDL");
		//ket noi CVP00051900BD\\SQLEXPRESS
		cn = DriverManager.getConnection("jdbc:sqlserver://HUYNHHO-PC\\SQLEXPRESS:1433;databaseName=QLDatVePhim4;user=sa;password=123");
		//cn = DriverManager.getConnection("jdbc:sqlserver://CVP00051900EA\\SQLEXPRESS;databaseName=QLDatVePhim2;user=sa;password=123");
		//System.out.println("Da ket noi csql");
	}
	public ResultSet getbang(String tb) throws Exception{
		//tao cau lenh sql
		String sql = "Select * from " + tb;
		//tao doi tuong preparesetatement: cmd
		PreparedStatement statement = cn.prepareStatement(sql);
		//cho thi hanh cau lenh sql tra ve 1 resultset	
		return statement.executeQuery();
	}
	public void dongketnoi() throws Exception {
		cn.close();
	}
}
