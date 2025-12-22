Return-Path: <linux-input+bounces-16666-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C6FCD483F
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 02:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 123C430056FC
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 01:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ACE63093DF;
	Mon, 22 Dec 2025 01:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyFJo29m"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A27228C9D;
	Mon, 22 Dec 2025 01:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766367627; cv=none; b=EOuB+JCMXIi1Vw1y2fviHh/hxVL+BJH+KOneE6oiAdTtCTyCvJ2OlpLjZ0N+jWzTryEnAKGwprx6KnNChaLKh/eKUcwbrABwSTWAuzSWcJ0MIkBeijOFqQ4WkFkuz6ijiCr2VPlyc+oUn2CxzladqEHVhWShReqtuSw9FMCxQFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766367627; c=relaxed/simple;
	bh=cxUTXdHuDJ7JiG1E1rHoRIedWf9fMtuIlhBIQpmXF1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EqqsCDIf1mhd+2rLQkr42+mB8OqfdgozNq3ANqQ31CcVRq/bENJ7/D7H/5zM73ulCTF1hFHPlUqQsfIhmnROFll74WU+pHR9y44L8Br4Y41T6qZqxXvkdvptIrsVamZK9x/Pw/tfxGT+OAFyuQivRcUEazTOxb7NfqmNEIpBntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyFJo29m; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766367626; x=1797903626;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cxUTXdHuDJ7JiG1E1rHoRIedWf9fMtuIlhBIQpmXF1U=;
  b=iyFJo29mYAqGQF8kZ2nIrna1pGkQj7sVn+2DSVhpdrLZYVvHZTMmyCvy
   phR6mVuVVrvAj6a0oAOCiqfIyyajQrJCobTShygJuGMlURuRCdzHb7dqm
   ZQEkd0wrp6UNc8FyCoKaDGCkKTQLBc6a7fynjtb8wjXkaXDSTwUBmEO6q
   0zV0M/8DE5+dDaFLN+eukZG+rVSPr9XOXmcvnHovutWx0IiceV6309QER
   T1XXSAINOMxuiVkQwaknM3BPxelSUMqyHJ+kc1ppbEJS6el5xmCouJZR7
   J7h1uTHaQTW8ymahqzDicSz0c5AP+Bk/0RWFqACKBiSYg1RqY2OGRF0B8
   w==;
X-CSE-ConnectionGUID: 85VW/VoxQzafEhvYJOHQ5g==
X-CSE-MsgGUID: py2gH0oEROmJ/BPiQ+5SNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85640715"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85640715"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:40:26 -0800
X-CSE-ConnectionGUID: zqgq0BuoT3i7phqkXWKVkg==
X-CSE-MsgGUID: 1NQqAxHXQNKjFVEwW9rh/g==
X-ExtLoop1: 1
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 17:40:23 -0800
From: Even Xu <even.xu@intel.com>
To: bentiss@kernel.org,
	jikos@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH] HID: Intel-thc-hid: Intel-quicki2c: Add power management for touch device
Date: Mon, 22 Dec 2025 09:41:34 +0800
Message-Id: <20251222014134.1810253-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Send POWER_SLEEP command to touch device when system enters into sleep
mode or hibernate mode to save more power; and send POWER_ON command to
take device back when system exits sleep mode.

Signed-off-by: Even Xu <even.xu@intel.com>
---
 .../intel-thc-hid/intel-quicki2c/pci-quicki2c.c    | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 0156ab391778..c9fb7f71942f 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -809,6 +809,12 @@ static int quicki2c_suspend(struct device *device)
 	if (!qcdev)
 		return -ENODEV;
 
+	if (!device_may_wakeup(qcdev->dev)) {
+		ret = quicki2c_set_power(qcdev, HIDI2C_SLEEP);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * As I2C is THC subsystem, no register auto save/restore support,
 	 * need driver to do that explicitly for every D3 case.
@@ -858,6 +864,9 @@ static int quicki2c_resume(struct device *device)
 	if (ret)
 		return ret;
 
+	if (!device_may_wakeup(qcdev->dev))
+		return quicki2c_set_power(qcdev, HIDI2C_ON);
+
 	return 0;
 }
 
@@ -915,6 +924,9 @@ static int quicki2c_poweroff(struct device *device)
 	if (!qcdev)
 		return -ENODEV;
 
+	/* Ignore the return value as platform will be poweroff soon */
+	quicki2c_set_power(qcdev, HIDI2C_SLEEP);
+
 	ret = thc_interrupt_quiesce(qcdev->thc_hw, true);
 	if (ret)
 		return ret;
@@ -968,7 +980,7 @@ static int quicki2c_restore(struct device *device)
 
 	thc_change_ltr_mode(qcdev->thc_hw, THC_LTR_MODE_ACTIVE);
 
-	return 0;
+	return quicki2c_set_power(qcdev, HIDI2C_ON);
 }
 
 static int quicki2c_runtime_suspend(struct device *device)
-- 
2.40.1


