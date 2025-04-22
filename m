Return-Path: <linux-input+bounces-11933-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74717A974F9
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 20:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 383643AFFC2
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 18:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0251DE3C3;
	Tue, 22 Apr 2025 18:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6BSbDaq"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006CB2989BA;
	Tue, 22 Apr 2025 18:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348227; cv=none; b=mBhJfUiXlUw+gSF0mLQOJPr7r2TJ78ukV9ddBn7Agm1kr3eqnV9zUUuxs2pF6qkc4DDxYsc9GvnWyBF8t7VVMJE2IUJ5jI5x1w0DlLDwo6Owq1aslDnHcEz9QRqVzTUhIiXky9BTzNC57h6Jdi+kp120Y+EUMoFX+JJl12WK4JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348227; c=relaxed/simple;
	bh=6fkvh5ss0UW60E2UL9tvRuqOGIYBbE9Yqsa6P08P63A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p1fdUXAGCAYkp4gta9o/seChakYxqaaRhlTF1InLpWFoTaDC3zIeQ2hRTBuIMWXjPK/sow8arOlhSJbsLAbJQFGHnwd1X/2kNSfeUWer8CkcIRcZR5FhXhI1mP+fODGFOYZcpnXKBc4Ow94nmrUJQp7C0muVLGa1RB6uErzca2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6BSbDaq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745348227; x=1776884227;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6fkvh5ss0UW60E2UL9tvRuqOGIYBbE9Yqsa6P08P63A=;
  b=P6BSbDaq8BaivnZ+sxp6yxNmSTMhWEvkZF6PtaewzT6mE9LdhRDv/oO6
   f2T5Fq0S7tK2wVd+d9mxzCvBspcdD4rxM54afmP1UpdrFoshBfRXB/Vcn
   9gnvS/vIl1UXkKTOb7I7wIBl+Gu92ss8W1ellINpdO82guKqoFIKCr5mS
   NqJlGqKIQPAn+7hY0bv0Dd3Nj0IM7z3yFYZ0gehI8jFxR4UPFmZdWe5DF
   YCHjnPi43PbG5bNMkaA2+Yi5cIeKq/m3bSRf68uVLRoZYZcvkBwm0V2CL
   HUD1e1PURJwU/856HSxCNJUk5YrG9fv3g2CQ6dyRZ7OeFdhZBVoNwG1sV
   A==;
X-CSE-ConnectionGUID: WJrwI/GmRjiiWVGKwR56lw==
X-CSE-MsgGUID: NS9HXQT3Q4O7oro0Q6qYQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47049486"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="47049486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 11:57:06 -0700
X-CSE-ConnectionGUID: OK44sUbxTgynLB9fcK5+XA==
X-CSE-MsgGUID: t3rfJXq3R5ShX/10n+gN3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="169308109"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2025 11:57:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 22E3F1E5; Tue, 22 Apr 2025 21:57:02 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: lifebook - bail out when device path can't fit buffer
Date: Tue, 22 Apr 2025 21:57:02 +0300
Message-ID: <20250422185702.1949465-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When creating a physical device name in the driver the snprintf() takes
an up to 32 characters argument along with the additional 8 characters
and tries to pack this into 32 bytes array. GCC complains about that
when build with `make W=1`:

drivers/input/mouse/lifebook.c:282:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
 282 |         snprintf(priv->phys, sizeof(priv->phys),
     |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 283 |                  "%s/input1", psmouse->ps2dev.serio->phys);
     |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix these by checking for the potential overflow.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/mouse/lifebook.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/lifebook.c b/drivers/input/mouse/lifebook.c
index 7147dacc404f..58df2c0e53cb 100644
--- a/drivers/input/mouse/lifebook.c
+++ b/drivers/input/mouse/lifebook.c
@@ -272,6 +272,7 @@ static int lifebook_create_relative_device(struct psmouse *psmouse)
 	struct input_dev *dev2;
 	struct lifebook_data *priv;
 	int error = -ENOMEM;
+	int n;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	dev2 = input_allocate_device();
@@ -279,8 +280,13 @@ static int lifebook_create_relative_device(struct psmouse *psmouse)
 		goto err_out;
 
 	priv->dev2 = dev2;
-	snprintf(priv->phys, sizeof(priv->phys),
-		 "%s/input1", psmouse->ps2dev.serio->phys);
+
+	n = snprintf(priv->phys, sizeof(priv->phys),
+		     "%s/input1", psmouse->ps2dev.serio->phys);
+	if (n >= sizeof(priv->phys)) {
+		error = -E2BIG;
+		goto err_out;
+	}
 
 	dev2->phys = priv->phys;
 	dev2->name = "LBPS/2 Fujitsu Lifebook Touchpad";
-- 
2.47.2


