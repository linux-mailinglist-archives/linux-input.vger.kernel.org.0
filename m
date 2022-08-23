Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D853759CD9D
	for <lists+linux-input@lfdr.de>; Tue, 23 Aug 2022 03:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbiHWBLZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Aug 2022 21:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239145AbiHWBLJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Aug 2022 21:11:09 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B09159240
        for <linux-input@vger.kernel.org>; Mon, 22 Aug 2022 18:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661217067; x=1692753067;
  h=from:to:cc:subject:date:message-id;
  bh=TxGcKb5znYBIYgTs88kQrD9Q8g6/mi92jRm1KVSLOj8=;
  b=jcCxmZWmRLhj/LICvU9zIpFjy4MPFq7+foefSH/w2du+8Hpcg25C5oVa
   ECACxhxdWu+tYsZ1nCpKZMWmlVW43ecCV4D1gXiDuQOOZ8eTKhphtDSKt
   viTMnEGCFpgtzizUJajiZGPOld6dfxEPIP+BOSVaR0eeue6/oop+T5MX5
   T8G+AAo3W96GWzXYfGsiG/4yHFPiu1SLXAhFRk3mZdNURmZaQCIvKVe/l
   edoDNufMxBE7t/jsTKJFCBeuKb5JNBcjCVEE1SQZLwtifLQAa5Vxx6Pph
   odm9TipYgsmV4ylRGFo1326b54b88iKI1vTgyt/0V/tOAprWrsihX/e0d
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="319600706"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="319600706"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 18:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; 
   d="scan'208";a="937262952"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.108])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2022 18:11:01 -0700
From:   Even Xu <even.xu@intel.com>
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        srinivas.pandruvada@linux.intel.com, Even Xu <even.xu@intel.com>
Subject: [PATCH] HID: intel-ish-hid: ipc: Add Meteor Lake PCI device ID
Date:   Tue, 23 Aug 2022 09:10:59 +0800
Message-Id: <1661217059-22227-1-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device ID of Meteor Lake P into ishtp support list.

Signed-off-by: Even Xu <even.xu@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index e600dbf..fc108f1 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -32,6 +32,7 @@
 #define ADL_P_DEVICE_ID		0x51FC
 #define ADL_N_DEVICE_ID		0x54FC
 #define RPL_S_DEVICE_ID		0x7A78
+#define MTL_P_DEVICE_ID		0x7E45
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 2c67ec1..7120b30 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -43,6 +43,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_P_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ADL_N_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, RPL_S_DEVICE_ID)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, MTL_P_DEVICE_ID)},
 	{0, }
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
-- 
2.7.4

