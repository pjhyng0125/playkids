package com.playkids.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChargeController {
	
	@RequestMapping("chargepage")
	public String readChargePage() {
		return "chargepage/readChargePage";
	}
}
