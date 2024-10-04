Return-Path: <linux-input+bounces-7065-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D2E99000E
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 11:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941951F244E5
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 09:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA4414884D;
	Fri,  4 Oct 2024 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ya63KC4x"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2EA152787
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034892; cv=none; b=DEln8BMbk3hGn5jHwi763ZVPfil7vgtNJbU3pJYy84QDO0i5hduUEITzHEOiQ1gHb5U4QKneLIVMRHjWA3QnaJp9ax/KU3QjOmI2GNfiF0zBApfAWQ+DYF6JkL3eYwM+FMPeYPozc9Qb5eO0lfvsPGkIK8FuXDOgs2swldcOF3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034892; c=relaxed/simple;
	bh=enluKrN2u1q/Yq+VJubHhrZUxesgptLgXSLEDsUvaHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OX2q9kxKoPm4y+VeN75+emuyIEqDlRiJMwwLLs+T0+zgz4GOXUNJIHOe/gfyxCEDC4+VdKZedemazpqcpCdJ3oGQfmAgdJst4ysqxEIw/jaIQ3AQ3PLxuM2YSDrTc6XEzr6H5Z4E2n1L4D6J0yr6MWzD7roK2DyXaRM3o0O66d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ya63KC4x; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034891; x=1759570891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=enluKrN2u1q/Yq+VJubHhrZUxesgptLgXSLEDsUvaHE=;
  b=Ya63KC4xc4Fa9r4AWqpPhztqh7YgFyB5nadRuafOENZ6aEUjgBT4yZLj
   HVzxlSMNfC84h550i5NGzkzpHYQhgEyEKte6uURo6ZdakOWNWwDEGzKM/
   mVUHlsu89zIGwRgKYOK1edYxNdPKdclw3w/ZJd2XF+8EnEMvlnxa6m3uS
   Pff25fHj6HtFT7VstcfPdQXqvvckE2NUO6IaWVhd2EBpCX8Jx7a+66Ngv
   +m+es5bWrxRmqtpum+GCWzfu8Q+02HTwDkgL0PTu/u6NlVVGFZJffXatz
   rRBzahHtCy/siDuHcTzb1ttJTOtYWh15+M362fTrr2vsnkz93Jjv6YsXY
   w==;
X-CSE-ConnectionGUID: D48KxNFxRIK+BaA4uheAng==
X-CSE-MsgGUID: EsFhfifOR4uEaV6wT77mmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856266"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856266"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:29 -0700
X-CSE-ConnectionGUID: uX6rjicyRVewQH8Cqp+p/w==
X-CSE-MsgGUID: 1nT+NMXwTYKB9FJC60i9SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331942"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:28 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1EDD5120E62;
	Fri,  4 Oct 2024 12:41:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoN-000TZx-0M;
	Fri, 04 Oct 2024 12:41:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-input@vger.kernel.org
Subject: [PATCH 20/51] Input: omap4-keypad: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:23 +0300
Message-Id: <20241004094123.113691-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/input/keyboard/omap4-keypad.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index 040b340995d8..cc8d77601fc7 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -196,7 +196,7 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 			 kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS));
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return IRQ_HANDLED;
 }
@@ -234,7 +234,7 @@ static int omap4_keypad_open(struct input_dev *input)
 
 out:
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return error;
 }
@@ -268,7 +268,7 @@ static void omap4_keypad_close(struct input_dev *input)
 	clk_disable_unprepare(keypad_data->fck);
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 }
 
 static int omap4_keypad_parse_dt(struct device *dev,
@@ -407,7 +407,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	if (error)
 		return error;
 
-- 
2.39.5


