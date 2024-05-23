Return-Path: <linux-input+bounces-3787-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A91428CCA4E
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 03:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D861C1C21171
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 01:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A60017F6;
	Thu, 23 May 2024 01:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdMFGirI"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D701852
	for <linux-input@vger.kernel.org>; Thu, 23 May 2024 01:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716426847; cv=none; b=XtL6ajIB04xnkO4wzhFErClfGqonPwa6qUKHvgnx2V62fWJ48Mr25hdFtTVAOmwpTLsCJlV1MoVgkQ9vUt6EntCEz5NHlLzb+XOroSyYiK2E1BFWc9YlAvCbHIbk3PHVDZCa9chxV4HQphe1Y51G4k60wyx+Qj2bgQ1uIQoQrL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716426847; c=relaxed/simple;
	bh=fxD0ncLu73e575hxMUNfl228qNqgdO4gBA2/pgjKOHA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hmDwxwotLODARnLMWSl5Zv+qbYZLSXgbUd/I2LLXNytTODaqa+i4ePbu58U/jIInhLkEtkKfN1PNyBuUCsxdG3yprYyrwI2QvftfIeV6mQ5X0+H85c9dOqicmdBr62utu3wcTB32AIqQIPMskpTJ6OOGN8TTyZS+SMwO3stRTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DdMFGirI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716426845; x=1747962845;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fxD0ncLu73e575hxMUNfl228qNqgdO4gBA2/pgjKOHA=;
  b=DdMFGirIfQ+eKYtQDSy1QKW696TuyVjYDbUhhhCfv7qUeWJasXiLH+4e
   h/ibqyEyPS9B9BWYeAqqp+T+kvEMeiTf07NuN8R/K+Jm/CUNXfTM4hjU7
   NS5Kg1LmqByWtKFky6I6Rsbt+6sOFKPrhf1bqTPNIkxFpvvyW6PjtPBpM
   MY14q/S4VbFNik7752FSSRyRxWQB5DzW0FcrImEK0FEnENh2vzO/Lgj5x
   iqscLhcDHNpMp/8gCHyqGzxdJOCsXwCqf2xPiVXHVo2pITkWc8GKW0zkH
   5BjExwByuaBB4vU9ciLjyjT3wEu56q1vZCtZPlETPMhFkGbjKKVs6UaMD
   Q==;
X-CSE-ConnectionGUID: vIwiKeEsQCOryRtRhGHv1g==
X-CSE-MsgGUID: BQl9x5YkSFe9lSpVDOKg/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12496188"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="12496188"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:14:04 -0700
X-CSE-ConnectionGUID: d/+AZqjpRgOrixruFAtimg==
X-CSE-MsgGUID: POH59N1iTgOXuvy0tmwxvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="33464355"
Received: from unknown (HELO ipg-l-lixuzha.sh.intel.com) ([10.239.153.157])
  by fmviesa008.fm.intel.com with ESMTP; 22 May 2024 18:14:02 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH] HID: intel-ish-hid: Fix build error for COMPILE_TEST
Date: Thu, 23 May 2024 09:14:01 +0800
Message-Id: <20240523011401.705577-1-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel test robot reported build error due to a pointer type mismatch:

  .../ishtp/loader.c:172:8: error: incompatible pointer types passing
  '__le64 *' (aka 'unsigned long long *') to parameter of type
  'dma_addr_t *' (aka 'unsigned int *')

The issue arises because the driver, which is primarily intended for
x86-64, is also built for i386 when COMPILE_TEST is enabled.

Resolve type mismatch by using a temporary dma_addr_t variable to hold
the DMA address. Populate this temporary variable in dma_alloc_coherent()
function, and then convert and store the address in the
fragment->fragment_tbl[i].ddr_adrs field in the correct format.
Similarly, convert the ddr_adrs field back to dma_addr_t when freeing
the DMA buffer with dma_free_coherent().

Fixes: 579a267e4617 ("HID: intel-ish-hid: Implement loading firmware from host feature")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405201313.SAStVPrT-lkp@intel.com/
Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/loader.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-ish-hid/ishtp/loader.c
index 993f8b390e57..2785b04a2f5a 100644
--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
@@ -138,12 +138,13 @@ static void release_dma_bufs(struct ishtp_device *dev,
 			     struct loader_xfer_dma_fragment *fragment,
 			     void **dma_bufs, u32 fragment_size)
 {
+	dma_addr_t dma_addr;
 	int i;
 
 	for (i = 0; i < FRAGMENT_MAX_NUM; i++) {
 		if (dma_bufs[i]) {
-			dma_free_coherent(dev->devc, fragment_size, dma_bufs[i],
-					  fragment->fragment_tbl[i].ddr_adrs);
+			dma_addr = le64_to_cpu(fragment->fragment_tbl[i].ddr_adrs);
+			dma_free_coherent(dev->devc, fragment_size, dma_bufs[i], dma_addr);
 			dma_bufs[i] = NULL;
 		}
 	}
@@ -164,15 +165,16 @@ static int prepare_dma_bufs(struct ishtp_device *dev,
 			    struct loader_xfer_dma_fragment *fragment,
 			    void **dma_bufs, u32 fragment_size)
 {
+	dma_addr_t dma_addr;
 	u32 offset = 0;
 	int i;
 
 	for (i = 0; i < fragment->fragment_cnt && offset < ish_fw->size; i++) {
-		dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size,
-						 &fragment->fragment_tbl[i].ddr_adrs, GFP_KERNEL);
+		dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size, &dma_addr, GFP_KERNEL);
 		if (!dma_bufs[i])
 			return -ENOMEM;
 
+		fragment->fragment_tbl[i].ddr_adrs = cpu_to_le64(dma_addr);
 		fragment->fragment_tbl[i].length = clamp(ish_fw->size - offset, 0, fragment_size);
 		fragment->fragment_tbl[i].fw_off = offset;
 		memcpy(dma_bufs[i], ish_fw->data + offset, fragment->fragment_tbl[i].length);

base-commit: de7e71ef8bed222dd144d8878091ecb6d5dfd208
-- 
2.34.1


