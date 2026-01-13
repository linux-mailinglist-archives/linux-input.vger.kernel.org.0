Return-Path: <linux-input+bounces-17017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEFCD1746D
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B6D3300D43D
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF03137FF76;
	Tue, 13 Jan 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuwPhcU3"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9DC3644C6;
	Tue, 13 Jan 2026 08:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292693; cv=none; b=P28ZTSUCuF1yJBc6BpDgWvjt/xAHzo74PHli5QVA8pybDAYZkmOcjRPEIKqz5UUW98wsEIIJYJuBt59yFU3dXj02NpA3e1OnvV44f1uxMNnvj/0OupT2wU4hw8lCOryFnCZr+m9UYSw9w72wNiHwhslHUTYQDtwP/z1kHXfEntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292693; c=relaxed/simple;
	bh=7VYHBNdfJRI/4r3wGlZlrY7u9q+KbI+duuDtsnpaLz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3l5hQ7K+V407jFaqXM0/F24rZ1V8wlH2ZUINGUSRhcxm7S+Q18rdIz7WWRcVhMrBB6vI74S3DUMkI7LTCElDPsUCTUHeEPL61YzT24SYXG7TurAtNlTSkQmNlJqnYGvPosBgoiyhEhqOE622vNgb9m1HIvDRGm7/qrHKYs+tws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuwPhcU3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292691; x=1799828691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7VYHBNdfJRI/4r3wGlZlrY7u9q+KbI+duuDtsnpaLz4=;
  b=RuwPhcU3NTRVJwqDy1UVx/tCXjyX2x+00iqQqV5SNS/D+aktl6+vr7td
   RXgYurRh/2pFX3NAzt6hgAE330DeMkb8lVypBK4KTULgzQ6+/7PWGYCM8
   oOYiDUu1YBBUUTD/+GW0vXz+7a0ecnjJIzxLxZQfp+d34ZuSrOn5ZFM+S
   pqFVLAGycO5S1ppMMF2fzrpXPe3VZ1l/RsZDplcrNzjJlOlYgu1i5oJ57
   +PfhqTfxAnmaTYfc04Vfmz/0FaF56c6/KdBMjw1tNzwLtYexdPPPBFadL
   8MbHnGdSzMao7rTzT44UwfBfLTwaaje2GoE+eMxznPyeJZ+OAYI5+rgw9
   g==;
X-CSE-ConnectionGUID: n420hJJVRU6eUmKSsUTIcg==
X-CSE-MsgGUID: k/9lJEL5SYWXJsv4L4QE6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86988109"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="86988109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:24:51 -0800
X-CSE-ConnectionGUID: fybJbI9zTTahWXeZQni/9w==
X-CSE-MsgGUID: YCZBGhswRlq+4vC1QMWNIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203479204"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 13 Jan 2026 00:24:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 71F1199; Tue, 13 Jan 2026 09:24:48 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 2/2] Input: wdt87xx_i2c - switch to use dev_err_probe()
Date: Tue, 13 Jan 2026 09:22:58 +0100
Message-ID: <20260113082445.44186-3-andriy.shevchenko@linux.intel.com>
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

Switch to use dev_err_probe() to simplify the error path and
unify a message template. With that being done, drop the now no-op
message for -ENOMEM as allocator will print a big warning anyway
and remove duplicate message for devm_request_threaded_irq().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/wdt87xx_i2c.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
index 99636d6eb0f3..3bf899fe615c 100644
--- a/drivers/input/touchscreen/wdt87xx_i2c.c
+++ b/drivers/input/touchscreen/wdt87xx_i2c.c
@@ -1033,10 +1033,8 @@ static int wdt87xx_ts_create_input_device(struct wdt87xx_data *wdt)
 	int error;
 
 	input = devm_input_allocate_device(dev);
-	if (!input) {
-		dev_err(dev, "failed to allocate input device\n");
+	if (!input)
 		return -ENOMEM;
-	}
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
 
@@ -1099,16 +1096,9 @@ static int wdt87xx_ts_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, wdt87xx_ts_interrupt,
-					  IRQF_ONESHOT,
-					  client->name, wdt);
-	if (error) {
-		dev_err(&client->dev, "request irq failed: %d\n", error);
-		return error;
-	}
-
-	return 0;
+	return devm_request_threaded_irq(dev, client->irq,
+					 NULL, wdt87xx_ts_interrupt,
+					 IRQF_ONESHOT, client->name, wdt);
 }
 
 static int wdt87xx_suspend(struct device *dev)
-- 
2.50.1


