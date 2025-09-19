Return-Path: <linux-input+bounces-14883-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 555DAB87908
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 03:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4874E4E03AA
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 01:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281371369B4;
	Fri, 19 Sep 2025 01:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ParSTaH9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE9F192B90
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 01:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758243790; cv=none; b=SuwTOYNl2TO6YAZcHIJ7fkyUvG0XfqWrJ2LiQmJMXkHIXyEbELP1dxAHp3vfMwfBo+3e0fWMtedlp/QNUgVDTLyfyBc7f3CGl8ygbV6G0cAjWP7/bL9x8SUOl9RrFhseOydNuO9XnKn1Ctzj0geUO4EkqwdJ4+L68w9Z814Daf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758243790; c=relaxed/simple;
	bh=NMaV9Wv4KJ1p3zTFk3Omgw6+0HreS3Oc7ZLqKkC/V8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4GHJFU5jz7LMKRV1+SYJDG2zpUl+FeOa0dyWl0acIUnlLQKmNpuf9BU7Icg1JRRKX5FaCTotcYlnFpHDBx2ry3L5w1lNl4kgaE/xmpw6sixasied5Yx2iRt9EKN3Eo/5kL/vRc1wtKGlbxUB7KUgyt4P6jahC8wdUKkoNPphdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ParSTaH9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758243788; x=1789779788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NMaV9Wv4KJ1p3zTFk3Omgw6+0HreS3Oc7ZLqKkC/V8c=;
  b=ParSTaH963xIWz/hTecXqh0lafgjhpJcyk9ts1mZGrahdn+ndSkIW5sL
   /ONnT82hp53lg2FtIm29IcTbOzhAuffCUOcRj7lkj5RQpLhK5TX1AZY6G
   x6jujX9cysZfaSfeZUr+QNZKTWak/hjimOqHLU8QvTPLvEr11grrTAcIx
   1HP9CNH6QIeLK0g58LTO8CKxkpcB1BM+NGLJoNQ3munhU6vOMiZ65em+Y
   qyFpYaYyyR1yVk5kkB7S7mAx8Al2Lnu3toDtLFVpFo97RgSBnoJpqWCWa
   mH+LJTgsGFZKpKmQdin5aovqk+T1FIlAGjvMEneaxLIqTJNTRKClkdTXC
   Q==;
X-CSE-ConnectionGUID: B/A53a/xRP2iCBp6yBD8EA==
X-CSE-MsgGUID: H+X6YGPOThq3Y3g6Twp8Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60535451"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60535451"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 18:03:08 -0700
X-CSE-ConnectionGUID: DnRsQB5BRCqhSqBa+8Iy4A==
X-CSE-MsgGUID: UoUD/hjoRbqmy9nMHG0kdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="180815184"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2025 18:03:07 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 6/6] HID: intel-ish-hid: ipc: Separate hibernate callbacks in dev_pm_ops
Date: Fri, 19 Sep 2025 09:05:59 +0800
Message-ID: <20250919010559.165076-7-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919010559.165076-1-lixu.zhang@intel.com>
References: <20250919010559.165076-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The same suspend and resume callbacks are used for both suspend-to-RAM/idle
and hibernation. These callbacks invoke pm_suspend_via_firmware() and
pm_resume_via_firmware(), respectively. In the .freeze() of hibernation,
pm_suspend_via_firmware() returns false, causing the driver to put ISH into
D0i3. However, during the .thaw(), pm_resume_via_firmware() returns true,
leading the driver to treat ISH as resuming from D3 instead of D0i3. The
asymmetric behavior between .freeze() and .thaw() during hibernation can
cause the client connection states on the firmware side and the driver side
to become inconsistent.

To address the inconsistent client connection states issue, separate
hibernate-related callbacks (freeze, thaw) in dev_pm_ops. Since ISH does
not need to save any firmware-related state when entering hibernation, it
is sufficient to call pci_save_state() in .freeze() to prevent the PCI bus
from changing the ISH power state. No actions are required in .thaw().

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index ccd195adbbd6..36445d2bb927 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -397,7 +397,20 @@ static int __maybe_unused ish_resume(struct device *device)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ish_pm_ops, ish_suspend, ish_resume);
+static int __maybe_unused ish_freeze(struct device *device)
+{
+	struct pci_dev *pdev = to_pci_dev(device);
+
+	return pci_save_state(pdev);
+}
+
+static const struct dev_pm_ops __maybe_unused ish_pm_ops = {
+	.suspend = pm_sleep_ptr(ish_suspend),
+	.resume = pm_sleep_ptr(ish_resume),
+	.freeze = pm_sleep_ptr(ish_freeze),
+	.restore = pm_sleep_ptr(ish_resume),
+	.poweroff = pm_sleep_ptr(ish_suspend),
+};
 
 static ssize_t base_version_show(struct device *cdev,
 				 struct device_attribute *attr, char *buf)
-- 
2.43.0


