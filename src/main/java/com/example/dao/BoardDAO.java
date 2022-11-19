package com.example.dao;

import java.util.ArrayList;
import java.util.List;
import com.example.util.JDBCUtil;
import com.example.bean.BoardVO;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public class BoardDAO {
    Connection conn;
    PreparedStatement stmt;
    ResultSet rs;

    private final String BOARD_INSERT = "insert into INFORMATION (name, age, position, email, militaryNum, birth, photo) values (?, ?, ?, ?, ?, ?, ?);";
    private final String BOARD_UPDATE = "update INFORMATION set name = ?, age = ?, position = ?, email = ?, militaryNum = ?, birth = ?, photo = ? where no = ?";
    private final String BOARD_DELETE = "delete from INFORMATION  where no=?";
    private final String BOARD_GET = "select * from INFORMATION  where no=?";
    private final String BOARD_LIST = "select * from INFORMATION order by no desc";

    public BoardDAO() {
        this.conn = null;
        this.stmt = null;
        this.rs = null;
    }
}
