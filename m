Return-Path: <linux-input+bounces-17018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1DD17497
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48862301A238
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD9C3803C1;
	Tue, 13 Jan 2026 08:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8ukBL3A"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B965037FF54;
	Tue, 13 Jan 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292935; cv=none; b=pd1uSYINNFFtNkK+88AQNu6pLatjqbWZVlNHYHvg6Mcnxk9FRGJ8/0t3f0npHY4d+6sZxfJR3Xuv9v6ofR8gp2WG9CB9hnDk2Co4ieudLH7msbBL+0LjKhEdIOnMXQao60Yo7nUajHViXufpQGekE+GhnxPbota4zV1S6cQ3pbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292935; c=relaxed/simple;
	bh=F64ihPYES4zDFtyI89XSKE5LW4iYMmb30yngozrBK1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/OK0GpVnkw0218BcNvAEK+ATcUossTTYNsvqLUFUMosJnhp6oqr3RcWMIiqpM4hlMvM5nUb/CSNlkZl26TzTZ1JNj7q6ZXGF4UzlgRyPsuG79KjoKkJh+PmwPecWYbkhdCkRfiqvJhhFLB5k6dxVdmkIXlOrsMKA9OW+LJsG88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8ukBL3A; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292934; x=1799828934;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F64ihPYES4zDFtyI89XSKE5LW4iYMmb30yngozrBK1I=;
  b=b8ukBL3AY0p0789jlRSDRtQJ+BwNOkh0kg/9hoGWsGNgUxY5tVl9ekIH
   IRVWE/k9if9+aW1XXrG9JN6y5FK1SjYXRAwYBuhOv8ewxkkOS8wT+PdT0
   n0wpzch97WcbT0/IrvDCsHlGxiYvV2EcBzgHGJYR6Hkqo89J9epS94UL7
   ucUF/xtrG6Cn4lYbm72gE+w3lIcR5lFYv5Jbdt+A1qroVGq9hcJNDe6Ok
   x3psDJWUbgYhqVaU8mIMh3z5gI8nrSvM4iAVVTkOkFRyRAOIAXgWf4svW
   vum2CIip+uKpLCJdILPQn5WcUjw4klCjmw+DakB6kohJcAU0hSGpg4QOn
   g==;
X-CSE-ConnectionGUID: E+dkINiJSIWc9HjM0QdN8Q==
X-CSE-MsgGUID: rzwgjolfQSKgxJbP+e1JmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69732334"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69732334"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:28:52 -0800
X-CSE-ConnectionGUID: YObtA8XBRjO2GVJhu7p3xg==
X-CSE-MsgGUID: yUiXqvQpQBq5/RbMJBzwIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204218972"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 13 Jan 2026 00:28:50 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 832F394; Tue, 13 Jan 2026 09:28:49 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: dynapro - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:28:45 +0100
Message-ID: <20260113082845.83550-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/dynapro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/dynapro.c b/drivers/input/touchscreen/dynapro.c
index fe626a226b85..00d18823a059 100644
--- a/drivers/input/touchscreen/dynapro.c
+++ b/drivers/input/touchscreen/dynapro.c
@@ -119,7 +119,7 @@ static int dynapro_connect(struct serio *serio, struct serio_driver *drv)
 
 	pdynapro->serio = serio;
 	pdynapro->dev = input_dev;
-	snprintf(pdynapro->phys, sizeof(pdynapro->phys),
+	scnprintf(pdynapro->phys, sizeof(pdynapro->phys),
 		 "%s/input0", serio->phys);
 
 	input_dev->name = "Dynapro Serial TouchScreen";
-- 
2.50.1


