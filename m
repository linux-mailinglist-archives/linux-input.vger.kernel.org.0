Return-Path: <linux-input+bounces-7066-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2B990010
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 11:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C2271F245E8
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 09:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399931537CB;
	Fri,  4 Oct 2024 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itm2cu3H"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECC31537DA
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034894; cv=none; b=hdyoHSOZ6bu2RGmSkLIkTR8nDfb+zFf27XbAEV/od7VN9+LAca+hJW9yS56bIjEMsGIZZIHQtJl5P83YfoT2ZxeOmlz+wOkLNkCzCriezBbZxlMjfAkci20MlLt4pHerSZEy/DIhf49E+FmZVoEpPaSXETOzzUz7ERJlwcax9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034894; c=relaxed/simple;
	bh=ewYQHM6nA4qx+kWAWS796CFp0cLYvU7NRBCFhXAJUE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W3fmkMrZk4tFZyS1yfi/KqbqpqTEH6AyqVFCArtHmM87YBId5W56/CZ+2rpgRG+cPiB2b76TDV3qGc4MV6rPiZ6QoZmrqyEI8lKgQ+yEMuZWTPxS+JKN3JGThB6Z9vykxQz30rUc3t/7VEmLkd+kKIJUmr2+wluRAG/+1GQX080=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itm2cu3H; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034893; x=1759570893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ewYQHM6nA4qx+kWAWS796CFp0cLYvU7NRBCFhXAJUE0=;
  b=itm2cu3HYQSFA+qQ61MBtMQbyG/2aMFOpGa4LMoB37J1zDj+L5eRJ84a
   i5nGMKisjruRuNx9m6iDh1fvGtJaXa4ntQiWHKDrr0ycigC6zvqHK0ll6
   UCWsSfXGnqYV99aimNvi5+UCXAHcmQm8mEWifwgtQ9rV0OD9iRiYHLKeh
   cZIVPHB+0+ytiI9WJuottYqG4qt7OZ0WAJUlq0yxgatTDoUAAgdn+HcQN
   lEdfV6Ju+ZujwJ/+ppQs/Ftp7fMQ2Tlgbupx6Mrqlifu7X2q7xBMlnZx7
   xvb02odsliwSTAtWGc/tdnjS6wXvW17g1gq1A0hQlbbaNyyGT+dDm/xSQ
   w==;
X-CSE-ConnectionGUID: rvPyKFKgTL+Alu/JlfGv/Q==
X-CSE-MsgGUID: UHiZfgxER0yGhO/GacM/dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856274"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856274"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:30 -0700
X-CSE-ConnectionGUID: 0gNsMhuEQ428PLPnu+zDUQ==
X-CSE-MsgGUID: /Nnm4HJxR46eJkm97qrMVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331941"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:28 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 31C98120E8F;
	Fri,  4 Oct 2024 12:41:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoN-000TaE-0c;
	Fri, 04 Oct 2024 12:41:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-input@vger.kernel.org
Subject: [PATCH 21/51] Input: cs40l50: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:23 +0300
Message-Id: <20241004094123.113708-1-sakari.ailus@linux.intel.com>
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
 drivers/input/misc/cs40l50-vibra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
index 03bdb7c26ec0..8555f0d93d3f 100644
--- a/drivers/input/misc/cs40l50-vibra.c
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -307,7 +307,7 @@ static void cs40l50_add_worker(struct work_struct *work)
 	}
 err_pm:
 	pm_runtime_mark_last_busy(vib->dev);
-	pm_runtime_put_autosuspend(vib->dev);
+	__pm_runtime_put_autosuspend(vib->dev);
 err_exit:
 	work_data->error = error;
 }
@@ -366,7 +366,7 @@ static void cs40l50_start_worker(struct work_struct *work)
 	}
 
 	pm_runtime_mark_last_busy(vib->dev);
-	pm_runtime_put_autosuspend(vib->dev);
+	__pm_runtime_put_autosuspend(vib->dev);
 err_free:
 	kfree(work_data);
 }
@@ -382,7 +382,7 @@ static void cs40l50_stop_worker(struct work_struct *work)
 	vib->dsp.write(vib->dev, vib->regmap, vib->dsp.stop_cmd);
 
 	pm_runtime_mark_last_busy(vib->dev);
-	pm_runtime_put_autosuspend(vib->dev);
+	__pm_runtime_put_autosuspend(vib->dev);
 
 	kfree(work_data);
 }
@@ -454,7 +454,7 @@ static void cs40l50_erase_worker(struct work_struct *work)
 	kfree(erase_effect);
 err_pm:
 	pm_runtime_mark_last_busy(vib->dev);
-	pm_runtime_put_autosuspend(vib->dev);
+	__pm_runtime_put_autosuspend(vib->dev);
 err_exit:
 	work_data->error = error;
 }
-- 
2.39.5


