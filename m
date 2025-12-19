Return-Path: <linux-input+bounces-16628-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF0CCE1E8
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 02:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B06B3012747
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 01:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33B2221DAC;
	Fri, 19 Dec 2025 01:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f29G9ppp"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F72C18C008;
	Fri, 19 Dec 2025 01:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766106812; cv=none; b=lISLgvLXhqYQs1oWNBQochJpEOWtCqR9ZEhCn5UoSawOz0CcC/EtQCFgttqE1jxWRKq1Um87zWmjIQeKJVNqHi/seZZHk+ezwLP8JLrP72UBpJU+UyqQSIcSeV6PGDXXHFEqWDnx9mgHgC70/1NGzetPmMMkWVaORd9eiODVeuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766106812; c=relaxed/simple;
	bh=bqzqJfBt8us3dL61OfU3GC49wJR3Dv2Sh9N7ModqmVE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cCpFrTJQFOxMlGtI1yMoTqE8nmwlRhKB9tP8gieJ2+uEyzbmqhhQ8i3KfgMRtBoa+YSUGmd2MTXUqoG1PX2bbDrCnvsa9LKmwSDfulILdn/CMKkJiaiBlZB/zmyOzAfozN0v0qdezbNKxRfwxt/ap7lY+RZwFVHdeHLmwPulA34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f29G9ppp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766106811; x=1797642811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bqzqJfBt8us3dL61OfU3GC49wJR3Dv2Sh9N7ModqmVE=;
  b=f29G9pppej6hlsIt7qYoR3kwtsR0XYjmOkzbyj3I43zhHQhFSFy20NrX
   txVx9p8wneGRRDEyj9tEb80MD62JR/B7jMvD8eunTDOWsyRr2cpxDVcpn
   dz92BUo6XCDsQecHrWn/UhO9cJtfmmaTbv4I4T3iwLCbIAnGkpauiqXrD
   CL2HMp6xeywSJaLVdmzU0Q4GcR0eUY0ntSGjEEkHc4GPdJh9nGBdvXHzG
   YIFRXHQtGN+HZtA8pmbZQ5TUN1OdaEqZkVvuD8LYCWrmCA4F0EK6HFaWk
   abHCch8kkqdXGsqKzpUgvuqjkREId1dfqRI9yavL/ZAELBkImKyokm1Mc
   Q==;
X-CSE-ConnectionGUID: jIhKWr/ZSk2LmEe6OETucw==
X-CSE-MsgGUID: yuTYADgFQxys88DtQ3brvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78386877"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78386877"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 17:13:30 -0800
X-CSE-ConnectionGUID: pzzurXEYQCe2FWks5md7MQ==
X-CSE-MsgGUID: ZolXeGMvRiWeVCCmzLPdnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203130049"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2025 17:13:28 -0800
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>
Subject: [PATCH] HID: Intel-thc-hid: Intel-thc: Fix wrong register reading
Date: Fri, 19 Dec 2025 09:14:38 +0800
Message-Id: <20251219011438.2104441-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the read register for the setting of max input size and
interrupt delay.

Fixes: 22da60f0304b ("HID: Intel-thc-hid: Intel-thc: Introduce interrupt delay control")
Fixes: 45e92a093099 ("HID: Intel-thc-hid: Intel-thc: Introduce max input size control")
Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 636a68306501..7e220a4c5ded 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -1593,7 +1593,7 @@ int thc_i2c_set_rx_max_size(struct thc_device *dev, u32 max_rx_size)
 	if (!max_rx_size)
 		return -EOPNOTSUPP;
 
-	ret = regmap_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, &val);
+	ret = regmap_read(dev->thc_regmap, THC_M_PRT_SPI_ICRRD_OPCODE_OFFSET, &val);
 	if (ret)
 		return ret;
 
@@ -1662,7 +1662,7 @@ int thc_i2c_set_rx_int_delay(struct thc_device *dev, u32 delay_us)
 	if (!delay_us)
 		return -EOPNOTSUPP;
 
-	ret = regmap_read(dev->thc_regmap, THC_M_PRT_SW_SEQ_STS_OFFSET, &val);
+	ret = regmap_read(dev->thc_regmap, THC_M_PRT_SPI_ICRRD_OPCODE_OFFSET, &val);
 	if (ret)
 		return ret;
 
-- 
2.40.1


