Return-Path: <linux-input+bounces-17015-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA5ED1745E
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 250573004BBF
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6396737C119;
	Tue, 13 Jan 2026 08:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bc2hpOLg"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAED923EA9B;
	Tue, 13 Jan 2026 08:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292692; cv=none; b=lDsgQWdrBj+IRisr0HK+B9Eb5VjCJVvaSeoouyiCF4ZOHjWi81wADI1TKffSZayJey6nNcOuIAgv4C7Bn2FTlA52v3v8nIAVb+TqDXMoT1aO30TjvvQ1pcBskEzmIcSI8iupqSJGSisfkvFPM7GTX7cFpCR7U+npF9gN8zegjV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292692; c=relaxed/simple;
	bh=K+qe+XhI83vj/6bO+RWRIFt0Wm4qiA8w38om6/KQybM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ozo+6+c7J/7LVmw9mxhPXPv3/NWnTwBVyIgQfFUK44CpDvnViFwqLOHWzCg6NGkWfxuIcFtJnD2lVS8S891ZmAoaT4h0BmQk6q0bhoTc8nJ3nAsoHtvGsj1kaGlWtFDqWXrRNhrMU7aG39uegJWUTGpzAGR3AcTu1PhVX9ZEdpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bc2hpOLg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292691; x=1799828691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K+qe+XhI83vj/6bO+RWRIFt0Wm4qiA8w38om6/KQybM=;
  b=bc2hpOLgidaChTapvxK7P3u1PeXzBSuVwe2gADSrutY0PU8qUUTWDpMy
   WWtjNA16UBrPrCsc1Ymu9Mhy4qxf0iMw4vcZuVzr5NCpjs2ETYrNyt0O1
   ddUKIQ1KxKOtiePRsEOtJ1xcWLEAVXnGsqUJYLkfl/Sls9xmr3SCNJRd8
   A8sXoN/EhWZMAwbmIJbz+9OGQd0Ris6LaF0TV+/dFD+OU9GCnBHMfXGH2
   tfOc7PAqaQV2EJ86zFmGlfU3bSpDBrC8lqyBcEYKc0U9VFAJQwMIRYezq
   EPYh6lJcof+DOu1YSKPK84WlWfgtZKr9FjU0WxRo0Fcu0ZQLp2a6wtKTh
   w==;
X-CSE-ConnectionGUID: 4XvQV6wcTdWpMHyPUx2xdQ==
X-CSE-MsgGUID: veDrompoQm2oXa7ybXYttw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80939214"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80939214"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:24:50 -0800
X-CSE-ConnectionGUID: 9vl+rjbGRoWg3VHjMXcLzg==
X-CSE-MsgGUID: 0x1NJZtUQIC7m13lUd0ocQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203960023"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2026 00:24:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6D7EF98; Tue, 13 Jan 2026 09:24:48 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 1/2] Input: wdt87xx_i2c - tidy up ACPI ID table
Date: Tue, 13 Jan 2026 09:22:57 +0100
Message-ID: <20260113082445.44186-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113082445.44186-1-andriy.shevchenko@linux.intel.com>
References: <20260113082445.44186-1-andriy.shevchenko@linux.intel.com>
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


