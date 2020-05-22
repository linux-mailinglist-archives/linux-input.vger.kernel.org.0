Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04A331DE2A0
	for <lists+linux-input@lfdr.de>; Fri, 22 May 2020 11:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729514AbgEVJKF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 May 2020 05:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgEVJKE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 May 2020 05:10:04 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE84C061A0E
        for <linux-input@vger.kernel.org>; Fri, 22 May 2020 02:10:04 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n11so4719439pgl.9
        for <linux-input@vger.kernel.org>; Fri, 22 May 2020 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=XQaBVKPb2cdTypH8lTyT3QjHXrnHxUj6waQ7hqlAw3w=;
        b=kj5L5+rh7ejppOUOFQDdKAhRoCecg0CZCzEaVoaF6mQcRKCx30cWfYDuIIqib9GcIS
         8ExzbAnQHBcAp8oUnDkQzc0hT6099Z7lIqP5BCdxis+KMAyM5Ru/i4BU/PawSHPkTdKJ
         fBCr8kzLFB9XMmIWaJnMxqRkEvamAi03NF+tcRkYJIwfKAJJPYwvH8cqqDRUZ3rdd2JI
         iQh10GXSXPq2tUhcXLWg/833hJbfWPS2/lwu8fthb3LfxPTkDGlRd9uSdkVJ299z+7p7
         f9pkC6n/lOPctoW4DFKzXeAlh2BSP2qpeNPWojASfHi0kWpyqfhPZYFo2x3c/nvwG7NX
         Tnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XQaBVKPb2cdTypH8lTyT3QjHXrnHxUj6waQ7hqlAw3w=;
        b=j++8C63ZWHbaUkk3a7rg7KUgnzD1LX4QM2duBo916DcSVx9cBMvbVvO6HevFvNLBHh
         5CoXeyp7J7R4Kw643oBfZcLoLbI1FE4lEJq9mn/9FTEOFD5o7skVa3oGNXtMzfb5xelO
         +6cGIFSAQGzKncDYwrrfeRreq+olsMUh1So2dsc7T6SB1B13umXvBK0MpSg+9MRSLscB
         hmhhgh0+37YulRgC4SF/qenuEJB9Y0hTJ42i2wsbOm2J6wD8DSdkxksNUm7yNVJfgirH
         R+cJx/DABcvkENlovs9kf15gDKYvydszQTBdsm6d1QKY8/C9cRuCqrFMUO2JCsJFVn3z
         Hsvw==
X-Gm-Message-State: AOAM533xRNZdq//a6qrwjXdBbd9FbSP02kDFsk+fTA10qDmLe7byaOin
        kILOMmMtTUR92vzXIKolgDI=
X-Google-Smtp-Source: ABdhPJyHbOxsETqE/hkIEUzV63230lL1FCSPJLFlH/E9ggEeLUk9XQliieQF+q3hDamxOCFiWo3r2A==
X-Received: by 2002:a62:1d48:: with SMTP id d69mr3026669pfd.27.1590138603731;
        Fri, 22 May 2020 02:10:03 -0700 (PDT)
Received: from localhost.localdomain ([128.1.231.46])
        by smtp.googlemail.com with ESMTPSA id d22sm5841286pgh.64.2020.05.22.02.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 02:10:02 -0700 (PDT)
From:   Caiyuan Xie <shirleyxcy@gmail.com>
X-Google-Original-From: Caiyuan Xie <Shirleyxcy@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, Caiyuan Xie <Shirleyxcy@gmail.com>,
        Caiyuan Xie <caiyuan.xie@cn.alps.com>
Subject: [PATCH] add alps devices to the hid-ids.h
Date:   Fri, 22 May 2020 05:09:37 -0400
Message-Id: <20200522090937.5917-1-Shirleyxcy@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



<Change List>
--Add ALPS devices 

Signed-off-by: Caiyuan Xie <caiyuan.xie@cn.alps.com>
---
 drivers/hid/hid-ids.h | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 1c71a1aa76b2..db318e6a1ad1 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -78,11 +78,26 @@
 #define HID_DEVICE_ID_ALPS_U1_DUAL	0x120B
 #define HID_DEVICE_ID_ALPS_U1_DUAL_PTP	0x121F
 #define HID_DEVICE_ID_ALPS_U1_DUAL_3BTN_PTP	0x1220
-#define HID_DEVICE_ID_ALPS_U1		0x1215
+#define HID_DEVICE_ID_ALPS_U1_OLDMAN		0x1215
 #define HID_DEVICE_ID_ALPS_U1_UNICORN_LEGACY         0x121E
 #define HID_DEVICE_ID_ALPS_T4_BTNLESS	0x120C
 #define HID_DEVICE_ID_ALPS_1222		0x1222
 
+#define HID_DEVICE_ID_ALPS_COSMO		0x1202
+#define HID_DEVICE_ID_ALPS_T4_MERITAGE		0x120D
+#define HID_DEVICE_ID_ALPS_U1		0x1209
+#define HID_DEVICE_ID_ALPS_U1_PTP_1		0x1207
+#define HID_DEVICE_ID_ALPS_U1_PTP_2		0x120A
+#define HID_DEVICE_ID_ALPS_U1_FW_PTP		0x120A
+#define HID_DEVICE_ID_ALPS_T4_PRADA			0x1216
+#define HID_DEVICE_ID_ALPS_T4_NOX_GIA		0x1217
+#define HID_DEVICE_ID_ALPS_FW_PTP_AP1		0x121B
+#define HID_DEVICE_ID_ALPS_FW_PTP_CP1		0x121C
+#define HID_DEVICE_ID_ALPS_MEGATRON		0x121A
+#define HID_DEVICE_ID_ALPS_KICKBACK		0x121D
+
+
+
 #define USB_VENDOR_ID_AMI		0x046b
 #define USB_DEVICE_ID_AMI_VIRT_KEYBOARD_AND_MOUSE	0xff10
 
@@ -385,7 +400,6 @@
 #define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_7349	0x7349
 #define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_73F7	0x73f7
 #define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_A001	0xa001
-#define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_C002	0xc002
 
 #define USB_VENDOR_ID_ELAN		0x04f3
 #define USB_DEVICE_ID_TOSHIBA_CLICK_L9W	0x0401
@@ -465,10 +479,6 @@
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_010A 0x010a
 #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
 
-#define USB_VENDOR_ID_GLORIOUS  0x258a
-#define USB_DEVICE_ID_GLORIOUS_MODEL_D 0x0033
-#define USB_DEVICE_ID_GLORIOUS_MODEL_O 0x0036
-
 #define I2C_VENDOR_ID_GOODIX		0x27c6
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
 
@@ -760,7 +770,6 @@
 #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2	0xc218
 #define USB_DEVICE_ID_LOGITECH_RUMBLEPAD2_2	0xc219
 #define USB_DEVICE_ID_LOGITECH_G15_LCD		0xc222
-#define USB_DEVICE_ID_LOGITECH_G11		0xc225
 #define USB_DEVICE_ID_LOGITECH_G15_V2_LCD	0xc227
 #define USB_DEVICE_ID_LOGITECH_G510		0xc22d
 #define USB_DEVICE_ID_LOGITECH_G510_USB_AUDIO	0xc22e
@@ -827,7 +836,6 @@
 #define USB_DEVICE_ID_PICK16F1454	0x0042
 #define USB_DEVICE_ID_PICK16F1454_V2	0xf2f7
 #define USB_DEVICE_ID_LUXAFOR		0xf372
-#define USB_DEVICE_ID_MCP2221		0x00dd
 
 #define USB_VENDOR_ID_MICROSOFT		0x045e
 #define USB_DEVICE_ID_SIDEWINDER_GV	0x003b
@@ -1099,9 +1107,6 @@
 #define USB_DEVICE_ID_SYMBOL_SCANNER_2	0x1300
 #define USB_DEVICE_ID_SYMBOL_SCANNER_3	0x1200
 
-#define I2C_VENDOR_ID_SYNAPTICS     0x06cb
-#define I2C_PRODUCT_ID_SYNAPTICS_SYNA2393   0x7a13
-
 #define USB_VENDOR_ID_SYNAPTICS		0x06cb
 #define USB_DEVICE_ID_SYNAPTICS_TP	0x0001
 #define USB_DEVICE_ID_SYNAPTICS_INT_TP	0x0002
@@ -1116,7 +1121,6 @@
 #define USB_DEVICE_ID_SYNAPTICS_LTS2	0x1d10
 #define USB_DEVICE_ID_SYNAPTICS_HD	0x0ac3
 #define USB_DEVICE_ID_SYNAPTICS_QUAD_HD	0x1ac3
-#define USB_DEVICE_ID_SYNAPTICS_DELL_K12A	0x2819
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012	0x2968
 #define USB_DEVICE_ID_SYNAPTICS_TP_V103	0x5710
 #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5	0x81a7
-- 
2.17.1

