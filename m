Return-Path: <linux-input+bounces-17027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 49721D174F5
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3D16303517C
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890A53816E2;
	Tue, 13 Jan 2026 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jK66MBEi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402853815FB;
	Tue, 13 Jan 2026 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292977; cv=none; b=DfImQpxIkYOEYFDr6bdTjRNei8ZffKZxOG9Sub8qRUGSztg13dJp74WEyUMewVzX8QzpzjVxf6hbP6wAE5jUALe8j4wxf7hxgiYHDUIEe++0Nwtvrp9WNfdH+Qh7Ka/oya1UyKLphb51jkMn8aJ74HBLcz2612fhgaqIry5ydyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292977; c=relaxed/simple;
	bh=dlwtqdF8X38MIRfhdGntlm5jJsrYicl+4OfdJ/gCxmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dw8QoII5nQGzlqnZQ1Qqr3Dx9J2LH/kJ/imx0yoXHITk58s90iIP0cs3CVvO0PwR1ptAAUKqXXqc1bEz61D9KG3jQ9bh7F3tptkGnNTRi+U2jYx5J/zHfYjUjvwyrQ2EIeaKEPjJEcNnkgGFdzOyNquPz8hfgPOjC/kZIo/RWEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jK66MBEi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292976; x=1799828976;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dlwtqdF8X38MIRfhdGntlm5jJsrYicl+4OfdJ/gCxmg=;
  b=jK66MBEiyMc5m2Iqapjzs6fXTrSCVj7I/KJg9YrXZK6pD6AumWW/L34y
   40jnGzTVA8qUFkOkdgoAR/YiO+JF/6EtpweDqXo0Kf2XI/zBR4VV2HS+R
   pq1OEsowUH4F59gZNK+W+M5xHCDGGxdmOZM/+UYEGsdZs7A2SUylsJbVU
   Eninsll78IGzw3m8FV/mVTIYXVRhC3JPwNN/wyr8r3c60kuaVvYVNE1i/
   Oxc0zNg95u1Vpkod0hx7vft5ZXYFWUHkRwd0OrLSRtByF4ZnVhl3rtfuH
   K0DATWw9az5otZ0AJwK/oXgi619jbIw3QKTRMhEopfKp1CyiVm9fQgSnt
   A==;
X-CSE-ConnectionGUID: WAb9xLzxTkC/gzhNZk/inQ==
X-CSE-MsgGUID: dtwIXZBwRmKWcLH+BnsgzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80217882"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80217882"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:35 -0800
X-CSE-ConnectionGUID: NpAeQBWLRyqLYV/3gyG0rQ==
X-CSE-MsgGUID: Ohq8evWTQZG6UgWeHt9mMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208481519"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2026 00:29:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1A03694; Tue, 13 Jan 2026 09:29:33 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: touchit213 - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:29:31 +0100
Message-ID: <20260113082931.88083-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/touchit213.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/touchit213.c b/drivers/input/touchscreen/touchit213.c
index c2718350815c..f5ba7cfb5945 100644
--- a/drivers/input/touchscreen/touchit213.c
+++ b/drivers/input/touchscreen/touchit213.c
@@ -148,7 +148,7 @@ static int touchit213_connect(struct serio *serio, struct serio_driver *drv)
 
 	touchit213->serio = serio;
 	touchit213->dev = input_dev;
-	snprintf(touchit213->phys, sizeof(touchit213->phys),
+	scnprintf(touchit213->phys, sizeof(touchit213->phys),
 		 "%s/input0", serio->phys);
 
 	input_dev->name = "Sahara Touch-iT213 Serial TouchScreen";
-- 
2.50.1


