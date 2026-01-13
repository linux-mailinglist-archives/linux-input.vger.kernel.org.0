Return-Path: <linux-input+bounces-17021-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93806D174A3
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D9F83022B35
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED4E2264BB;
	Tue, 13 Jan 2026 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLkSZkME"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE03C3815C2;
	Tue, 13 Jan 2026 08:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292946; cv=none; b=b4rg80tElTHTQrjNgIrmLCVq7XPx4KhBS4R/q/TJGs9vjXXiV3++jycZwx0Xjq7czryoqh/E1DzYp+6vbpVbtFMEjyYCvYjj6qwpldA7w2lhspAYFTMZzSEfhbkjdaS6ojhiL7mrUgjEaik/TRcBRTyw3TUIF+B/1PxavqKGSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292946; c=relaxed/simple;
	bh=FER6nD6OGLno2LRzY5sbJIt648xFbtBpSEzNkZhEYIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMh6ZCdqW2SK4hqKg0kTqPfI6Ndd8+3eVyP+hqRI90X4B09iUpQK3NiUhunfbqqT5LRR06z9ap3FsvMqNMq6Kk1qY/nPIWhHgpayoaKqy81KBkhAp2A2L80THbjuFci4aP5I0WdObaIYU5f0sGpW5mwJEX7Ap4o6Bd9MTCFzqoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLkSZkME; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292946; x=1799828946;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FER6nD6OGLno2LRzY5sbJIt648xFbtBpSEzNkZhEYIU=;
  b=eLkSZkMEXl4/wHZwua4W7VIk9CqcoftgFFTQxRKjCtYvKicWhjfXr02M
   9HyX/6BJ8ap8jLdpfkKXDxzeJPMKAr1L7fj5U5vKlCAZvGMqBV50ctfUQ
   kPf9vCBiIuHLz/93AO4DRtWtALZL9D7L35inojrW+xf63tXafTIAAcUFG
   X8ob3ecZUNOIdPy0KhHqKi+1fXkw0fUjUHH6OPdWgJWc04wwvxjo5lP42
   efnDScX+sCm6eropLabtW8E1UwTtkxj78q6ayPjcRtXCHV3BAF4pTY35G
   ZQNkWRMQqH9+gDLxryg4514+Vbm4vs8VHOqwLHau2KEhHh6zL6t5RwzJh
   Q==;
X-CSE-ConnectionGUID: p3GVwAxgT+C6c+rZPtMCmw==
X-CSE-MsgGUID: NyfmYenHQli0x3J06d74LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69732366"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69732366"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:06 -0800
X-CSE-ConnectionGUID: 2EauQnZSQmm0FIaAzjvIDw==
X-CSE-MsgGUID: RFOlWjukSU+3S5bvLXGrmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204219162"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 00:29:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6EB5A94; Tue, 13 Jan 2026 09:29:03 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: gunze - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:29:01 +0100
Message-ID: <20260113082901.83668-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/gunze.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/gunze.c b/drivers/input/touchscreen/gunze.c
index dbf92fb02f80..426d2bc80a93 100644
--- a/drivers/input/touchscreen/gunze.c
+++ b/drivers/input/touchscreen/gunze.c
@@ -106,7 +106,7 @@ static int gunze_connect(struct serio *serio, struct serio_driver *drv)
 
 	gunze->serio = serio;
 	gunze->dev = input_dev;
-	snprintf(gunze->phys, sizeof(serio->phys), "%s/input0", serio->phys);
+	scnprintf(gunze->phys, sizeof(serio->phys), "%s/input0", serio->phys);
 
 	input_dev->name = "Gunze AHL-51S TouchScreen";
 	input_dev->phys = gunze->phys;
-- 
2.50.1


