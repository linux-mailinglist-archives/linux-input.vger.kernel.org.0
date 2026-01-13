Return-Path: <linux-input+bounces-17010-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD327D1709D
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CAD7A3015AF2
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 07:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD5F313532;
	Tue, 13 Jan 2026 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0dhfPL9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC63226CF6;
	Tue, 13 Jan 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289761; cv=none; b=QuMqtn037mfontiIygIPhT2rN4HAZ8fS7s7nKyct51sTzUs57ANaIY7OmS5qX6kI+/cg9le9Or2IKwUy2CfFlifo3sZKCFYtU8c3PxtkRsAnuYt9XmbQor1CJV7IC1StuMoDd1L4CZQzzhil6/gkwus+PPrkVLIdQ2hZNtbPL1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289761; c=relaxed/simple;
	bh=hoS/L5g4HueJM0uhUXkrsfm5tiMeRdYmScwyCbGr65g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBfVPpNQtmh4UJCMiIqAirA6cPTO2vLxRhXM/rUkkb1Lhridhwvt5WlGndUZSL8Hlri5AZ1L4vkiB9ujk+z54EOEDZPN6eY5InDUB0aqSYxhbYYPNTLC/qX8TAFxhXUhv6mk7xY68mGZSpNU1+5VxkyROLO5wDZXbAQT3gpnN+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0dhfPL9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289760; x=1799825760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hoS/L5g4HueJM0uhUXkrsfm5tiMeRdYmScwyCbGr65g=;
  b=k0dhfPL9XK9Ok5NqfDDaO51Mg7za4E5OlWtZjxTeDmFCSbMjr80plSk7
   WeXzD1aqTJ3b5nnttLltD9tJhuGhyqZMP3UdLqtzWNXr0bpXFOwTBZRmm
   YpwZp3okTkPwApAu5Wpftr+CUVIPHWPxj3D+e+ybXTxXgdC3GFM/u7GmU
   35x5wiqsIggz8fNT/PwQJVkvuqH2sT040GOQld3bur63svI2rJkAx0XpU
   IeP3CrjnTb/bra5lHuelTbQlWnKZ6AkXBTrenrYYrCktV7aIhsbWV3KU5
   OgvhsopXHC/Jz0WUrXLGtKKeL5aEAW3RWPoVSqDZyDxctIdE+eOUULIN3
   A==;
X-CSE-ConnectionGUID: VBmsBHKhSRS5A2zVuR/YNw==
X-CSE-MsgGUID: qT7DzUllSoSA2uIx1Onvxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="79866201"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="79866201"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:35:59 -0800
X-CSE-ConnectionGUID: RAxybaMiSvi+EDQYE/4lRg==
X-CSE-MsgGUID: Oa+Mj7NlTQSg3fcCM3kjAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203526548"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 23:35:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EFEFA99; Tue, 13 Jan 2026 08:35:57 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 2/2] Input: wdt87xx_i2c - switch to use dev_err_probe()
Date: Tue, 13 Jan 2026 08:35:22 +0100
Message-ID: <20260113073556.7380-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113073556.7380-1-andriy.shevchenko@linux.intel.com>
References: <20260113073556.7380-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to use dev_err_probe() to simplify the error path and
unify a message template.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/wdt87xx_i2c.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
index 99636d6eb0f3..3e7fbc4d7549 100644
--- a/drivers/input/touchscreen/wdt87xx_i2c.c
+++ b/drivers/input/touchscreen/wdt87xx_i2c.c
@@ -1033,10 +1033,8 @@ static int wdt87xx_ts_create_input_device(struct wdt87xx_data *wdt)
 	int error;
 
 	input = devm_input_allocate_device(dev);
-	if (!input) {
-		dev_err(dev, "failed to allocate input device\n");
-		return -ENOMEM;
-	}
+	if (!input)
+		return dev_err_probe(dev, -ENOMEM, "failed to allocate input device\n");
 	wdt->input = input;
 
 	input->name = "WDT87xx Touchscreen";
@@ -1060,16 +1058,15 @@ static int wdt87xx_ts_create_input_device(struct wdt87xx_data *wdt)
 			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 
 	error = input_register_device(input);
-	if (error) {
-		dev_err(dev, "failed to register input device: %d\n", error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(dev, error, "failed to register input device\n");
 
 	return 0;
 }
 
 static int wdt87xx_ts_probe(struct i2c_client *client)
 {
+	struct device *dev = &client->dev;
 	struct wdt87xx_data *wdt;
 	int error;
 
@@ -1103,10 +1100,8 @@ static int wdt87xx_ts_probe(struct i2c_client *client)
 					  NULL, wdt87xx_ts_interrupt,
 					  IRQF_ONESHOT,
 					  client->name, wdt);
-	if (error) {
-		dev_err(&client->dev, "request irq failed: %d\n", error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(dev, error, "request irq failed\n");
 
 	return 0;
 }
-- 
2.50.1


