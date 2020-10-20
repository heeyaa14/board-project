package com.cos.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.board.dto.BoardSaveRequestDto;
import com.cos.board.model.Board;
import com.cos.board.repository.BoardRepository;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;
	
	
	@Transactional
	public void 글쓰기(BoardSaveRequestDto dto) {
		Board boardEntity = BoardSaveRequestDto.toEntity(dto);
		boardRepository.save(boardEntity);
	}

	public Page<Board> 글목록보기(Pageable pageable) {
		return boardRepository.findAll(pageable);
	}
	
	@Transactional
	public Board 글상세보기(int id) {
		Board board = boardRepository.findById(id)
				.orElseThrow(()-> new RuntimeException("ID값 잘못들어옴."));
		
		// 조회수 증가 = 더티체킹
		board.setReadCount(board.getReadCount()+1);
		
		return board;
	}
	
	@Transactional
	public void 글삭제하기(int id) {
		//boardRepository.deleteById(id);
		boardRepository.mDeleteById(id);
	}
	
	@Transactional
	public void 글수정하기(int id, BoardSaveRequestDto dto) {
		// 더티 체킹
		Board boardEntity = boardRepository.mFindById(id);	// BoardRepository에서 query로 처리.
		boardEntity.setTitle(dto.getTitle());
		boardEntity.setContent(dto.getContent());
	}
	
	
}

