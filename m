Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64AA61221A9
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2019 02:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfLQBr7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Dec 2019 20:47:59 -0500
Received: from mga14.intel.com ([192.55.52.115]:35417 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbfLQBr7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Dec 2019 20:47:59 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 17:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,323,1571727600"; 
   d="scan'208";a="209511705"
Received: from shsensorbuild2.sh.intel.com ([10.239.133.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Dec 2019 17:11:20 -0800
From:   Even Xu <even.xu@intel.com>
To:     srinivas.pandruvada@linux.intel.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Cc:     Even Xu <even.xu@intel.com>
Subject: [PATCH] HID: intel-ish-hid: ipc: add CMP device id
Date:   Tue, 17 Dec 2019 09:11:18 +0800
Message-Id: <1576545078-17316-1-git-send-email-even.xu@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add Comet Lake H into ishtp support list.

Signed-off-by: Even Xu <even.xu@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index 6c1e611..905e1bc 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -24,6 +24,7 @@
 #define ICL_MOBILE_DEVICE_ID	0x34FC
 #define SPT_H_DEVICE_ID		0xA135
 #define CML_LP_DEVICE_ID	0x02FC
+#define CMP_H_DEVICE_ID		0x06FC
 #define EHL_Ax_DEVICE_ID	0x4BB3
 
 #define	REVISION_ID_CHT_A0	0x6
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 784dcc8..9c8cefe 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -34,6 +34,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ICL_MOBILE_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, SPT_H_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CML_LP_DEVICE_ID)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CMP_H_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, EHL_Ax_DEVICE_ID)},
 	{0, }
 };
-- 
2.7.4

