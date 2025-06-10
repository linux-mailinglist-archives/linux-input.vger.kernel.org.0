Return-Path: <linux-input+bounces-12748-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D5AD2BA7
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 03:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1340E16F5B6
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 01:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF9B1B0411;
	Tue, 10 Jun 2025 01:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZYV4tVo"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E191ACED3
	for <linux-input@vger.kernel.org>; Tue, 10 Jun 2025 01:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749520779; cv=none; b=VHR+F1jtSMb122VXo03EFSpj4WVZyvo66DOY2YFAqsIr9X6bIwmROhAqMMAnOeSoacxLQ/vqvyIDTQQj78+pf0BjRwppC0VAN/vH/svC0yPH2YDpbwZH0rMrrbPlcDJELuad9IeBztMQ2BsCFVKvNuu59jhpSBej96B7xdm8nyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749520779; c=relaxed/simple;
	bh=8JSXdw88au+z85d5LEYHC4jO4/eJ22XyTsrAdj+J3Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gm1VxM0ZvbBt3KM/D9ytJitqlKRY5d0FvsYTrA9HpekOWdXlgZ+myEqO8mXJDB4qCQdMwvOPg4OynXr4aOFrb+QeR3Jb5/x1KTs3q+oqF1iJvFI/yv89zMBTYmkid/Rj8h2UJ55lDFT7dlzVZZ8Wwwc+OwTuFJ/STvnJjmx5D4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZYV4tVo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749520777; x=1781056777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8JSXdw88au+z85d5LEYHC4jO4/eJ22XyTsrAdj+J3Mw=;
  b=AZYV4tVoRL/WeFovJuDDX2w3/i056cnOsWp2peux5GloMQP0hgrg8umr
   OdTBjgmuRcZovDyOQVgK4wCvJxz8+AUDasldE4wFG6+K/hKsgEwXWypM0
   b8Bfm1SZEUKXnPaKPiZ64jCc+9ZS2yNcMjxqth7njcbY2eMJ1sSi4a4Oi
   +n+XBRYkWu8FFuLNRuasFb2bCU7AGAdhFFCRPjyC4Kn+IdJ7ma5OwWAtH
   t7jEUVcu8ANYyZSEfTT47sUM1gd7wua1LbjXpHEheX9SaBQZYsMuhRvKt
   szN3gvAAjiRy4M120OOwCGo45Qg5Z212284UbeN6Kxs8CfLMBN87Spdcv
   w==;
X-CSE-ConnectionGUID: uT13qpPRQxmbPZu9XjA9eg==
X-CSE-MsgGUID: EVv5EdczTRi28Md+ke/now==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51757957"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51757957"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 18:59:37 -0700
X-CSE-ConnectionGUID: XOellFJBSqy+mi8BAiEkmA==
X-CSE-MsgGUID: D+Mf75euQ0+1IhJaprkx1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="146568467"
Received: from iscp-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jun 2025 18:59:35 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	even.xu@intel.com,
	zhifeng.wang@intel.com,
	selina.wang@intel.com
Subject: [PATCH 1/2] hid: intel-ish-hid: Use PCI_DEVICE_DATA() macro for ISH device table
Date: Tue, 10 Jun 2025 10:01:31 +0800
Message-ID: <20250610020132.1544110-2-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610020132.1544110-1-lixu.zhang@intel.com>
References: <20250610020132.1544110-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the usage of PCI_VDEVICE() with driver_data assignment in the ISH
PCI device table with the PCI_DEVICE_DATA() macro. This improves code
readability.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index ff0fc8010072..0db41ed74a14 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -67,9 +67,9 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_MTL_P)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_H)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_S)},
-	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_LNL_M), .driver_data = ISHTP_DRIVER_DATA_LNL_M},
-	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_PTL_H), .driver_data = ISHTP_DRIVER_DATA_PTL},
-	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_PTL_P), .driver_data = ISHTP_DRIVER_DATA_PTL},
+	{PCI_DEVICE_DATA(INTEL, ISH_LNL_M, ISHTP_DRIVER_DATA_LNL_M)},
+	{PCI_DEVICE_DATA(INTEL, ISH_PTL_H, ISHTP_DRIVER_DATA_PTL)},
+	{PCI_DEVICE_DATA(INTEL, ISH_PTL_P, ISHTP_DRIVER_DATA_PTL)},
 	{}
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
-- 
2.43.0


