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
        //�õ�һ��NumberFormat��ʵ��
        NumberFormat nf = NumberFormat.getInstance();
        //�����Ƿ�ʹ�÷���
        nf.setGroupingUsed(false);
        //�����������λ��
        nf.setMaximumIntegerDigits(5);
        //������С����λ��    
        nf.setMinimumIntegerDigits(5);
        //����������
		
		System.out.print(nf.format(tmp_comid1));
	}

}
