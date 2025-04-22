Return-Path: <linux-input+bounces-11931-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E81A974F5
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 20:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65DC016680B
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 18:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023CD1C9DE5;
	Tue, 22 Apr 2025 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5i+SX0V"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BACA38382;
	Tue, 22 Apr 2025 18:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745348219; cv=none; b=fqcrCwOZQ16XBY4LYEbEW/KmGmhqnSON0FTh3x01nkc61JrxsPVpbIzRwy9zB6QscVkFTw0BOM1GLl8sQ4ycGgwVBA+jjiUw9ly26jOWHNlOAnMb+X+naMkFxNSghvi2T0wxcUtIo8eQhD5w8YKR63I5Vh2AcB+WmlOxVbzdbUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745348219; c=relaxed/simple;
	bh=C2hXjWBtaa/nrjNrelrqgjcarFDfmEvg+tIEbUCjG9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MAgS97YcHX5UCPftK3SKNr4CVIOpZ8Q4K8NhqeimLfg7ykFuEywbu1TT4XmnHnd5ULJw5GdFV8ZwuZCUXRNESdR5QeqAgeT6QpAuQozkhYrVp4WA1QaswaGsfkMLc1wnUdbNhAIFU1CK6i2VeW+Hvt+bt02M8IjmPf53yV+C/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5i+SX0V; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745348219; x=1776884219;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C2hXjWBtaa/nrjNrelrqgjcarFDfmEvg+tIEbUCjG9A=;
  b=i5i+SX0V+8ntZfzqHdvw3SE7vi4S4UEl8yIh1gWqBJwFAx6EoxMwgjTf
   7ae2HtPhBqYIlKsqxnXekdtT2fjdCT/4gwobu/pFE77yVKc8Qqh9FsuuY
   xsFYK+BrJqxfahAGyNRgd9lM76OqLkBd2BFNeyZCeXwqQGO7xlLaaeyt4
   Ot4iuAIY0uqdi3V4KLBWqhM63ejbY3sucF07Ta4H+LGT2FF5qD0FUxjX+
   T8oKadyROIgTrDIId14nafzOmM7Ef3q8d3DTAk88akwh0ApzUH23GCIN2
   DHRxdCgPh9LYjnckhXFkEwbzHSnZrNjlVuxESRraiVHgKfa4oyZRdvR9D
   A==;
X-CSE-ConnectionGUID: ahxsevKMRyqlEWW1MhYW9A==
X-CSE-MsgGUID: 5ytr0GCcQIOFEHRRqAYcJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47049468"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="47049468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 11:56:57 -0700
X-CSE-ConnectionGUID: aYcohfHZStekOEuQtU8paw==
X-CSE-MsgGUID: SkzDp9X3RoGQtaMUNd+VwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="169308048"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2025 11:56:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B1C8E1E5; Tue, 22 Apr 2025 21:56:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] Input: ALPS - bail out when device path can't fit buffer
Date: Tue, 22 Apr 2025 21:56:45 +0300
Message-ID: <20250422185645.1949391-1-andriy.shevchenko@linux.intel.com>
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

drivers/input/mouse/alps.c:1411:9: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
 1411 |         snprintf(priv->phys3, sizeof(priv->phys3), "%s/%s",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1412 |                  psmouse->ps2dev.serio->phys,
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1413 |                  (priv->dev2 ? "input2" : "input1"));
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

drivers/input/mouse/alps.c:3106:17: note: ‘snprintf’ output between 8 and 39 bytes into a destination of size 32
 3106 |                 snprintf(priv->phys2, sizeof(priv->phys2), "%s/input1",
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 3107 |                          psmouse->ps2dev.serio->phys);
      |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix these by checking for the potential overflow.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/mouse/alps.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 0bd7b09b0aa3..e76dcb19fa72 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1401,6 +1401,16 @@ static int alps_do_register_bare_ps2_mouse(struct alps_data *priv)
 	struct psmouse *psmouse = priv->psmouse;
 	struct input_dev *dev3;
 	int error;
+	int n;
+
+	n = snprintf(priv->phys3, sizeof(priv->phys3), "%s/%s",
+		     psmouse->ps2dev.serio->phys,
+		     priv->dev2 ? "input2" : "input1");
+	if (n >= sizeof(priv->phys3)) {
+		psmouse_err(psmouse,
+			    "failed to prepare path to the secondary device\n");
+		return -E2BIG;
+	}
 
 	dev3 = input_allocate_device();
 	if (!dev3) {
@@ -1408,9 +1418,6 @@ static int alps_do_register_bare_ps2_mouse(struct alps_data *priv)
 		return -ENOMEM;
 	}
 
-	snprintf(priv->phys3, sizeof(priv->phys3), "%s/%s",
-		 psmouse->ps2dev.serio->phys,
-		 (priv->dev2 ? "input2" : "input1"));
 	dev3->phys = priv->phys3;
 
 	/*
@@ -3094,6 +3101,16 @@ int alps_init(struct psmouse *psmouse)
 
 	if (priv->flags & ALPS_DUALPOINT) {
 		struct input_dev *dev2;
+		int n;
+
+		n = snprintf(priv->phys2, sizeof(priv->phys2), "%s/input1",
+			     psmouse->ps2dev.serio->phys);
+		if (n >= sizeof(priv->phys2)) {
+			psmouse_err(psmouse,
+				    "failed to prepare path to the trackstick device\n");
+			error = -E2BIG;
+			goto init_fail;
+		}
 
 		dev2 = input_allocate_device();
 		if (!dev2) {
@@ -3103,8 +3120,6 @@ int alps_init(struct psmouse *psmouse)
 			goto init_fail;
 		}
 
-		snprintf(priv->phys2, sizeof(priv->phys2), "%s/input1",
-			 psmouse->ps2dev.serio->phys);
 		dev2->phys = priv->phys2;
 
 		/*
-- 
2.47.2


