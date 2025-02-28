Return-Path: <linux-input+bounces-10438-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F1A498D3
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 13:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CC7B169FA4
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 12:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2803026B2B2;
	Fri, 28 Feb 2025 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnlD3iXN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85426AAA1;
	Fri, 28 Feb 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740744716; cv=none; b=Y2to6WKr9MWAqY8cl6C+vBdLD3GQgX2ZB1SIDFhQoJtwVBcVCKTUhchkgAMU6iW2isD01uKCuVz37jcmaIsjKZ99F9f7i4v2rX/fOcTXmEBA+oCE5TYCX6U5oYnFhYMJiMmG0MPtUwiM6n4tj2Z3VHn0z2ldZI4cjtfYRg2/7uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740744716; c=relaxed/simple;
	bh=4V0n3DIxRuCjsSIt2VNFo1xATqFm0YNwHI8ecDrJdUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SgJStTjlKivbVxp5NDCSmQtRRo5z5d5K3APFm+PMBOE/gHaYyGWmrK4BI5pGfszsNjMf1L9fLSSH4nCjkU+w1hgv2e/XLrkpcnM2+af3//3Mutr3zl4OeU6sA2xIBz/QNQwiv4YZI5G/1CeM5nePnybC0kG/LVCp4rg/KiQZVDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnlD3iXN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740744714; x=1772280714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4V0n3DIxRuCjsSIt2VNFo1xATqFm0YNwHI8ecDrJdUQ=;
  b=gnlD3iXN0nOEwU2FUDRYg2ibAIxiefhFP4Kz8/rImnuuacoBq1S+bpsd
   pbRoVoGmOGcWqYt+tf0a8dDPg8NXbYKm8saBMmJpoCId2ZFxfm6BvsPkC
   JyN/Vu1dH2NkU6GNzP25mtKJxtM6Q3YZh91cjVBp+chsaUBtMz2SCqxLg
   eNR4aBzpklSaP6cvOuTBIOcG8Yl7Kl5yUUltqj6o10l5p0We285qGwAo0
   MHEjoCKe9pDPaTDJzm3y1tkANCZ0nEAVK7Yv+oBdtPREj9bWyuSIDRRTm
   dNaZw+8eooYk4QHYvA1p4qUAI8XxzBTBp7YX4hJFcViXC1lQCLEL3Fd8W
   Q==;
X-CSE-ConnectionGUID: LeC0KD4TTH+VuFrXVn/vWQ==
X-CSE-MsgGUID: vHMl/UywQC23OrevYHippQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53081097"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="53081097"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:11:52 -0800
X-CSE-ConnectionGUID: dr0MAJ7jSeu6yjo/zbhw/Q==
X-CSE-MsgGUID: VsktOm7uQn6zUXZP2rj4Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="122269272"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 28 Feb 2025 04:11:51 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0653C909; Fri, 28 Feb 2025 14:11:48 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v1 3/4] Input: lifebook - increase size of phys
Date: Fri, 28 Feb 2025 14:07:46 +0200
Message-ID: <20250228121147.242115-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
References: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
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

Increase the size to cover all possible cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/mouse/lifebook.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/lifebook.c b/drivers/input/mouse/lifebook.c
index 7147dacc404f..628a1b36a5da 100644
--- a/drivers/input/mouse/lifebook.c
+++ b/drivers/input/mouse/lifebook.c
@@ -21,7 +21,7 @@
 
 struct lifebook_data {
 	struct input_dev *dev2;		/* Relative device */
-	char phys[32];
+	char phys[40];
 };
 
 static bool lifebook_present;
-- 
2.47.2


