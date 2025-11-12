Return-Path: <linux-input+bounces-16047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E0CC5417A
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 20:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86E233B8EDF
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 19:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57A52E0412;
	Wed, 12 Nov 2025 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDmqGdmn"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971D03C465;
	Wed, 12 Nov 2025 19:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762974859; cv=none; b=igvMcLFc0Rhuwr/8m8DAHu4/TJYEHrhW6C+zLVKEHHYM4ks4Cln4q0E2iDH2j9vN59z7BP+Cnb23u/Iqw2ePSkSbBX9m9uHhU2oZjlZ4JLFzhSkwwJ3VTIuqBeZudUsr78ErMNd1Dbp+Ussars/OeAGgU6yag8V/2PE8P1ul52A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762974859; c=relaxed/simple;
	bh=BM3/WsEhx6V4q9gdSQn84p7QgaZ00RWNFD1Rpo6D9Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ku7okyM0wneVOh/ZfJjLzGkk31nwx/JsVTe7FliATrinzgK99zG1Kz3PfJB4+siXeaHpYbRVDNg65TxmzsE5p3QVSiYklvCN7rpp5t2mqcu1ExFQ7y+i6nion1m7lqpRDgOHVSacAeKQxeHJ+wHVluEG/F1uVLSoAelKJSw0qms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DDmqGdmn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762974857; x=1794510857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BM3/WsEhx6V4q9gdSQn84p7QgaZ00RWNFD1Rpo6D9Ic=;
  b=DDmqGdmnSAn899RWrgtQvrR+B9bjG7NXmKm/9HvT9+at2UMUFNJvvHio
   4xDcZIYq8aehtCtbhszcFZvU6eShsasAXq7L+zYN9p7vc3P23bQV6Ee7D
   NtrT5t3nCJ1/O9YiIJepNJtjs4bRvyMwBJEoNnF8p5nXM1D0DE7mabWVG
   OGSDZNV3m+pURl7b9xZ0q5mH9OZFbr/clJXp/l6Nzk4hA+XJKYxVsTy1T
   mVDBNMsPdk6jgNovqC9NxeuHukqlfFGbNcPFc/l3Bso0nCV842rEB4ieO
   JakxkTIopTE/Yf5z2FI9hzzPxqZGIRVKXOGQkBKsyrE2ES71IfVnQpNhW
   w==;
X-CSE-ConnectionGUID: Cu4chYyCQgG9gGa6aEZoVg==
X-CSE-MsgGUID: J/dy3pNNQx24dvkj4zGzSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65086879"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="65086879"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 11:14:16 -0800
X-CSE-ConnectionGUID: rgYLfN/PSuiBg+Z3VBOFIw==
X-CSE-MsgGUID: nOfF5zywQMusWabLKvSoxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="219951616"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 12 Nov 2025 11:14:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id A4DD097; Wed, 12 Nov 2025 20:14:14 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 2/5] Input: gpio_decoder - unify messages with help of dev_err_probe()
Date: Wed, 12 Nov 2025 20:13:18 +0100
Message-ID: <20251112191412.2088105-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251112191412.2088105-1-andriy.shevchenko@linux.intel.com>
References: <20251112191412.2088105-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unify error messages that might appear during probe phase by
switching to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/misc/gpio_decoder.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/input/misc/gpio_decoder.c b/drivers/input/misc/gpio_decoder.c
index 459abc749a49..a2ae400790f9 100644
--- a/drivers/input/misc/gpio_decoder.c
+++ b/drivers/input/misc/gpio_decoder.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/kernel.h>
@@ -73,15 +74,12 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 	device_property_read_u32(dev, "linux,axis", &decoder->axis);
 
 	decoder->input_gpios = devm_gpiod_get_array(dev, NULL, GPIOD_IN);
-	if (IS_ERR(decoder->input_gpios)) {
-		dev_err(dev, "unable to acquire input gpios\n");
-		return PTR_ERR(decoder->input_gpios);
-	}
+	if (IS_ERR(decoder->input_gpios))
+		return dev_err_probe(dev, PTR_ERR(decoder->input_gpios),
+				     "unable to acquire input gpios\n");
 
-	if (decoder->input_gpios->ndescs < 2) {
-		dev_err(dev, "not enough gpios found\n");
-		return -EINVAL;
-	}
+	if (decoder->input_gpios->ndescs < 2)
+		return dev_err_probe(dev, -EINVAL, "not enough gpios found\n");
 
 	if (device_property_read_u32(dev, "decoder-max-value", &max))
 		max = (1U << decoder->input_gpios->ndescs) - 1;
@@ -97,16 +95,12 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 	input_set_abs_params(input, decoder->axis, 0, max, 0, 0);
 
 	err = input_setup_polling(input, gpio_decoder_poll_gpios);
-	if (err) {
-		dev_err(dev, "failed to set up polling\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "failed to set up polling\n");
 
 	err = input_register_device(input);
-	if (err) {
-		dev_err(dev, "failed to register input device\n");
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "failed to register input device\n");
 
 	return 0;
 }
-- 
2.50.1


