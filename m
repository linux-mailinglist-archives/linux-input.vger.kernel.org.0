Return-Path: <linux-input+bounces-11059-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7583A6C2A4
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 19:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C027189EEE1
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 18:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A72722FF41;
	Fri, 21 Mar 2025 18:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6j8OeVQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33E422FDEE;
	Fri, 21 Mar 2025 18:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742582405; cv=none; b=Db1SewChu7RSvNy+aImqDUcoKBsvRB5HKDlO3lyKahaBjnEwWFJj8KsoZ84vRtpvBoHFC65A//HTEuyl3ljEidfTZ3xEtgucqDMKLbkzWzpk96bPB/Xf6k7SgWlmNsVfkbbZkLtwx12huIaKK5lRYW36PwMVwUbD+DBoip01RZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742582405; c=relaxed/simple;
	bh=qwFfDqNHPdLRRnwRsODwWrfD4a77T7dH0CDqJSAlhC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgflFuoU/+TfeJ7bYYVe0kKiMbt+bd7kTvzXvI0teCmulXxzDnfItyq6dPIN00+0aSIzQmY2Lve1eGV1IIhTboDuExoyZHONFvuYYpczTsy7WapBeEocC74qqab8DKwBdVcDbQC+k2HXxSAgVgb/AYuuA6ekKhxxNMUZH7lVOts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6j8OeVQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742582403; x=1774118403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qwFfDqNHPdLRRnwRsODwWrfD4a77T7dH0CDqJSAlhC4=;
  b=W6j8OeVQ9zknguV5blm1oPOM9va1Wrj4HoHVIg5UBvmVSu+LRduqXBsP
   VSuCkJCXCH7GfBo41+fw1uAFUtXQRq8Lj2PJ7NT7JzQ/kSi6au2oENGvu
   9Cqwto5243rk4/1ALjjfgF71drJ52H2mmQoYHPY8Yt/GdjhL6nmrQvTGL
   O90kIW7zv+2gfuEp13Uq8Ntts3ymSQ9GXCL+bP0eQ60csQQjmkCAFLK8K
   P4HcaDJL6xksxxGbXnS/sDBFGiLEfyIUsHCbRGNmyH3qvbOwO35L7xSyv
   WWZPk0/hGpHp7V8uu7/141KkXGng2VgYJxeeZuqTInD3JQo6fsOmiM97Y
   Q==;
X-CSE-ConnectionGUID: zGOPCBVvRoGGZI6/RXB1DQ==
X-CSE-MsgGUID: 6K71nTDsT+ycDDwGgnCRhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43986460"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="43986460"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:40:00 -0700
X-CSE-ConnectionGUID: QVbV26ScTTGkifBNj9YC5A==
X-CSE-MsgGUID: LS9Opvy1Royqn257UvE7rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123282491"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Mar 2025 11:39:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 22ED9214; Fri, 21 Mar 2025 20:39:58 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 2/2] Input: wdt87xx_i2c - switch to use dev_err_probe()
Date: Fri, 21 Mar 2025 20:39:18 +0200
Message-ID: <20250321183957.455518-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250321183957.455518-1-andriy.shevchenko@linux.intel.com>
References: <20250321183957.455518-1-andriy.shevchenko@linux.intel.com>
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
2.47.2


