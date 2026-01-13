Return-Path: <linux-input+bounces-17024-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1979D17501
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:34:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B101B306DBF6
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A5A3806C9;
	Tue, 13 Jan 2026 08:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHp1Dp9r"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E423806DA;
	Tue, 13 Jan 2026 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292966; cv=none; b=TVm0h3XStl28utHRKWvHzAcmg2dZfFqSnjnJtt2tSZ4pJ89E00VE4Dajrq1+K5KomeuuuIsahXGGTplXpM26QgHBgy/+M0a6CCvk58B7BelN9C+8rbB+6s7dB1dFlzBPENuH+RvbHV9s5NuJJOSjIvYBikY42e4JTqNhV3K0Q10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292966; c=relaxed/simple;
	bh=hip6hCUmdoGJNvAnvD7pW9hLnM55MEQoxYy97G2ABpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UY5P3/pNzEwDQGzp3jX462TpPGO6GDVdMauY/hz+DK3GbMK4rhRllvkUza40GAe+ffCD/Iqm5FqMGFoeVBn6DwHth8CtbWt2EXRrWxozHqzETzFTlrKkpZbyq/zDXTXQDOpZwVwHuAJ+/1VxNz1I2P22jhPdTcGw/wfGydmrAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHp1Dp9r; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292965; x=1799828965;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hip6hCUmdoGJNvAnvD7pW9hLnM55MEQoxYy97G2ABpQ=;
  b=aHp1Dp9rq/g+KhThj6Omc9S9VoTlvgPfolQQExH+2RFADE4ND11R5up6
   EmG9FWf6vY+8g48AYdgu6Df22BFhVRyMxxXZ0dKmbpJYy4Od3MKkPpBL4
   oQj2tUEovW7IgcDpTEZAbch5GWL5s8Tig+pmxWbLg6+FCUV8tv/RPAhEt
   dDy25fzve+k12pE8tjO+WgH9vkanIKaR3HP7E7KpnQQ+LGcO5Z3dfl6TM
   K3u3dLNlGSDPYws0rO/xdPDT/wGIsPbrBvZnLlvCG8v228toKg+6MPYDl
   g2kLkQpBvjmXuD+5s4MDuemUyN/+vhSz64cgi2GM3YoS36tHaaHarmpW9
   A==;
X-CSE-ConnectionGUID: UMTC54HWS7WoLP5yDicdkA==
X-CSE-MsgGUID: kaNcu6eMQD2gvWVmUhQTDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86988371"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="86988371"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:22 -0800
X-CSE-ConnectionGUID: F2WG+gLbR+W7TC4lq5QYPg==
X-CSE-MsgGUID: JtK2TMaQSSqiSHcY2QyY3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235035193"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2026 00:29:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BC9E894; Tue, 13 Jan 2026 09:29:19 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: inexio - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:29:17 +0100
Message-ID: <20260113082917.85109-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the driver to use scnprintf() to avoid warnings about potential
truncation of "phys" field which we can tolerate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/touchscreen/inexio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/inexio.c b/drivers/input/touchscreen/inexio.c
index 82f7ac62a4f2..a7604f2c4e3a 100644
--- a/drivers/input/touchscreen/inexio.c
+++ b/drivers/input/touchscreen/inexio.c
@@ -123,7 +123,7 @@ static int inexio_connect(struct serio *serio, struct serio_driver *drv)
 
 	pinexio->serio = serio;
 	pinexio->dev = input_dev;
-	snprintf(pinexio->phys, sizeof(pinexio->phys), "%s/input0", serio->phys);
+	scnprintf(pinexio->phys, sizeof(pinexio->phys), "%s/input0", serio->phys);
 
 	input_dev->name = "iNexio Serial TouchScreen";
 	input_dev->phys = pinexio->phys;
-- 
2.50.1


