Return-Path: <linux-input+bounces-15734-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EBAC0D59F
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 13:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D590189A12C
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 11:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EC92FB09C;
	Mon, 27 Oct 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnNtyT+o"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB6C2FFDCE
	for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566310; cv=none; b=PpDYdeG/GB8dR8Y4mk8rwPMklo6aMaxLzuUZM5PdDutORdqb5ShsBoQ+y+Jtw7g8yBwhP1OkVz81z0BUZlk+2hXMS4kXzXey7oI3ofKrd3I+h894WK8qi6FLx7qQo0gLSLhaVsXWL8HUcjLUzttw9Hngwu4t5NR3609gXD132T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566310; c=relaxed/simple;
	bh=u83ArnEVDDh/Bfv42saW69MzoIYz61YfpoHMFYfOPEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4Rm7O243Nj9z7FhSK1xQdUJPBgkhw9h6ybXQzX53r0Cc6RdesEUh6k1ZDo839InfsiNyeuOewzOf7kuS2CDdY4csgpK58sMBC2kJM+rHuBhaN+YERIfiPNNT90u4iFJfpVl1fKZpgsOfFmMI54guvBQMkmnXWU9Q8RYa6pUcOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnNtyT+o; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761566308; x=1793102308;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=u83ArnEVDDh/Bfv42saW69MzoIYz61YfpoHMFYfOPEQ=;
  b=BnNtyT+oPyZJsPpMms8+jp6gDONNTWoPm+NSTji3SvrRKt94MgpR/6rs
   oCsftu7FHxF735ka/30e6w65+5jVzJp6HFfPiklJF9RcqtZDr8IaNLF2a
   KGR/JcB/71nY8hD2E6VzU+iaeiRvoxUUITjm4wu3IBltTnQMIpOLN7ThX
   SqaTu2SuiuVPFaLnd8U3UVYcmH0P+HQNgZt/pCHYJgeWzYVquJDL2Pmv4
   +RntJSVrqx9w39bAnN1sZw3maFJQKBQmXjA0Syt2IlxVncirr49NDSDyz
   ITIfbAxyPvJiWRSM6UPKnsLREOqB100NleKdFmpvPHY3isq44JFCWAdjM
   Q==;
X-CSE-ConnectionGUID: EbrnFbBuRUyrigNyoK9fDA==
X-CSE-MsgGUID: /uT6q4iNRwqAfr4D+vxmEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63344084"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63344084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:58:27 -0700
X-CSE-ConnectionGUID: +HlODz1HTe2DVtxMru8ZqQ==
X-CSE-MsgGUID: 0UeaVoc1RjayPs1q9Rhy3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189337774"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:58:26 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A107121E63;
	Mon, 27 Oct 2025 13:58:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDLrj-00000001dk0-15T9;
	Mon, 27 Oct 2025 13:58:23 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-input@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	patches@opensource.cirrus.com
Subject: [PATCH 1/3] Input: omap4-keypad - Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 13:58:21 +0200
Message-ID: <20251027115823.391080-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
2.47.3


