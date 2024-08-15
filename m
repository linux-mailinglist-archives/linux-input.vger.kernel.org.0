Return-Path: <linux-input+bounces-5580-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0315B9527D4
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 04:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3970285B73
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 02:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34D16FC3;
	Thu, 15 Aug 2024 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdAJhW0h"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132C8F6D
	for <linux-input@vger.kernel.org>; Thu, 15 Aug 2024 02:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723687816; cv=none; b=Qiil93OYlU6ml01gIJ1UwCta/gopuH2PoJPrtKLa/1JX9cx0uak5OXbpc9t0ZKFiTgA19AboqRuGC2r0gBZp3uOR9AP0i5PoQzOHog1HbpM9012ie5JCMWYuAhBzTC+Xszp+FTGnwmgrirhXffZamU40rZpfdT8I/hpMlm+7NUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723687816; c=relaxed/simple;
	bh=NPCHo1P97QcUOplo6nm44XwDM4ia3zlrYgn6JHMPR/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fvHxgJakZi6AHaLy8HUyMclxdxa8zKK0oygpJYy5sUuCiOGe28aJEjff/qp+kywcikiOi+0SgFF9fkvKuk42rmItuMW9r9SHCBOvEs5T5HHCHdCAOACBDWSYFssP3uYq6F5WIZ1b1tzlmhHfda34upccohERYGRoaFXruWp8lzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdAJhW0h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723687815; x=1755223815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NPCHo1P97QcUOplo6nm44XwDM4ia3zlrYgn6JHMPR/w=;
  b=UdAJhW0hUzWI0bNICTcJGze54G6XhOCaUw6T8i9RGY8HUSTjzLYTpMfu
   hpzlU9a4rGIeHO5U9XAXMrJTxc8N6wLWcjNYzA+ULU3Y6BUi5g1DFaIo0
   G4b2Wi0W2kd3eae8wHHlojshQxqsRHqfEV7TYRwHA9JiDSnDXrPCGiNhv
   s3sRmYjkowYlNdoP4yo0sJUAILAdmGdYPylYeSrGomEzZY8Q1Ai4gmjpy
   03zBoIwNd/wjD/tNRIQQq+8yqjHQnbJ8kae+RUJbdH4Epo5gxM/4YJSwD
   hIZsFv2KoRxf1yzCKeKG5K8SwvK9mqu1VQPB+wZvczC5qswemjTUEaTmo
   w==;
X-CSE-ConnectionGUID: DdmcHO9GTCSDxJv37PpIng==
X-CSE-MsgGUID: YbV0d3lnT5+ZVqZIIV/dJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21796113"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="21796113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 19:10:09 -0700
X-CSE-ConnectionGUID: Q4TYVX9WTiC9B4IYmgMVtg==
X-CSE-MsgGUID: H4ax1UEHTzWWen3P+k2OjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="63635446"
Received: from ipg-l-lixuzha.sh.intel.com ([10.239.153.157])
  by fmviesa005.fm.intel.com with ESMTP; 14 Aug 2024 19:10:04 -0700
From: Zhang Lixu <lixu.zhang@intel.com>
To: linux-input@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com
Cc: lixu.zhang@intel.com,
	hemin.han@intel.com,
	yoshi.wang@intel.com,
	even.xu@intel.com,
	ilpo.jarvinen@linux.intel.com
Subject: [PATCH v2 1/3] Documentation: hid: intel-ish-hid: Add vendor custom firmware loading
Date: Thu, 15 Aug 2024 10:09:59 +0800
Message-Id: <20240815021001.936277-2-lixu.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240815021001.936277-1-lixu.zhang@intel.com>
References: <20240815021001.936277-1-lixu.zhang@intel.com>
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


