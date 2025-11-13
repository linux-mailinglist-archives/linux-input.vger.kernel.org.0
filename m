Return-Path: <linux-input+bounces-16091-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F61C588F2
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 714CC364273
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 15:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0DA3546FE;
	Thu, 13 Nov 2025 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4Oz6Xvw"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B6E346E4A;
	Thu, 13 Nov 2025 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048785; cv=none; b=c7PseGaQKZ4WHLzXZnbD9jVL6JjSlRk1XE5BmpD34fXhzbkiJf/jyKeieaarVHuzco4ATRrAP6IJjUxurcGAgVam6XX4H9pDtGHzpxocorIkOf9jTHIYT+yImBR/RfuTD25ofkLKSV7Pvcu3KHx2u4xH1Ee+vQa4CXifeOa9lOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048785; c=relaxed/simple;
	bh=BM3/WsEhx6V4q9gdSQn84p7QgaZ00RWNFD1Rpo6D9Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0ySgBGVVU0TD6D8Q6AMbddSUGLFGRQ0xlJTJAPUT0Fl2B1Tl+QfmoBB36148sRR8o9ChCoTUzuGRwMEiQCjKIgXgpdgIGhDxE1WX190A4B8Ah3aT8xG0bP3vTojsHdkUrWPCBswwVCJFPOwXCppVQEV9RhQ15xGEStr5fFUh44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4Oz6Xvw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763048783; x=1794584783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BM3/WsEhx6V4q9gdSQn84p7QgaZ00RWNFD1Rpo6D9Ic=;
  b=Q4Oz6Xvwbo9dxZ3MLk55NVQHtEJ5aXJseVeJMvRLHiAhKidOPQgqKAO0
   00Sc0yHW+Q2jpWAYKi/dfOVftqbfJtKqx/2Yj6vj4/mUD0YGq7vW8TwdN
   bWn2cqi6FNdgF1LfVVfwS4xoBfR3NTqiw8Zjz+shhhtOJW0mO78B3K+QG
   xwF/y/mMWW8ESShoGG+d2j9esRqu9kyO72Czw4h+4wT6Fxd5MP8k6BEUz
   eMtQ2gr+YjqxJmnWtCJbLuCFFW98dcIu10/lz2VQUu7Ywz7aTjqfITK+2
   Smh96YRNR+SxGmDIIMOpKUhf2WK51LQ1laTv7hcrXOxvdZ195qDtGEpTh
   w==;
X-CSE-ConnectionGUID: wwPcyk09Q4+g8wuFxMGCIA==
X-CSE-MsgGUID: MulJG/LOQICSSx2fMNFaAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75448550"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="75448550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 07:46:20 -0800
X-CSE-ConnectionGUID: ux3w9i91R7OyyWz2cq7VCg==
X-CSE-MsgGUID: cQEUSjwlRe+dHy+kAE9Etg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="212933924"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2025 07:46:18 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 8F37598; Thu, 13 Nov 2025 16:46:17 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 2/5] Input: gpio_decoder - unify messages with help of dev_err_probe()
Date: Thu, 13 Nov 2025 16:44:43 +0100
Message-ID: <20251113154616.3107676-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113154616.3107676-1-andriy.shevchenko@linux.intel.com>
References: <20251113154616.3107676-1-andriy.shevchenko@linux.intel.com>
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


