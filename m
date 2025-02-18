Return-Path: <linux-input+bounces-10122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25088A3A8CC
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 181D93A71B3
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5181DC070;
	Tue, 18 Feb 2025 20:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3O1Qjs9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701A51C700F;
	Tue, 18 Feb 2025 20:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910316; cv=none; b=Vtw9JgZeFUCvRphHXAIW10W96IpFnaOq/5VJa709dN0oUabhOg0CzofYTpLh+e2p9IyjO/wRyVqFE1jweeNGGbPRRVOaz4ww3lubyJc/qoniazJ88rupSmB4DuVGohiM3ZMGP7VOlqKrBkDTBhe8bOPlYFWHVQMcX0W3rsczbhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910316; c=relaxed/simple;
	bh=umqQ4u0EARIognq7R1uJvL1gkdjPluo6e2NcBWDVp20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NY3hp+cg8XtBY8t4UNadd+6YHdb915GlZrihd4lYjkePVZOusUp38We0dJfMJKdKN25jzezhtXtD3Bt7asT9QQqVP1wE5gV4IKT7Nz+WyL3F3Z+q7E4DoSEsMr5tQXxxAzkD2PvKB+sHm0dxQss3MthADN/eCpCfHl6zBdyG6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3O1Qjs9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14753C4CEE2;
	Tue, 18 Feb 2025 20:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910316;
	bh=umqQ4u0EARIognq7R1uJvL1gkdjPluo6e2NcBWDVp20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V3O1Qjs9t5OC7QWCtmvfA/eUfQN7gR34vqQXUeFXsDWcC1lEEBSZp3/YIBkwaECKT
	 ECqKnjEgeqEWAOh6Cteo1lGzXQUlCO83QFHx7F2nIRaTVQ7OEG/vUUZoS0Jz1WhEz+
	 +pdxLeFzvL40qlPRWIzzPLV2MQNKW0+nZY5cLFUgxmrjP3RPOiBFi7HvIqcPIEBcJE
	 Qn/jMMaG39Cy1wHM2PBe9oUKswO4peKYepnWytcg3UVNf9gdv4+nCyE/itmP07ji5H
	 Ub61R82Gd/NrLaLie4I65cTdYaGwIdQopPkTZuVGZBuIE837m+ZtCHGAFo1ORJ+NtR
	 Ptk9DR32wpVxg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhang Lixu <lixu.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	andriy.shevchenko@intel.com,
	even.xu@intel.com,
	nichen@iscas.ac.cn,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 07/31] HID: intel-ish-hid: ipc: Add Panther Lake PCI device IDs
Date: Tue, 18 Feb 2025 15:24:27 -0500
Message-Id: <20250218202455.3592096-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202455.3592096-1-sashal@kernel.org>
References: <20250218202455.3592096-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.3
Content-Transfer-Encoding: 8bit

From: Zhang Lixu <lixu.zhang@intel.com>

[ Upstream commit 18c966b62819b9d3b99eac8fb8cdc8950826e0c2 ]

Add device IDs of Panther Lake-H and Panther Lake-P into ishtp support
list.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 2 ++
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index cdd80c653918b..07e90d51f073c 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -36,6 +36,8 @@
 #define PCI_DEVICE_ID_INTEL_ISH_ARL_H		0x7745
 #define PCI_DEVICE_ID_INTEL_ISH_ARL_S		0x7F78
 #define PCI_DEVICE_ID_INTEL_ISH_LNL_M		0xA845
+#define PCI_DEVICE_ID_INTEL_ISH_PTL_H		0xE345
+#define PCI_DEVICE_ID_INTEL_ISH_PTL_P		0xE445
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 9e2401291a2f6..ff0fc80100728 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -26,9 +26,11 @@
 enum ishtp_driver_data_index {
 	ISHTP_DRIVER_DATA_NONE,
 	ISHTP_DRIVER_DATA_LNL_M,
+	ISHTP_DRIVER_DATA_PTL,
 };
 
 #define ISH_FW_GEN_LNL_M "lnlm"
+#define ISH_FW_GEN_PTL "ptl"
 
 #define ISH_FIRMWARE_PATH(gen) "intel/ish/ish_" gen ".bin"
 #define ISH_FIRMWARE_PATH_ALL "intel/ish/ish_*.bin"
@@ -37,6 +39,9 @@ static struct ishtp_driver_data ishtp_driver_data[] = {
 	[ISHTP_DRIVER_DATA_LNL_M] = {
 		.fw_generation = ISH_FW_GEN_LNL_M,
 	},
+	[ISHTP_DRIVER_DATA_PTL] = {
+		.fw_generation = ISH_FW_GEN_PTL,
+	},
 };
 
 static const struct pci_device_id ish_pci_tbl[] = {
@@ -63,6 +68,8 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_H)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_ARL_S)},
 	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_LNL_M), .driver_data = ISHTP_DRIVER_DATA_LNL_M},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_PTL_H), .driver_data = ISHTP_DRIVER_DATA_PTL},
+	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ISH_PTL_P), .driver_data = ISHTP_DRIVER_DATA_PTL},
 	{}
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
-- 
2.39.5


