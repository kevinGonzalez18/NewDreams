package Modelo;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

public class PdfGenerator {

    public static String generatePdf(String fileName, cotizante cotizante, cotizacion cotizacion, List<cotizacionServicio> cotizacionServicios) throws FileNotFoundException, DocumentException {
        Document document = new Document();
        String tempDir = "C:\\Users\\feli1\\OneDrive\\Documentos\\pdf";
        String filePath = tempDir + fileName;
        try {
            PdfWriter.getInstance(document, new FileOutputStream(filePath));
            document.open();

            // Agregar título
            Paragraph title = new Paragraph("Detalles de la Cotización", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, BaseColor.BLACK));
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            document.add(Chunk.NEWLINE); // Línea en blanco

            // Información del cotizante
            document.add(new Paragraph("Nombre: " + cotizante.getCotizanteNombre()));
            document.add(new Paragraph("Apellido: " + cotizante.getCotizanteApellido()));
            document.add(new Paragraph("Correo: " + cotizante.getCotizanteCorreo()));
            document.add(new Paragraph("Teléfono: " + cotizante.getCotizanteTelefono()));

            document.add(Chunk.NEWLINE); // Línea en blanco

            // Información de la cotización
            document.add(new Paragraph("Tipo de Cotización: " + cotizacion.getTipoCotizacion()));
            document.add(new Paragraph("Ubicación: " + cotizacion.getUbicacion()));
            document.add(new Paragraph("Fecha del Evento: " + cotizacion.getFechaParcialEvento()));
            document.add(new Paragraph("Fecha de la Cotización: " + cotizacion.getFechaCotizacion()));
            document.add(new Paragraph("Valor de la Cotización: " + cotizacion.getValorCotizacion()));
            document.add(new Paragraph("Cantidad de Personas: " + cotizacion.getCantidadPersonas()));

            document.add(Chunk.NEWLINE); // Línea en blanco

            // Tabla para los servicios
            PdfPTable table = new PdfPTable(3); // 3 columnas
            table.setWidthPercentage(100); // Ancho de la tabla al 100% de la página
            table.setSpacingBefore(10f); // Espacio antes de la tabla
            table.setSpacingAfter(10f); // Espacio después de la tabla

            // Definir los encabezados de la tabla
            PdfPCell cell;

            cell = new PdfPCell(new Phrase("Servicio", FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase("Cantidad", FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase("Precio Total", FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            table.addCell(cell);

            // Agregar los datos de los servicios
            for (cotizacionServicio cotServ : cotizacionServicios) {
                table.addCell(cotServ.getServicio().getServicioNombre());
                table.addCell(String.valueOf(cotServ.getCantidad()));
                table.addCell(String.valueOf(cotServ.getPrecioTotal()));
            }

            document.add(table);

            document.close();
            System.out.println("PDF generado en: " + filePath);

        } catch (DocumentException | IOException e) {
            e.printStackTrace();
        }

        return filePath; // Retorna la ruta del PDF generado
    }
}
