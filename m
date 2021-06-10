Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A5F3A2464
	for <lists+linux-input@lfdr.de>; Thu, 10 Jun 2021 08:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhFJGYD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Jun 2021 02:24:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:10599 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229925AbhFJGYC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Jun 2021 02:24:02 -0400
IronPort-SDR: hr0E6rpYiVSTZb+h08JTMmAB2smKAK3rywVbubAfJyelSBVn9+DULpQxTRhfpQTQgSSEG14ULN
 0NySbgpy0KNQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="185610252"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; 
   d="scan'208";a="185610252"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 23:22:02 -0700
IronPort-SDR: 361QJnCqPWnszfc2PolyEbGrj03wNWe1tcLr+jXA6pWDAqLl0mP3nMyEc7rDeAsX+osTQRRFCb
 dXj0llr0m58A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; 
   d="scan'208";a="482702846"
Received: from shsensorbuild2.sh.intel.com ([10.239.132.180])
  by orsmga001.jf.intel.com with ESMTP; 09 Jun 2021 23:22:00 -0700
From:   Even Xu <even.xu@intel.com>
To:     srinivas.pandruvada@linux.intel.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, Even Xu <even.xu@intel.com>
Subject: [PATCH 1/3] hid: intel-ish-hid: Set ISH driver depends on x86
Date:   Thu, 10 Jun 2021 14:21:52 +0800
Message-Id: <1623306114-19208-2-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1623306114-19208-1-git-send-email-even.xu@intel.com>
References: <1623306114-19208-1-git-send-email-even.xu@intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

During ISH DMA enabling, some platforms (such as EHL) don't
support cache snooping, driver needs involve clflush_cache_range
API which isn't supported by all archs (such as ARM).

Considering ISH only exists on Intel platforms, add the dependence
in Kconfig to avoid build warnings or errors on other archs.

Acked-by: Pandruvada, Srinivas <srinivas.pandruvada@intel.com>
Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-ish-hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/intel-ish-hid/Kconfig b/drivers/hid/intel-ish-hid/Kconfig
index c6c9cfe2..689da84 100644
--- a/drivers/hid/intel-ish-hid/Kconfig
+++ b/drivers/hid/intel-ish-hid/Kconfig
@@ -5,6 +5,7 @@ menu "Intel ISH HID support"
 config INTEL_ISH_HID
 	tristate "Intel Integrated Sensor Hub"
 	default n
+	depends on X86
 	select HID
 	help
 	  The Integrated Sensor Hub (ISH) enables the ability to offload
-- 
2.7.4

