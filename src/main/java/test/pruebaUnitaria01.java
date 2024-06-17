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

public class pruebaUnitaria01 {

    public static void main(String[] args) throws InterruptedException {
        pruebaUnitaria01 test = new pruebaUnitaria01();

        // Llamar a los métodos de prueba
        test.DiligenciarFormatoCotizacion();
        test.ValidacionCamposObligatoriosCotizacion();
    }

    public void DiligenciarFormatoCotizacion() throws InterruptedException {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\feli1\\OneDrive\\Documentos\\NetBeansProjects\\New_Dreams\\src\\main\\resources\\drivers\\edgedriver_win64\\msedgedriver.exe");
        WebDriver driver = new EdgeDriver();

        try {
            driver.get("http://localhost:8080/New_Dreams/index.jsp");
            driver.manage().window().maximize();

            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
            WebElement botonEvento = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("botonXV")));

            // Esperar a que el elemento sea clicable
            wait.until(ExpectedConditions.elementToBeClickable(botonEvento));

            // Desplazarse al elemento
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", botonEvento);

            // Hacer clic usando JavaScript
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", botonEvento);

            Thread.sleep(5000);

            WebElement botonInfoEvento = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("/html/body/div[2]/div[1]/div[2]/a")));
            wait.until(ExpectedConditions.elementToBeClickable(botonInfoEvento));
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", botonInfoEvento);
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", botonInfoEvento);

            Thread.sleep(5000);

            // Localizar y rellenar el formulario
            WebElement tipoEvento = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("item_type")));
            Select tipoEventoSelect = new Select(tipoEvento);
            tipoEventoSelect.selectByValue("XVaños");

            WebElement lugarEvento = driver.findElement(By.id("event_location"));
            Select lugarEventoSelect = new Select(lugarEvento);
            lugarEventoSelect.selectByValue("tengo");

            WebElement nombreLugar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("event_name")));
            nombreLugar.sendKeys("Salon de Eventos XYZ");

            WebElement direccionLugar = driver.findElement(By.id("event_address"));
            direccionLugar.sendKeys("Calle 123");

            WebElement barrioLugar = driver.findElement(By.id("event_neighborhood"));
            barrioLugar.sendKeys("Barrio ABC");

            WebElement cantidadPersonas = driver.findElement(By.id("quantity"));
            cantidadPersonas.sendKeys("50");

            // Interactuar con el Flatpickr para seleccionar la fecha y hora
            WebElement iconoFecha = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("toggle_date_icon")));
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", iconoFecha);

            Thread.sleep(1000); // Esperar un momento para que el calendario se muestre

            // Seleccionar la fecha deseada en el calendario (16 de julio de 2024)
            WebElement fecha = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[@class='flatpickr-day' and text()='27']")));
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", fecha);

            // Seleccionar la hora y los minutos
            WebElement hora = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input.flatpickr-hour")));
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", hora);
            hora.clear();
            hora.sendKeys("10"); // Seleccionar la hora (10 AM por ejemplo)

            WebElement minutos = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input.flatpickr-minute")));
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", minutos);
            minutos.clear();
            minutos.sendKeys("30"); // Seleccionar los minutos (30 por ejemplo)

            WebElement nombreContacto = driver.findElement(By.id("name"));
            nombreContacto.sendKeys("Juan");

            WebElement apellidosContacto = driver.findElement(By.id("last-name"));
            apellidosContacto.sendKeys("Perez Gomez");

            WebElement emailContacto = driver.findElement(By.id("email"));
            emailContacto.sendKeys("juan.perez@example.com");

            WebElement telefonoContacto = driver.findElement(By.id("phone"));
            telefonoContacto.sendKeys("1234567890");

            // Llenar datos de mantelería
            for (int i = 0; i < 2; i++) {
                WebElement manteleria = driver.findElement(By.id("service_quantity_manteleria_" + i));
                manteleria.sendKeys("10");
            }

            // Llenar datos de mesas y sillas
            for (int i = 0; i < 2; i++) {
                WebElement mesasSillas = driver.findElement(By.id("service_quantity_mesasSillas_" + i));
                mesasSillas.sendKeys("10");
            }

            // Llenar datos de decoración
            for (int i = 0; i < 2; i++) {
                WebElement decoracion = driver.findElement(By.id("service_quantity_decoracion_" + i));
                decoracion.sendKeys("10");
            }

            WebElement botonEnviar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("botonEnviar")));
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", botonEnviar);
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", botonEnviar);

            Thread.sleep(30000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }
    
    public void ValidacionCamposObligatoriosCotizacion() throws InterruptedException {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\feli1\\OneDrive\\Documentos\\NetBeansProjects\\New_Dreams\\src\\main\\resources\\drivers\\edgedriver_win64\\msedgedriver.exe");
        WebDriver driver = new EdgeDriver();

        try {
            driver.get("http://localhost:8080/New_Dreams/index.jsp");
            driver.manage().window().maximize();

            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
            WebElement botonEvento = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("botonXV")));

            // Esperar a que el elemento sea clicable
            wait.until(ExpectedConditions.elementToBeClickable(botonEvento));

            // Desplazarse al elemento
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", botonEvento);

            // Hacer clic usando JavaScript
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", botonEvento);

            Thread.sleep(5000);

            WebElement botonInfoEvento = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("/html/body/div[2]/div[1]/div[2]/a")));
            wait.until(ExpectedConditions.elementToBeClickable(botonInfoEvento));
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", botonInfoEvento);
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", botonInfoEvento);

            Thread.sleep(5000);

            // Localizar y rellenar el formulario
            WebElement tipoEvento = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("item_type")));
            Select tipoEventoSelect = new Select(tipoEvento);
            tipoEventoSelect.selectByValue("XVaños");

            WebElement lugarEvento = driver.findElement(By.id("event_location"));
            Select lugarEventoSelect = new Select(lugarEvento);
            lugarEventoSelect.selectByValue("tengo");

            WebElement nombreLugar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("event_name")));
            nombreLugar.sendKeys("Salon de Eventos XYZ");

            WebElement direccionLugar = driver.findElement(By.id("event_address"));
            direccionLugar.sendKeys("Calle 123");

            WebElement barrioLugar = driver.findElement(By.id("event_neighborhood"));
            barrioLugar.sendKeys("Barrio ABC");


            // Interactuar con el Flatpickr para seleccionar la fecha y hora
            WebElement iconoFecha = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("toggle_date_icon")));
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", iconoFecha);

            Thread.sleep(1000); // Esperar un momento para que el calendario se muestre

            // Seleccionar la fecha deseada en el calendario (16 de julio de 2024)
            WebElement fecha = wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//span[@class='flatpickr-day' and text()='27']")));
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", fecha);

            // Seleccionar la hora y los minutos
            WebElement hora = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input.flatpickr-hour")));
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", hora);
            hora.clear();
            hora.sendKeys("10"); // Seleccionar la hora (10 AM por ejemplo)

            WebElement minutos = wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("input.flatpickr-minute")));
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", minutos);
            minutos.clear();
            minutos.sendKeys("30"); // Seleccionar los minutos (30 por ejemplo)


            // Llenar datos de mantelería
            for (int i = 0; i < 2; i++) {
                WebElement manteleria = driver.findElement(By.id("service_quantity_manteleria_" + i));
                manteleria.sendKeys("10");
            }

            // Llenar datos de mesas y sillas
            for (int i = 0; i < 2; i++) {
                WebElement mesasSillas = driver.findElement(By.id("service_quantity_mesasSillas_" + i));
                mesasSillas.sendKeys("10");
            }

            // Llenar datos de decoración
            for (int i = 0; i < 2; i++) {
                WebElement decoracion = driver.findElement(By.id("service_quantity_decoracion_" + i));
                decoracion.sendKeys("10");
            }

            WebElement botonEnviar = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("botonEnviar")));
            ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", botonEnviar);
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", botonEnviar);

            Thread.sleep(30000);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }

}
