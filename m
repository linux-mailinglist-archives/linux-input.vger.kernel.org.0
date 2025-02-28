Return-Path: <linux-input+bounces-10439-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CADDEA498D5
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 13:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B4EB16A884
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 12:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7128D26B2CC;
	Fri, 28 Feb 2025 12:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfeurIWd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92C226AAAE;
	Fri, 28 Feb 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740744716; cv=none; b=nLj5MIkTLjETqJ1KpXASxRE9zIo5TaciKNskwthRHZ3kwtcU6Gy1zbDbjb5L9Jkp8yeT2UNVRDb0cwiwgRoICFgWEyvgI06L3Q+oFNvhnR9+b9Q+70mZryjVi02Z4yo4CuejLWIPAGUvVcaCEnsfRmxHyuzH2L3ZsQqf96oMsHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740744716; c=relaxed/simple;
	bh=iseyydn3166fxxMEU90V1J8zPR+ti7lo2U3jMW76PXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NvdubhzoiUT8rqC5qUQ5ciWbJoYyUEPtb9M+FovVfAlFfrKmLtHS+xi01JGGR/nC640KGpMN16CunNIehlCIkGLSiC0DD5KgKXbTO/h5pNRVT2OOjGecpxn+DuBuzAOrfmJGZe0orM6R/tWxSxmhQ0gXXhm3rTOtzuD+KLQd7Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfeurIWd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740744715; x=1772280715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iseyydn3166fxxMEU90V1J8zPR+ti7lo2U3jMW76PXY=;
  b=mfeurIWd4Nufc/cMO5Dj60EiPThLFP16SXBM4E8Ohtb1qSJW+hPMMywV
   UiLJc9IINKJFKbVfEqUgo6mtfur0hGj+7fCujBVhirAcW6Kg1apLbM4Oa
   rKokuqlbTNSt6shpOrw6/Kho0vAVasnv/EnVBvfqEeA1uRWk6Vy3WgWxc
   3LK528ojO+dnnZhOp7gZ+ke6k30G0+GysrPNvxJysWNO5DS3FtUGnRsaa
   ol0szzLZkleME0Yjt445V2BcqO1CNaXqU/5UW+olLjybV8yKI5UhNa7ie
   bELkTLXzY/JMgoKelTkUC78sAUTsadGVg7/qll0aEF/u33S5/e1mtcKSb
   Q==;
X-CSE-ConnectionGUID: yT/naTqCTgyYYUxbaKrVVg==
X-CSE-MsgGUID: SAYXLnFXSMeMR4oHduV2RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40846708"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="40846708"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:11:52 -0800
X-CSE-ConnectionGUID: NRbvSAkNSZe8jINLZntKXA==
X-CSE-MsgGUID: 514ykL25SDe0PoJVUFHAbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117081034"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 28 Feb 2025 04:11:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DB3A4297; Fri, 28 Feb 2025 14:11:48 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v1 1/4] Input: ALPS - increase size of phys2 and phys3
Date: Fri, 28 Feb 2025 14:07:44 +0200
Message-ID: <20250228121147.242115-2-andriy.shevchenko@linux.intel.com>
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

Increase the size to cover all possible cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/input/mouse/alps.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/alps.h b/drivers/input/mouse/alps.h
index 0a1048cf23f6..9c8f69694f60 100644
--- a/drivers/input/mouse/alps.h
+++ b/drivers/input/mouse/alps.h
@@ -287,8 +287,8 @@ struct alps_data {
 	struct psmouse *psmouse;
 	struct input_dev *dev2;
 	struct input_dev *dev3;
-	char phys2[32];
-	char phys3[32];
+	char phys2[40];
+	char phys3[40];
 	struct delayed_work dev3_register_work;
 
 	/* these are autodetected when the device is identified */
-- 
2.47.2


