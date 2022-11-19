package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.bean.BoardVO;
import com.example.util.JDBCUtil;

public class BoardDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String BOARD_INSERT = "insert into INFORMATION (name, age, position, email, militaryNum, birth, photo) values (?,?,?,?,?,?,?)";
    private final String BOARD_UPDATE = "update INFORMATION set name=?, age=?, position=?, email=?, militaryNum=?, birth=?, photo=? where no=?";
    private final String BOARD_DELETE = "delete from INFORMATION  where no=?";
    private final String BOARD_GET = "select * from INFORMATION  where no=?";
    private final String BOARD_LIST = "select * from INFORMATION order by no desc";

    public int insertBoard(BoardVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_INSERT);
            stmt.setString(1, vo.getName());
            stmt.setString(2, vo.getAge());
            stmt.setString(3, vo.getPosition());
            stmt.setString(4, vo.getEmail());
            stmt.setString(5, vo.getMilNum());
            stmt.setString(6, vo.getBirth());
            stmt.setString(7, vo.getPhotoPath());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 글 삭제
    public void deleteBoard(BoardVO vo) {
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_DELETE);
            stmt.setInt(1, vo.getNo());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int updateBoard(BoardVO vo) {
        System.out.println("===> JDBC로 updateBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_UPDATE);
            stmt.setString(1, vo.getName());
            stmt.setString(2, vo.getAge());
            stmt.setString(3, vo.getPosition());
            stmt.setString(4, vo.getEmail());
            stmt.setString(5, vo.getMilNum());
            stmt.setString(6, vo.getBirth());
            stmt.setString(7, vo.getPhotoPath());
            stmt.setInt(8, vo.getNo());


            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public BoardVO getBoard(int seq) {
        BoardVO one = new BoardVO();
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()) {
                one.setNo(rs.getInt("no"));
                one.setName(rs.getString("name"));
                one.setAge(rs.getString("age"));
                one.setPosition(rs.getString("position"));
                one.setEmail(rs.getString("email"));
                one.setMilNum(rs.getString("militaryNum"));
                one.setBirth(rs.getString("birth"));
                one.setPhotoPath(rs.getString("photo"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<BoardVO> getBoardList(){
        List<BoardVO> list = new ArrayList<BoardVO>();
        System.out.println("===> JDBC로 getBoardList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(BOARD_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                BoardVO one = new BoardVO();
                one.setNo(rs.getInt("no"));
                one.setName(rs.getString("name"));
                one.setAge(rs.getString("age"));
                one.setPosition(rs.getString("position"));
                one.setEmail(rs.getString("email"));
                one.setMilNum(rs.getString("militaryNum"));
                one.setBirth(rs.getString("birth"));
                one.setPhotoPath(rs.getString("photo"));
                one.setRegdate(rs.getDate("regdate"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getPhotoFilename(final int seq) {
        String filename = null;

        try {
            this.conn = JDBCUtil.getConnection();
            (this.stmt = this.conn.prepareStatement("select * from INFORMATION  where no=?")).setInt(1, seq);
            this.rs = this.stmt.executeQuery();

            if (this.rs.next()) {
                filename = this.rs.getString("photo");
            }

            this.rs.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return filename;
    }
}
