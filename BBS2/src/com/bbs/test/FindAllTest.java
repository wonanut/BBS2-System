package com.bbs.test;

import java.text.DecimalFormat;
import java.text.NumberFormat;

import com.bbs.dbconnect.comment.CommentDAO;
import com.bbs.dbconnect.message.MessageDAO;

public class FindAllTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String tmp_comid = MessageDAO.getNewId();
		int tmp_comid1 = Integer.parseInt(tmp_comid) + 1;
        //得到一个NumberFormat的实例
        NumberFormat nf = NumberFormat.getInstance();
        //设置是否使用分组
        nf.setGroupingUsed(false);
        //设置最大整数位数
        nf.setMaximumIntegerDigits(5);
        //设置最小整数位数    
        nf.setMinimumIntegerDigits(5);
        //输出测试语句
		
		System.out.print(nf.format(tmp_comid1));
	}

}
