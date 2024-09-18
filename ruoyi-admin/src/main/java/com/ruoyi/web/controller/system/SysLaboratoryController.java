package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysLaboratory;
import com.ruoyi.system.service.ISysLaboratoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 实验室Controller
 * 
 * @author ruoyi
 * @date 2024-06-22
 */
@RestController
@RequestMapping("/system/laboratory")
public class SysLaboratoryController extends BaseController
{
    @Autowired
    private ISysLaboratoryService sysLaboratoryService;

    /**
     * 查询实验室列表
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysLaboratory sysLaboratory)
    {
        startPage();
        List<SysLaboratory> list = sysLaboratoryService.selectSysLaboratoryList(sysLaboratory);
        return getDataTable(list);
    }

    /**
     * 导出实验室列表
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:export')")
    @Log(title = "实验室", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysLaboratory sysLaboratory)
    {
        List<SysLaboratory> list = sysLaboratoryService.selectSysLaboratoryList(sysLaboratory);
        ExcelUtil<SysLaboratory> util = new ExcelUtil<SysLaboratory>(SysLaboratory.class);
        util.exportExcel(response, list, "实验室数据");
    }

    /**
     * 获取实验室详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysLaboratoryService.selectSysLaboratoryById(id));
    }

    /**
     * 新增实验室
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:add')")
    @Log(title = "实验室", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysLaboratory sysLaboratory)
    {
        return toAjax(sysLaboratoryService.insertSysLaboratory(sysLaboratory));
    }

    /**
     * 修改实验室
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:edit')")
    @Log(title = "实验室", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysLaboratory sysLaboratory)
    {
        return toAjax(sysLaboratoryService.updateSysLaboratory(sysLaboratory));
    }

    /**
     * 删除实验室
     */
    @PreAuthorize("@ss.hasPermi('system:laboratory:remove')")
    @Log(title = "实验室", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysLaboratoryService.deleteSysLaboratoryByIds(ids));
    }
}
