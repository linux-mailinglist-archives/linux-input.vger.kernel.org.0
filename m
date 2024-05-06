Return-Path: <linux-input+bounces-3476-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F87E8BC573
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 03:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BAF11F2114E
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 01:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046073CF6A;
	Mon,  6 May 2024 01:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4kURGQi"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FF62FB6
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 01:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714959047; cv=none; b=lVDI48ixmnHK4c6nI3PHKABqI28uNMaBwkF8ia5/UHlyf/rDox60+4rR/HKeKXpmSlHhJ4klJrlgRhMsG9/xX2nANnMH19wYUm8Gzax3NoZWvzmk51vVDvU9LsLkwK0l26Kv3lxQgyQGmXHtgH+l+oRlq1uSg1tW1QogABy9swc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714959047; c=relaxed/simple;
	bh=pc+H5eCwZlQwuCX/gPKOACHfdZm6g/vpcGzGq78Td/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pKOwAj3zoF/OHZ1biOygysTyeVu3J/JGbdmdsrCsZq76vGB/Y73frx/hU37/qWyc2cWfmjrKK1F3uq8l20Fz5BPNam6KGJps5dzIQijMSL0sRvkvAvABFn6eqxSMlTEbqn6NtiMt8VeUdMVjkUff/JSW7CvIviW7aoyUt3a/aJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4kURGQi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714959046; x=1746495046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pc+H5eCwZlQwuCX/gPKOACHfdZm6g/vpcGzGq78Td/c=;
  b=f4kURGQibifb1r7JNZeYe0fKoAqeeiboqAE0Qnzaa8IrhIOJWmFC64tC
   imAAfJC/9fTuwJ9M8rnqGRWGZ46VBTiaU21Halpvx8Mi0p1KXY4qcZzgc
   OuN4FEEHEIZoSbEE/k3LuJq3ly8ogAXa+9w6MBSXfrWbyZxe0SuJZvqwf
   6AZVHwnCm78d8CES4EdBNtRxW2lGoRO9wzbJ4/zYKuRclau1s9emoLuv7
   lajS7j35Deqa+5prPXA7uHNvWOf46lBG322uc85IpfiLGbvRxBqJzl+cF
   Seyo+QJ9cWYXk4hWXr06efftGUqZ0L3EoCp5g0HDuu6r+EUIBFKPMJpsb
   A==;
X-CSE-ConnectionGUID: /NDSq8f5QkKkL46whvaULw==
X-CSE-MsgGUID: udYOVs3PQ2yJWr+KE4/nNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="14503858"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="14503858"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 18:30:46 -0700
X-CSE-ConnectionGUID: EF37PLDqQJuaAOLPCFFuLQ==
X-CSE-MsgGUID: yGbuqNatTCaOQhWcZRg3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28092908"
Received: from unknown (HELO ipg-l-lixuzha.sh.intel.com) ([10.239.153.157])
  by fmviesa010.fm.intel.com with ESMTP; 05 May 2024 18:30:44 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com
Subject: [PATCH 2/5] Documentation: hid: intel-ish-hid: add section for firmware loading
Date: Mon,  6 May 2024 09:30:37 +0800
Message-Id: <20240506013040.10700-3-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506013040.10700-1-lixu.zhang@intel.com>
References: <20240506013040.10700-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qianru Huang <qianru.huang@intel.com>

Add a section to describe the ISH firmware loading process for Lunar Lake
and later generations.

Signed-off-by: Qianru Huang <qianru.huang@intel.com>
Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 Documentation/hid/intel-ish-hid.rst | 65 +++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/hid/intel-ish-hid.rst b/Documentation/hid/intel-ish-hid.rst
index 12613cb2be43..55cbaa719a79 100644
--- a/Documentation/hid/intel-ish-hid.rst
+++ b/Documentation/hid/intel-ish-hid.rst
@@ -339,6 +339,71 @@ End to End HID transport Sequence Diagram
           |                        |                       |                               |
 
 
+ISH Firmware Loading from Host Flow
+-----------------------------------
+
+Starting from the Lunar Lake generation, the ISH firmware has been divided into two components for better space optimization and increased flexibility. These components include a bootloader that is integrated into the BIOS, and a main firmware that is stored within the operating system's file system.
+
+The process works as follows:
+
+- Initially, the ISHTP driver sends a command, HOST_START_REQ_CMD, to the ISH bootloader. In response, the bootloader sends back a HOST_START_RES_CMD. This response includes the ISHTP_SUPPORT_CAP_LOADER bit. Subsequently, the ISHTP driver checks if this bit is set. If it is, the firmware loading process from the host begins.
+
+- During this process, the ISHTP driver first invokes the request_firmware() function, followed by sending a LOADER_CMD_XFER_QUERY command. Upon receiving a response from the bootloader, the ISHTP driver sends a LOADER_CMD_XFER_FRAGMENT command. After receiving another response, the ISHTP driver sends a LOADER_CMD_START command. The bootloader responds and then proceeds to the Main Firmware.
+
+- After the process concludes, the ISHTP driver calls the release_firmware() function.
+
+For more detailed information, please refer to the flow descriptions provided below:
+
+::
+
+  +---------------+                                                    +-----------------+
+  | ISHTP Driver  |                                                    | ISH Bootloader  |
+  +---------------+                                                    +-----------------+
+          |                                                                     |
+          |~~~Send HOST_START_REQ_CMD~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>|
+          |                                                                     |
+          |<--Send HOST_START_RES_CMD(Includes ISHTP_SUPPORT_CAP_LOADER bit)----|
+          |                                                                     |
+  ****************************************************************************************
+  * if ISHTP_SUPPORT_CAP_LOADER bit is set                                               *
+  ****************************************************************************************
+          |                                                                     |
+          |~~~start loading firmware from host process~~~+                      |
+          |                                              |                      |
+          |<---------------------------------------------+                      |
+          |                                                                     |
+  ---------------------------                                                   |
+  | Call request_firmware() |                                                   |
+  ---------------------------                                                   |
+          |                                                                     |
+          |~~~Send LOADER_CMD_XFER_QUERY~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>|
+          |                                                                     |
+          |<--Send response-----------------------------------------------------|
+          |                                                                     |
+          |~~~Send LOADER_CMD_XFER_FRAGMENT~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>|
+          |                                                                     |
+          |<--Send response-----------------------------------------------------|
+          |                                                                     |
+          |~~~Send LOADER_CMD_START~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>|
+          |                                                                     |
+          |<--Send response-----------------------------------------------------|
+          |                                                                     |
+          |                                                                     |~~~Jump to Main Firmware~~~+
+          |                                                                     |                           |
+          |                                                                     |<--------------------------+
+          |                                                                     |
+  ---------------------------                                                   |
+  | Call release_firmware() |                                                   |
+  ---------------------------                                                   |
+          |                                                                     |
+  ****************************************************************************************
+  * end if                                                                               *
+  ****************************************************************************************
+          |                                                                     |
+  +---------------+                                                    +-----------------+
+  | ISHTP Driver  |                                                    | ISH Bootloader  |
+  +---------------+                                                    +-----------------+
+
 ISH Debugging
 -------------
 
-- 
2.34.1


