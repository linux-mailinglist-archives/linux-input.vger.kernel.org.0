Return-Path: <linux-input+bounces-17029-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE00D17532
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD3EC30EB662
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F10D381706;
	Tue, 13 Jan 2026 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqwnzJR9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A683816FC;
	Tue, 13 Jan 2026 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292983; cv=none; b=L4jkXk4hlrHNbU3cxltgO79yN9qz4Kn5PO8O9Cf1kxrdoyZqW5QF2pH+Ezh0tV69l5eFa/yMlvX41FQHDHk7xWr88e2XeGrMLj66HL65Ymgr2aydfVu3BVL+0GHvMyftEbGrAm04np/LHde1jzMsssS1HW18AlxzMsyA2/eGzF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292983; c=relaxed/simple;
	bh=wcQQ1uv0cAg+JHFEdG22Qu1aEfTmXdtJf24c7J5B+JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ui3d4EzeRu//tG/UJnFr9WgpFDHpW3qptUx0arF2O8ynVNcXsEhcXlhumiDq9SCjOwcW1gAfxqFdHrD5vfnQi+FK1m3ltPg4r3AaSdu7Nl0DCmIDdF1K4Zw2pHVcRpr5RWTte1x9UJJgogXPge76Q/tZ0wMDOHOx8tnerZWcmBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqwnzJR9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292982; x=1799828982;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wcQQ1uv0cAg+JHFEdG22Qu1aEfTmXdtJf24c7J5B+JM=;
  b=dqwnzJR913Dpe07Tqw9VoUc6neKv5RNE55wEHc/x79bYI4Dd5NuQAmkC
   IUjAxIwUVYVJ/eNPJyDKe+02RJ527X+t9L0f1YRrKQzRr6ADPBKroaoK1
   4rNqwcIPPyGRNgB777hcxoYxWQezHuNaEw1EXLMsTy2VArqV7snqN9kBi
   CA1tUEGwxkpPaoIrpTX7BKVzkVhRIzXCdbK5nPqeS8Qqi2UM2lpFTncBw
   v3epbWVEkK+JmNk/lnPyAnXBUpUtYN5s3xx2TjRmmik7XjCm9KOgKEjkm
   1+JBjmAXsXj+IpzlSTVExRG3NMFR5lKHJNdPH5nBcaoATgIR5HYORMJXB
   Q==;
X-CSE-ConnectionGUID: qeWnG9SgR8Clz29ZtCnqEQ==
X-CSE-MsgGUID: Y+MXitRJSOWONxLIC+jALQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80293983"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80293983"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:41 -0800
X-CSE-ConnectionGUID: HP66DjWoSduXriDz78edCA==
X-CSE-MsgGUID: UaNsQgwLTyGvsUapQEMBSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204134833"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 00:29:40 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7CC3694; Tue, 13 Jan 2026 09:29:39 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: touchwin - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:29:38 +0100
Message-ID: <20260113082938.89437-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/touchwin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/touchwin.c b/drivers/input/touchscreen/touchwin.c
index fbd72789ea80..4b92e8711e1d 100644
--- a/drivers/input/touchscreen/touchwin.c
+++ b/drivers/input/touchscreen/touchwin.c
@@ -118,7 +118,7 @@ static int tw_connect(struct serio *serio, struct serio_driver *drv)
 
 	tw->serio = serio;
 	tw->dev = input_dev;
-	snprintf(tw->phys, sizeof(tw->phys), "%s/input0", serio->phys);
+	scnprintf(tw->phys, sizeof(tw->phys), "%s/input0", serio->phys);
 
 	input_dev->name = "Touchwindow Serial TouchScreen";
 	input_dev->phys = tw->phys;
-- 
2.50.1


