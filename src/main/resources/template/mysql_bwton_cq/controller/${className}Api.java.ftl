<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.${module}.api.interfaces;



import java.util.List;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.bwton.lang.Result;
import ${basePackage}.${module}.api.fallback.${className}FallbackFactory;
import ${basePackage}.${module}.api.dto.request.${className}RequestDTO;

/**
 * ***********************************************************
 * Copyright  ${year} 八维通科技有限公司 Inc.All rights reserved.  *
 * ***********************************************************
 *
 * description:
 * @author ${author}
 * @date ${.now}
 */

@FeignClient(value = "bas-${module}-service", fallbackFactory = ${className}FallbackFactory.class)
public interface ${className}Api {

    //@PostMapping(value = "/bas/user/v1/register", consumes = "application/json")
    //Result register(@RequestBody UserRegisterRequestDTO userRegisterRequestDTO);
}
