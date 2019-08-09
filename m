Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB7D87151
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 07:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfHIFSX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 01:18:23 -0400
Received: from mga07.intel.com ([134.134.136.100]:51999 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbfHIFSX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 9 Aug 2019 01:18:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Aug 2019 22:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="350396679"
Received: from fengxu-ubuntu.sh.intel.com ([10.239.154.117])
  by orsmga005.jf.intel.com with ESMTP; 08 Aug 2019 22:18:21 -0700
From:   Even Xu <even.xu@intel.com>
To:     jikos@kernel.org, linux-input@vger.kernel.org
Cc:     srinivas.pandruvada@linux.intel.com, Even Xu <even.xu@intel.com>
Subject: [PATCH] hid: intel-ish-hid: ipc: add EHL device id
Date:   Fri,  9 Aug 2019 21:18:29 +0800
Message-Id: <20190809131829.6126-1-even.xu@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

EHL is a new platform using ishtp solution, add its device id
to support list.

Signed-off-by: Even Xu <even.xu@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index 1065692f90e2..5792a104000a 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -24,6 +24,7 @@
 #define ICL_MOBILE_DEVICE_ID	0x34FC
 #define SPT_H_DEVICE_ID		0xA135
 #define CML_LP_DEVICE_ID	0x02FC
+#define EHL_Ax_DEVICE_ID	0x4BB3
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index aa80b4d3b740..279567baca3d 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -33,6 +33,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, ICL_MOBILE_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, SPT_H_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CML_LP_DEVICE_ID)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, EHL_Ax_DEVICE_ID)},
 	{0, }
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
-- 
2.17.1

