Return-Path: <linux-input+bounces-5533-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E27F94FC68
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 05:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 084A7B2211B
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 03:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38A6179AE;
	Tue, 13 Aug 2024 03:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5InO7w0"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275B118EAB
	for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 03:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723520864; cv=none; b=iZ1OqE6eD2zYGruLIC49T/OE0HARRVSnl1ErVWOj9yd9Ctl0YqrVn12fn4TX/ZfScxT7QtV2q6X8dqB0YFKkaYZMECTY7dxkMhbfeC7d51VRJBwbHF+WMs3zS1mLR7i7cK++kHLPyZb0UAjHGvoKg1jMu5zD+g+QSK0wSyJ471A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723520864; c=relaxed/simple;
	bh=NPCHo1P97QcUOplo6nm44XwDM4ia3zlrYgn6JHMPR/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a1M4u5dBBYOgyNC96xRXtDR/ZVpowNUfBBYehcqJaIkvJ6yEbvZvJADEVwTBt5JjwdVV7QNdK1WZN/K3XbvOBL2jXC8Wtn+r77KoChU1aaThLXn0OF9rCVgBGr3g7cDdug97IHNdumOYPlUjYAhXuHmDPrd4I0lSz/TxceHg6cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5InO7w0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723520863; x=1755056863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NPCHo1P97QcUOplo6nm44XwDM4ia3zlrYgn6JHMPR/w=;
  b=M5InO7w0R6Oy9ZCv18aof3ZlKnTzQaDVzLgx4vc9ZlmGRxxyxYsfG9Oe
   RpI5ga1eM782bJCjyPecpwOSV+4KkDKYK4HWqGFH9u4OF5h88CXUds19h
   5USuuGLZV/MwSdBLPO6C//AUCgoKHiQhi59WT7/GYdqiYQn3CTkfhE2Ti
   0cp162XbdprIXHl75JV+MPRYzjvxTEQJxschBb3aqA6iLuMKGpRP4g1g2
   umxadfI8RrkS4xB4IowLReg4pN8HnRaEgGQrAlXUsYnvkSzJCQ9lePoTX
   7DBcVaevSGiwgP2Bg4I0P8Jo1WlHWtsGth3NO9uU00kaKCMw5+kyVKrfF
   g==;
X-CSE-ConnectionGUID: 7vl4cN2uQWysrNQlsy3oJQ==
X-CSE-MsgGUID: MBEGxX6MTha+r1hBiVsrIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21819912"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21819912"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 20:47:43 -0700
X-CSE-ConnectionGUID: y6Yb8obRRL2njTX1nnsQPw==
X-CSE-MsgGUID: YKfELcckRGOUzATTxTwzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="58396402"
Received: from ipg-l-lixuzha.sh.intel.com ([10.239.153.157])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2024 20:47:40 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	hemin.han@intel.com,
	yoshi.wang@intel.com,
	even.xu@intel.com
Subject: [PATCH 1/3] Documentation: hid: intel-ish-hid: Add vendor custom firmware loading
Date: Tue, 13 Aug 2024 11:47:34 +0800
Message-Id: <20240813034736.812475-2-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240813034736.812475-1-lixu.zhang@intel.com>
References: <20240813034736.812475-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ISH firmware loading guidelines for vendor custom firmware.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 Documentation/hid/intel-ish-hid.rst | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/hid/intel-ish-hid.rst b/Documentation/hid/intel-ish-hid.rst
index 55cbaa719a79..2adc174fb576 100644
--- a/Documentation/hid/intel-ish-hid.rst
+++ b/Documentation/hid/intel-ish-hid.rst
@@ -404,6 +404,35 @@ For more detailed information, please refer to the flow descriptions provided be
   | ISHTP Driver  |                                                    | ISH Bootloader  |
   +---------------+                                                    +-----------------+
 
+Vendor Custom Firmware Loading
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The firmware running inside ISH can be provided by Intel or developed by vendors using the Firmware Development Kit (FDK) provided by Intel.
+Intel will upstream the Intel-built firmware to the ``linux-firmware.git`` repository, located under the path ``intel/ish/``. For the Lunar Lake platform, the Intel-built ISH firmware will be named ``ish_lnlm.bin``.
+Vendors who wish to upstream their custom firmware should follow these guidelines for naming their firmware files:
+
+- The firmware filename should use one of the following patterns:
+
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}.bin``
+  - ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}.bin``
+
+- ``${intel_plat_gen}`` indicates the Intel platform generation (e.g., ``lnlm`` for Lunar Lake) and must not exceed 8 characters in length.
+- ``${SYS_VENDOR_CRC32}`` is the CRC32 checksum of the ``sys_vendor`` value from the DMI field ``DMI_SYS_VENDOR``.
+- ``${PRODUCT_NAME_CRC32}`` is the CRC32 checksum of the ``product_name`` value from the DMI field ``DMI_PRODUCT_NAME``.
+- ``${PRODUCT_SKU_CRC32}`` is the CRC32 checksum of the ``product_sku`` value from the DMI field ``DMI_PRODUCT_SKU``.
+
+During system boot, the ISH Linux driver will attempt to load the firmware in the following order, prioritizing custom firmware with more precise matching patterns:
+
+1. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+2. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin``
+3. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}.bin``
+4. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}.bin``
+5. ``intel/ish/ish_${intel_plat_gen}.bin``
+
+The driver will load the first matching firmware and skip the rest. If no matching firmware is found, it will proceed to the next pattern in the specified order. If all searches fail, the default Intel firmware, listed last in the order above, will be loaded.
+
 ISH Debugging
 -------------
 
-- 
2.34.1


