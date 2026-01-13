Return-Path: <linux-input+bounces-17030-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB72D174CC
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69EAF301DE98
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E341537FF70;
	Tue, 13 Jan 2026 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRrK3cOW"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1B338171A;
	Tue, 13 Jan 2026 08:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292986; cv=none; b=R8aTuNivKC/K4ONZrjaVujNl0Gyrf7gGDHvcFoQ5mehhSNkUa4h2O2p/WhzffNNHd0EFMGajEzlZeOZLcBDvdUDolqm2Daz1PcpQVQe9X7K/c1WYj1KpfrEqS08yooVzbWd6Lb9xkKeUwrF4TMacb3/bVozDVuRt2cQzi6WQOeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292986; c=relaxed/simple;
	bh=NwekEGl6ypKetQQPdR/Kh+fyATlqmfs0VWcHizYvSuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/3zZOzxu9/SDngTDgilR3liB7OZwQn74rRtlfNdvGn0sw838Lu2F03pzjBfe4sFkztcnG0rPfL29GPi+3wDhYCvQp/vLW+bz6Uabl7+HLgGcPnXjO4zh/jLCp85zEvSREHifRn6+wWzaLmr/ru/fOV5QisSbMDTWhYRtUF543g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRrK3cOW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292985; x=1799828985;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NwekEGl6ypKetQQPdR/Kh+fyATlqmfs0VWcHizYvSuc=;
  b=nRrK3cOWZ0M5xJBG0xFWR25usP96j1ISl1+VZ9eOy8MV0vLsJ2bISJno
   RpVOr6RCzfzso5gPonrW2f1oEGoII9XpToOShvEpbYnVg1i6nMF3f4sbk
   Tguo05p4sc0ykcUcyf2ec4gzR/6rYLJb/JpOqOhdxJk20dq23xv6DscGT
   ibAkKH/mHuiIof33brerS1vJTcFv/PO6/Baxf4/FG8nS6bh2azCiFvmuL
   I+KkzwvbZRZBrsduJSdyi/p3i3h9T8dx0hzKeDzMlJFXvWKE3wfzOYUtJ
   0vNI1AqvlfsxZ6hpotbAcmE3TCK3og3zYG6hAFJRhjEEuMEAXZ1dnLYDq
   w==;
X-CSE-ConnectionGUID: wLVDt74cQVatYdHhyuJ9Yw==
X-CSE-MsgGUID: veOA6n/vS7+mvJ2KOYOcJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80217889"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80217889"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:44 -0800
X-CSE-ConnectionGUID: oUQYevX3QfCntRVkCREBRg==
X-CSE-MsgGUID: OE4ZKp3ER3qkUB9/pU4buw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208481530"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2026 00:29:44 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 942FC94; Tue, 13 Jan 2026 09:29:42 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: tsc40 - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:29:41 +0100
Message-ID: <20260113082941.90006-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/tsc40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/tsc40.c b/drivers/input/touchscreen/tsc40.c
index 9f485cf57a72..c5dabebaf96d 100644
--- a/drivers/input/touchscreen/tsc40.c
+++ b/drivers/input/touchscreen/tsc40.c
@@ -92,7 +92,7 @@ static int tsc_connect(struct serio *serio, struct serio_driver *drv)
 
 	ptsc->serio = serio;
 	ptsc->dev = input_dev;
-	snprintf(ptsc->phys, sizeof(ptsc->phys), "%s/input0", serio->phys);
+	scnprintf(ptsc->phys, sizeof(ptsc->phys), "%s/input0", serio->phys);
 
 	input_dev->name = "TSC-10/25/40 Serial TouchScreen";
 	input_dev->phys = ptsc->phys;
-- 
2.50.1


