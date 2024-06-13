package test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.WebElement;

public class test {
    public static void main(String[] args) throws InterruptedException {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\feli1\\OneDrive\\Documentos\\NetBeansProjects\\New_Dreams\\src\\main\\resources\\drivers\\edgedriver_win64\\msedgedriver.exe");
        
        //Inicializar el driver
        WebDriver driver = new EdgeDriver();
        
        //Abrir el sitio web
        driver.get("http://localhost:8080/mavenproject1/index.jsp");
        //Maximizar la pestaña
        driver.manage().window().maximize();
        
        //Credenciales
        String user = "juliansanabria@gmail.com";
        String password = "newdreams001";
        
        //Localizador por ID
        WebElement loginBtn1 = driver.findElement(By.id("logIn"));
        
        //Acciones
        loginBtn1.click();
        Thread.sleep(2000);
        
        //Localizador por ID
        WebElement userBtn = driver.findElement(By.id("userName"));
        WebElement passwordBtn = driver.findElement(By.id("pwd"));
        WebElement loginBtn2 = driver.findElement(By.id("tryLogIn"));
        
        //Acciones
        userBtn.sendKeys(user);
        passwordBtn.sendKeys(password);
        Thread.sleep(2000);
        
        loginBtn2.click();
        Thread.sleep(5000);
        
        
        WebElement logOut = driver.findElement(By.xpath("//*[@id=\"logoutButton\"]"));
        
        logOut.click();
    }
}
