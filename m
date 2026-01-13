Return-Path: <linux-input+bounces-17026-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8CBD174AF
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 09:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F033330286B7
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0DF3803C2;
	Tue, 13 Jan 2026 08:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbhPnRik"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F6637FF7C;
	Tue, 13 Jan 2026 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292973; cv=none; b=beDIJMjuHZRs8mdc9CEMULiLqotC8/XPbIHDys6E8sdlEuD/70mqmU+50w9Q44Wb58gYTKxI9p08fQ5sLeQ+nMLHrk8+CbHYBsJzOUkQNMdybDFGciu4/CvlTb/uTH7coeT0yeZw9vjU2Cbk/OYlPAk8LSgU1aGfiyfNe/4aSyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292973; c=relaxed/simple;
	bh=+b/UTekjNV9XS8rpfbjCrPZDZdUgrGq1m/pltoV6YDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WoZW/TTMvvwoTSMJJGcTdq947LTliyK7tkdI74X6lgUegw+8O/Pan945xlu9wgFsquyMZwPQAF7zNOF3nC30beR8aX0UME8QyhCJu0PrfZKrOhYtc8YN26gqR9Px0LB+UAT7EL0lPh11bWAudpldhH5p3qvOUqkuFN8oLkW8uRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cbhPnRik; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292972; x=1799828972;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+b/UTekjNV9XS8rpfbjCrPZDZdUgrGq1m/pltoV6YDY=;
  b=cbhPnRikho+A9G+dYj7PfolXBjB8EvvL2ACO8jYTO8psHl877HSRpW9u
   gM7RxRji9jeWzei0Y/By2rpQyT9Rk7yri+4jsmppMBfdtnpTQi91e6LKT
   V3MEc9OJfj8gG+/UV42ueZ+A/XAhIUNfppeqxCq0JVFql7AagIKfpvZzV
   fPuCvLhfj3J7OJk0nySiKtwY//oyQFArLNv4Xh7/yJ4j0u1vsN1WdIZdR
   b8xz9/OX/WF8247y1XErbeVuZ0txKk0Xg6dJvBIzcgWp2BiZDbrNwmVYt
   x6cix8jQlAzdIc+fnUmIt4t69jv7PBtUt5vt9IaU9jtBIo3pVxtXTQ+UQ
   g==;
X-CSE-ConnectionGUID: AjjZRCaLTueG9vPi413dRg==
X-CSE-MsgGUID: 4r8J/BQFR4i/Ge8/imXwdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80293972"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80293972"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:29:32 -0800
X-CSE-ConnectionGUID: A6QWpXaOSRWwj34u458XWw==
X-CSE-MsgGUID: ojkKoRYlTGivn/hXDp+aJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204134814"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 00:29:30 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 6E99E94; Tue, 13 Jan 2026 09:29:29 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v1 1/1] Input: penmount - switch to use scnprintf() to suppress truncation warning
Date: Tue, 13 Jan 2026 09:29:26 +0100
Message-ID: <20260113082926.87049-1-andriy.shevchenko@linux.intel.com>
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
 drivers/input/touchscreen/penmount.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/penmount.c b/drivers/input/touchscreen/penmount.c
index 95adede26703..e027c71cffd9 100644
--- a/drivers/input/touchscreen/penmount.c
+++ b/drivers/input/touchscreen/penmount.c
@@ -208,7 +208,7 @@ static int pm_connect(struct serio *serio, struct serio_driver *drv)
 
 	pm->serio = serio;
 	pm->dev = input_dev;
-	snprintf(pm->phys, sizeof(pm->phys), "%s/input0", serio->phys);
+	scnprintf(pm->phys, sizeof(pm->phys), "%s/input0", serio->phys);
 	pm->maxcontacts = 1;
 
 	input_dev->name = "PenMount Serial TouchScreen";
-- 
2.50.1


