/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package luonglv.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import luonglv.dtos.BookDTO;
import luonglv.dtos.CouponDTO;
import luonglv.dtos.OrderDTO;
import luonglv.dtos.OrderError;
import shoppingcarts.ShoppingCart;
import luonglv.models.BookBean;
import luonglv.models.CouponBean;
import luonglv.models.OrderBean;

/**
 *
 * @author LeVaLu
 */
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String INVALID = "customer_checkout.jsp";
    private static final String SUCCESS = "customer_confirm.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean check = false;
        try {
            String code = request.getParameter("txtDiscountCode");

            HttpSession session = request.getSession();
            ShoppingCart shoppingCartDTO = (ShoppingCart) session.getAttribute("CART");

            if (shoppingCartDTO != null) {
                OrderDTO orderDTO = new OrderDTO();
                orderDTO.setUserId(shoppingCartDTO.getCustomerId());
                orderDTO.setListBook(new ArrayList<>(shoppingCartDTO.getCart().values()));

                BookBean bookBean = new BookBean();
                int quantity;
                for (BookDTO bookDTO : orderDTO.getListBook()) {
                    bookBean.setBookId(bookDTO.getBookId());
                    quantity = bookBean.loadQuantity();
                    if (quantity < bookDTO.getQuantityCart()) {
                        OrderError orderError = new OrderError();
                        orderError.setOrderError("Book:  " + bookDTO.getTitle() + " is out of stock!");
                        request.setAttribute("INVALID", orderError);
                        url = INVALID;
                        check = true;
                    }
                }

                if (!check) {
                    OrderBean orderBean = new OrderBean();
                    if (!code.isEmpty()) {
                        CouponBean couponBean = new CouponBean();
                        couponBean.setCode(code);
                        if (!couponBean.check()) {
                            OrderError orderError = new OrderError();
                            orderError.setOrderError("Discount Code is invalid!");
                            request.setAttribute("INVALID", orderError);
                            url = INVALID;
                        } else {
                            CouponDTO couponDTO = couponBean.findByCode();
                            orderDTO.setCouponCode(code);
                            orderDTO.setDiscountValue(couponDTO.getValue());
                            float subtotal = shoppingCartDTO.getTotal() - couponDTO.getValue();
                            orderDTO.setTotal(subtotal < 0 ? 0 : subtotal);
                            orderBean.setOrderDTO(orderDTO);
                            if (orderBean.insertWithDiscount()) {
                                shoppingCartDTO.removeAll();
                                request.setAttribute("ORDER", orderDTO);
                                url = SUCCESS;
                            } else {
                                request.setAttribute("ERROR", "Order fail!");
                            }
                        }
                    } else {
                        orderDTO.setTotal(shoppingCartDTO.getTotal());
                        orderBean.setOrderDTO(orderDTO);
                        if (orderBean.insertNoDiscount()) {
                            shoppingCartDTO.removeAll();
                            request.setAttribute("ORDER", orderDTO);
                            url = SUCCESS;
                        } else {
                            request.setAttribute("ERROR", "Order fail!");
                        }
                    }
                }
            }

        } catch (SQLException | NamingException e) {
            log("Error at CheckoutController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
