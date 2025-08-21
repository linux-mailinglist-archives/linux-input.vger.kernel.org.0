Return-Path: <linux-input+bounces-14217-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05994B2EB0F
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 04:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB0C35E1030
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 02:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AC82C3265;
	Thu, 21 Aug 2025 02:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsQvYJXH"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821F52C21E1
	for <linux-input@vger.kernel.org>; Thu, 21 Aug 2025 02:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755741866; cv=none; b=hfPPQiL/Zzp1TzAP52fcQ7CH6XAixxFp8u8vQ7o+TwRQDKIvDQkaO3eW68JSYhDzJ69r4KNgg7bR/dqXgS+mcFTepTgqyP2Qbr6QvNwOGdDuEKGrITSXq/Qns3s84AIE9ByJgz+67dHPftUUMcUMMzFOgH8nhnLfhvwRFlKoJ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755741866; c=relaxed/simple;
	bh=a0fZaxcocEcxBQ5uTD+RfTKX0ZzmjWMiCc9FzHyoWYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UmNxm2BWjsRtkguWIJhczCNHMUeaRJcqyyicH5yDcwHooCNxWHgfcSgWfAkvma7W+qjWoBmuzN8NNru1Ogxrdln3oBZxMhNAOCDocxOiUPeeAJHztO4gTExJepYLaFzVz29wPNn8eXN0EFFiSpBcIy5l9hviye70FVFXoJZGt/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsQvYJXH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755741864; x=1787277864;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a0fZaxcocEcxBQ5uTD+RfTKX0ZzmjWMiCc9FzHyoWYU=;
  b=UsQvYJXH9Nj6Kj/NM+QgvwTC4ayZPCF9Gya6M25btQ85N0tvXGaFz917
   CBzLxOAvFK7+LSpdnz36WWHo168PCS1rLgTkaEjqSPpp3rLLwyQSb8YjL
   LN4+iPy4dqiBXcVja6wWCKgIuzLzl2drHmuv9FKGdWdVmjDj3QT/2r6be
   dR85410DXZkdW9zsUH8ZwW/DV7a7glBhJriRTNjfMGHk9jSi1kiraZpHi
   A7pEt8KXjy1Ph/V7g1t3SvuY8f3SiILafMBCbtF+SvtOO8TRoBD9g94NK
   Att+uAtLaNKBOn0ExPs1bf91OnE2LChoTa3dgtqa1RvyTnjGt+mzoHvEv
   Q==;
X-CSE-ConnectionGUID: nDYpEHFyQl+VPGXxipYRxw==
X-CSE-MsgGUID: 29+7cBTtTOiyT2N6cf9tOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57937933"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57937933"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 19:04:24 -0700
X-CSE-ConnectionGUID: rdSbQL3aT4uF9dJWnWOR4Q==
X-CSE-MsgGUID: AYgTjv+nToe0hxxhrr1NyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168694510"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa009.fm.intel.com with ESMTP; 20 Aug 2025 19:04:22 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH] HID: intel-ish-ipc: Remove redundant ready check after timeout function
Date: Thu, 21 Aug 2025 10:06:09 +0800
Message-ID: <20250821020609.1947237-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

timed_wait_for_timeout() internally checks for ish_is_input_ready() and
ishtp_fw_is_ready() based on the provided parameters. If
timed_wait_for_timeout() returns 0, it indicates the status is ready. In
rare cases, another thread may send a message immediately after
timed_wait_for_timeout() returns, causing a subsequent ish_is_input_ready()
check to fail. Since the return value of timed_wait_for_timeout() is
sufficient to determine readiness, the additional ready check is
unnecessary and may introduce issues.

This patch removes the redundant check and relies solely on the return
value of timed_wait_for_timeout().

Fixes: ae02e5d40d5f ("HID: intel-ish-hid: ipc layer")
Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/ipc.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 4c861119e97a..3ddaa2cd39d5 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -498,6 +498,7 @@ static int ish_fw_reset_handler(struct ishtp_device *dev)
 {
 	uint32_t	reset_id;
 	unsigned long	flags;
+	int ret;
 
 	/* Read reset ID */
 	reset_id = ish_reg_read(dev, IPC_REG_ISH2HOST_MSG) & 0xFFFF;
@@ -510,12 +511,11 @@ static int ish_fw_reset_handler(struct ishtp_device *dev)
 	/* ISHTP notification in IPC_RESET */
 	ishtp_reset_handler(dev);
 
-	if (!ish_is_input_ready(dev))
-		timed_wait_for_timeout(dev, WAIT_FOR_INPUT_RDY,
-			TIME_SLICE_FOR_INPUT_RDY_MS, TIMEOUT_FOR_INPUT_RDY_MS);
-
+	ret = timed_wait_for_timeout(dev, WAIT_FOR_INPUT_RDY,
+				     TIME_SLICE_FOR_INPUT_RDY_MS,
+				     TIMEOUT_FOR_INPUT_RDY_MS);
 	/* ISH FW is dead */
-	if (!ish_is_input_ready(dev))
+	if (ret)
 		return	-EPIPE;
 
 	/* Send clock sync at once after reset */
@@ -531,9 +531,10 @@ static int ish_fw_reset_handler(struct ishtp_device *dev)
 			 sizeof(uint32_t));
 
 	/* Wait for ISH FW'es ILUP and ISHTP_READY */
-	timed_wait_for_timeout(dev, WAIT_FOR_FW_RDY,
-			TIME_SLICE_FOR_FW_RDY_MS, TIMEOUT_FOR_FW_RDY_MS);
-	if (!ishtp_fw_is_ready(dev)) {
+	ret = timed_wait_for_timeout(dev, WAIT_FOR_FW_RDY,
+				     TIME_SLICE_FOR_FW_RDY_MS,
+				     TIMEOUT_FOR_FW_RDY_MS);
+	if (ret) {
 		/* ISH FW is dead */
 		uint32_t	ish_status;
 

base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
-- 
2.43.0


