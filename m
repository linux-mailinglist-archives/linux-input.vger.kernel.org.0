Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69548730C26
	for <lists+linux-input@lfdr.de>; Thu, 15 Jun 2023 02:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbjFOA0v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jun 2023 20:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjFOA0u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jun 2023 20:26:50 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84DA2684
        for <linux-input@vger.kernel.org>; Wed, 14 Jun 2023 17:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686788809; x=1718324809;
  h=from:to:cc:subject:date:message-id;
  bh=bKRiYrqUSD6rbq7QxkuhiwGvIcCIAETz0Yxi13D9Wws=;
  b=URAqGuN2Z6/HHTW0oGE0ujV4hYNmax3fgYd5uVywkRCSuvXkaUC8y+Bi
   x48mvekAOat79knaq+7NNKlJ0vjcRYjyOV51HH5DE+WmM+eda0Z+BfFEA
   Rd4GsiR2q+TkxxhA88Shgs+dkkgLiVkaRTZQpwMJFH4fsgwLQzQ+664E+
   h2H3dbl9ezYT5l8YwJc7ow9d9a159ewVi3EWMaFt8fd2Sm7/2cjd7fnB1
   Bc4KhWBMwbdxFg3NrFTDQ48GDkZYQFV0LGQV5gHMq4sSWIyA9paQ+D6Y3
   FZSjKGcVUHzKTEYbO0DghhA2zm5TT7jBDtrkHRAZa4EGd7ugT6aZTc5gO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="445139817"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="445139817"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 17:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="742031315"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="742031315"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga008.jf.intel.com with ESMTP; 14 Jun 2023 17:26:46 -0700
From:   Even Xu <even.xu@intel.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, srinivas.pandruvada@linux.intel.com
Cc:     Even Xu <even.xu@intel.com>
Subject: [PATCH] HID: intel-ish-hid: ipc: Add Arrow Lake PCI device ID
Date:   Thu, 15 Jun 2023 08:26:41 +0800
Message-Id: <1686788801-23388-1-git-send-email-even.xu@intel.com>
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

Add device ID of Arrow Lake-H into ishtp support list.

Signed-off-by: Even Xu <even.xu@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index fc108f1..e99f3a3 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -33,6 +33,7 @@
 #define ADL_N_DEVICE_ID		0x54FC
 #define RPL_S_DEVICE_ID		0x7A78
 #define MTL_P_DEVICE_ID		0x7E45
+#define ARL_H_DEVICE_ID		0x7745
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 7120b30..55cb250 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -44,6 +44,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_N_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, RPL_S_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, MTL_P_DEVICE_ID)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ARL_H_DEVICE_ID)},
 	{0, }
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
-- 
2.7.4

