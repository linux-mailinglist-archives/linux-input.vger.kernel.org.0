Return-Path: <linux-input+bounces-16048-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A78BC54183
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 20:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2B333B9323
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 19:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADB734D38A;
	Wed, 12 Nov 2025 19:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZxf3VD8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF034888E;
	Wed, 12 Nov 2025 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762974861; cv=none; b=dStKAsMn+s8NOXmFVNDzr5WVj+h8ChIqZbVky9ZTrk6OSJjNPglYL0LEcyRslKD/59YP7OubPf7p7IC9AQMXXpzyPFpy/JbBoBiXgwZhRahV3Dr+56F5EmDvf9xVjNXpjpTOMd3oBr6Ua+SGgBum6XKuvGpiR/vmawnHpIrlXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762974861; c=relaxed/simple;
	bh=eza3j0+EuTOOHO74CxzObedr0qx+jM54OCacx5vMhDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vc4XIexPI58FTAfz+56/6GHyOyD23IgQb4wL/9eiC5c2O1f/zmfhoHB7Pu7mQOdFdwDREP1IaDgCD7CCPQ9TffmGla+oVJiV6mwcA1lH1QLeIAHitxftaup4cNegp4yceWP5+4H/QjdS4ojarLX0HXforoi2+bLq2EKEyBFFF/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZxf3VD8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762974859; x=1794510859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eza3j0+EuTOOHO74CxzObedr0qx+jM54OCacx5vMhDI=;
  b=LZxf3VD8Rn5AMKFHntLNsmutNW8tdXn7ybQ49bcuyThAa7kpMv9PLtU3
   +Toq6rQilfjarR7495Czh22rwBhnMFhQOs7HetNCgFNwknCmgY0CDzHXr
   KW5/et9WJrMftw8KlumA9A0vQrB1k7cTVctOogrIFXbx3NGH1yjs7kUs5
   P50Ja+ikXeaKi8/pw92Fxaux8RZOLqYwIvTOjd5k53OG/oag7pkFs0nBG
   LANc88dQ1h2/bul8S3sDhFxuGMvGA8bBsHDq7XpZCCb0r5FCyUJCw7tJW
   qGLz06XqJi2Os4XBwz678gbVXFCyRQ+Zi2lz6PJaN3ZSgECQrBwsqMDvZ
   Q==;
X-CSE-ConnectionGUID: Ww0TDe2DTPCyg4Ar4KfVEg==
X-CSE-MsgGUID: swMP5UaxQrKgEmeTyFk0TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65086881"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="65086881"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 11:14:16 -0800
X-CSE-ConnectionGUID: g+mrirHxSyCc2TaAS7rIkg==
X-CSE-MsgGUID: jB86uPVwTI6tf39+G5KHkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; 
   d="scan'208";a="219951617"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 12 Nov 2025 11:14:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id ADD1399; Wed, 12 Nov 2025 20:14:14 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 4/5] Input: gpio_decoder - make use of the macros from bits.h
Date: Wed, 12 Nov 2025 20:13:20 +0100
Message-ID: <20251112191412.2088105-5-andriy.shevchenko@linux.intel.com>
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

Make use of BIT() where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/misc/gpio_decoder.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/gpio_decoder.c b/drivers/input/misc/gpio_decoder.c
index 8c07f7ff66e5..299f16d3bf4d 100644
--- a/drivers/input/misc/gpio_decoder.c
+++ b/drivers/input/misc/gpio_decoder.c
@@ -60,7 +60,7 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct gpio_decoder *decoder;
 	struct input_dev *input;
-	u32  max;
+	u32 max;
 	int err;
 
 	decoder = devm_kzalloc(dev, sizeof(*decoder), GFP_KERNEL);
@@ -82,7 +82,7 @@ static int gpio_decoder_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL, "too many gpios found\n");
 
 	if (device_property_read_u32(dev, "decoder-max-value", &max))
-		max = (1U << decoder->input_gpios->ndescs) - 1;
+		max = BIT(decoder->input_gpios->ndescs) - 1;
 
 	input = devm_input_allocate_device(dev);
 	if (!input)
-- 
2.50.1


