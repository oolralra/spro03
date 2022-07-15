package com.keduit.controller;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyVO;
import com.keduit.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	private Long[] bnoArr = {884698L, 884697L, 884696L, 884695L, 884694L };
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1, 10).forEach(i -> {
			
			ReplyVO vo = new ReplyVO();
			
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("댓글 테스트입니다." + i);
			vo.setReplyer("replyer"+i);
			
			mapper.insert(vo);
		});
	}
	
	@Test
	public void testRead() {
		Long rno = 35L;
		
		ReplyVO vo = mapper.read(rno);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		Long rno = 5L;
		int result = mapper.delete(rno);
		log.info("삭제 결과 : " + result);
	}
	
	@Test
	public void testUpdate() {
		long rno = 1L;
		ReplyVO vo = mapper.read(rno);
		
		vo.setReply("Update 댓글 test!!!....");
		
		int result = mapper.update(vo);
		log.info("update 결과 : " + result);
		
		vo = mapper.read(rno);
		log.info("update 후의 replyVO : " + vo);
		
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListwithPaging(cri,  bnoArr[3]);
		
		replies.forEach(reply-> log.info(reply));
		
	}
	

}
