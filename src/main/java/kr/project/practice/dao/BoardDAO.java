package kr.project.practice.dao;

import java.util.ArrayList;

import kr.project.practice.dto.BoardDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> list(); //게시판 불러오기

	BoardDTO detail(String idx); //게시판 상세보기

	int bHit(String idx); // 조회수 올려주기
	
	int write(BoardDTO dto);

	int update(BoardDTO dto);

	int delete(String idx);

}
