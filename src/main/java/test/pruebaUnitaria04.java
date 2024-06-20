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
 * @author feli1
 */
public class pruebaUnitaria04 {

    public static void main(String[] args) {
        pruebaUnitaria04 test = new pruebaUnitaria04();
        test.RegistrarCotizanteComoCliente();
        test.ValidacionCamposObligatoriosRegistroCliente();
    }

    public void RegistrarCotizanteComoCliente() {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\feli1\\OneDrive\\Documentos\\NetBeansProjects\\New_Dreams\\src\\main\\resources\\drivers\\edgedriver_win64\\msedgedriver.exe");
        WebDriver driver = new EdgeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // Espera explícita de 10 segundos
        JavascriptExecutor js = (JavascriptExecutor) driver;
        try {
            driver.get("http://localhost:8080/New_Dreams/index.jsp");
            driver.manage().window().maximize();
            // Credenciales
            String user = "juliansanabria@gmail.com";
            String password = "newdreams001";

            // Localizador por ID y espera hasta que el botón sea clicable
            WebElement loginBtn1 = wait.until(ExpectedConditions.elementToBeClickable(By.id("logIn")));
            loginBtn1.click();

            Thread.sleep(3000);

            // Esperar hasta que los campos de usuario y contraseña sean visibles
            WebElement userBtn = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("userName")));
            WebElement passwordBtn = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("pwd")));
            WebElement loginBtn2 = wait.until(ExpectedConditions.elementToBeClickable(By.id("tryLogIn")));

            // Acciones
            userBtn.sendKeys(user);
            passwordBtn.sendKeys(password);
            loginBtn2.click();
            Thread.sleep(5000);

            // Esperar hasta que el botón de cotizaciones sea clicable
            WebElement botonCotizantes = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[2]/a")));
            botonCotizantes.click();
            Thread.sleep(5000);

            // Esperar hasta que la tabla de coti-zaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));
            Thread.sleep(5000);
            WebElement crearClientebtn = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"Table\"]/tbody/tr[1]/td[5]/button[1]")));
            crearClientebtn.click();
            Thread.sleep(5000);

            WebElement generarContraseñabtn = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"formulario-cotizante\"]/div[1]/div[2]/button")));
            generarContraseñabtn.click();
            Thread.sleep(5000);

            WebElement crearCliente = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"formulario-cotizante\"]/div[2]/button[2]")));
            crearCliente.click();
            Thread.sleep(5000);

            WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));
            logOut.click();
            Thread.sleep(3000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    public void ValidacionCamposObligatoriosRegistroCliente() {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\feli1\\OneDrive\\Documentos\\NetBeansProjects\\New_Dreams\\src\\main\\resources\\drivers\\edgedriver_win64\\msedgedriver.exe");
        WebDriver driver = new EdgeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // Espera explícita de 10 segundos
        JavascriptExecutor js = (JavascriptExecutor) driver;
        try {
            driver.get("http://localhost:8080/New_Dreams/index.jsp");
            driver.manage().window().maximize();
            // Credenciales
            String user = "juliansanabria@gmail.com";
            String password = "newdreams001";

            // Localizador por ID y espera hasta que el botón sea clicable
            WebElement loginBtn1 = wait.until(ExpectedConditions.elementToBeClickable(By.id("logIn")));
            loginBtn1.click();

            Thread.sleep(3000);

            // Esperar hasta que los campos de usuario y contraseña sean visibles
            WebElement userBtn = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("userName")));
            WebElement passwordBtn = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("pwd")));
            WebElement loginBtn2 = wait.until(ExpectedConditions.elementToBeClickable(By.id("tryLogIn")));

            // Acciones
            userBtn.sendKeys(user);
            passwordBtn.sendKeys(password);
            loginBtn2.click();
            Thread.sleep(5000);

            // Esperar hasta que el botón de cotizaciones sea clicable
            WebElement botonCotizantes = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[2]/a")));
            botonCotizantes.click();
            Thread.sleep(5000);

            // Esperar hasta que la tabla de coti-zaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));
            Thread.sleep(5000);
            WebElement crearClientebtn = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"Table\"]/tbody/tr[1]/td[5]/button[1]")));
            crearClientebtn.click();
            Thread.sleep(5000);


            WebElement crearCliente = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"formulario-cotizante\"]/div[2]/button[2]")));
            crearCliente.click();
            Thread.sleep(5000);

            WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));
            logOut.click();
            Thread.sleep(3000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }
}
