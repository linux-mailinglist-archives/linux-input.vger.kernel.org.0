Return-Path: <linux-input+bounces-13380-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BC3AF8B00
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 10:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E236170670
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 08:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDB32FD593;
	Fri,  4 Jul 2025 07:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmDPYHDY"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9633E2FCE33;
	Fri,  4 Jul 2025 07:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615721; cv=none; b=f/VTkptglPjgZFj/th4ejOhvsQr7en7Z3FXKPYIq+p4SODMe2Mmq+btMv+v99rjUNDtmeAL7B/3n7JZNmZZ93ZG/2xIjy3H21nsTePjZgu1zTve+k1KI9mPyY8c5Xbe9TDpQi1NuUJANnV41oouZFAbLF6QK6x9+Z3UE0RiBRRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615721; c=relaxed/simple;
	bh=AKRBPdQvBvtbRK/bXPl6r6OCwP7RJU5T2nZ52barpCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YEkoFu9xGUXCnParwSjIZzdwMPJoJYAyNtllooXYu/BHO6F2iu2vsGWIyDdeipEa4jPiDm3EvN0THTf1RKhzlr4tRCITmtjGCrbIqZdmQXZpdsGYU5ay+0SIAQEjM++AutA95l0B2MbrIvYYh3yGtghDcO8uemhr+e6XILt9Clg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmDPYHDY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615720; x=1783151720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AKRBPdQvBvtbRK/bXPl6r6OCwP7RJU5T2nZ52barpCE=;
  b=GmDPYHDYZWod9kDSXyKXP9yMvDq5uX8MSK2Gvn/dbdjJ8TYoa2eMkYoC
   yDSqTtTGjzKb4pK0bS2mY2b4dVjuIZRCUV8gwUJXQUwWIBjCOnoJ1QFrl
   CXsgNi3gZ5ywVTyC5aU2huGCX4EOHVOAny+1v6ojTNfn8JCPTLY4zbcKi
   RlUUUzbqWdP/E05OQnqA3jUXTziBpio9ansGpYhe/5a5YcY9o5VXPx+sV
   8ORT8XPRcuhslbGPCq0X1VGdBf/res0hqYtfJI4mAN4yW0qPE+Ky/XlfT
   Bt3ddQXdHVW5/+CsTdXuG+OmLQrNF2oEu5+eE85ruyjvgUDVJBIAaF3jW
   Q==;
X-CSE-ConnectionGUID: k2Bm+046SmGKX56WGj2riQ==
X-CSE-MsgGUID: DOdFi4pgRYmtaOlbGiehwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194406"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194406"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:07 -0700
X-CSE-ConnectionGUID: r0Yg0XYGSACvaZf+G+FrQw==
X-CSE-MsgGUID: U50mikryQMm5rKhXsjifnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616725"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:55:04 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 70C6C44424;
	Fri,  4 Jul 2025 10:55:02 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 78/80] Input: cyapa - Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:55:02 +0300
Message-Id: <20250704075502.3223112-1-sakari.ailus@linux.intel.com>
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

 drivers/input/mouse/cyapa.c      | 3 ---
 drivers/input/mouse/cyapa_gen5.c | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index 00c87c0532a6..6e0d956617a1 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -403,7 +403,6 @@ static int cyapa_open(struct input_dev *input)
 	}
 
 	pm_runtime_get_sync(dev);
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_sync_autosuspend(dev);
 out:
 	mutex_unlock(&cyapa->state_sync_lock);
@@ -666,7 +665,6 @@ static int cyapa_reinitialize(struct cyapa *cyapa)
 		pm_runtime_enable(dev);
 
 		pm_runtime_get_sync(dev);
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_sync_autosuspend(dev);
 	}
 
@@ -710,7 +708,6 @@ static irqreturn_t cyapa_irq(int irq, void *dev_id)
 			 * process.
 			 */
 			pm_runtime_get_sync(dev);
-			pm_runtime_mark_last_busy(dev);
 			pm_runtime_put_sync_autosuspend(dev);
 		}
 
diff --git a/drivers/input/mouse/cyapa_gen5.c b/drivers/input/mouse/cyapa_gen5.c
index 3b4439f10635..59f6e97d5482 100644
--- a/drivers/input/mouse/cyapa_gen5.c
+++ b/drivers/input/mouse/cyapa_gen5.c
@@ -2833,7 +2833,6 @@ static int cyapa_pip_event_process(struct cyapa *cyapa,
 		 * process.
 		 */
 		pm_runtime_get_sync(dev);
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_sync_autosuspend(dev);
 		return 0;
 	} else if (report_id != PIP_TOUCH_REPORT_ID &&
-- 
2.39.5


