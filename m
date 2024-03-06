Return-Path: <linux-input+bounces-2260-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3C1872BEA
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 01:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 620CB1F23073
	for <lists+linux-input@lfdr.de>; Wed,  6 Mar 2024 00:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BF2612E;
	Wed,  6 Mar 2024 00:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6DcyqWu"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A5463D9
	for <linux-input@vger.kernel.org>; Wed,  6 Mar 2024 00:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709686601; cv=none; b=SSvgRrrDwmnH3RudUajMGfB9rk3/ij/VyqoL1K19whXnUeo+dhcyQrOmsUs3w2SF+oz4A+oV2HgwNWDFmCDk5WEAXJKXj8dhG2uatv1bUMCYHW8ca6zimdmOuwnE0ZVpLdPWyJlCr+bsQvtGM92xKsCeXJ2wPkZgYLYi12WPb4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709686601; c=relaxed/simple;
	bh=WZBsGzAbDYi+TmSME/bg5hluaax0aALwFMiNRU/H7zg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IN0ESdkcZhGOamB0Mmki3gtXvH8wmtYdaWoPFYCbGaaL9UJ08aExg1KcdU/N+UHNpXymzD8JCRiRYkVdkjd9GbnKi/9rb5Gs0Ct9e4LgOmQiUyxNVnBJwa6BUqiTAWZXFSOP++qm86lM5AMhJp2Bqa7t2pTsB1WfUp4MhZ1c0Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6DcyqWu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709686600; x=1741222600;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=WZBsGzAbDYi+TmSME/bg5hluaax0aALwFMiNRU/H7zg=;
  b=I6DcyqWuj3RYevfsVrCVjI1kK0EfaW9WG+ciVIzujoxUz6NsXDcV39sb
   vQSuMhzps3VcI+epQtmbYtJVkb6IWqE0iuJXdJvpr9xoK19+CxTlxRsmH
   Gy2mfZoxX0wwAn4NkabfrLZmO48P0psvhVYOWrXuhgY9OJTRucH+wVSfM
   n+C9np+vlZbGhkVPHDuU1jvBJjO0GV8FwbLz6cQNrPvcvoTQ2uFg244eq
   +dZkjdJoOiD/6fN5pt34D7fdTD4NvbtDXCfAcIS+5P+IBDit7qZVYTsmO
   WDefDEtHoUYmDxJS9lZjLqxvhvabudPgsdnp3rofPBwXc4AKLIHuhKwPL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8094870"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="8094870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 16:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9983847"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.198])
  by orviesa007.jf.intel.com with ESMTP; 05 Mar 2024 16:56:39 -0800
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Subject: [PATCH 2/2] HID: intel-ish-hid: ipc: Add Lunar Lake-M PCI device ID
Date: Wed,  6 Mar 2024 00:56:38 +0000
Message-Id: <20240306005638.2781839-3-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306005638.2781839-1-lixu.zhang@intel.com>
References: <20240306005638.2781839-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhang Lixu <lixu.zhang@intel.com>

Add device ID of Lunar Lake-M into ishtp support list.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index a4484f3ba2be..cdd80c653918 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -35,6 +35,7 @@
 #define PCI_DEVICE_ID_INTEL_ISH_MTL_P		0x7E45
 #define PCI_DEVICE_ID_INTEL_ISH_ARL_H		0x7745
 #define PCI_DEVICE_ID_INTEL_ISH_ARL_S		0x7F78
+#define PCI_DEVICE_ID_INTEL_ISH_LNL_M		0xA845
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 330916ed5bfd..e79d72f7db2a 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -46,6 +46,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_MTL_P)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_H)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_S)},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_LNL_M)},
 	{}
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
-- 
2.40.1


