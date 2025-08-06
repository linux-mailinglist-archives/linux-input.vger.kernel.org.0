Return-Path: <linux-input+bounces-13831-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C7AB1BDD5
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 02:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4617C18A7DB9
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 00:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BB118EAB;
	Wed,  6 Aug 2025 00:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdpvXhla"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50A113AF2;
	Wed,  6 Aug 2025 00:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754439865; cv=none; b=chYRI6UA6IJ7N1hMKSr9BMbT6Kum2gHs+WAA0rQTpSZ5n9FRkrPKwCSMxYZYvlq9GGojk+/Zl5VT0/Mt5o769tzRZmbGsJQV27naxM5/WiRMOIvfJFuSx141s5CbwJuylMEYvSQznwYBqHVBZ2MrhICAjPLzne4laXTc6XljWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754439865; c=relaxed/simple;
	bh=NiDxZsY547/dYaQ+I07KrcgaTx4wOefvN+uysj//JVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Svx4HOJlO05QqJJsnSIp9WpS/1SefG6p9pKHoOJZ6QC17RvIjWF0XWwr/EQU0VUknKwsVg157k3q2ah5995/VeKV+dO39EYFpJIBbztEDXEXgxDc1Lnb/jUUchp/OhsV0lTQ3jarHFwgs1ExiHC7/whYBEuoNKNf+1DxeoAvSwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jdpvXhla; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754439864; x=1785975864;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NiDxZsY547/dYaQ+I07KrcgaTx4wOefvN+uysj//JVg=;
  b=jdpvXhlaLSCX0VNan+CHDZlCD0ki6MKHCkML9sK5xo+pgo2UddM94Cty
   mnP92+6t+jKbRvn6JtH+t69nnWrw8m6pD1FW1+bipt1kzxGoC9Oqhilm9
   H8L1AjZVvdBBTGSFxcVm0N4REHv1Mju979KjfFq68TDfuayoA/jHHLHGF
   WiuL/n02i7Hgqi+jxQhR+2P+/O061kWpTEsoU+6uAlweHZnV77+UbchUq
   34/rBlArkC9XiBwnaQ2MEqKE9NJ+fLWDhLTx2MMsu2IPZmMmuDSqinmrm
   XDoqqKsBLiFJF8276+hM2/ppjmeEsyeQ0wOJf7q2gyqEaNN0YZzHTdpi1
   w==;
X-CSE-ConnectionGUID: 1uayUPStSwG6wjpdy7rNTA==
X-CSE-MsgGUID: SG9X1+NSRICqYxu34srrng==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="74326411"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="74326411"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 17:24:23 -0700
X-CSE-ConnectionGUID: 9O4T3e7/QeiZ0gjjq8UODg==
X-CSE-MsgGUID: iIbob0mFSXS4KoXZm0GVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="169897799"
Received: from shsensorbuild.sh.intel.com ([10.239.133.18])
  by fmviesa004.fm.intel.com with ESMTP; 05 Aug 2025 17:24:21 -0700
From: Even Xu <even.xu@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Even Xu <even.xu@intel.com>,
	Rui Zhang <rui1.zhang@intel.com>
Subject: [PATCH] Hid: Intel-thc-hid: Intel-quicki2c: Enhance driver re-install flow
Date: Wed,  6 Aug 2025 08:23:32 +0800
Message-Id: <20250806002332.1487447-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After driver module is removed and during re-install stage, if there
is continueous user touching on the screen, it is a risk impacting
THC hardware initialization which causes driver installation failure.

This patch enhances this flow by quiescing the external touch
interrupt after driver is removed which keeps THC hardware
ignore external interrupt during this remove and re-install stage.

Signed-off-by: Even Xu <even.xu@intel.com>
Tested-by: Rui Zhang <rui1.zhang@intel.com>
Fixes: 66b59bfce6d9 ("HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver")
---
 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index e944a6ccb776..854926b3cfd4 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -419,6 +419,7 @@ static struct quicki2c_device *quicki2c_dev_init(struct pci_dev *pdev, void __io
  */
 static void quicki2c_dev_deinit(struct quicki2c_device *qcdev)
 {
+	thc_interrupt_quiesce(qcdev->thc_hw, true);
 	thc_interrupt_enable(qcdev->thc_hw, false);
 	thc_ltr_unconfig(qcdev->thc_hw);
 	thc_wot_unconfig(qcdev->thc_hw);
-- 
2.40.1


