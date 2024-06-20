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
public class pruebaUnitaria06 {

    public static void main(String[] args) {
        pruebaUnitaria06 test = new pruebaUnitaria06();
        test.ModificarDatosCliente();
        test.ValidaciónCamposOligatorios();
        test.ConsultarClientes();
        test.InhabilitarClientes();
    }

    public void ModificarDatosCliente() {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\feli1\\OneDrive\\Documentos\\NetBeansProjects\\New_Dreams\\src\\main\\resources\\drivers\\edgedriver_win64\\msedgedriver.exe");
        WebDriver driver = new EdgeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // Espera explícita de 10 segundos
        JavascriptExecutor js = (JavascriptExecutor) driver;
        try {
            driver.get("http://localhost:8080/New_Dreams/index.jsp");
            driver.manage().window().maximize();
            // Credenciales
            String user = "dfelipebr737@gmail.com";
            String password = "contraseña1";;

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
            WebElement botonDatos = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[3]/a")));
            botonDatos.click();

            WebElement nombre = wait.until(ExpectedConditions.elementToBeClickable(By.id("name")));
            nombre.clear();
            nombre.sendKeys("Damian Felipe");
            WebElement apellido = wait.until(ExpectedConditions.elementToBeClickable(By.id("last-name")));
            apellido.clear();
            apellido.sendKeys("Rodriguez");
            WebElement telefono = wait.until(ExpectedConditions.elementToBeClickable(By.id("phone")));
            telefono.clear();
            telefono.sendKeys("0315776150");
            Thread.sleep(5000);

            WebElement submit = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"form2\"]/div[5]/input")));
            submit.click();
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

    public void ValidaciónCamposOligatorios() {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\feli1\\OneDrive\\Documentos\\NetBeansProjects\\New_Dreams\\src\\main\\resources\\drivers\\edgedriver_win64\\msedgedriver.exe");
        WebDriver driver = new EdgeDriver();
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10)); // Espera explícita de 10 segundos
        JavascriptExecutor js = (JavascriptExecutor) driver;
        try {
            driver.get("http://localhost:8080/New_Dreams/index.jsp");
            driver.manage().window().maximize();
            // Credenciales
            String user = "dfelipebr737@gmail.com";
            String password = "contraseña1";;

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
            WebElement botonDatos = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[3]/a")));
            botonDatos.click();

            WebElement nombre = wait.until(ExpectedConditions.elementToBeClickable(By.id("name")));
            nombre.clear();
            nombre.sendKeys("Damian Felipe");
            WebElement apellido = wait.until(ExpectedConditions.elementToBeClickable(By.id("last-name")));
            apellido.clear();
            apellido.sendKeys("Rodriguez");
            WebElement telefono = wait.until(ExpectedConditions.elementToBeClickable(By.id("phone")));
            telefono.clear();
            Thread.sleep(5000);

            WebElement submit = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"form2\"]/div[5]/input")));
            submit.click();
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

    public void ConsultarClientes() {
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
            WebElement botonClientes = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[4]/a")));
            botonClientes.click();

            Thread.sleep(5000);

            // Esperar hasta que la tabla de coti-zaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));
            WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));
            logOut.click();
            Thread.sleep(5000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

    public void InhabilitarClientes() {
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
            WebElement botonClientes = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[4]/a")));
            botonClientes.click();

            Thread.sleep(5000);

            // Esperar hasta que la tabla de coti-zaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));
            WebElement editarClientesBtn = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"Table\"]/tbody/tr[1]/td[7]/a/button")));
            editarClientesBtn.click();
            Thread.sleep(5000);

            WebElement estadoBtn = wait.until(ExpectedConditions.elementToBeClickable(By.id("estadoCliente")));
            Select estadoCliente = new Select (estadoBtn);
            estadoCliente.selectByValue("Inhabilitado");
            Thread.sleep(5000);
            WebElement estadoEnviarBtn = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"formulario-datos-cliente\"]/button")));
            estadoEnviarBtn.click();
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
