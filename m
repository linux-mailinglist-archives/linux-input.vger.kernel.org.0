Return-Path: <linux-input+bounces-10130-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E01C2A3A939
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EA9C1898E66
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF341F582B;
	Tue, 18 Feb 2025 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n36QA7qT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123CE1F5826;
	Tue, 18 Feb 2025 20:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910402; cv=none; b=G8loIiUcefn0FpniGtccOlZF9qIO8USa559s5pOqMFBjy83swNQcGTadLxhjZgGCBdK4AmvJes3T1511op688LriY7cXyllM+1EmBPFdvASXUzvok2iGUVpiV1y61YOahvGgnpp7cRNc7WP2l7cpX3Cjc8gS9HjvSmVn67vnCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910402; c=relaxed/simple;
	bh=0f2QleHGRIgyOTCCR6QeW458t9wxZKpvnrfaegIRWlw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GrZgq7ZUECWE4qDRZI6H4zIJaeqjVKXUzWfW3y2NvNn2hBZc2RpAl0Wfakdo/eDEVzEh4Ps6o4ntoEiS1GUbizqsvfszh+T2eUxoFN7eSBEqgPQ7Ftpnm/m5LKThsibIB5oxMgCL/A1b1Ldoc1mgOAw323UZSbX6qYLc3jNSZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n36QA7qT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42203C4CEE4;
	Tue, 18 Feb 2025 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910401;
	bh=0f2QleHGRIgyOTCCR6QeW458t9wxZKpvnrfaegIRWlw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n36QA7qTIeADTHeTYXMBI2JyR0DWiZ1beYmIeqrCqLn6DMcUsglAkjez8Px+5sz35
	 Lxp5Snnlf7KI+RWhwOhfB7wL0ap2LXXJvrN+KOwCfN2dPE1YrTJvV441vBkbLpOUWz
	 Sryv+eN7UuwBI79pfxWwuv0pyhdZ1LzI7zTBin4fwgHwLLqpie1hGZjITSlbWxkQPi
	 uOkQ7GxTe7o1wu7AOVTcRgU7SJ8bqGaZ6QkfjPlaPPHAxRPUI0AXfUOJToJPz4l/LB
	 SfPFG75u8i+q59cNHN8Sa8AkAWGi/FIzxp7dkcC8gQ0bcX6/xHfSy6lMGtG6T4LqjE
	 d2hApnyGt6Qig==
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
Subject: [PATCH AUTOSEL 6.12 07/31] HID: intel-ish-hid: ipc: Add Panther Lake PCI device IDs
Date: Tue, 18 Feb 2025 15:25:53 -0500
Message-Id: <20250218202619.3592630-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202619.3592630-1-sashal@kernel.org>
References: <20250218202619.3592630-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.15
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
index aae0d965b47b5..1894743e88028 100644
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


