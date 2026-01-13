Return-Path: <linux-input+bounces-17012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C70AAD170A3
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDD61301646D
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 07:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A04636AB5F;
	Tue, 13 Jan 2026 07:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="er30FuJT"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA713148DA;
	Tue, 13 Jan 2026 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289763; cv=none; b=SpmLw7GdwXHM4P1/75IEENvDnluJFFq/38FPRSewBRxpUkdePVOvDnKcrEJ5/lHJlDllQvMETkNBFdcaklyD3+2pKzyXI7Y/gBJg2aVmPs+uUxk3jZPRIRu+5IB/HbXc0UitOBGs55XIFVyK64xxOH5r0x5SJvGyuqLvkFhmBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289763; c=relaxed/simple;
	bh=K+qe+XhI83vj/6bO+RWRIFt0Wm4qiA8w38om6/KQybM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Elb8t7RSFmAW+AjQIq1DNbKQtHK7q1Ke0Y9Ud5mUUeZS+KL609w38dtyx46Sz9i6mh1QSK0eakQnzKoU6JxqGJvfgl7B5me2KWYLyPXh8W4eGATR0WyC74XlFEZUlf8UAY77eun4iGthVcwSjKvmgZCoBRwq4K3Kga/uhADrwdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=er30FuJT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768289762; x=1799825762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K+qe+XhI83vj/6bO+RWRIFt0Wm4qiA8w38om6/KQybM=;
  b=er30FuJTsDLMWGJQJUZmJW88d+Orjp5dvzeNAiLLBBwQeR6AA9msGrCE
   JRB69mSswsFXoyqmfl1d5BlCxUpDEQwLKloX2wm/E9PzuDRwOKPCRk2Rb
   iS5qy+6gRfQeS7Ic6t5tHw5MHxyTseX/ut5FOo+PQmYWec4DHwixt0erY
   GkZuzCGELuT42PR4SadqIHwDgYV04QBV6zPpwOWpdYR/xr47Do71UHLHW
   w/CRtRviVlunhMD9gjsi1Mq+eKfRDaMOe3adFtQYjZZcQ9IcnGXkWZ1Gq
   4cj3obcy+Z8UHBiMNCBjVHXbw4m0d7B+2TZ/3Ipky+2dkdc1UrpFkr/gD
   g==;
X-CSE-ConnectionGUID: 9MKzYJFKQJSnwJqfSc0nXA==
X-CSE-MsgGUID: rH/umoR1THmjAKN+kLv+vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86985059"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="86985059"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 23:36:01 -0800
X-CSE-ConnectionGUID: CeDsW4p5RnSX3qD8GBkWVw==
X-CSE-MsgGUID: A0HMKFTYRC6vDr5rXM9EDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235557342"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jan 2026 23:35:59 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EB77E98; Tue, 13 Jan 2026 08:35:57 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/2] Input: wdt87xx_i2c - tidy up ACPI ID table
Date: Tue, 13 Jan 2026 08:35:21 +0100
Message-ID: <20260113073556.7380-2-andriy.shevchenko@linux.intel.com>
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

Tidy up ACPI ID table:
- drop ACPI_PTR() and hence replace acpi.h with mod_devicetable.h et al.
- remove explicit driver_data initializer

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/wdt87xx_i2c.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
index 88d376090e6e..99636d6eb0f3 100644
--- a/drivers/input/touchscreen/wdt87xx_i2c.c
+++ b/drivers/input/touchscreen/wdt87xx_i2c.c
@@ -9,17 +9,24 @@
  * may be copied, distributed, and modified under those terms.
  */
 
+#include <linux/array_size.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
+#include <linux/input/mt.h>
 #include <linux/interrupt.h>
-#include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/io.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pm.h>
 #include <linux/slab.h>
-#include <linux/firmware.h>
-#include <linux/input/mt.h>
-#include <linux/acpi.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
 #include <linux/unaligned.h>
 
 #define WDT87XX_NAME		"wdt87xx_i2c"
@@ -1153,13 +1160,11 @@ static const struct i2c_device_id wdt87xx_dev_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wdt87xx_dev_id);
 
-#ifdef CONFIG_ACPI
 static const struct acpi_device_id wdt87xx_acpi_id[] = {
-	{ "WDHT0001", 0 },
+	{ "WDHT0001" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, wdt87xx_acpi_id);
-#endif
 
 static struct i2c_driver wdt87xx_driver = {
 	.probe		= wdt87xx_ts_probe,
@@ -1168,7 +1173,7 @@ static struct i2c_driver wdt87xx_driver = {
 		.name = WDT87XX_NAME,
 		.dev_groups = wdt87xx_groups,
 		.pm = pm_sleep_ptr(&wdt87xx_pm_ops),
-		.acpi_match_table = ACPI_PTR(wdt87xx_acpi_id),
+		.acpi_match_table = wdt87xx_acpi_id,
 	},
 };
 module_i2c_driver(wdt87xx_driver);
-- 
2.50.1


