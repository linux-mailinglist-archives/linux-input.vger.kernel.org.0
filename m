Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA4F4EC681
	for <lists+linux-input@lfdr.de>; Wed, 30 Mar 2022 16:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345226AbiC3O3e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Mar 2022 10:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245102AbiC3O3d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Mar 2022 10:29:33 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008652F3A8
        for <linux-input@vger.kernel.org>; Wed, 30 Mar 2022 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648650468; x=1680186468;
  h=from:to:cc:subject:date:message-id;
  bh=7AFm1ya9wN+ggwQd+PlNEIHM2UDms8/2n6arUVejhB0=;
  b=Xk3npFo1ZktisunTfMEnEjXj945j7+acTSTrLex3IhJTFTMm5S3lSnJW
   vdNfd4Zu8W9wvZMFhO4CzG00Lv1wGl5fufan1v1jHPdOwn8G9XiRtn9uu
   j/XOfY9R5Mxo1fW6ez2ckPKw5g9OPn23HsZcFkjJiRdXMsqT6He+lG0WG
   B4O1Odi74JVvqSmq2h70jyyKhCM0UO0Vbhlc0GLJ5EhzfGuczN7G4BWEp
   eKcPGmnIIIyeW6naOV6ZwEHfJHqsPf0SB/5PZ0mjXJNa8TltNG+VMt4DW
   tOzzzrHo/+KzPcSkoE+I1oq47taieZfD8JInMy4dEdNj3qHiEeI1g5hTm
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="240151303"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="240151303"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:27:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="788024982"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.108])
  by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2022 07:27:47 -0700
From:   Even Xu <even.xu@intel.com>
To:     jikos@kernel.org, srinivas.pandruvada@linux.intel.com,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, even.xu@intel.com
Subject: [PATCH] HID: intel-ish-hid: ipc: add ADL and RPL device id
Date:   Wed, 30 Mar 2022 22:27:45 +0800
Message-Id: <1648650465-32730-1-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device IDs of Alder Lake N and Raptor Lake S into ishtp support list.

Signed-off-by: Even Xu <even.xu@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 2 ++
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index 07e3cbc..e600dbf 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -30,6 +30,8 @@
 #define TGL_H_DEVICE_ID		0x43FC
 #define ADL_S_DEVICE_ID		0x7AF8
 #define ADL_P_DEVICE_ID		0x51FC
+#define ADL_N_DEVICE_ID		0x54FC
+#define RPL_S_DEVICE_ID		0x7A78
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 8e9d945..2c67ec1 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -41,6 +41,8 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, TGL_H_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_S_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_P_DEVICE_ID)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_N_DEVICE_ID)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, RPL_S_DEVICE_ID)},
 	{0, }
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
-- 
2.7.4

