Return-Path: <linux-input+bounces-17019-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA93D17517
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ED0430CD9CA
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663773803CD;
	Tue, 13 Jan 2026 08:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejMpq0id"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB753806A3;
	Tue, 13 Jan 2026 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292938; cv=none; b=rZJhFfaf/gC1mcW8TeFNihBgvHBfaBToxUmNhHwVxVjFJrQNDELjD9/2U7DyX4MVFKtdordRadhnNnsmfA2W9qRx2lo3NbnWDUBneTPblfCeRzq9pq3ku9iFYWLy3PgugaJ3d3XE80RGQDzgC80Z3ZzutZp2bEOZCvS4MSaZL2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292938; c=relaxed/simple;
	bh=OyHw83A2A19sVpcGsbd13IlNPPP3p4XGJSt26jywD5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FiU1TC+MaDRM+g6Il17qyLLfq+73l3B5fTS8y23gmihdHQ36Gn5SoZKIQRX5Ow1AIjiotWpCA2N++dhYWhhcLsWiqJA/nHjt4gmiDFPEjW1dkXorl+4+WWg1vBi/vAovBgThTU/5ndzJAS9hXIR7dDscAQmV3BxxbnunPhD7vHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejMpq0id; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292938; x=1799828938;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OyHw83A2A19sVpcGsbd13IlNPPP3p4XGJSt26jywD5c=;
  b=ejMpq0idjdv8ihRpH7njWgMCGXLRo6lu9Q0Ayq+39j8ZvmlTa2xUZLqk
   We2KK2jofiFdt8PKDjOem1dTThpvJYtjFl6TiXo2rZ8tMEHHDxLoM4JZs
   5DiUBxO1p10dY7Ag29iQsC45n2WL9lLY/Ksfj9JdD38301r1JbPdB8npe
   e+owEp/Y4UHYxCk8Qa/f1vwc8K608CiN0bJo13q0DuFJ7dRR5FomchyyN
   BOskmItKCKDX9FU/ZD98oyvqE3Khy66hSGboPVvjWuPqB+xGhMUV/Tju5
   Q4nRDnR4MvKHyftUbapJk3uhnKszzj6auKs1kQoyoncO/4zInwXKvENY1
   Q==;
X-CSE-ConnectionGUID: My/GKm54SLifa67d3L/LGg==
X-CSE-MsgGUID: GY+AQOBBQduVbO8zsRcc3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86988332"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="86988332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:28:57 -0800
X-CSE-ConnectionGUID: RPi2igqIT+SKm6O/14QJng==
X-CSE-MsgGUID: EJmxcDXpQDirnFUM7u+chA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235035126"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 13 Jan 2026 00:28:56 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 95CF394; Tue, 13 Jan 2026 09:28:54 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: egalax_ts_serial - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:28:51 +0100
Message-ID: <20260113082851.83584-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/egalax_ts_serial.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/egalax_ts_serial.c b/drivers/input/touchscreen/egalax_ts_serial.c
index 07a4aa1c19bb..5f284490a298 100644
--- a/drivers/input/touchscreen/egalax_ts_serial.c
+++ b/drivers/input/touchscreen/egalax_ts_serial.c
@@ -108,8 +108,7 @@ static int egalax_connect(struct serio *serio, struct serio_driver *drv)
 
 	egalax->serio = serio;
 	egalax->input = input_dev;
-	snprintf(egalax->phys, sizeof(egalax->phys),
-		 "%s/input0", serio->phys);
+	scnprintf(egalax->phys, sizeof(egalax->phys), "%s/input0", serio->phys);
 
 	input_dev->name = "EETI eGalaxTouch Serial TouchScreen";
 	input_dev->phys = egalax->phys;
-- 
2.50.1


