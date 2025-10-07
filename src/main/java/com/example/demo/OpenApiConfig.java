package com.example.demo;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * OpenAPIのメタデータを定義する設定クラス。
 */
@Configuration
public class OpenApiConfig {

    /**
     * Swagger UIで表示するAPI情報を構築する。
     *
     * @return OpenAPI定義
     */
    @Bean
    public OpenAPI demoOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("Demo API")
                        .description("Spring BootサンプルアプリのAPI仕様です。")
                        .version("v1.0.0")
                        .contact(new Contact()
                                .name("Demo Team")
                                .url("https://example.com")
                                .email("contact@example.com")));
    }
}
