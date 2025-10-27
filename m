Return-Path: <linux-input+bounces-15733-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B818CC0D69E
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 13:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90A37421B29
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 11:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223E619ADBA;
	Mon, 27 Oct 2025 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwIrX9t9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EBE2FFDCB
	for <linux-input@vger.kernel.org>; Mon, 27 Oct 2025 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566310; cv=none; b=XJnc3mpsEShQOcacBvtCvUmC9adDxAQTg8G26c2DZ86Ib1d4O2n7bgHgrZ/ThhWt5DrUpz6JfSdPZHSMNinTH56SEEbcPOgzhya+GZxrqLwvAsjgBR4Lu03mWzuKNOkiVYEgJCzdqmxlzISX2qZf1tDFb4G/JdnXvARHb+JoTEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566310; c=relaxed/simple;
	bh=rTowg0RBT66AWVL03IKIFiPeAdtgolAe5b+yICoCCLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/JJ6kJzWSCVmarTqAX4QnSKskktIul3suWvywS7mCZd0M4ReRZjg3yeKuVRwsQJmwC2oOlBzIJIa/t9VqLPfi4x0ZE9PuRJIxOfawMN9cQDfvsQ+s+Xmsqd6UZQVcxSFMVzczPeYCHIp3abcVVxhuzQ4cKKMNFd6QeQtLJ/agI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dwIrX9t9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761566308; x=1793102308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rTowg0RBT66AWVL03IKIFiPeAdtgolAe5b+yICoCCLA=;
  b=dwIrX9t92FWPLkiNFq9QZAPRp8p+wLlA/THPJ0GpH5k89kg5PQmnd7nc
   0pIb51va0NlRCGSgpppeTbLqZ+EF9MZtUrPri8cCw4hMbunWHyKsat1SM
   jdM0AF0NTikwszZVKWYPz/yfc2epl8GqCEC1EaO2sQobGwsQcx4ZQUUVd
   UFWjErNAAeEudZgKJZoxw/eKvNnkH9pj9JEhDEI5aC1r8i7c7Fsx7719d
   2xwWN9FRV8IXN6G5Qqn63jJ3Wqng3jzFvg/4I2657Ks5Hm+Uf45o41dcz
   ddpo3870pPm18Hln8wYk8WjtE7rO3uXmgU+IZ31CtSeHahBjbqrtZ0JTL
   A==;
X-CSE-ConnectionGUID: N1RtqVjQSHaT+F9pFoiSvw==
X-CSE-MsgGUID: vLQGeaDdRcqKLHmcBaCCpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86270828"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="86270828"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:58:27 -0700
X-CSE-ConnectionGUID: AbbfSUsiQqOdpoIkrexsMA==
X-CSE-MsgGUID: RNg6awKETn+2MQHh3ztlVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="208640574"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:58:25 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5A65F121EC5;
	Mon, 27 Oct 2025 13:58:23 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDLrj-00000001dk3-18p1;
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
Subject: [PATCH 2/3] Input: cs40l50 - Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 13:58:22 +0200
Message-ID: <20251027115823.391080-2-sakari.ailus@linux.intel.com>
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
 drivers/input/misc/cs40l50-vibra.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
index 7aa7d577e01b..90410025bbae 100644
--- a/drivers/input/misc/cs40l50-vibra.c
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -308,7 +308,6 @@ static void cs40l50_add_worker(struct work_struct *work)
 			list_add(&effect->list, &vib->effect_head);
 	}
 err_pm:
-	pm_runtime_mark_last_busy(vib->dev);
 	pm_runtime_put_autosuspend(vib->dev);
 err_exit:
 	work_data->error = error;
@@ -368,7 +367,6 @@ static void cs40l50_start_worker(struct work_struct *work)
 		dev_err(vib->dev, "Effect to play not found\n");
 	}
 
-	pm_runtime_mark_last_busy(vib->dev);
 	pm_runtime_put_autosuspend(vib->dev);
 err_free:
 	kfree(work_data);
@@ -384,7 +382,6 @@ static void cs40l50_stop_worker(struct work_struct *work)
 
 	vib->dsp.write(vib->dev, vib->regmap, vib->dsp.stop_cmd);
 
-	pm_runtime_mark_last_busy(vib->dev);
 	pm_runtime_put_autosuspend(vib->dev);
 
 	kfree(work_data);
@@ -456,7 +453,6 @@ static void cs40l50_erase_worker(struct work_struct *work)
 	list_del(&erase_effect->list);
 	kfree(erase_effect);
 err_pm:
-	pm_runtime_mark_last_busy(vib->dev);
 	pm_runtime_put_autosuspend(vib->dev);
 err_exit:
 	work_data->error = error;
-- 
2.47.3


