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
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 *
 * @author feli1
 */
public class pruebaUnitaria13 {

    public static void main(String[] args) {
        pruebaUnitaria13 test = new pruebaUnitaria13();
        test.consultarServicio();
        test.AgregarServicio();
        test.EliminarServicio();
        test.ActualizarServicio();
        test.ValidarAgregarServicio();
    }

    public void consultarServicio() {
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
            WebElement botonCotizaciones = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[7]/a")));
            botonCotizaciones.click();
            Thread.sleep(5000);

            // Esperar hasta que la tabla de coti-zaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));
            Thread.sleep(5000);
            WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));
            logOut.click();
            Thread.sleep(5000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    public void AgregarServicio() {
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
            WebElement botonCotizaciones = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[7]/a")));
            botonCotizaciones.click();
            Thread.sleep(5000);

            // Esperar hasta que la tabla de coti-zaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));
            WebElement agregarServicioBtn = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"main\"]/div[2]/div[1]/button")));
            agregarServicioBtn.click();
            WebElement nombreServicio = wait.until(ExpectedConditions.elementToBeClickable(By.id("nombreServicio")));
            nombreServicio.sendKeys("Espuma artificial");
            WebElement valorServicio = wait.until(ExpectedConditions.elementToBeClickable(By.id("valorServicio")));
            valorServicio.sendKeys("10000");
            WebElement tipoServicio = wait.until(ExpectedConditions.elementToBeClickable(By.id("tipoServicio")));
            Select tipoServicioSelect = new Select(tipoServicio);
            tipoServicioSelect.selectByValue("Decoracion");
            Thread.sleep(5000);
            WebElement agregarServicio = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"formulario-servicio\"]/div[2]/button[2]")));
            agregarServicio.click();
            Thread.sleep(5000);

            WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));
            logOut.click();
            Thread.sleep(5000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    public void EliminarServicio() {
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
            WebElement botonCotizaciones = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[7]/a")));
            botonCotizaciones.click();
            Thread.sleep(5000);

            // Esperar hasta que la tabla de coti-zaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));
            WebElement eliminarServiciobtn = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"Table\"]/tbody/tr[1]/td[5]/button[2]")));
            eliminarServiciobtn.click();
            Thread.sleep(5000);

            WebElement sweetAlertConfirmBtn = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector("button.swal2-confirm.swal2-styled.swal2-default-outline")));
            sweetAlertConfirmBtn.click();
            Thread.sleep(5000);

            WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));
            logOut.click();
            Thread.sleep(5000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    public void ActualizarServicio() {
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
            WebElement botonCotizaciones = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[7]/a")));
            botonCotizaciones.click();
            Thread.sleep(5000);

            // Esperar hasta que la tabla de coti-zaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));
            WebElement actualizarServiciobtn = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"Table\"]/tbody/tr[1]/td[5]/button[1]")));
            actualizarServiciobtn.click();
            Thread.sleep(5000);

            WebElement nombreServicio = wait.until(ExpectedConditions.elementToBeClickable(By.id("nombreServicioActualizar")));
            nombreServicio.clear();
            nombreServicio.sendKeys("Silla de plastico");
            WebElement valorServicio = wait.until(ExpectedConditions.elementToBeClickable(By.id("valorServicioActualizar")));
            valorServicio.clear();
            valorServicio.sendKeys("5000");
            WebElement tipoServicio = wait.until(ExpectedConditions.elementToBeClickable(By.id("tipoServicioActualizar")));
            Select tipoServicioSelect = new Select(tipoServicio);
            tipoServicioSelect.selectByValue("Mesas y sillas");
            Thread.sleep(5000);

            WebElement actualizarServicio = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"formulario-servicio-actualizar\"]/div[2]/button[2]")));
            actualizarServicio.click();
            Thread.sleep(5000);

            WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));
            logOut.click();
            Thread.sleep(5000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    public void ValidarAgregarServicio() {
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
            WebElement botonCotizaciones = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[7]/a")));
            botonCotizaciones.click();
            Thread.sleep(5000);

            // Esperar hasta que la tabla de coti-zaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));
            WebElement agregarServicioBtn = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"main\"]/div[2]/div[1]/button")));
            agregarServicioBtn.click();
            WebElement nombreServicio = wait.until(ExpectedConditions.elementToBeClickable(By.id("nombreServicio")));
            nombreServicio.sendKeys("Espuma artificial");
            WebElement tipoServicio = wait.until(ExpectedConditions.elementToBeClickable(By.id("tipoServicio")));
            Select tipoServicioSelect = new Select(tipoServicio);
            tipoServicioSelect.selectByValue("Decoracion");
            Thread.sleep(5000);
            WebElement agregarServicio = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"formulario-servicio\"]/div[2]/button[2]")));
            agregarServicio.click();
            Thread.sleep(5000);

            WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));
            logOut.click();
            Thread.sleep(5000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

}
