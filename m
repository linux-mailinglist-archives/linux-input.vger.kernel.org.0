Return-Path: <linux-input+bounces-13379-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209CBAF8B9B
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 10:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 868934A3F8C
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 08:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD272E2F1F;
	Fri,  4 Jul 2025 07:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDz4zJtX"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F122E0B75;
	Fri,  4 Jul 2025 07:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615680; cv=none; b=cudSwm2VKsMtgc51julEnW4Ry4vaOFx0dvP+xTdSG5LPOgPtMkJSoFbL2zsJoMmGlUnv+9jVcfAMA28pV7qOmVdQFcr0rXdE2negwcyB77p3U9d4PMBCrcKTHxqmbILlgiDKWVVlo2Gm6RwJyp2CcyrIBrDLk/2eXA7KicFSpbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615680; c=relaxed/simple;
	bh=wB79eH98fNbh61qiXKAUKjCvjkalYAl1YFc1JZjSyL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aEpz1hpw2OOzTSXCLPZDy7jBIuXPXUKclGef3mQ3FOWcFhY7uSJPLpBnRPzgJ2nivCNez5q2OSsAocLn1zhhjSGuIw5Gy8PzGFR44QjjVFEl3WTplkiZLy4j/YmmyNTXfcQ36CgxxuW8bFOK39zaU2h7hfxYCFV+IqTPdOrhz1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDz4zJtX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615678; x=1783151678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wB79eH98fNbh61qiXKAUKjCvjkalYAl1YFc1JZjSyL4=;
  b=LDz4zJtXxHcohqnrymzVQTz5BGdmH0WySIctNQmxWgHiJTi0JN9NLA6T
   Jle/AGVnIA0kiqLlkOkoZ82ZJMttvcUdPq8PqTF0NMvv+blNhxO6IIAqe
   i82Y2+Wi1NMV5udl5ri+8+wQpohfjFOnza8gKpMQmZwYS/cxUH36n+eD2
   vi9FETiiqqXe6dFfAMqjgHGYcy/1vPGEDQqWOdoaE1j1oKrwbh/CaoRSZ
   DynBZrJ6AdDha9caMf4PBzt8sCDSzW+gCff6P/hPkw42Xb6MQCzW2Djmo
   jHxCxPTtszZEK5fevq3EXlWONoGTqcXMM6v9HNy5DxGsWNCwvei4LQMek
   A==;
X-CSE-ConnectionGUID: 5SOIEvK0QHKf9wSAU4565Q==
X-CSE-MsgGUID: 64RwAvUiSiuaiaDh3JLuKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494789"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494789"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:34 -0700
X-CSE-ConnectionGUID: 6mn5JHY1Qs6igO/wqvoNgA==
X-CSE-MsgGUID: iZDOe7kQS/yVZ5I/Q21eDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924322"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:31 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 0227944424;
	Fri,  4 Jul 2025 10:54:30 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 40/80] Input: cs40l50: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:29 +0300
Message-Id: <20250704075429.3220022-1-sakari.ailus@linux.intel.com>
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

 drivers/input/misc/cs40l50-vibra.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
index dce3b0ec8cf3..c651a84a6335 100644
--- a/drivers/input/misc/cs40l50-vibra.c
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -306,7 +306,6 @@ static void cs40l50_add_worker(struct work_struct *work)
 			list_add(&effect->list, &vib->effect_head);
 	}
 err_pm:
-	pm_runtime_mark_last_busy(vib->dev);
 	pm_runtime_put_autosuspend(vib->dev);
 err_exit:
 	work_data->error = error;
@@ -366,7 +365,6 @@ static void cs40l50_start_worker(struct work_struct *work)
 		dev_err(vib->dev, "Effect to play not found\n");
 	}
 
-	pm_runtime_mark_last_busy(vib->dev);
 	pm_runtime_put_autosuspend(vib->dev);
 err_free:
 	kfree(work_data);
@@ -382,7 +380,6 @@ static void cs40l50_stop_worker(struct work_struct *work)
 
 	vib->dsp.write(vib->dev, vib->regmap, vib->dsp.stop_cmd);
 
-	pm_runtime_mark_last_busy(vib->dev);
 	pm_runtime_put_autosuspend(vib->dev);
 
 	kfree(work_data);
@@ -454,7 +451,6 @@ static void cs40l50_erase_worker(struct work_struct *work)
 	list_del(&erase_effect->list);
 	kfree(erase_effect);
 err_pm:
-	pm_runtime_mark_last_busy(vib->dev);
 	pm_runtime_put_autosuspend(vib->dev);
 err_exit:
 	work_data->error = error;
-- 
2.39.5


