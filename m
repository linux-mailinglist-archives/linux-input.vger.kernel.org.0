Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6D279DE4A
	for <lists+linux-input@lfdr.de>; Wed, 13 Sep 2023 04:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjIMCds (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Sep 2023 22:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjIMCds (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Sep 2023 22:33:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5961713
        for <linux-input@vger.kernel.org>; Tue, 12 Sep 2023 19:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694572424; x=1726108424;
  h=from:to:cc:subject:date:message-id;
  bh=/Yhg+vTJvYWBwXL4LbtrPiTVCt6F3TVZDasajdio1pI=;
  b=coW6td7glnNAzatsWHhDH0C1/kEohmfj8XxlcaeiEorf7eDutu2CJTAn
   qho5AigrwXQ5392SM1kRT4MTVGFYm+mUkOHc//vsloluxZk2BJS4Z3bjA
   3qwIGPBRfe/JiXr5DOhCwYMIRel/4LPg47ph6NzFFEU/1/NzXd1IZY7F2
   ZRbjkykW4EJfk1B4R6P+E7wzxynlSi8kI2FCQpxXL2nNrcNmDLe4dG7T/
   if0yk6kTyvpSHRky9r9U4r2E6hGaUNFf9os965yqumcH6zhewJhYalNf0
   R9z/Nr/LvETWwhRED6pkuUg3nTz2dBPjKvrCEDRdMAfSh44P4tC+xt/ac
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="464915863"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="464915863"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 19:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743943756"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="743943756"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 19:33:41 -0700
From:   Even Xu <even.xu@intel.com>
To:     linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     Even Xu <even.xu@intel.com>
Subject: [PATCH] HID: intel-ish-hid: ipc: Add Arrow Lake PCI device ID
Date:   Wed, 13 Sep 2023 10:33:39 +0800
Message-Id: <1694572419-10981-1-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device ID of Arrow Lake-S into ishtp support list.

Signed-off-by: Even Xu <even.xu@intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index e99f3a3..f89b300 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -34,6 +34,7 @@
 #define RPL_S_DEVICE_ID		0x7A78
 #define MTL_P_DEVICE_ID		0x7E45
 #define ARL_H_DEVICE_ID		0x7745
+#define ARL_S_DEVICE_ID		0x7F78
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 55cb250..ae3c6c1 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -45,6 +45,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, RPL_S_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, MTL_P_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ARL_H_DEVICE_ID)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ARL_S_DEVICE_ID)},
 	{0, }
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
-- 
2.7.4

