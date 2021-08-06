/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.Room;
import entity.Time;
import entity.Class;
import entity.TimeTable;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import validate.Validation;

/**
 *
 * @author Vuong Van Truong
 */
@WebServlet(name = "AddControl", urlPatterns = {"/add"})
public class AddControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        List<Time> listTime = dao.loadAllSlot();
        List<Room> listRoom = dao.loadAllRoom();
        List<Class> listClass = dao.loadAllClass();
        request.setAttribute("listTime", listTime);
        request.setAttribute("listRoom", listRoom);
        request.setAttribute("listClass", listClass);
        
        request.getRequestDispatcher("Add.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session= request.getSession();
        String date = request.getParameter("date");
        String slot =  request.getParameter("slot");
        String room = request.getParameter("room");
        String teacher = request.getParameter("teacher");
        String classID = request.getParameter("class");
        String result;
        String mess = "";
        DAO dao = new DAO();
        Validation v = new Validation();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        int teacherID = dao.checkTeacherExist(teacher);
        
        if (teacherID == -1) {
            result = "Must be available in database";
        } 
        else if (dao.checkRoomExist(date, Integer.parseInt(slot), Integer.parseInt(room))) {
            result = "One Room cannot arrange for 2 class/course in the same time";
        }    
        else if (dao.checkTeacherHaveClass(date, Integer.parseInt(slot), teacherID)) {
            result = "Teacher " + teacher + "cannot teach 2 class/course in the same time";
        } 
        else {
            if (dao.addTimeTable(
                    Integer.parseInt(classID),
                    (date),
                    Integer.parseInt(slot),
                    Integer.parseInt(room),
                    teacherID) == 1) {
                request.setAttribute("Add Successfull!", mess);
                response.sendRedirect("home");
                return;
            }
            result = "This class is learning in this time!";
        }
        List<Time> listTime = dao.loadAllSlot();
        List<Room> listRoom = dao.loadAllRoom();
        List<Class> listClass = dao.loadAllClass();
        
        request.setAttribute("listTime", listTime);
        request.setAttribute("listRoom", listRoom);
        request.setAttribute("listClass", listClass);
        request.setAttribute("result", result);
        request.getRequestDispatcher("Add.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
