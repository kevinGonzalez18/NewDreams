/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import java.time.Duration;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 *
 * @author kevin
 */
public class pruebaUnitaria09 {

    public static void main(String[] args) throws InterruptedException {
        pruebaUnitaria09 test = new pruebaUnitaria09();

        // Llamar a los métodos de prueba
        test.InicioSesionAdministrador();
        test.AdministradorEliminarServicioEvento();
    }

    public void InicioSesionAdministrador() throws InterruptedException {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\kevin\\OneDrive - SENA\\Documentos\\NetBeansProjects\\New_Dreams\\src\\main\\resources\\drivers\\edgedriver_win64\\msedgedriver.exe");
        // Inicializar el driver
        WebDriver driver = new EdgeDriver();
        JavascriptExecutor js = (JavascriptExecutor) driver;
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5)); // Espera explícita de 10 segundos
        // Abrir el sitio web
        try {
            driver.get("http://localhost:8080/New_Dreams/index.jsp");
            // Maximizar la pestaña
            driver.manage().window().maximize();

            // Credenciales
            String user = "juliansanabria@gmail.com";
            String password = "newdreams001";

            // Localizador por ID
            WebElement loginBtn1 = driver.findElement(By.id("logIn"));

            // Acciones
            loginBtn1.click();
            Thread.sleep(2000);

            // Localizador por ID
            WebElement userBtn = driver.findElement(By.id("userName"));
            WebElement passwordBtn = driver.findElement(By.id("pwd"));
            WebElement loginBtn2 = driver.findElement(By.id("tryLogIn"));

            // Acciones
            userBtn.sendKeys(user);
            passwordBtn.sendKeys(password);
            Thread.sleep(2000);

            loginBtn2.click();
            Thread.sleep(5000);

            // Localizador por ID
            WebElement eventoBtn1 = driver.findElement(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[5]/a"));

            // Acciones
            eventoBtn1.click();
            Thread.sleep(2000);

            // Esperar hasta que la tabla de cotizaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));

            // Ejemplo: Esperar hasta que el botón "Ver más" en la primera fila de la tabla sea clicable
            WebElement botonDetallesEvento = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"Table\"]/tbody/tr[1]/td[5]/a/button")));
            botonDetallesEvento.click();

            Thread.sleep(5000);

            WebElement campoDescripcionEvento = wait.until(ExpectedConditions.elementToBeClickable(By.id("descripcion-evento")));

            // Limpiar el campo y enviar el nuevo texto
            campoDescripcionEvento.clear();
            campoDescripcionEvento.sendKeys("Nuevo texto de descripción del evento");
            Thread.sleep(2000);

            WebElement campoCantidadServicio = wait.until(ExpectedConditions.elementToBeClickable(By.id("service_quantity_0")));

            // Limpiar el campo y enviar el nuevo texto
            campoCantidadServicio.clear();
            campoCantidadServicio.sendKeys("20");
            Thread.sleep(2000);

            WebElement campoCantidadServicio1 = wait.until(ExpectedConditions.elementToBeClickable(By.id("service_quantity_1")));

            // Limpiar el campo y enviar el nuevo texto
            campoCantidadServicio1.clear();
            campoCantidadServicio1.sendKeys("10");

            Thread.sleep(2000);

            WebElement botonActualizarEvento = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"formulario_evento\"]/div/div/div[14]/div[3]/button")));

            botonActualizarEvento.click();
            Thread.sleep(5000);
            WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));

            logOut.click();
            Thread.sleep(5000);
            driver.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }

    }

    public void AdministradorEliminarServicioEvento() throws InterruptedException {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\kevin\\OneDrive - SENA\\Documentos\\NetBeansProjects\\New_Dreams\\src\\main\\resources\\drivers\\edgedriver_win64\\msedgedriver.exe");
        // Inicializar el driver
        WebDriver driver = new EdgeDriver();
        JavascriptExecutor js = (JavascriptExecutor) driver;
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5)); // Espera explícita de 10 segundos
        // Abrir el sitio web
        try {
            driver.get("http://localhost:8080/New_Dreams/index.jsp");
            // Maximizar la pestaña
            driver.manage().window().maximize();

            // Credenciales
            String user = "juliansanabria@gmail.com";
            String password = "newdreams001";

            // Localizador por ID
            WebElement loginBtn1 = driver.findElement(By.id("logIn"));

            // Acciones
            loginBtn1.click();
            Thread.sleep(2000);

            // Localizador por ID
            WebElement userBtn = driver.findElement(By.id("userName"));
            WebElement passwordBtn = driver.findElement(By.id("pwd"));
            WebElement loginBtn2 = driver.findElement(By.id("tryLogIn"));

            // Acciones
            userBtn.sendKeys(user);
            passwordBtn.sendKeys(password);
            Thread.sleep(2000);

            loginBtn2.click();
            Thread.sleep(5000);

            // Localizador por ID
            WebElement eventoBtn1 = driver.findElement(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[5]/a"));

            // Acciones
            eventoBtn1.click();
            Thread.sleep(2000);

            // Esperar hasta que la tabla de cotizaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));

            // Ejemplo: Esperar hasta que el botón "Ver más" en la primera fila de la tabla sea clicable
            WebElement botonDetallesEvento = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"Table\"]/tbody/tr[1]/td[5]/a/button")));
            botonDetallesEvento.click();

            Thread.sleep(5000);

            WebElement botonEliminarServicio = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"formulario_evento\"]/div/div/div[10]/div[4]/button")));
            botonEliminarServicio.click();

            Thread.sleep(5000);

            WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));

            logOut.click();
            Thread.sleep(5000);
            driver.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            //driver.quit();
        }

    }
}
