package himedia.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import himedia.dao.GuestBookDao;
import himedia.vo.GuestBookVo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//	Controller: 요청 처리, 내부 로직 담당
//	- 목록 (GET)
//	- 입력 폼 (GET) ?a=form
//	- 입력 액션 (POST)
//	어노테이션 방식으로 등록
@WebServlet(name = "Guestbook", urlPatterns = "/gb")
public class GuestBookServlet extends BaseServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터 a=form이면 입력 폼으로 이동
		String actionName = req.getParameter("a");
		if ("deleteform".equals(actionName)) {
			// 사용자 입력 페이지로 FORWARD
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/guestbook/deleteform.jsp");
			rd.forward(req, resp);
		} else {
			// 목록 받아오는 부분 -> /el
			GuestBookDao dao = new GuestBookDao(dbuser, dbpass);
			try {
				List<GuestBookVo> list = dao.getlist();
				req.setAttribute("list", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			// list 객체를 jsp로 FORWARD
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/WEB-INF/views/guestbook/list.jsp");
			rd.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String actionName = req.getParameter("a");
		GuestBookDao dao = new GuestBookDao(dbuser, dbpass);

		if ("insert".equals(actionName)) {
			// 입력 액션 처리
			String name = req.getParameter("name");
			String password = req.getParameter("pass");
			String content = req.getParameter("content");

			try {
				dao.insert(name, password, content);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			// 입력 후 목록 페이지로 리다이렉트
			resp.sendRedirect(req.getContextPath() + "/gb");
		} else if ("delete".equals(actionName)) {
			// 삭제 액션 처리
			int no = Integer.parseInt(req.getParameter("no"));
			String password = req.getParameter("password");

			try {
				if (dao.delete(no, password)) {
					// 삭제 성공 시 목록 페이지로 리다이렉트
					resp.sendRedirect(req.getContextPath() + "/gb");
				} else {
					// 삭제 실패 시 에러 메시지와 함께 다시 삭제 폼으로 포워드
					req.setAttribute("error", "비밀번호가 일치하지 않습니다.");
					RequestDispatcher rd = getServletContext()
							.getRequestDispatcher("/WEB-INF/views/guestbook/deleteform.jsp");
					rd.forward(req, resp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
