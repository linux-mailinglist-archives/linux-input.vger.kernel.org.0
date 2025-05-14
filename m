Return-Path: <linux-input+bounces-12361-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68544AB630A
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 08:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2088919E4DB5
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 06:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907CD1FCFF1;
	Wed, 14 May 2025 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIG/pObi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F5C1F4177;
	Wed, 14 May 2025 06:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747204039; cv=none; b=qo94L9dZKYoBIFwbO2eIIwOFinDJ7r28I2d9Z6bpWqB3hkInJf9Iac5rHLQwsLyLw675XWdGNnLqrJvxdHL5KaC4W0LKQQO3helDQpLe0tao5shjudiAcmo3ID3pDLKoLeSKGiF25p7W3iztznGr5M/Y5K/230qESWRgnyiXK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747204039; c=relaxed/simple;
	bh=9z8D49yU8U83ywDMZxLf/UoAlkGa4AgNzdCIJSrLYDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=njR/tX6lzcwQbm7s8XT1rQbsuZdM1QcygI+4LrVNS0QLSxfkbPOWKIV9wxv/wqER5Yt1alRi8WSNlPG22EO402ZPGmf497NKr7w7/hBKqpu2UMgAI8KxVIzCxJaj5C0rPNNUZUSXAyu1h9QMC4rUcN6xk/IwCrtvcc9DKhcduJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIG/pObi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747204038; x=1778740038;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9z8D49yU8U83ywDMZxLf/UoAlkGa4AgNzdCIJSrLYDU=;
  b=UIG/pObi12SUKDuYv6iMDdtdkEtNanYHtewFzJh7CoIrHPpTclQMUnV3
   N/x/JLBVlf/abW+/jFyra7ZMom5C9JGZmObj9lV3brUS5nndKknWWtbJX
   sPEO+rvZ7/PF4IU6XQRheW2pmzS5Hd4prd9SrmLGZbV1QwAIKyHn/pC5T
   VNOyYwrAwvsCvRBIwvZmWW4LJ9e1dLpM1OxcZcKuj0N7WFahpujqAE+1M
   ZI00o6wQqNWsWDLwJE6ImmcBPODVsSkfLbA0DejH6pvSE221i2HP6+N55
   2DA02WOhRBprK+kiHSegkgRb2TUzn7cxZh9E/QYWaWzqD0LGjAU5batxN
   g==;
X-CSE-ConnectionGUID: 5BO/dVMvRQKtaDHSLsh/Ig==
X-CSE-MsgGUID: 6EqyCiWRTsePNwfu9ioICA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60481925"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="60481925"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 23:27:16 -0700
X-CSE-ConnectionGUID: 7skri2yKR0+xGxgpJWkmPg==
X-CSE-MsgGUID: b8lSsuX2T0ODmVgC2D4JfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="138371012"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa008.fm.intel.com with ESMTP; 13 May 2025 23:27:14 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Chong Han <chong.han@intel.com>
Subject: [PATCH] HID: Intel-thc-hid: Intel-quicki2c: Enhance QuickI2C reset flow
Date: Wed, 14 May 2025 14:26:38 +0800
Message-Id: <20250514062639.132017-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During customer board enabling, it was found: some touch devices
prepared reset response, but either forgot sending interrupt or
THC missed reset interrupt because of timing issue. THC QuickI2C
driver depends on interrupt to read reset response, in this case,
it will cause driver waiting timeout.

This patch enhances the flow by adding manually reset response
reading after waiting for reset interrupt timeout.

Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Chong Han <chong.han@intel.com>
Fixes: 66b59bfce6d9 ("HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver")
---
 .../intel-quicki2c/quicki2c-protocol.c        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
index f493df0d5dc4..a63f8c833252 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
@@ -4,6 +4,7 @@
 #include <linux/bitfield.h>
 #include <linux/hid.h>
 #include <linux/hid-over-i2c.h>
+#include <linux/unaligned.h>
 
 #include "intel-thc-dev.h"
 #include "intel-thc-dma.h"
@@ -200,6 +201,9 @@ int quicki2c_set_report(struct quicki2c_device *qcdev, u8 report_type,
 
 int quicki2c_reset(struct quicki2c_device *qcdev)
 {
+	u16 input_reg = le16_to_cpu(qcdev->dev_desc.input_reg);
+	size_t read_len = HIDI2C_LENGTH_LEN;
+	u32 prd_len = read_len;
 	int ret;
 
 	qcdev->reset_ack = false;
@@ -213,12 +217,32 @@ int quicki2c_reset(struct quicki2c_device *qcdev)
 
 	ret = wait_event_interruptible_timeout(qcdev->reset_ack_wq, qcdev->reset_ack,
 					       HIDI2C_RESET_TIMEOUT * HZ);
-	if (ret <= 0 || !qcdev->reset_ack) {
+	if (qcdev->reset_ack)
+		return 0;
+
+	/*
+	 * Manually read reset response if it wasn't received, in case reset interrupt
+	 * was missed by touch device or THC hardware.
+	 */
+	ret = thc_tic_pio_read(qcdev->thc_hw, input_reg, read_len, &prd_len,
+			       (u32 *)qcdev->input_buf);
+	if (ret) {
+		dev_err_once(qcdev->dev, "Read Reset Response failed, ret %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Check response packet length, it's first 16 bits of packet.
+	 * If response packet length is zero, it's reset response, otherwise not.
+	 */
+	if (get_unaligned_le16(qcdev->input_buf)) {
 		dev_err_once(qcdev->dev,
 			     "Wait reset response timed out ret:%d timeout:%ds\n",
 			     ret, HIDI2C_RESET_TIMEOUT);
 		return -ETIMEDOUT;
 	}
 
+	qcdev->reset_ack = true;
+
 	return 0;
 }
-- 
2.40.1


