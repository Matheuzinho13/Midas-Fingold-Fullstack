package br.com.midas.factory;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

    private static ConnectionFactory connectionManager;

    private ConnectionFactory() {
    }

    public static ConnectionFactory getInstance() {
        if (connectionManager == null) {
            connectionManager = new ConnectionFactory();
        }
        return connectionManager;
    }

    public Connection getConnection() {
        Connection connection = null;
        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");

            connection = DriverManager.getConnection(
                    "URL",
                    "USER",
                    "PASSWORD");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

}