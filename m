Return-Path: <linux-input+bounces-15735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C213CC0D5BD
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 13:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4C2F4F6D19
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 11:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFC02FB982;
	Mon, 27 Oct 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dlvq8xuD"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08402FFF8D
	for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566310; cv=none; b=L0UskgUrbG9ii2e4ZNuDYU3OBJ1gdUrfqoUtsLEch1eSxPqejngzmhRojn40M7iPu3kQmGmpou1bIJ3mO0SY7MkUElxUTQyo4lkpd9c+I3et7MbLVY1JRxDvYwpcn5WtopX09CLMXK4//3NgoKBWUdW7WvL/R4lE4UJ4s7HQ7DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566310; c=relaxed/simple;
	bh=IwxuX42Yg63key+0Ep4yfS8KHY9KBTR4tCKxqI7DDqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmahKcn/HkyOaDYKjbDj0Po/wCn5+mVvZFgxiQcKdzcaJDiRBpLb56MdWSbFEPrkavmiD1+JteWQVkyr+yKNlZCZ1E5AlDvZ8kpp7zivv3SNMP7IY28O0emlhWRYhglRCVcNUFufQZqT9E759mBiX0pbpZzTZzzOQccCHd6NGko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dlvq8xuD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761566309; x=1793102309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IwxuX42Yg63key+0Ep4yfS8KHY9KBTR4tCKxqI7DDqM=;
  b=Dlvq8xuDVwrai4BbKj/jS5xa7iPzFtQNcuitEQVX+wfC7ZBKL6jdZHvU
   br5ku3bSo6k7PMYvAN74NGYIiplPITordcvIJegvjpJmHzibIm0cSdJvB
   EHlxTlUcj7CU+HdIdnhzMah2BdVHKNUXO/m1XZuAk6Keu6OpsZ6Fnw+Zj
   H24YnZAiESLi4+inaiif98R6DUDPeYQcJyS1sHtQw+Kpw4+nYQjv/MApz
   2vjSVd2BYtZdPHqQgWfuZJH3VGLPVncCpQwhOpO2ttVewAvQgrMSkyI9U
   7OR+tHeERxmbDnxOb8HVUnkBqsPtbP+8SLWZlk7W10VXBELkxJosNpT4T
   A==;
X-CSE-ConnectionGUID: h4P3M+GmT0myC+/cbl6bSQ==
X-CSE-MsgGUID: Gu59T5epQICyei8XMnl49A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66255934"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="66255934"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:58:28 -0700
X-CSE-ConnectionGUID: pnv2d1YYQ5iiXPNz79wfPQ==
X-CSE-MsgGUID: O1Js83doSfGWZP8N5a8j+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="190157085"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:58:26 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5AD67121EF1;
	Mon, 27 Oct 2025 13:58:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDLrj-00000001dk7-1BuD;
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
Subject: [PATCH 3/3] Input: cyapa - Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 13:58:23 +0200
Message-ID: <20251027115823.391080-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027115823.391080-1-sakari.ailus@linux.intel.com>
References: <20251027115823.391080-1-sakari.ailus@linux.intel.com>
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
2.47.3


