Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4431B85E2
	for <lists+linux-input@lfdr.de>; Sat, 25 Apr 2020 12:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgDYK7Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Apr 2020 06:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726050AbgDYK7Q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Apr 2020 06:59:16 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CAAC09B04A
        for <linux-input@vger.kernel.org>; Sat, 25 Apr 2020 03:59:16 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id fu13so4389064pjb.5
        for <linux-input@vger.kernel.org>; Sat, 25 Apr 2020 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/UOIBA04AFgjepOASpTxpEkjvC5TJ1xzwXdPeenoKTY=;
        b=ZCJDdZBfkM++0eyn2+5GcHsEQIGH4HqbBCkiZl81h5Q7NG/eVZdXib6vowarp1BrPS
         W2dbzdkwJyBaky4riQAkY4O3X3SjW9DGJRQlw3A4q2UBgbXkllhBIozbhoHaqzQLZbc8
         8RTc/c692hdjUKr8W2M5wA78uNRM2ULdvM1HvdFZRNQszK7clEW+RTPUDbxr/DcYRnBm
         Et9BMaOgUi1PxbtMfrbm3/r/K5YXrRlmo0aEUyO2Fhih/4QDOERRr2yroogpIoDjcqSS
         hIG2eb9XlaHGrRTHVohaSSYsiAuWG11Dsd/xPKt9eu/5ZG8/fYp3hzKDmptZBSDxAm9D
         FnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/UOIBA04AFgjepOASpTxpEkjvC5TJ1xzwXdPeenoKTY=;
        b=INI68k1FsHym148l18OkKt9aokKD4VgZaNBbrmuLaFT1Z/aZqumE+RbIM5OamYVT9K
         Pu0yQ14YwQrzTazeik8WcEXzSe+cWcHmSgBMphsmRh1UC5Z0yEjVKFEf5uANllgPtP3Z
         rdhzXbJTj7ACR+5uLvqck593t23vS05kcRbb7sTDR70Xx30mPbbXwKzdV/btYV6GuDYA
         i6xBM4l2kcPPNPkjYj5xbp/NXOnUaPh7kwr64dd3oLR/H8eLvzUejnIp5MoTkHDWd1hP
         N80nfLlzVBQrrpIKxik4uxSbL1P59j2MQt5SEnDFDejdqn2OBcd3ZwGpfZSq5D/l7dzq
         Qd9Q==
X-Gm-Message-State: AGi0Puafm2RuH+yioqn47Wl5u0/tfi/1LbHQ9bFSLd6rSkvOaasY8RMs
        CRKTsoWNrSG7Vb0GX/Qzszc=
X-Google-Smtp-Source: APiQypK/SzEiZZlueJMtMXd3XMCrxOH4Q+S3RkFLi2DVdjzQuVwrOX3SetEQgDIaJjabxdXylRrNtw==
X-Received: by 2002:a17:902:44d:: with SMTP id 71mr14395951ple.123.1587812355854;
        Sat, 25 Apr 2020 03:59:15 -0700 (PDT)
Received: from localhost.localdomain (14-201-44-137.tpgi.com.au. [14.201.44.137])
        by smtp.gmail.com with ESMTPSA id b3sm6943811pgh.75.2020.04.25.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 03:59:15 -0700 (PDT)
From:   Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
Subject: [PATCH] HID: i2c-hid: reset Synaptics SYNA2393 on resume
Date:   Sat, 25 Apr 2020 20:58:17 +1000
Message-Id: <20200425105817.27084-1-daniel.playfair.cal@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On the Dell XPS 9570, the Synaptics SYNA2393 touchpad generates spurious
interrupts after resuming from suspend until it receives some input or
is reset. Add it to the quirk I2C_HID_QUIRK_RESET_ON_RESUME so that it
is reset when resuming from suspend.

More information about the bug can be found in this mailing list
discussion: https://www.spinics.net/lists/linux-input/msg59530.html

Signed-off-by: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
---
 drivers/hid/hid-ids.h              | 3 +++
 drivers/hid/i2c-hid/i2c-hid-core.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b18b13147a6f..984011835ce9 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1097,6 +1097,9 @@
 #define USB_DEVICE_ID_SYMBOL_SCANNER_2	0x1300
 #define USB_DEVICE_ID_SYMBOL_SCANNER_3	0x1200
 
+#define I2C_VENDOR_ID_SYNAPTICS     0x06cb
+#define I2C_PRODUCT_ID_SYNAPTICS_SYNA2393   0x7a13
+
 #define USB_VENDOR_ID_SYNAPTICS		0x06cb
 #define USB_DEVICE_ID_SYNAPTICS_TP	0x0001
 #define USB_DEVICE_ID_SYNAPTICS_INT_TP	0x0002
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 009000c5d55c..294c84e136d7 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -177,6 +177,8 @@ static const struct i2c_hid_quirks {
 		 I2C_HID_QUIRK_BOGUS_IRQ },
 	{ USB_VENDOR_ID_ALPS_JP, HID_ANY_ID,
 		 I2C_HID_QUIRK_RESET_ON_RESUME },
+	{ I2C_VENDOR_ID_SYNAPTICS, I2C_PRODUCT_ID_SYNAPTICS_SYNA2393,
+		 I2C_HID_QUIRK_RESET_ON_RESUME },
 	{ USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
 		I2C_HID_QUIRK_BAD_INPUT_SIZE },
 	{ 0, 0 }
-- 
2.26.2

