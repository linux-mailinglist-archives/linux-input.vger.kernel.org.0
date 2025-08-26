Return-Path: <linux-input+bounces-14306-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D8BB3559F
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 09:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12C9F3A39EF
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 07:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C54393DE3;
	Tue, 26 Aug 2025 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fkv29RJc"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87389239E75;
	Tue, 26 Aug 2025 07:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756193242; cv=none; b=tMYY3AzlnEWu0uj1jBLPpJRfk0UZHM2PwdZxngWHCBSXui4KFhOQlZtY2LICKI710Zkb86pDBFhAXQAmZem6nHzNiSTVB906ZoRsIQfzpSu/qDugrJEcvAlc+yGGZDylpqq/gI838iL8IhG7ot1riCbCX75x+hl9V0554AvWBzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756193242; c=relaxed/simple;
	bh=pntWWrGVuPp5HzGt640eACPG+Nj7VbEsiuFZwlfE7y4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DL9WY7E5NwIpk3Xg4Z5xcof7cO6mx/8EnlNkr837UYmzmHLC54q04YOSadXWT0BFnfsEYzlh/pD3E+zpzg4qlULAi8A6/et2yeV1olf5w6pHYem10Eq2XV5FDvjHlDKA6odon/wE1dx1LxaVDnF6Pcg971xoFQsJPlvsbPWZdo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fkv29RJc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756193241; x=1787729241;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pntWWrGVuPp5HzGt640eACPG+Nj7VbEsiuFZwlfE7y4=;
  b=Fkv29RJcnhT2GpGqOw/S3aB3vfVIRBQcz6J14xSLun0cYD0Tf1M6jxMx
   Z4OcnWdGUcrc+Bqd+coLyn5xoQDQW17r8hNi6t2gqK8Bzd5M4U8x4nwg2
   Hvd1A/uC5gMGdAwCZxBP7awKhJBIdn3Rnt3yu/g/dePyFpFP433bCNvi8
   /SgnExXq+5vogjEEPSsp00Uavl6wk59tMNcHoCogCwWeaXGjoWvKMMbk6
   xzzazL3wn+fkiqCUVeLZ78cpUOcvZ2/+Mt9JqWJuTFuiQ6ZH2a6Pxvo7R
   fNMWhEZdUbLK7Ub3vhnYvedAov2OgmmmC/9RSYyBfsDygPLSJZHHNRNVP
   A==;
X-CSE-ConnectionGUID: /zxOSDdYS76ZykttJxPaRw==
X-CSE-MsgGUID: jOQgRL8VQh2BD2WLawsepg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69519239"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69519239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 00:27:20 -0700
X-CSE-ConnectionGUID: rB0QoYusQbWr+/fdEgzjhA==
X-CSE-MsgGUID: FXQ2xWiBS1i7Mh717L5JnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="173901870"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by orviesa004.jf.intel.com with ESMTP; 26 Aug 2025 00:27:18 -0700
From: Xinpeng Sun <xinpeng.sun@intel.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: srinivas.pandruvada@linux.intel.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xinpeng Sun <xinpeng.sun@intel.com>
Subject: [PATCH 1/2] hid: intel-thc-hid: intel-quicki2c: Add WCL Device IDs
Date: Tue, 26 Aug 2025 15:27:00 +0800
Message-Id: <20250826072701.991046-1-xinpeng.sun@intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
---
 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 ++
 drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index f122fde879b9..17b1f2df8f8a 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -1019,6 +1019,8 @@ static const struct pci_device_id quicki2c_pci_tbl[] = {
 	{ PCI_DEVICE_DATA(INTEL, THC_PTL_H_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
 	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT1, &ptl_ddata) },
 	{ PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
+	{ PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_I2C_PORT1, &ptl_ddata) },
+	{ PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_I2C_PORT2, &ptl_ddata) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, quicki2c_pci_tbl);
diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
index b78c8864d39e..240492a38c24 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
@@ -13,6 +13,8 @@
 #define PCI_DEVICE_ID_INTEL_THC_PTL_H_DEVICE_ID_I2C_PORT2	0xE34A
 #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_I2C_PORT1	0xE448
 #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_I2C_PORT2	0xE44A
+#define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_I2C_PORT1 	0x4D48
+#define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_I2C_PORT2 	0x4D4A
 
 /* Packet size value, the unit is 16 bytes */
 #define MAX_PACKET_SIZE_VALUE_LNL			256
-- 
2.40.1


