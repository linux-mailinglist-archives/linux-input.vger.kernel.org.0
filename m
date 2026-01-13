Return-Path: <linux-input+bounces-17023-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE35D174CB
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 834F8302975A
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD573806B5;
	Tue, 13 Jan 2026 08:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxB2Gumt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF723803CD;
	Tue, 13 Jan 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292959; cv=none; b=nm/fpVkMXEbEaDXXtogT+C1pRvGH5YkxnSkPNhtLavnxcHYxf2TaX4U1opmpCJZblwRnXmN3YiaV0+Tc2tCkqX2JZtxn20eabrTZCZ1f2lUkPNSDF29gkxhTfDEgPfjzdRlvmJEojgN2uIiO93quU0S02YHZnEjgpDiAbItMQPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292959; c=relaxed/simple;
	bh=wc6zhk7dGMy0kcgdQ/2Y5VNXD1F3c9ohYfYeQcPamnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iboQ24oB3UBKu2dXRLJcH/808SG95VtTtcI0+R1pvEuGvokpOMasUfRj6tj5ffL0IPFylRktJCCwNlmNnQ1atnHx7ww+QzirnSMKN3I9+Jxt4IzGwCYMQasg+b0nrbdSz2YadyfIZqmOEGlzRSKRr5hTNtja1wA1+GoRZ+njnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxB2Gumt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292959; x=1799828959;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wc6zhk7dGMy0kcgdQ/2Y5VNXD1F3c9ohYfYeQcPamnU=;
  b=dxB2GumtyPitZsxf86dwAgm+kdktSYj97MsHqp42n++BXbdlynrtcANl
   BIeLJKXW2c3s74UQaIHHmLGSoT2Yfv3Dbw6Rfp/TV5J2Wd4Wxd/7Uu65Q
   MLFBLTSRkyFuuzzR0YpreHN6mczRt27dQN6aWU8vzhRBjfBDH+Wtu7Ubb
   WBKgyWEuA0aj6fjahT+z6p9erVqD/04aETj6ZvnVZdYQA1TGxy5nHX1cp
   iDLDXcfmZp+BN4MMf8d5JQ88GQ3Hkx6qTcGCub14uzck1UQ6ljumSyr37
   qgDQYoA063ZIWAPy2ZnF2DRHwqxG1/yN8zi3xt4fs+coJoyyWevhMGe9a
   g==;
X-CSE-ConnectionGUID: 7xvakiN3Se6Mobr+MjqETg==
X-CSE-MsgGUID: y8b4Xy42Qbug3sdRp7/BoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69732384"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69732384"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:17 -0800
X-CSE-ConnectionGUID: Y1hhhZNARIm1+mHc7KiXDQ==
X-CSE-MsgGUID: akvKtgleR6CmNm3CxBN2DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204219272"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 00:29:15 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1837494; Tue, 13 Jan 2026 09:29:15 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: fujitsu_ts - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:29:12 +0100
Message-ID: <20260113082912.84123-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/fujitsu_ts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/fujitsu_ts.c b/drivers/input/touchscreen/fujitsu_ts.c
index 1a3e14ea2e08..cef2e93c17bc 100644
--- a/drivers/input/touchscreen/fujitsu_ts.c
+++ b/drivers/input/touchscreen/fujitsu_ts.c
@@ -108,8 +108,7 @@ static int fujitsu_connect(struct serio *serio, struct serio_driver *drv)
 
 	fujitsu->serio = serio;
 	fujitsu->dev = input_dev;
-	snprintf(fujitsu->phys, sizeof(fujitsu->phys),
-		 "%s/input0", serio->phys);
+	scnprintf(fujitsu->phys, sizeof(fujitsu->phys), "%s/input0", serio->phys);
 
 	input_dev->name = "Fujitsu Serial Touchscreen";
 	input_dev->phys = fujitsu->phys;
-- 
2.50.1


