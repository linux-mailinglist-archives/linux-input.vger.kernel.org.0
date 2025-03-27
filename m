Return-Path: <linux-input+bounces-11324-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E1A74168
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 00:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E3223B6850
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 23:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90451E1DF0;
	Thu, 27 Mar 2025 23:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kW7dxmzx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40807335C0;
	Thu, 27 Mar 2025 23:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743117222; cv=none; b=EhWrQ9jNPsS8oqmlaRPRse+v2+lCK3kXglrO8DAX50gSKCn7eA83jB/Tm12mukKwDszJSCz2qLXBC3Cz+l3C45Lj/R2/n9phj001XHc4GQ41Xc2MgiGS6q1AsupHbeU7uUZ1Hf7ZorhWmJiIyFHUOtL/2RkRjNr1HbswQPWXIgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743117222; c=relaxed/simple;
	bh=u53yL0a/1/RYDTw+aARftjh8UkdlgZkXzY2Gi3tTFs0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZGTmyA1Jr+Hni4stYopUdjsl57+nq6LhnV1E7Hm8/BWQdELfjJyvpSUkhYCQ0CUMz7FGDhKRMUaFpaQq+nnr90cNOUsXfvrL1Avp3iwYpT5WmcZkLXtxgVDfXBnh7w1lrmjEHTwQgg1m046Gx53uj2IL1fPPdefmIUNsJsiq9xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kW7dxmzx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913b539aabso863893f8f.2;
        Thu, 27 Mar 2025 16:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743117218; x=1743722018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=kW7dxmzx7SPahYXdtcMfHhIteO9fhBScg0Ew/cG7Wnw9izTEOPTBhCmmIYH0Ro7Hq5
         7pApfiQZ8jw6BQGUzC4btxRqRA9dgJKZ8SFunQI+C1EYzz8s+fnBTHz3mI2eKprKFEJC
         WQonN99MBhy53H/wXO9Ws9SqhbGQbi5jTfPhwR/ZjTMI2KQpaon6ml1C3OCvLG2PJbep
         u8K6wf21XoUOShRK3rqGwweSWZnRNuRn4yBZZTxYTa3LNbThF5l0nBhEjkUAxJbDgnWI
         qGhQC+jkpvI3MdGndjImaLofmFK2hI6r2OL5752wguwb1yTb4GZoell2ullwrSEheVTv
         zwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743117218; x=1743722018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMBZuLcEi1BVATpyEBDSQRvEoX2RBDn8k/CK1srt6Gg=;
        b=QOx5F+4nNze3HR3vLKMMegiijGB0OnR6MioWSqqMC2OnMYVUVtZqs7OH5KyiwypMSZ
         F3fyKILieny1eE/w99QlUIpt/gvUfUVRkBFnZHY2GmFTGNPZMCj9TacGL+II14Csg/qS
         UYx/2j/rOCVErTkajjyWGloxsr3lxru9GiNyks8n43b0OIe3nHiCMDFdme2i2hrKTUPe
         TF1Culvnvx7fo902hm+sJOz6LBWoq6Nbmmn3aI50pR7glyVcvcExkETt1/p3spQVJtRA
         wE2z9CW7ek6j/AC9ueiW9CaYKmutwlAayROZiFht/68MgAVJGo/IJZ7RWhqPNamNkDOY
         98WA==
X-Forwarded-Encrypted: i=1; AJvYcCWBK1WM7QKgyJq+m8kiuMSn+76njVQySWvP3dgnTu8GAkvVdaMLsXImckm8pDpCMyUpTpew/5mpXJvjtho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxCxjm+i0AW5z+j10Q16/ZMSBUPwMjLHe5BH6sLM3xGvrbC3z3
	hzAD1Go8h3GVVsUKGFqhNBIfrZQp3eJT3tZo9YwpIOptiqOYjqui
X-Gm-Gg: ASbGnct6WSEUfQTTHdRPsNFVVoHEPBmY+68t0J4pwJkg9j7mXd1tH4S201Xf6ZQt3Jc
	TKHZZfmfuFTUFAxTSBQ9YBYKreGqHeqkFo2kIych1DgTSQe06sv5fu8QVOEeiPc2zP6s0iaR830
	Doy4FjKgmAtKi94V6P9fGRMY/8Nmy7QsOVtCr0ENJD9Jl/mi9omhhGE/UfKV+M+GouT6oXMwriF
	G/WRu0zrdcFOUa4IiK8K0x7vFEv6e69LshajkhNp3SvbPn/UIenEc8p3ohGby/MB2vlTQMsMyId
	HZb9YK3yDxlCIJ7Xn2lJqFeS+w9wvtqdMBZSJ6gRhl2AVw==
X-Google-Smtp-Source: AGHT+IETOZ4c3GApnoFs7MN0qkl/1HBcaEp2e0Y5v9Jar1Q6i8U47juByr5xqoThiy0+bdfqPLYyIg==
X-Received: by 2002:a05:6000:184c:b0:391:4095:49b7 with SMTP id ffacd0b85a97d-39ad174acd7mr5478950f8f.25.1743117218225;
        Thu, 27 Mar 2025 16:13:38 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:80e7:c933:bc4d:7e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd78bdsm9151775e9.24.2025.03.27.16.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 16:13:37 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-input@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: thrustmaster: fix memory leak in thrustmaster_interrupts()
Date: Thu, 27 Mar 2025 23:11:46 +0000
Message-Id: <20250327231146.6388-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In thrustmaster_interrupts(), the allocated send_buf is not 
freed if the usb_check_int_endpoints() check fails, leading 
to a memory leak. 

Fix this by ensuring send_buf is freed before returning in 
the error path.

Fixes: 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index 3b81468a1df2..0bf70664c35e 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -174,6 +174,7 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 	u8 ep_addr[2] = {b_ep, 0};
 
 	if (!usb_check_int_endpoints(usbif, ep_addr)) {
+		kfree(send_buf);
 		hid_err(hdev, "Unexpected non-int endpoint\n");
 		return;
 	}
-- 
2.39.5


