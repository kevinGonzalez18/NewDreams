package test;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.edge.EdgeDriver;

public class test {
    public static void main(String[] args) {
        System.setProperty("webdriver.edge.driver", "C:\\Users\\Felipe Rodriguez\\Documents\\NetBeansProjects\\mavenproject1\\src\\main\\resources\\drivers\\edgedriver_win64\\msedgedriver.exe");
        WebDriver driver = new EdgeDriver();
        driver.get("http://localhost:8080/mavenproject1/index.jsp");
        driver.manage().window().maximize();
    }
}
