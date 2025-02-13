Return-Path: <linux-input+bounces-10008-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F77A3358C
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 03:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD28B3A7E7B
	for <lists+linux-input@lfdr.de>; Thu, 13 Feb 2025 02:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802002045A0;
	Thu, 13 Feb 2025 02:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvZ1xzTP"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841AC35949;
	Thu, 13 Feb 2025 02:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739414446; cv=none; b=g2IJbDogbkybNxV40uKx+AoF7IGTEdaVM89Y2fn1LCTOhQUc/L3FYWUxqzhp1wRTIDQKTEdQpFgoWiowuN5T0tdSg3hvcbVG/gXjNb9XdMTLY0xLiFHAwjlS3ke7iSUKQmXA/ohyP/CU2XGvlkEsyFyi7PUvywzSgCzWVkpAlM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739414446; c=relaxed/simple;
	bh=cE2iJB3OrulRpc7Rb4dCoPZ4Ky4vgHwwheI4oec45n4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S8HlJ0XXzF61RqTYtJ+vzi54eezbBHQPPV12ZqPSpDKEfcirJuSYsiGGDYwOB6jXm6cAlHMJszQ8iFKHCM/pZrqCCA4oSn7a8h0BRpkpp+JGNGjLBZxE1/UQLxYHKG1nRxrGC1VQYeQP0Zhp8uSbXDHkkNeocmfbuKoMIfTe9lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvZ1xzTP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739414444; x=1770950444;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cE2iJB3OrulRpc7Rb4dCoPZ4Ky4vgHwwheI4oec45n4=;
  b=SvZ1xzTPeI1CbGBOkENiuNYb9h0blaCyC7oku/3zuHrIA9TQ4EHRckzh
   M5Mv4RnJTY/DmQAlCCpo2zJVPUpcdYsoOmfVZ3OWw6qFq/e1HQRg66P10
   Z12yYHuCrCAp06L1PonmrokqJgSJ4fBlemAjBoz8JWi6Ccev/QX2KYdgV
   ho0KSjznW9jMExkQTffH6xyo9tikJfw0dlzmw2WWI+UmbSMgByBmXCV2b
   +326JSpi30bCbItUpBhXe2Ta2+585FD6efc3m+/4KIe58zXYET3bNcmLd
   5b2W8gf6ZODZFc0jDqNL8ypA5tQaWkWrx74euJ9Y/jL4CPLDvID5uwS1Z
   w==;
X-CSE-ConnectionGUID: pOksh8PISk+pdtrsQG4btA==
X-CSE-MsgGUID: 2vUloj2VSLuI3HwbZwJ+DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39802393"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="39802393"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 18:40:43 -0800
X-CSE-ConnectionGUID: 3sGc4uU/RF6xYYIvPyHpsA==
X-CSE-MsgGUID: UXSroWr9R0CFX4g5Xw7f3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="112863616"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa006.fm.intel.com with ESMTP; 12 Feb 2025 18:40:41 -0800
From: Even Xu <even.xu@intel.com>
To: david.laight.linux@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] Hid: Intel-thc-hid: Intel-thc: Fix "dubious: !x | !y" issue
Date: Thu, 13 Feb 2025 10:40:21 +0800
Message-Id: <20250213024021.2477473-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change to use "||" to make it more readable and avoid miss
understanding.

Signed-off-by: Even Xu <even.xu@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@intel.com
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
index eb23bea77686..8f97e71df7f4 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
@@ -295,7 +295,7 @@ static void release_dma_buffers(struct thc_device *dev,
 		return;
 
 	for (i = 0; i < config->prd_tbl_num; i++) {
-		if (!config->sgls[i] | !config->sgls_nent[i])
+		if (!config->sgls[i] || !config->sgls_nent[i])
 			continue;
 
 		dma_unmap_sg(dev->dev, config->sgls[i],
-- 
2.40.1


