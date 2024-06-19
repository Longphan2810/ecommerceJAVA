package com.example.demo.controller.vnpay;

import java.io.IOException;
import java.net.URLEncoder;

import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.domain.Orders;
import com.example.demo.repository.OrderDetailRepository;
import com.example.demo.service.impl.OrderDetailServiceImpl;
import com.example.demo.service.impl.OrderServiceImpl;
import com.example.demo.service.impl.SessionService;
import com.example.demo.vnpayConfig.Config;

import jakarta.persistence.TransactionRequiredException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;

@Controller
@Component
@Transactional
public class PaymentController {

	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse resp;

	@Autowired
	OrderServiceImpl orderServiceImpl;

	@Autowired
	OrderDetailServiceImpl orderDetailServiceImpl;

	@Autowired
	SessionService session;

	public String payment(int totalPrice, String vnp_TxnRef) throws IOException {

		String vnp_Version = "2.1.0";
		String vnp_Command = "pay";
		String orderType = "other";
		long amount = totalPrice * 100;

		String bankCode = req.getParameter("bankCode");

//		String vnp_TxnRef = Config.getRandomNumber(8);// ma giao dich

		String vnp_IpAddr = Config.getIpAddress(req);

		String vnp_TmnCode = Config.vnp_TmnCode;

		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", vnp_Version);
		vnp_Params.put("vnp_Command", vnp_Command);
		vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
		vnp_Params.put("vnp_Amount", String.valueOf(amount));
		vnp_Params.put("vnp_CurrCode", "VND");

		if (bankCode != null && !bankCode.isEmpty()) {
			vnp_Params.put("vnp_BankCode", bankCode);
		}
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
		vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
		vnp_Params.put("vnp_OrderType", orderType);

		String locate = req.getParameter("language");
		if (locate != null && !locate.isEmpty()) {
			vnp_Params.put("vnp_Locale", locate);
		} else {
			vnp_Params.put("vnp_Locale", "vn");
		}
		vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

		Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String vnp_CreateDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

		cld.add(Calendar.MINUTE, 15);
		String vnp_ExpireDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

		List fieldNames = new ArrayList(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		Iterator itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) vnp_Params.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				// Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				// Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		String queryUrl = query.toString();
		String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
		queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;

		System.out.println(paymentUrl);

		return paymentUrl;
	}

	@RequestMapping("/vnpay_jsp/vnpay_return")
	public String vnpayReturn(@RequestParam(name = "vnp_Amount", required = false) String vnpAmount,
			@RequestParam(name = "vnp_BankCode", required = false) String vnpBankCode,
			@RequestParam(name = "vnp_BankTranNo", required = false) String vnpBankTranNo,
			@RequestParam(name = "vnp_CardType", required = false) String vnpCardType,
			@RequestParam(name = "vnp_OrderInfo", required = false) String vnpOrderInfo,
			@RequestParam(name = "vnp_PayDate", required = false) String vnpPayDate,
			@RequestParam(name = "vnp_ResponseCode", required = false) String vnpResponseCode,
			@RequestParam(name = "vnp_TmnCode", required = false) String vnpTmnCode,
			@RequestParam(name = "vnp_TransactionNo", required = false) String vnpTransactionNo,
			@RequestParam(name = "vnp_TransactionStatus", required = false) String vnpTransactionStatus,
			@RequestParam(name = "vnp_TxnRef", required = false) String vnpTxnRef,
			@RequestParam(name = "vnp_SecureHash", required = false) String vnpSecureHash, Model model) {
		model.addAttribute("vnpAmount", vnpAmount);
		model.addAttribute("vnpBankCode", vnpBankCode);
		model.addAttribute("vnpBankTranNo", vnpBankTranNo);
		model.addAttribute("vnpCardType", vnpCardType);
		model.addAttribute("vnpOrderInfo", vnpOrderInfo);
		model.addAttribute("vnpPayDate", vnpPayDate);
		model.addAttribute("vnpResponseCode", vnpResponseCode); // 00 = thanh cong
		model.addAttribute("vnpTmnCode", vnpTmnCode);
		model.addAttribute("vnpTransactionNo", vnpTransactionNo);
		model.addAttribute("vnpTransactionStatus", vnpTransactionStatus);
		model.addAttribute("vnpTxnRef", vnpTxnRef); // ma giao dich
		model.addAttribute("vnpSecureHash", vnpSecureHash);

		boolean checkTransactionVnpay = true;

		Orders order = orderServiceImpl.findBytransactionCode(vnpTxnRef);
		try {

			if (order == null || !vnpResponseCode.trim().equals("00")) {
				checkTransactionVnpay = false;

			}
			if (order != null) {
				if (checkTransactionVnpay) {
					order.setPayedVNpay(true);
					order.setCountDownTimeTranVNpay(null);
					orderServiceImpl.save(order);

				} else {
					orderDetailServiceImpl.deleteAllByOrder(order);
					orderServiceImpl.delete(order);
				}
			}

		} catch (TransactionRequiredException e) {
			// TODO: handle exception
			checkTransactionVnpay = false;
			if (order != null) {

				orderDetailServiceImpl.deleteAllByOrder(order);
				orderServiceImpl.delete(order);

			}

		}

		return "vnpay_jsp/vnpay_return";
	}

}
