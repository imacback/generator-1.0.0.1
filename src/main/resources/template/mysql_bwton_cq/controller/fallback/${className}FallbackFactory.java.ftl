<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.${module}.api.fallback;


import ${basePackage}.${module}.api.interfaces.${className}Api;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * ***********************************************************
 * Copyright  ${year} 八维通科技有限公司 Inc.All rights reserved.  *
 * ***********************************************************
 *
 * description:
 * @author ${author}
 * @date ${.now}
 */
@Component
public class ${className}FallbackFactory implements FallbackFactory<${className}Api> {
    @Override
    public ${className}Api create(Throwable cause) {
        return new ${className}Api() {
//            @Override
//            public Result register(PushRequestDTO userRegisterRequestDTO) {
//                return new Result<String>(CommonErrors.SERVICE_UNAVAILABLE,
//                        "fallback cause = " + cause.getMessage());
//            }
        };
    }
}
