Return-Path: <linux-input+bounces-16688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBEDCDE4BD
	for <lists+linux-input@lfdr.de>; Fri, 26 Dec 2025 04:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 531AA300A853
	for <lists+linux-input@lfdr.de>; Fri, 26 Dec 2025 03:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE71715CD74;
	Fri, 26 Dec 2025 03:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3kokulG"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3384822083;
	Fri, 26 Dec 2025 03:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766720323; cv=none; b=Xr+KmiPfKmWoOdmJXxJlg/GwC4cPfhY8cUMPafyPDTMovQq/ecTuvYjfDMNkFdvV0u7IFOvW2tNLAnca5WOpiIkT5CJukXYFaouuRwsuQBNPW2I29xJjLxhlV0PfufJcGdmzsz0K4Kr9CKh10oNUUumBcH0w6w6blIFsWMjB9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766720323; c=relaxed/simple;
	bh=FLbESIToTTfwy2jxhNHU42vbXMzcFFbcU70Ngzpf/D4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EtPxKaPfAIN7ZkQX85vT7yiexpUU2fJk9A9ELFD/2a/bH+RHWg0/br8CLPU2no7FPwS3hRPPWVkEXr3XseSlNeIo4J58QxQSB1cmssjgcxhiwnoVRx6zIqeuJTXXigvFO/TRxX4J5o2b1N7jfrDbuV5NPMfEgqa//7d32AbIAxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3kokulG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766720322; x=1798256322;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FLbESIToTTfwy2jxhNHU42vbXMzcFFbcU70Ngzpf/D4=;
  b=R3kokulG8KCgRmwes6IwazjOaR77tK7jOHanYfM8xGZH9ydRqe85F8Ug
   CvDkUQFTz/RAWIVwZEE2DUAGRXUVQxCnFq3oNbKUapHJKT0BSqGk+GNMg
   H6jwu9Wu40sOCnQvfMfRvfoFmOp4Djw/MSgQ0+cjd1C+j503Ht8G9J3RA
   uRwiQQbGAAlD2YRoWbJA/Y+Ne9PkQZ6vwxAzYsygWNofW+nJc8PcPF6kW
   8fpbRhw+sr7wwtM3Winh5ZXKtwh9ldDHOPK1iqtNpoMCVrXh57JjorzxC
   NHGqnVovcs5sZ4flG+FpOomPwSOjimBiRgDJCoAp+w6Uakb9bHgzZOF87
   w==;
X-CSE-ConnectionGUID: NM+0imxVSMaZYGTT/4QwlA==
X-CSE-MsgGUID: PlK0CtGIRKeCxI2ncPuEKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68249090"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="68249090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 19:38:42 -0800
X-CSE-ConnectionGUID: o92bKqT0QxOFPS8e1D23fQ==
X-CSE-MsgGUID: lZgV7BlnRHmcaS1fF4R60g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200335572"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by orviesa008.jf.intel.com with ESMTP; 25 Dec 2025 19:38:40 -0800
From: Even Xu <even.xu@intel.com>
To: bentiss@kernel.org,
	jikos@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>
Subject: [PATCH] HID: Intel-thc-hid: Intel-thc: Add safety check for reading DMA buffer
Date: Fri, 26 Dec 2025 11:39:53 +0800
Message-Id: <20251226033953.3651688-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMA buffer readiness check before reading DMA buffer to avoid
unexpected NULL pointer accessing.

Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
index 82b8854843e0..e1aadae4eb24 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
@@ -573,6 +573,11 @@ static int read_dma_buffer(struct thc_device *dev,
 		return -EINVAL;
 	}
 
+	if (!read_config->prd_tbls || !read_config->sgls[prd_table_index]) {
+		dev_err_once(dev->dev, "PRD tables are not ready yet\n");
+		return -EINVAL;
+	}
+
 	prd_tbl = &read_config->prd_tbls[prd_table_index];
 	mes_len = calc_message_len(prd_tbl, &nent);
 	if (mes_len > read_config->max_packet_size) {
-- 
2.40.1


