Return-Path: <linux-input+bounces-17025-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E0AD174DA
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89FC5302D98E
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1BC3815E1;
	Tue, 13 Jan 2026 08:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7Tb/i33"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493C537FF73;
	Tue, 13 Jan 2026 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292968; cv=none; b=nR9NJZ9OrcEdc0mrg8Q66R8BHjcIkJ5gzsNFTcW4U86/RhrPckJmD2UEqQayC2Vc2tW9WvXUE6uv89IenR/G0iKrwydDQ7lZ9NcrAgJPxUNOi+gOT0ygWK4y1slJqDz16Mm/PIbIvr2xviTxBw9Z3y79XMgozFfIKQp28hs3Jvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292968; c=relaxed/simple;
	bh=ae/e8b2AwK4hkXBY6WaIgdW5+x1xdK32edZ95du17w0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J9i0A1AE6SMs5fLc9Oyx74EuQQgo3WDHlKRCI0Cwz+CwMxz28OAwUT16XO9Ulq+KLrMQU8Vw2equGr09tvgSw6nJQEgB87GnW9JyrX3ri4t1UbD+f0jL34/aVBQ8369Klgosqs5vmmY19qW6XGM1k61fwrvFynmklnlpn+DXlGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7Tb/i33; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292967; x=1799828967;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ae/e8b2AwK4hkXBY6WaIgdW5+x1xdK32edZ95du17w0=;
  b=K7Tb/i337yHz63cj59MWw1sIkCiGs0BpZdjlH7JzE/l7X2WLidKn093S
   UyUZ7HLamaMTxa9RrQHaFSoPhGcDRRPr2Bg1+GinSIEl0CQesQP+AVRr0
   0KZXgHb+ma+QXGtXxlrDkp9RQyU16RgVxfUJ52zVWzD+q/a38Ul2X8i+c
   uVjqawO/oFZNTObPvh+pXdJVk7m2MhFCxHuu7xd3tRVEySm/Xi1qAi6Zg
   VSXhaVjSMkjuJCEEDXZmkkvTYbpqHYjO8SIlxSQ+FkdefLesaAKRYiyUn
   hMERPAttnhXXwtACPBvSn2boUzUAoqfyytQWAvIl8AHgMZNPIPLXWbeMo
   g==;
X-CSE-ConnectionGUID: yL5EfepRS+W78uDek0HBMw==
X-CSE-MsgGUID: YRU8KM/xT8Kp0k61QvUAaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80293968"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80293968"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:26 -0800
X-CSE-ConnectionGUID: wLehsQvyQbaLbT0W9KWFXA==
X-CSE-MsgGUID: 9KhPEgH6SpG1fwMm/qSLzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204134800"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 00:29:25 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 184A394; Tue, 13 Jan 2026 09:29:24 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: mtouch - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:29:21 +0100
Message-ID: <20260113082921.86167-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/mtouch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/mtouch.c b/drivers/input/touchscreen/mtouch.c
index eefae96a2d40..0427ae08c39d 100644
--- a/drivers/input/touchscreen/mtouch.c
+++ b/drivers/input/touchscreen/mtouch.c
@@ -137,7 +137,7 @@ static int mtouch_connect(struct serio *serio, struct serio_driver *drv)
 
 	mtouch->serio = serio;
 	mtouch->dev = input_dev;
-	snprintf(mtouch->phys, sizeof(mtouch->phys), "%s/input0", serio->phys);
+	scnprintf(mtouch->phys, sizeof(mtouch->phys), "%s/input0", serio->phys);
 
 	input_dev->name = "MicroTouch Serial TouchScreen";
 	input_dev->phys = mtouch->phys;
-- 
2.50.1


