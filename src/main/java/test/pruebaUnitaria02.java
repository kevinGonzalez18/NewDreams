package test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import org.openqa.selenium.JavascriptExecutor;

//TENER CUIDADO CON EL METODO APROBAR, REVISAR QUE LA COTIZACION A APROBAR TENGA EL CLIENTE CREADO
public class pruebaUnitaria02 {

    public static void main(String[] args) {
        pruebaUnitaria02 test = new pruebaUnitaria02();
        test.ConsultarCotizaciones();
    }

    public void ConsultarCotizaciones() {
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
            WebElement botonCotizaciones = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"sidebar\"]/div/ul/li[3]/a")));
            botonCotizaciones.click();

            Thread.sleep(5000);

            // Esperar hasta que la tabla de cotizaciones esté visible
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("Table")));

            // Aquí puedes agregar más lógica según sea necesario para interactuar con los elementos cargados dinámicamente
            // Ejemplo: Esperar hasta que el botón "Ver más" en la primera fila de la tabla sea clicable
            WebElement botonVerMasCotizacion = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"Table\"]/tbody/tr[1]/td[6]/a/button")));
            botonVerMasCotizacion.click();

            Thread.sleep(5000);

            // Esperar hasta que la página de detalle de la cotización esté visible
            WebElement detalleCotizacion = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"main\"]/div[1]/main/section/div/div/h2")));

            // Esperar hasta que el botón "Aprobar cotización" sea visible y desplazarse hasta él
            WebElement aprobarCotizacionBtn = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//*[@id=\"cotizacionForm\"]/div/div/div[12]/div/button[2]")));
            js.executeScript("arguments[0].scrollIntoView(true);", aprobarCotizacionBtn);

            // Esperar hasta que el botón "Aprobar cotización" sea clicable y hacer clic con JavaScript
            wait.until(ExpectedConditions.elementToBeClickable(aprobarCotizacionBtn));
            js.executeScript("arguments[0].click();", aprobarCotizacionBtn);
            
            Thread.sleep(5000);

            // Esperar hasta que el botón de confirmación de SweetAlert sea visible y clicable
            WebElement sweetAlertConfirmBtn = wait.until(ExpectedConditions.elementToBeClickable(By.cssSelector("button.swal2-confirm.swal2-styled")));
            sweetAlertConfirmBtn.click();

            Thread.sleep(5000);

            WebElement logOut = wait.until(ExpectedConditions.elementToBeClickable(By.xpath("//*[@id=\"logoutButton\"]")));
            logOut.click();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }
}
