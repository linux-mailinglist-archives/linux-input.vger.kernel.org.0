Return-Path: <linux-input+bounces-17028-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81328D1752F
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6196030E77F9
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E597C3816EC;
	Tue, 13 Jan 2026 08:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mauwAMM8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B03816F4;
	Tue, 13 Jan 2026 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292980; cv=none; b=kPjhGVtAZsQh8ufVf2bqjmb3ZsAd0qjJhP2WrD5Gt/7j9Ul/y0x9ZzVaJh/V8bG728eDGnadktVqo5VEY1ynDtsMxSM2J2crV/pEDx++8zZc2+OZS32UNqGURRAWnjV11eOg69NkeL8yXgFjKpOop551ixnjJRV6xl+IXIvmMgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292980; c=relaxed/simple;
	bh=XlmGjfzqNf7s+bsCekP0MQCnSZiCzHsTodpUFIgBPFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dd0opESYE+N5JUUootg+s3IECV+JZ6lE0nZ3NS+5vg3EGa6wM2y5vuPyIazsP7gyEEefgQeq2iveQ10vfJ5rKn54S0NpNQaYBdijA2gB7+LMu/W8i2JK4aMQQlo9WtidEHsFWWpxXKkY9o/pUMPC5PDkd/rTjuD33SsKYiIrPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mauwAMM8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292979; x=1799828979;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XlmGjfzqNf7s+bsCekP0MQCnSZiCzHsTodpUFIgBPFw=;
  b=mauwAMM859pfTtCbbgOt1kb20LpBM5bx54MZxJiQjncFUNaT4Om3Uyte
   Nx/N8EQU1/3JdEm9XRFf+ZPdXFajJFZkkU4qZR49ea+pdwc0VsvNqhZJU
   JQBYpElWZLHkkVkqkyafCXaixmpayIkO6XJG9xgk6hF9vdGOr35vbMueC
   7KOlqRfpmBHoT6FOL4ml0HnhgegS/n6WSyOag2cl/+oIyvgx92Kgn9CJF
   FT3oV4s9XIYF6nmngeIWx7MGO2fUcAmUHR0eCAPl4SzcRCiXTHWvbbpHs
   jzk+noaGGay4892lbtahUjgoeuOUpK6cozPDeqh/BMoW1s4QzjZVLI2Mq
   A==;
X-CSE-ConnectionGUID: RG0pzhG6SGeA5envEIbLSA==
X-CSE-MsgGUID: LoDZTAxRSnevciH52tYCeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80293980"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80293980"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:39 -0800
X-CSE-ConnectionGUID: nw1xpgYzT8WrQhWkaB51/A==
X-CSE-MsgGUID: dwQ9a88NR6KaQPAwOVN2Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204134826"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 00:29:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 58ED794; Tue, 13 Jan 2026 09:29:36 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: touchright - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:29:35 +0100
Message-ID: <20260113082935.88801-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/touchright.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/touchright.c b/drivers/input/touchscreen/touchright.c
index 30ba97bd00a1..9be7c6bf5e7f 100644
--- a/drivers/input/touchscreen/touchright.c
+++ b/drivers/input/touchscreen/touchright.c
@@ -111,7 +111,7 @@ static int tr_connect(struct serio *serio, struct serio_driver *drv)
 
 	tr->serio = serio;
 	tr->dev = input_dev;
-	snprintf(tr->phys, sizeof(tr->phys), "%s/input0", serio->phys);
+	scnprintf(tr->phys, sizeof(tr->phys), "%s/input0", serio->phys);
 
 	input_dev->name = "Touchright Serial TouchScreen";
 	input_dev->phys = tr->phys;
-- 
2.50.1


