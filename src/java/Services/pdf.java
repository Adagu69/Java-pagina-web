/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Services;

import BusinessEntity.CursoBean2;
import BusinessLogic.CursoController2;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BusinessEntity.CursoBean2;
import BusinessLogic.CursoController2;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.event.DocumentListener;
import javax.swing.event.UndoableEditListener;
import javax.swing.text.AttributeSet;
import javax.swing.text.BadLocationException;
//import javax.swing.text.Document;
//import javax.swing.text.Element;
import javax.swing.text.Position;
import javax.swing.text.Segment;

/**
 *
 * @author U-07
 */
@WebServlet(urlPatterns = {"Services/pdf"})
public class pdf extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream(); // definiendo la salida en pdf.

        try {
            
            try {
         CursoController2 cuC = new CursoController2();
           ArrayList<CursoBean2> ldata = cuC.SelectAll();
           
                if (cuC!=null) {
                  try {

                Document documento = new Document() {
                    
                    public int getLength() {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public void addDocumentListener(DocumentListener listener) {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public void removeDocumentListener(DocumentListener listener) {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public void addUndoableEditListener(UndoableEditListener listener) {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    public void removeUndoableEditListener(UndoableEditListener listener) {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                   
                    public Object getProperty(Object key) {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                   
                    public void putProperty(Object key, Object value) {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public void remove(int offs, int len) throws BadLocationException {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public void insertString(int offset, String str, AttributeSet a) throws BadLocationException {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                   
                    public String getText(int offset, int length) throws BadLocationException {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public void getText(int offset, int length, Segment txt) throws BadLocationException {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public Position getStartPosition() {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public Position getEndPosition() {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public Position createPosition(int offs) throws BadLocationException {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public Element[] getRootElements() {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public Element getDefaultRootElement() {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }

                    
                    public void render(Runnable r) {
                        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
                    }
                }; // creando documento pdf, mediante la instancia de la clase
                PdfWriter.getInstance(documento, out); // ESCRIBIR EN EL PDF, ES DECIR LA SALIDA VA  SER UN DOCUMENTO Y EN PDF.
                documento.open(); // abrir documento.
                Paragraph par1 = new Paragraph(); // Permite definir elementos.
                Font fonttitulo = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD, BaseColor.BLUE);
                par1.add(new Phrase("Reporte con iTextopdf.jar", fonttitulo));
                par1.setAlignment(Element.ALIGN_CENTER);
                par1.add(new Phrase(Chunk.NEWLINE)); // agrega un salto de linea
                par1.add(new Phrase(Chunk.NEWLINE));
                documento.add(par1);

                Paragraph par2 = new Paragraph(); // Permite definir elementos.
                Font fontdescrip = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
                par2.add(new Phrase("Para hacer este reporte en formato pdf, hacemos uso de la librería iTextPdf.jar y el urso de servlet", fontdescrip));
                par2.setAlignment(Element.ALIGN_JUSTIFIED);
                par2.add(new Phrase(Chunk.NEWLINE)); // agrega un salto de linea
                par2.add(new Phrase(Chunk.NEWLINE));
                documento.add(par2);

                Image imagenes = Image.getInstance("C:\\Users\\U-07\\Downloads\\logo_arguedas.jpg");
                imagenes.setAlignment(Element.ALIGN_CENTER);
                imagenes.scaleToFit(100, 100);

                documento.add(imagenes);

                PdfPTable tabla = new PdfPTable(4);
                PdfPCell celda1 = new PdfPCell(new Paragraph("ID Curso", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
                PdfPCell celda2 = new PdfPCell(new Paragraph("Nombre", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
                PdfPCell celda3 = new PdfPCell(new Paragraph("Descripcion ", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));
                PdfPCell celda4 = new PdfPCell(new Paragraph("Estado ", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.RED)));

              tabla.addCell(celda1);
                 tabla.addCell(celda2);
                 tabla.addCell(celda3); 
                tabla.addCell(celda4);
                
                CursoBean2 item = null;

                               Iterator<CursoBean2> iter = ldata.iterator();
                               
                                while (iter.hasNext()) {
                                    item = iter.next();
                                    tabla.addCell(item.getId_curso());
                                     tabla.addCell(item.getNombre_curso());
                                      tabla.addCell(item.getDescripcion_curso());
                                       String estado="";
                     if (item.getEstado_curso()==1 ) {
                             estado="Disponible";
                         }else {
                        estado=" No Disponible"; }
                                       tabla.addCell(estado);
                                }
                documento.add(tabla);
                documento.close();

            } catch (Exception ex) {

                ex.getMessage();
            }  
                }
            }catch(Exception ex)  {
            
            ex.getMessage();
            
            }
            
            
        } finally {

            out.close();
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
