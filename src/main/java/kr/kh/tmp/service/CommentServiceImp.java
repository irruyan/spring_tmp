package kr.kh.tmp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.tmp.dao.CommentDAO;
import kr.kh.tmp.model.vo.CommentVO;
import kr.kh.tmp.model.vo.MemberVO;

@Service
public class CommentServiceImp implements CommentService {
	
	@Autowired
	CommentDAO commentDao;

	@Override
	public boolean insertComment(CommentVO comment, MemberVO user) {
		if(comment == null /* || user == null*/) {
			return false;
		}
		comment.setCo_me_id("user");
		return commentDao.insertComment(comment);
	}
}
