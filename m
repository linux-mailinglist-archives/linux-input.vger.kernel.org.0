Return-Path: <linux-input+bounces-13378-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0BAF8B62
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 10:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8DE2587002
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 08:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D1A2E03E0;
	Fri,  4 Jul 2025 07:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gv+yZlg7"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0562DECD2;
	Fri,  4 Jul 2025 07:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615677; cv=none; b=umc0wk6Fu429oBRwPPKE79z37xkxh91qTk9hKIe1/V8rmD2po23BqBTmno044mvM8vmcH7DMxMXP7Qq0Z/yjanOXNGGYQE0G0XY5rIRPpDTr8v0Bcmm9RUnyL1tuKKc8i5F7mzeAzEDjjgVqn44Ce1pTYAeFkUgAkRx6aXx3G3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615677; c=relaxed/simple;
	bh=CTv6iPrW9uEDcgFRXY04j1SNCfKTPuyZUDjMaqvzVHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fn5p8Qcycs972XceSRSN0l7CV5MdvU6SXta1EteUBCxI88WLVw0OUckDvmDD1FShkuDcarK5gU0JVsC2f7r76nthB0XVF2hVWi1yXq30lveKrJnQnMP61TO37y2LSCyaFdScBubEkQBDV58N8+rsXwN/lZVwbmsq2Ks6AN+dgZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gv+yZlg7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615675; x=1783151675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CTv6iPrW9uEDcgFRXY04j1SNCfKTPuyZUDjMaqvzVHQ=;
  b=gv+yZlg76T+RcJKkphE3yhwgP4mV0iX4SdRx1bcVLmHkTEIdVgALpBEZ
   ViBTU9ZVJj0EGsIorlngm5HZrubblvYGBwWE6Lphusxht/QmQ/1Icseew
   Y9/7k4RROjVxs+raJoE1fH30dT5fElp3xJPQAF+8ErDdEn+gmKzWx6sIG
   RzCBUSKgP19hFUvYdV0HlkekqLLVp2OWj4jI0ZMaesLmQYLx1yvZbJeix
   mEth+9LdwTTLpPrS2mz6ijVN08u8YL8zeJmbNTkkgkDELhRMf6d+1g0lj
   XswZ1nzukylWUzk5BF/y+Sw9UWK4PQ35ZyPoQABL9QQiHjH2vKmyzAqII
   g==;
X-CSE-ConnectionGUID: jW/4i/JuRVeACO1r7Bh57w==
X-CSE-MsgGUID: gdiPxzyRTOKybDjo7BZ9Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494737"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494737"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:32 -0700
X-CSE-ConnectionGUID: MQBkuX0FQCiq4o3yIm1YVg==
X-CSE-MsgGUID: 7muF5evQTH+hCpqXfufQIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924314"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:30 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id E8B9144419;
	Fri,  4 Jul 2025 10:54:28 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 39/80] Input: omap4-keypad: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:28 +0300
Message-Id: <20250704075428.3219960-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/input/keyboard/omap4-keypad.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index bffe89c0717a..e783244d0c91 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -193,7 +193,6 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
 			 kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS));
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return IRQ_HANDLED;
@@ -231,7 +230,6 @@ static int omap4_keypad_open(struct input_dev *input)
 	enable_irq(keypad_data->irq);
 
 out:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return error;
@@ -265,7 +263,6 @@ static void omap4_keypad_close(struct input_dev *input)
 	enable_irq(keypad_data->irq);
 	clk_disable_unprepare(keypad_data->fck);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 }
 
@@ -404,7 +401,6 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 		omap4_keypad_stop(keypad_data);
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	if (error)
 		return error;
-- 
2.39.5


