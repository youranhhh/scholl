package com.dtz.controller;

import com.dtz.pojo.InspectionRecord;
import com.dtz.pojo.Laboratory;
import com.dtz.pojo.Term;
import com.dtz.pojo.User;
import com.dtz.service.InspectionRecordService;
import com.dtz.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/inspection_record")
public class InspectionRecordController {
    @Autowired
    private InspectionRecordService inspectionRecordService;
    @Autowired
    private UserService userService;
    @RequestMapping("/recordlist")
    public String recordlist(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Integer userId = user.getId();
        List<InspectionRecord> inspectionRecord = inspectionRecordService.listAll(userId);
        model.addAttribute("inspectionRecords", inspectionRecord);
        return "recordlist";
    }
    @GetMapping("/toinsert")
    public String toinsertrecord(Model model) {
        model.addAttribute("record", new InspectionRecord());
        return "insertrecord"; // 返回编辑页面
    }
    @PostMapping("/insert")
    public String insertrecord(@RequestBody InspectionRecord inspectionRecord) {
        inspectionRecordService.save(inspectionRecord);
        return "redirect:/user/admin";
    }
    @RequestMapping("/resolve")
    public String resolve(Model model) {
        List<InspectionRecord> recordList = inspectionRecordService.listli();
        model.addAttribute("recordList", recordList);
        return "resolvelist";
    }
    // ...

    @PutMapping("/updateStatus/{recordId}/{targetStatus}")
    public ResponseEntity<String> updateStatus(@PathVariable int recordId, @PathVariable int targetStatus) {
        // 假设inspectionRecordService.updateStatus是正确的实现且已经更新了状态
        inspectionRecordService.updateStatus(recordId, targetStatus);
        return ResponseEntity.ok("Status updated to " + targetStatus + ".");
    }
}

