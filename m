Return-Path: <linux-input+bounces-12384-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9912AB8FAD
	for <lists+linux-input@lfdr.de>; Thu, 15 May 2025 21:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 596621892459
	for <lists+linux-input@lfdr.de>; Thu, 15 May 2025 19:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7304C41C71;
	Thu, 15 May 2025 19:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWeldCC/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41EC1F4163
	for <linux-input@vger.kernel.org>; Thu, 15 May 2025 19:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336043; cv=none; b=Xa4QpNQpgb1zJApcznp89n/CYDb/SOeWf7f2Q98Uzt/aR0tFDcTqGzJnioON9jJDDqhJHjL9rgMePrpEezpoONNmtcEAnuFfdlcnV4+wLVtH8IT2z0Grb2ZMObzY3a/yM2XOd5jx7G7008n0kG9ddqDkbbzDQ5bU7Prus8oLSA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336043; c=relaxed/simple;
	bh=QR1NGYZ1GTQV0an9lzVc4/3N76KQE629LYx41NCvJXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NM9Vmn1sSz280Ko6LS9nig0kTJs/rE0Exb9QM64dUi5eoWmfBvCi+Yutx5AC0cS9PK1k0HxxUdhkWMbTC2lndwpFm8GzM+pj665EntHDeqtYoP/1RQ66kelSO7BtfhwugAmfZ8DeZZo9qpxjWRdOmT4v9uH/UeVdjguuW838jY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWeldCC/; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26ebdac42fso14594a12.2
        for <linux-input@vger.kernel.org>; Thu, 15 May 2025 12:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747336041; x=1747940841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nBM1YOk0z5CfNMKvHK241ikIo0zaqpU/ycvX2d5cUc=;
        b=NWeldCC/+QrcAy+y0U053s0xCeB3uCuHtID+rT0dNuTR/5lrqvQYtAT13LWvLBl+9d
         mJ3dwsL0XqD6ScMdis99OMGC34ZpQDtGiQItO+w/ssqOKdoTUsq5LpJWr+fOP0HeWKLw
         1n16AffR7tIO7imnV3gZS93E1huqtR0k/60u65TdBjEKyJmql23T6iuUx4fop2Xdw63M
         fhqOVp6Joi7o4K82mWXYJH3FQnLkMrJKnya/iXq6NxNfGOuMs6B+3qdki2N1W2OwBEAi
         q491ih3o3e1bxfZAbA/Dv/oTKCWdnNdZ8xStnKhPVXl9qOFqCUKLEqGKA9KZBZbgu22N
         dmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747336041; x=1747940841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nBM1YOk0z5CfNMKvHK241ikIo0zaqpU/ycvX2d5cUc=;
        b=KH11OgeFBpbmjVeaYaxPuQJ160AKrCnyvKVTeTkoFOF9vG1IKi7yrVYfRxsG6Sl0AB
         iDkCtoZrlGtPAaikfX9+vkqpzEwsGaXnWkpEJFy4fkvpJg05w3oOpkdzuSkRJ+GWiVyP
         vRLz0lW5KeRDtsS3U0W1CwJLed4FCeZOAiKWnTOoWkn2QtyF3wtCfwgnUabUwr39QHwk
         4fJ5UuENWgMeG1UjHT36VXHdpvHIWZnTCXNCQvGFEinEenrSirWbP5PGGZj2/LB/vHBE
         R2Jsfi2HGRQEfvP/N5QpCXxB3htsrlZo+t/ir9cXN72HKxghzrVW6sLPFIm9p009Shs9
         xOAQ==
X-Gm-Message-State: AOJu0YzFwJuQCcGM9DNbBsavILRq2kAJGkuyuMzj4YBAAsJerDmgKgzn
	MznYsTeNR/VllYtQUrmEFbyoZnMvpixtJbBBzwlACM6vJ39B0kiuh0+lBYQAJBX0H4+Hkw==
X-Gm-Gg: ASbGncsIGuHjczWPNzbPfMNHn8BLzJ3V5yZzzMySajU/1AGWrSYY8Od5HIgp9O0TfzR
	o2es3cRyB1KrNtO7/nfkMlhDRtVb7lVVGGxoiBxl5Taw693PKwmjQXpR2nhpfr1TNyU2sIP8mR7
	CCI4VeCkS6DMpQi8Ifd6zasol1S3o2QUZZs3H/0y7edq+Yv2Dmaid0/BFSxEQ23IbLuOkZTgOa0
	94JgtIs05GHXAjYmKBD8k/1p567+HdXclo/3nQbUQKH6Kg8gZBSLPe7lgiJduR3uJvgJ8a16lCu
	f6sH0kCuUy7sJD9eHXlhOOxgtQTERB1jjMlnmutBYIM2xA==
X-Google-Smtp-Source: AGHT+IE+0sXnxXyE/DAo99fxqof9peFlbaqUjpgEGpws2o0PdxdIsZXIypf8c2ma1iouttDCOrH8Yw==
X-Received: by 2002:a17:903:b4e:b0:224:8bf:6d83 with SMTP id d9443c01a7336-231d43d1938mr2712735ad.8.1747336040671;
        Thu, 15 May 2025 12:07:20 -0700 (PDT)
Received: from fedora.. ([136.158.31.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb121sm1148995ad.202.2025.05.15.12.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:07:20 -0700 (PDT)
From: keenplify <keenplify@gmail.com>
To: linux-input@vger.kernel.org
Cc: linuxhid@cosmicgizmosystems.com,
	jikos@kernel.org,
	keenplify <keenplify@gmail.com>
Subject: [PATCH] HID: add support for Rakk Dasig X mouse (248a:8266)
Date: Fri, 16 May 2025 03:06:40 +0800
Message-ID: <20250515190640.15600-1-keenplify@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CANTHs-61C+S01crRDHYvS8Sa-mxtG1TeAszc+_PjN9aV4s6-GA@mail.gmail.com>
References: <CANTHs-61C+S01crRDHYvS8Sa-mxtG1TeAszc+_PjN9aV4s6-GA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a HID quirk driver for the Rakk Dasig X gaming mouse
to expose the side buttons properly via evdev. The default report
descriptor does not expose all inputs, so this driver replaces
it with a fixed descriptor.

Reported-by: Keenplify <keenplify@gmail.com>
Tested-by: Keenplify <keenplify@gmail.com>
Signed-off-by: Keenplify <keenplify@gmail.com>
Signed-off-by: keenplify <keenplify@gmail.com>
---
 drivers/hid/Kconfig    |  6 ++++++
 drivers/hid/Makefile   |  1 +
 drivers/hid/hid-ids.h  |  3 +++
 drivers/hid/hid-rakk.c | 45 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 drivers/hid/hid-rakk.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a503252702b7..a2cf200e841b 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1413,6 +1413,12 @@ config HID_KUNIT_TEST
 
 	  If in doubt, say "N".
 
+config HID_RAKK
+	tristate "RAKK HID driver"
+	depends on HID
+	help
+		Support for the RAKK HID device.
+
 endmenu
 
 source "drivers/hid/bpf/Kconfig"
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 10ae5dedbd84..4ece64ebf2ec 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -113,6 +113,7 @@ obj-$(CONFIG_HID_PLAYSTATION)	+= hid-playstation.o
 obj-$(CONFIG_HID_PRIMAX)	+= hid-primax.o
 obj-$(CONFIG_HID_PXRC)		+= hid-pxrc.o
 obj-$(CONFIG_HID_RAZER)	+= hid-razer.o
+obj-$(CONFIG_HID_RAKK)		+= hid-rakk.o
 obj-$(CONFIG_HID_REDRAGON)	+= hid-redragon.o
 obj-$(CONFIG_HID_RETRODE)	+= hid-retrode.o
 obj-$(CONFIG_HID_ROCCAT)	+= hid-roccat.o hid-roccat-common.o \
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 288a2b864cc4..a052a307fdda 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1520,4 +1520,7 @@
 #define USB_VENDOR_ID_SIGNOTEC			0x2133
 #define USB_DEVICE_ID_SIGNOTEC_VIEWSONIC_PD1011	0x0018
 
+#define USB_VENDOR_ID_RAKK        0x248a
+#define USB_DEVICE_ID_RAKK_DASIGX 0xfa02
+
 #endif
diff --git a/drivers/hid/hid-rakk.c b/drivers/hid/hid-rakk.c
new file mode 100644
index 000000000000..38abf92e764a
--- /dev/null
+++ b/drivers/hid/hid-rakk.c
@@ -0,0 +1,45 @@
+#include <linux/module.h>
+#include <linux/hid.h>
+
+#include "hid-ids.h"
+
+static const __u8 *rakk_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+                                     unsigned int *rsize)
+
+{
+    static __u8 fixed_rdesc[] = {
+        0x05, 0x01, 0x09, 0x02, 0xa1, 0x01, 0x85, 0x01,
+        0x09, 0x01, 0xa1, 0x00, 0x05, 0x09, 0x19, 0x01,
+        0x29, 0x05,
+        0x15, 0x00, 0x25, 0x01, 0x75, 0x01, 0x95, 0x05,
+        0x81, 0x02, 0x75, 0x03, 0x95, 0x01, 0x81, 0x01,
+        0x05, 0x01, 0x09, 0x30, 0x09, 0x31, 0x16, 0x01,
+        0x80, 0x26, 0xff, 0x7f, 0x75, 0x10, 0x95, 0x02,
+        0x81, 0x06, 0x09, 0x38, 0x15, 0x81, 0x25, 0x7f,
+        0x75, 0x08, 0x95, 0x01, 0x81, 0x06, 0xc0, 0xc0
+    };
+
+    if (*rsize >= sizeof(fixed_rdesc)) {
+        *rsize = sizeof(fixed_rdesc);
+        return fixed_rdesc;
+    }
+
+    return rdesc;
+}
+
+static const struct hid_device_id rakk_devices[] = {
+    { HID_USB_DEVICE(USB_VENDOR_ID_RAKK, USB_DEVICE_ID_RAKK_DASIGX) },
+    { }
+};
+MODULE_DEVICE_TABLE(hid, rakk_devices);
+
+static struct hid_driver rakk_driver = {
+    .name = "hid-rakk",
+    .id_table = rakk_devices,
+    .report_fixup = rakk_report_fixup,
+};
+module_hid_driver(rakk_driver);
+
+MODULE_AUTHOR("keenplify");
+MODULE_DESCRIPTION("Fix for Rakk Dasig X side buttons");
+MODULE_LICENSE("GPL");
\ No newline at end of file
-- 
2.49.0


