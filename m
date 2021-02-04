Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D716230EE87
	for <lists+linux-input@lfdr.de>; Thu,  4 Feb 2021 09:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbhBDIeA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Feb 2021 03:34:00 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:43366 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhBDId6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Feb 2021 03:33:58 -0500
Received: by mail-pf1-f176.google.com with SMTP id q131so1650249pfq.10;
        Thu, 04 Feb 2021 00:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6i67hzmhIyWLTSUgjOoxI09dTzDeKdwAjKDGK5dJYk0=;
        b=uj9ELWyoITYJtt/+HI089jQrhZYAQYRk9JNDTAjf7pRsy4KFYSFYLTf50C2LsjSBdD
         0/u0NWuWzO4CaNe8kutovBetTdAO71xm6pESl5MbhpLOPKVFmYc2/X1xX08DljCW2cOv
         hRwoKwkmmhSmNWZI+izHuH4mJLwX9CkDyYQ/Bo/78DoZwUruSsCPytCs/Qr+OcJe0cn6
         s3DY8h6Dwe8rD/uvby+nb3+x5QCbvk5hShAjpdnCVH8M9vmfCfvc1acUMLfK2qJ9CJOs
         hLLgSxVN7/rUKa8wDerC8JXB4VW/xBvlgGZS0tdC5q0/drNR7ylEpc8O9XtzV/y9VT0u
         rY7w==
X-Gm-Message-State: AOAM532hzTuAy6CVBSkUAE2kYBL1YngzS7yVCcjcuVR1qMl5rJWBTxtS
        5Lh8HBAmGnB6AfWQSIi+n8w=
X-Google-Smtp-Source: ABdhPJzLUKlQ2HaGyCgmVdPlvVhA/Kf8+d64Cq5dnxQ8mNlKljneYGC6PHyXxSDT9tn1V8P2VypItA==
X-Received: by 2002:aa7:9d1a:0:b029:1c8:8148:a89d with SMTP id k26-20020aa79d1a0000b02901c88148a89dmr6998297pfp.66.1612427597869;
        Thu, 04 Feb 2021 00:33:17 -0800 (PST)
Received: from localhost (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id x8sm4626952pjf.55.2021.02.04.00.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 00:33:16 -0800 (PST)
From:   You-Sheng Yang <vicamo.yang@canonical.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: intel-ish-hid: ipc: Add Tiger Lake H PCI device ID
Date:   Thu,  4 Feb 2021 16:33:15 +0800
Message-Id: <20210204083315.122952-1-vicamo.yang@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Added Tiger Lake H PCI device ID to the supported device list.

Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
---
 drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
index 1fb294ca463e..21b0e6123754 100644
--- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
+++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
@@ -27,6 +27,7 @@
 #define CMP_H_DEVICE_ID		0x06FC
 #define EHL_Ax_DEVICE_ID	0x4BB3
 #define TGL_LP_DEVICE_ID	0xA0FC
+#define TGL_H_DEVICE_ID		0x43FC
 
 #define	REVISION_ID_CHT_A0	0x6
 #define	REVISION_ID_CHT_Ax_SI	0x0
diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index c6d48a8648b7..6dea657b7b15 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -37,6 +37,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CMP_H_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, EHL_Ax_DEVICE_ID)},
 	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, TGL_LP_DEVICE_ID)},
+	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, TGL_H_DEVICE_ID)},
 	{0, }
 };
 MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
-- 
2.29.2

