Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B71876753DD
	for <lists+linux-input@lfdr.de>; Fri, 20 Jan 2023 12:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjATLxo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Jan 2023 06:53:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjATLxn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Jan 2023 06:53:43 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799D38A6E;
        Fri, 20 Jan 2023 03:53:35 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id o13so5379183pjg.2;
        Fri, 20 Jan 2023 03:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7A+mz19SqKQdQRfHZ+N7cRt6qVRIEgym994T+luPOw=;
        b=onVjXi7OCyMz4706YmcshQy32V7XgjCkmjc2tVQZOc8Hvu5TjMOSrcZBSqYXomjitE
         M5ycLi1z3u5WRx0SVhy/EfZVNRO0hrd9hqKxZZu8AnJTkiQT2TRM60CIKfEfKrYXDgWr
         f0LprSlTmKfmL3ws2eKAS6UqXplpvhTxyEN/SrAuSnGOrVKe66pEeSD8T1cp33VuoEPF
         2EmrPNUeLDwlAL75eFsFnaBl7ZJrEWTWDImCnilryCkVn8Z742ie9MkGN3PUfbpkgts7
         uSiXNI98MOXMC3NDa761zasPGYV+BY43nBlsZbsW7phN1LWVLPI8JohpHUagqeexfAZU
         MGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7A+mz19SqKQdQRfHZ+N7cRt6qVRIEgym994T+luPOw=;
        b=XYWqxzMbaRUBtlZw6m2yIEDd8vdq2G2HY2bsWYIOtyrYdiZ/DktTvOVCXfvN915Do6
         RF6Al9DDQ6HIIbchgeJFxq91YocLW3DIeenz2Gi2+dWd7QAI8/aMkDWb0XveyCU+N2pY
         /pbmWRo94qsWwdrrX0bJzQZDsGprVIc4PRawrKgmKKWXH41oNG3j14d6IuCqUiaZs9fG
         DGL4y9UnFO4AS16x64dvyPm5TtrmX9iqlya08mXBKKU8dPuh+yR2lQPB0qxkt2ofC61p
         gsp124ldFN5BQs6fJw2DsxQB59/LYv8/tUD07z74pBr+UQeCeiAXfglCyG+nteRtYy+G
         dEQg==
X-Gm-Message-State: AFqh2kqHk8VALKysD3gM7zy3D86/WnYobqG+IqQpj+nV/DX4noZRzCWJ
        imb5kyPENymv3exQd1/HNUsfx0eDt0MblUI8fvU=
X-Google-Smtp-Source: AMrXdXtEBCkpWwuYR+1wyp1XKE7HE04/ioQ1X9uTiK2mFlLeRvCdDQdupNRTSkLWz9TgQot8FX8j6A==
X-Received: by 2002:a17:902:9690:b0:193:6520:739a with SMTP id n16-20020a170902969000b001936520739amr34284291plp.46.1674215614446;
        Fri, 20 Jan 2023 03:53:34 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.245.200])
        by smtp.gmail.com with ESMTPSA id h1-20020a170902f54100b00195f097bc98sm138661plf.83.2023.01.20.03.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 03:53:34 -0800 (PST)
From:   yangfl <mmyangfl@gmail.com>
X-Google-Original-From: yangfl <yangfl@users.noreply.github.com>
To:     mmyangfl@gmail.com
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] HID: kye: Add support for all kye tablets
Date:   Fri, 20 Jan 2023 19:53:07 +0800
Message-Id: <20230120115308.2610-1-yangfl@users.noreply.github.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221124031537.6890-1-mmyangfl@gmail.com>
References: <20221124031537.6890-1-mmyangfl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: David Yang <mmyangfl@gmail.com>

Genius digitizer tablets send incorrect report descriptor by default. This
patch collects their physical data from Windows driver, and use it to
generate correct HID reports.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v2: fix missing rsize assignment
v3: fix geometry
 drivers/hid/hid-ids.h    |   9 +-
 drivers/hid/hid-kye.c    | 886 ++++++++++++++++-----------------------
 drivers/hid/hid-quirks.c |  14 +-
 3 files changed, 392 insertions(+), 517 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0f8c11842a3a..11153d897db7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -712,12 +712,19 @@
 #define USB_DEVICE_ID_GENIUS_MANTICORE	0x0153
 #define USB_DEVICE_ID_GENIUS_GX_IMPERATOR	0x4018
 #define USB_DEVICE_ID_KYE_GPEN_560	0x5003
+#define USB_DEVICE_ID_KYE_EASYPEN_M406	0x5005
+#define USB_DEVICE_ID_KYE_EASYPEN_M506	0x500F
 #define USB_DEVICE_ID_KYE_EASYPEN_I405X	0x5010
 #define USB_DEVICE_ID_KYE_MOUSEPEN_I608X	0x5011
-#define USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2	0x501a
+#define USB_DEVICE_ID_KYE_EASYPEN_M406W	0x5012
 #define USB_DEVICE_ID_KYE_EASYPEN_M610X	0x5013
+#define USB_DEVICE_ID_KYE_EASYPEN_340	0x5014
 #define USB_DEVICE_ID_KYE_PENSKETCH_M912	0x5015
+#define USB_DEVICE_ID_KYE_MOUSEPEN_M508WX	0x5016
+#define USB_DEVICE_ID_KYE_MOUSEPEN_M508X	0x5017
 #define USB_DEVICE_ID_KYE_EASYPEN_M406XE	0x5019
+#define USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2	0x501A
+#define USB_DEVICE_ID_KYE_PENSKETCH_T609A	0x501B
 
 #define USB_VENDOR_ID_LABTEC		0x1020
 #define USB_DEVICE_ID_LABTEC_WIRELESS_KEYBOARD	0x0006
diff --git a/drivers/hid/hid-kye.c b/drivers/hid/hid-kye.c
index da903138eee4..42a7182ffb3a 100644
--- a/drivers/hid/hid-kye.c
+++ b/drivers/hid/hid-kye.c
@@ -5,361 +5,267 @@
  *  Copyright (c) 2009 Jiri Kosina
  *  Copyright (c) 2009 Tomas Hanak
  *  Copyright (c) 2012 Nikolai Kondrashov
+ *  Copyright (c) 2022 David Yang
  */
 
-/*
- */
-
+#include <asm-generic/unaligned.h>
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/module.h>
 
 #include "hid-ids.h"
 
-/* Original EasyPen i405X report descriptor size */
-#define EASYPEN_I405X_RDESC_ORIG_SIZE	476
-
-/* Fixed EasyPen i405X report descriptor */
-static __u8 easypen_i405x_rdesc_fixed[] = {
-	0x06, 0x00, 0xFF, /*  Usage Page (FF00h),             */
-	0x09, 0x01,       /*  Usage (01h),                    */
-	0xA1, 0x01,       /*  Collection (Application),       */
-	0x85, 0x05,       /*    Report ID (5),                */
-	0x09, 0x01,       /*    Usage (01h),                  */
-	0x15, 0x80,       /*    Logical Minimum (-128),       */
-	0x25, 0x7F,       /*    Logical Maximum (127),        */
-	0x75, 0x08,       /*    Report Size (8),              */
-	0x95, 0x07,       /*    Report Count (7),             */
-	0xB1, 0x02,       /*    Feature (Variable),           */
-	0xC0,             /*  End Collection,                 */
-	0x05, 0x0D,       /*  Usage Page (Digitizer),         */
-	0x09, 0x01,       /*  Usage (Digitizer),              */
-	0xA1, 0x01,       /*  Collection (Application),       */
-	0x85, 0x10,       /*    Report ID (16),               */
-	0x09, 0x20,       /*    Usage (Stylus),               */
-	0xA0,             /*    Collection (Physical),        */
-	0x14,             /*      Logical Minimum (0),        */
-	0x25, 0x01,       /*      Logical Maximum (1),        */
-	0x75, 0x01,       /*      Report Size (1),            */
-	0x09, 0x42,       /*      Usage (Tip Switch),         */
-	0x09, 0x44,       /*      Usage (Barrel Switch),      */
-	0x09, 0x46,       /*      Usage (Tablet Pick),        */
-	0x95, 0x03,       /*      Report Count (3),           */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0x95, 0x04,       /*      Report Count (4),           */
-	0x81, 0x03,       /*      Input (Constant, Variable), */
-	0x09, 0x32,       /*      Usage (In Range),           */
-	0x95, 0x01,       /*      Report Count (1),           */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0x75, 0x10,       /*      Report Size (16),           */
-	0x95, 0x01,       /*      Report Count (1),           */
-	0xA4,             /*      Push,                       */
-	0x05, 0x01,       /*      Usage Page (Desktop),       */
-	0x55, 0xFD,       /*      Unit Exponent (-3),         */
-	0x65, 0x13,       /*      Unit (Inch),                */
-	0x34,             /*      Physical Minimum (0),       */
-	0x09, 0x30,       /*      Usage (X),                  */
-	0x46, 0x7C, 0x15, /*      Physical Maximum (5500),    */
-	0x26, 0x00, 0x37, /*      Logical Maximum (14080),    */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0x09, 0x31,       /*      Usage (Y),                  */
-	0x46, 0xA0, 0x0F, /*      Physical Maximum (4000),    */
-	0x26, 0x00, 0x28, /*      Logical Maximum (10240),    */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0xB4,             /*      Pop,                        */
-	0x09, 0x30,       /*      Usage (Tip Pressure),       */
-	0x26, 0xFF, 0x03, /*      Logical Maximum (1023),     */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0xC0,             /*    End Collection,               */
-	0xC0              /*  End Collection                  */
+/* Data gathered from Database/VID0458_PID????/Vista/TBoard/default.xml in ioTablet driver
+ *
+ * TODO:
+ *   - Add battery and sleep support for EasyPen M406W and MousePen M508WX
+ *   - Investigate ScrollZ.MiceFMT buttons of EasyPen M406
+ */
+
+static const __u8 easypen_m406_control_rdesc[] = {
+	0x05, 0x0C,        /*  Usage Page (Consumer),    */
+	0x09, 0x01,        /*  Usage (Consumer Control), */
+	0xA1, 0x01,        /*  Collection (Application), */
+	0x85, 0x12,        /*    Report ID (18),         */
+	0x0A, 0x45, 0x02,  /*    Usage (AC Rotate),      */
+	0x09, 0x40,        /*    Usage (Menu),           */
+	0x0A, 0x2F, 0x02,  /*    Usage (AC Zoom),        */
+	0x0A, 0x46, 0x02,  /*    Usage (AC Resize),      */
+	0x0A, 0x1A, 0x02,  /*    Usage (AC Undo),        */
+	0x0A, 0x6A, 0x02,  /*    Usage (AC Delete),      */
+	0x0A, 0x24, 0x02,  /*    Usage (AC Back),        */
+	0x0A, 0x25, 0x02,  /*    Usage (AC Forward),     */
+	0x14,              /*    Logical Minimum (0),    */
+	0x25, 0x01,        /*    Logical Maximum (1),    */
+	0x75, 0x01,        /*    Report Size (1),        */
+	0x95, 0x08,        /*    Report Count (8),       */
+	0x81, 0x02,        /*    Input (Variable),       */
+	0x95, 0x30,        /*    Report Count (48),      */
+	0x81, 0x01,        /*    Input (Constant),       */
+	0xC0               /*  End Collection            */
 };
 
-/* Original MousePen i608X report descriptor size */
-#define MOUSEPEN_I608X_RDESC_ORIG_SIZE	476
-
-/* Fixed MousePen i608X report descriptor */
-static __u8 mousepen_i608x_rdesc_fixed[] = {
-	0x06, 0x00, 0xFF, /*  Usage Page (FF00h),             */
-	0x09, 0x01,       /*  Usage (01h),                    */
-	0xA1, 0x01,       /*  Collection (Application),       */
-	0x85, 0x05,       /*    Report ID (5),                */
-	0x09, 0x01,       /*    Usage (01h),                  */
-	0x15, 0x80,       /*    Logical Minimum (-128),       */
-	0x25, 0x7F,       /*    Logical Maximum (127),        */
-	0x75, 0x08,       /*    Report Size (8),              */
-	0x95, 0x07,       /*    Report Count (7),             */
-	0xB1, 0x02,       /*    Feature (Variable),           */
-	0xC0,             /*  End Collection,                 */
-	0x05, 0x0D,       /*  Usage Page (Digitizer),         */
-	0x09, 0x01,       /*  Usage (Digitizer),              */
-	0xA1, 0x01,       /*  Collection (Application),       */
-	0x85, 0x10,       /*    Report ID (16),               */
-	0x09, 0x20,       /*    Usage (Stylus),               */
-	0xA0,             /*    Collection (Physical),        */
-	0x14,             /*      Logical Minimum (0),        */
-	0x25, 0x01,       /*      Logical Maximum (1),        */
-	0x75, 0x01,       /*      Report Size (1),            */
-	0x09, 0x42,       /*      Usage (Tip Switch),         */
-	0x09, 0x44,       /*      Usage (Barrel Switch),      */
-	0x09, 0x46,       /*      Usage (Tablet Pick),        */
-	0x95, 0x03,       /*      Report Count (3),           */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0x95, 0x04,       /*      Report Count (4),           */
-	0x81, 0x03,       /*      Input (Constant, Variable), */
-	0x09, 0x32,       /*      Usage (In Range),           */
-	0x95, 0x01,       /*      Report Count (1),           */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0x75, 0x10,       /*      Report Size (16),           */
-	0x95, 0x01,       /*      Report Count (1),           */
-	0xA4,             /*      Push,                       */
-	0x05, 0x01,       /*      Usage Page (Desktop),       */
-	0x55, 0xFD,       /*      Unit Exponent (-3),         */
-	0x65, 0x13,       /*      Unit (Inch),                */
-	0x34,             /*      Physical Minimum (0),       */
-	0x09, 0x30,       /*      Usage (X),                  */
-	0x46, 0x40, 0x1F, /*      Physical Maximum (8000),    */
-	0x26, 0x00, 0x50, /*      Logical Maximum (20480),    */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0x09, 0x31,       /*      Usage (Y),                  */
-	0x46, 0x70, 0x17, /*      Physical Maximum (6000),    */
-	0x26, 0x00, 0x3C, /*      Logical Maximum (15360),    */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0xB4,             /*      Pop,                        */
-	0x09, 0x30,       /*      Usage (Tip Pressure),       */
-	0x26, 0xFF, 0x03, /*      Logical Maximum (1023),     */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0xC0,             /*    End Collection,               */
-	0xC0,             /*  End Collection,                 */
-	0x05, 0x01,       /*  Usage Page (Desktop),           */
-	0x09, 0x02,       /*  Usage (Mouse),                  */
-	0xA1, 0x01,       /*  Collection (Application),       */
-	0x85, 0x11,       /*    Report ID (17),               */
-	0x09, 0x01,       /*    Usage (Pointer),              */
-	0xA0,             /*    Collection (Physical),        */
-	0x14,             /*      Logical Minimum (0),        */
-	0xA4,             /*      Push,                       */
-	0x05, 0x09,       /*      Usage Page (Button),        */
-	0x75, 0x01,       /*      Report Size (1),            */
-	0x19, 0x01,       /*      Usage Minimum (01h),        */
-	0x29, 0x03,       /*      Usage Maximum (03h),        */
-	0x25, 0x01,       /*      Logical Maximum (1),        */
-	0x95, 0x03,       /*      Report Count (3),           */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0x95, 0x05,       /*      Report Count (5),           */
-	0x81, 0x01,       /*      Input (Constant),           */
-	0xB4,             /*      Pop,                        */
-	0x95, 0x01,       /*      Report Count (1),           */
-	0xA4,             /*      Push,                       */
-	0x55, 0xFD,       /*      Unit Exponent (-3),         */
-	0x65, 0x13,       /*      Unit (Inch),                */
-	0x34,             /*      Physical Minimum (0),       */
-	0x75, 0x10,       /*      Report Size (16),           */
-	0x09, 0x30,       /*      Usage (X),                  */
-	0x46, 0x40, 0x1F, /*      Physical Maximum (8000),    */
-	0x26, 0x00, 0x50, /*      Logical Maximum (20480),    */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0x09, 0x31,       /*      Usage (Y),                  */
-	0x46, 0x70, 0x17, /*      Physical Maximum (6000),    */
-	0x26, 0x00, 0x3C, /*      Logical Maximum (15360),    */
-	0x81, 0x02,       /*      Input (Variable),           */
-	0xB4,             /*      Pop,                        */
-	0x75, 0x08,       /*      Report Size (8),            */
-	0x09, 0x38,       /*      Usage (Wheel),              */
-	0x15, 0xFF,       /*      Logical Minimum (-1),       */
-	0x25, 0x01,       /*      Logical Maximum (1),        */
-	0x81, 0x06,       /*      Input (Variable, Relative), */
-	0x81, 0x01,       /*      Input (Constant),           */
-	0xC0,             /*    End Collection,               */
-	0xC0              /*  End Collection                  */
+static const __u8 easypen_m506_control_rdesc[] = {
+	0x05, 0x0C,        /*  Usage Page (Consumer),    */
+	0x09, 0x01,        /*  Usage (Consumer Control), */
+	0xA1, 0x01,        /*  Collection (Application), */
+	0x85, 0x12,        /*    Report ID (18),         */
+	0x0A, 0x6A, 0x02,  /*    Usage (AC Delete),      */
+	0x0A, 0x1A, 0x02,  /*    Usage (AC Undo),        */
+	0x0A, 0x2D, 0x02,  /*    Usage (AC Zoom In),     */
+	0x0A, 0x2E, 0x02,  /*    Usage (AC Zoom Out),    */
+	0x14,              /*    Logical Minimum (0),    */
+	0x25, 0x01,        /*    Logical Maximum (1),    */
+	0x75, 0x01,        /*    Report Size (1),        */
+	0x95, 0x04,        /*    Report Count (4),       */
+	0x81, 0x02,        /*    Input (Variable),       */
+	0x95, 0x34,        /*    Report Count (52),      */
+	0x81, 0x01,        /*    Input (Constant),       */
+	0xC0               /*  End Collection            */
 };
 
-/* Original MousePen i608X v2 report descriptor size */
-#define MOUSEPEN_I608X_V2_RDESC_ORIG_SIZE	482
+static const __u8 easypen_m406w_control_rdesc[] = {
+	0x05, 0x0C,        /*  Usage Page (Consumer),    */
+	0x09, 0x01,        /*  Usage (Consumer Control), */
+	0xA1, 0x01,        /*  Collection (Application), */
+	0x85, 0x12,        /*    Report ID (18),         */
+	0x0A, 0x6A, 0x02,  /*    Usage (AC Delete),      */
+	0x0A, 0x1A, 0x02,  /*    Usage (AC Undo),        */
+	0x0A, 0x01, 0x02,  /*    Usage (AC New),         */
+	0x09, 0x40,        /*    Usage (Menu),           */
+	0x14,              /*    Logical Minimum (0),    */
+	0x25, 0x01,        /*    Logical Maximum (1),    */
+	0x75, 0x01,        /*    Report Size (1),        */
+	0x95, 0x04,        /*    Report Count (4),       */
+	0x81, 0x02,        /*    Input (Variable),       */
+	0x95, 0x34,        /*    Report Count (52),      */
+	0x81, 0x01,        /*    Input (Constant),       */
+	0xC0               /*  End Collection            */
+};
 
-/* Fixed MousePen i608X v2 report descriptor */
-static __u8 mousepen_i608x_v2_rdesc_fixed[] = {
-	0x06, 0x00, 0xFF,             /*  Usage Page (FF00h),             */
-	0x09, 0x01,                   /*  Usage (01h),                    */
-	0xA1, 0x01,                   /*  Collection (Application),       */
-	0x85, 0x05,                   /*    Report ID (5),                */
-	0x09, 0x01,                   /*    Usage (01h),                  */
-	0x15, 0x80,                   /*    Logical Minimum (-128),       */
-	0x25, 0x7F,                   /*    Logical Maximum (127),        */
-	0x75, 0x08,                   /*    Report Size (8),              */
-	0x95, 0x07,                   /*    Report Count (7),             */
-	0xB1, 0x02,                   /*    Feature (Variable),           */
-	0xC0,                         /*  End Collection,                 */
-	0x05, 0x0D,                   /*  Usage Page (Digitizer),         */
-	0x09, 0x01,                   /*  Usage (Digitizer),              */
-	0xA1, 0x01,                   /*  Collection (Application),       */
-	0x85, 0x10,                   /*    Report ID (16),               */
-	0x09, 0x20,                   /*    Usage (Stylus),               */
-	0xA0,                         /*    Collection (Physical),        */
-	0x14,                         /*      Logical Minimum (0),        */
-	0x25, 0x01,                   /*      Logical Maximum (1),        */
-	0x75, 0x01,                   /*      Report Size (1),            */
-	0x09, 0x42,                   /*      Usage (Tip Switch),         */
-	0x09, 0x44,                   /*      Usage (Barrel Switch),      */
-	0x09, 0x46,                   /*      Usage (Tablet Pick),        */
-	0x95, 0x03,                   /*      Report Count (3),           */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0x95, 0x04,                   /*      Report Count (4),           */
-	0x81, 0x03,                   /*      Input (Constant, Variable), */
-	0x09, 0x32,                   /*      Usage (In Range),           */
-	0x95, 0x01,                   /*      Report Count (1),           */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0x75, 0x10,                   /*      Report Size (16),           */
-	0x95, 0x01,                   /*      Report Count (1),           */
-	0xA4,                         /*      Push,                       */
-	0x05, 0x01,                   /*      Usage Page (Desktop),       */
-	0x55, 0xFD,                   /*      Unit Exponent (-3),         */
-	0x65, 0x13,                   /*      Unit (Inch),                */
-	0x34,                         /*      Physical Minimum (0),       */
-	0x09, 0x30,                   /*      Usage (X),                  */
-	0x46, 0x40, 0x1F,             /*      Physical Maximum (8000),    */
-	0x27, 0x00, 0xA0, 0x00, 0x00, /*      Logical Maximum (40960),    */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0x09, 0x31,                   /*      Usage (Y),                  */
-	0x46, 0x70, 0x17,             /*      Physical Maximum (6000),    */
-	0x26, 0x00, 0x78,             /*      Logical Maximum (30720),    */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0xB4,                         /*      Pop,                        */
-	0x09, 0x30,                   /*      Usage (Tip Pressure),       */
-	0x26, 0xFF, 0x07,             /*      Logical Maximum (2047),     */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0xC0,                         /*    End Collection,               */
-	0xC0,                         /*  End Collection,                 */
-	0x05, 0x01,                   /*  Usage Page (Desktop),           */
-	0x09, 0x02,                   /*  Usage (Mouse),                  */
-	0xA1, 0x01,                   /*  Collection (Application),       */
-	0x85, 0x11,                   /*    Report ID (17),               */
-	0x09, 0x01,                   /*    Usage (Pointer),              */
-	0xA0,                         /*    Collection (Physical),        */
-	0x14,                         /*      Logical Minimum (0),        */
-	0xA4,                         /*      Push,                       */
-	0x05, 0x09,                   /*      Usage Page (Button),        */
-	0x75, 0x01,                   /*      Report Size (1),            */
-	0x19, 0x01,                   /*      Usage Minimum (01h),        */
-	0x29, 0x03,                   /*      Usage Maximum (03h),        */
-	0x25, 0x01,                   /*      Logical Maximum (1),        */
-	0x95, 0x03,                   /*      Report Count (3),           */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0x95, 0x05,                   /*      Report Count (5),           */
-	0x81, 0x01,                   /*      Input (Constant),           */
-	0xB4,                         /*      Pop,                        */
-	0x95, 0x01,                   /*      Report Count (1),           */
-	0xA4,                         /*      Push,                       */
-	0x55, 0xFD,                   /*      Unit Exponent (-3),         */
-	0x65, 0x13,                   /*      Unit (Inch),                */
-	0x34,                         /*      Physical Minimum (0),       */
-	0x75, 0x10,                   /*      Report Size (16),           */
-	0x09, 0x30,                   /*      Usage (X),                  */
-	0x46, 0x40, 0x1F,             /*      Physical Maximum (8000),    */
-	0x27, 0x00, 0xA0, 0x00, 0x00, /*      Logical Maximum (40960),    */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0x09, 0x31,                   /*      Usage (Y),                  */
-	0x46, 0x70, 0x17,             /*      Physical Maximum (6000),    */
-	0x26, 0x00, 0x78,             /*      Logical Maximum (30720),    */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0xB4,                         /*      Pop,                        */
-	0x75, 0x08,                   /*      Report Size (8),            */
-	0x09, 0x38,                   /*      Usage (Wheel),              */
-	0x15, 0xFF,                   /*      Logical Minimum (-1),       */
-	0x25, 0x01,                   /*      Logical Maximum (1),        */
-	0x81, 0x06,                   /*      Input (Variable, Relative), */
-	0x81, 0x01,                   /*      Input (Constant),           */
-	0xC0,                         /*    End Collection,               */
-	0xC0                          /*  End Collection                  */
+static const __u8 easypen_m610x_control_rdesc[] = {
+	0x05, 0x0C,        /*  Usage Page (Consumer),       */
+	0x09, 0x01,        /*  Usage (Consumer Control),    */
+	0xA1, 0x01,        /*  Collection (Application),    */
+	0x85, 0x12,        /*    Report ID (18),            */
+	0x0A, 0x1A, 0x02,  /*    Usage (AC Undo),           */
+	0x0A, 0x79, 0x02,  /*    Usage (AC Redo Or Repeat), */
+	0x0A, 0x2D, 0x02,  /*    Usage (AC Zoom In),        */
+	0x0A, 0x2E, 0x02,  /*    Usage (AC Zoom Out),       */
+	0x14,              /*    Logical Minimum (0),       */
+	0x25, 0x01,        /*    Logical Maximum (1),       */
+	0x75, 0x01,        /*    Report Size (1),           */
+	0x95, 0x04,        /*    Report Count (4),          */
+	0x81, 0x02,        /*    Input (Variable),          */
+	0x95, 0x34,        /*    Report Count (52),         */
+	0x81, 0x01,        /*    Input (Constant),          */
+	0xC0               /*  End Collection               */
 };
 
-/* Original EasyPen M610X report descriptor size */
-#define EASYPEN_M610X_RDESC_ORIG_SIZE	476
+static const __u8 pensketch_m912_control_rdesc[] = {
+	0x05, 0x0C,        /*  Usage Page (Consumer),        */
+	0x09, 0x01,        /*  Usage (Consumer Control),     */
+	0xA1, 0x01,        /*  Collection (Application),     */
+	0x85, 0x12,        /*    Report ID (18),             */
+	0x14,              /*    Logical Minimum (0),        */
+	0x25, 0x01,        /*    Logical Maximum (1),        */
+	0x75, 0x01,        /*    Report Size (1),            */
+	0x95, 0x08,        /*    Report Count (8),           */
+	0x05, 0x0C,        /*    Usage Page (Consumer),      */
+	0x0A, 0x6A, 0x02,  /*    Usage (AC Delete),          */
+	0x0A, 0x1A, 0x02,  /*    Usage (AC Undo),            */
+	0x0A, 0x01, 0x02,  /*    Usage (AC New),             */
+	0x0A, 0x2F, 0x02,  /*    Usage (AC Zoom),            */
+	0x0A, 0x25, 0x02,  /*    Usage (AC Forward),         */
+	0x0A, 0x24, 0x02,  /*    Usage (AC Back),            */
+	0x0A, 0x2D, 0x02,  /*    Usage (AC Zoom In),         */
+	0x0A, 0x2E, 0x02,  /*    Usage (AC Zoom Out),        */
+	0x81, 0x02,        /*    Input (Variable),           */
+	0x95, 0x30,        /*    Report Count (48),          */
+	0x81, 0x03,        /*    Input (Constant, Variable), */
+	0xC0               /*  End Collection                */
+};
 
-/* Fixed EasyPen M610X report descriptor */
-static __u8 easypen_m610x_rdesc_fixed[] = {
-	0x06, 0x00, 0xFF,             /*  Usage Page (FF00h),             */
-	0x09, 0x01,                   /*  Usage (01h),                    */
-	0xA1, 0x01,                   /*  Collection (Application),       */
-	0x85, 0x05,                   /*    Report ID (5),                */
-	0x09, 0x01,                   /*    Usage (01h),                  */
-	0x15, 0x80,                   /*    Logical Minimum (-128),       */
-	0x25, 0x7F,                   /*    Logical Maximum (127),        */
-	0x75, 0x08,                   /*    Report Size (8),              */
-	0x95, 0x07,                   /*    Report Count (7),             */
-	0xB1, 0x02,                   /*    Feature (Variable),           */
-	0xC0,                         /*  End Collection,                 */
-	0x05, 0x0D,                   /*  Usage Page (Digitizer),         */
-	0x09, 0x01,                   /*  Usage (Digitizer),              */
-	0xA1, 0x01,                   /*  Collection (Application),       */
-	0x85, 0x10,                   /*    Report ID (16),               */
-	0x09, 0x20,                   /*    Usage (Stylus),               */
-	0xA0,                         /*    Collection (Physical),        */
-	0x14,                         /*      Logical Minimum (0),        */
-	0x25, 0x01,                   /*      Logical Maximum (1),        */
-	0x75, 0x01,                   /*      Report Size (1),            */
-	0x09, 0x42,                   /*      Usage (Tip Switch),         */
-	0x09, 0x44,                   /*      Usage (Barrel Switch),      */
-	0x09, 0x46,                   /*      Usage (Tablet Pick),        */
-	0x95, 0x03,                   /*      Report Count (3),           */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0x95, 0x04,                   /*      Report Count (4),           */
-	0x81, 0x03,                   /*      Input (Constant, Variable), */
-	0x09, 0x32,                   /*      Usage (In Range),           */
-	0x95, 0x01,                   /*      Report Count (1),           */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0x75, 0x10,                   /*      Report Size (16),           */
-	0x95, 0x01,                   /*      Report Count (1),           */
-	0xA4,                         /*      Push,                       */
-	0x05, 0x01,                   /*      Usage Page (Desktop),       */
-	0x55, 0xFD,                   /*      Unit Exponent (-3),         */
-	0x65, 0x13,                   /*      Unit (Inch),                */
-	0x34,                         /*      Physical Minimum (0),       */
-	0x09, 0x30,                   /*      Usage (X),                  */
-	0x46, 0x10, 0x27,             /*      Physical Maximum (10000),   */
-	0x27, 0x00, 0xA0, 0x00, 0x00, /*      Logical Maximum (40960),    */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0x09, 0x31,                   /*      Usage (Y),                  */
-	0x46, 0x6A, 0x18,             /*      Physical Maximum (6250),    */
-	0x26, 0x00, 0x64,             /*      Logical Maximum (25600),    */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0xB4,                         /*      Pop,                        */
-	0x09, 0x30,                   /*      Usage (Tip Pressure),       */
-	0x26, 0xFF, 0x03,             /*      Logical Maximum (1023),     */
-	0x81, 0x02,                   /*      Input (Variable),           */
-	0xC0,                         /*    End Collection,               */
-	0xC0,                         /*  End Collection,                 */
-	0x05, 0x0C,                   /*  Usage Page (Consumer),          */
-	0x09, 0x01,                   /*  Usage (Consumer Control),       */
-	0xA1, 0x01,                   /*  Collection (Application),       */
-	0x85, 0x12,                   /*    Report ID (18),               */
-	0x14,                         /*    Logical Minimum (0),          */
-	0x25, 0x01,                   /*    Logical Maximum (1),          */
-	0x75, 0x01,                   /*    Report Size (1),              */
-	0x95, 0x04,                   /*    Report Count (4),             */
-	0x0A, 0x1A, 0x02,             /*    Usage (AC Undo),              */
-	0x0A, 0x79, 0x02,             /*    Usage (AC Redo Or Repeat),    */
-	0x0A, 0x2D, 0x02,             /*    Usage (AC Zoom In),           */
-	0x0A, 0x2E, 0x02,             /*    Usage (AC Zoom Out),          */
-	0x81, 0x02,                   /*    Input (Variable),             */
-	0x95, 0x01,                   /*    Report Count (1),             */
-	0x75, 0x14,                   /*    Report Size (20),             */
-	0x81, 0x03,                   /*    Input (Constant, Variable),   */
-	0x75, 0x20,                   /*    Report Size (32),             */
-	0x81, 0x03,                   /*    Input (Constant, Variable),   */
-	0xC0                          /*  End Collection                  */
+static const __u8 mousepen_m508wx_control_rdesc[] = {
+	0x05, 0x0C,        /*  Usage Page (Consumer),    */
+	0x09, 0x01,        /*  Usage (Consumer Control), */
+	0xA1, 0x01,        /*  Collection (Application), */
+	0x85, 0x12,        /*    Report ID (18),         */
+	0x0A, 0x1A, 0x02,  /*    Usage (AC Undo),        */
+	0x0A, 0x6A, 0x02,  /*    Usage (AC Delete),      */
+	0x0A, 0x2D, 0x02,  /*    Usage (AC Zoom In),     */
+	0x0A, 0x2E, 0x02,  /*    Usage (AC Zoom Out),    */
+	0x14,              /*    Logical Minimum (0),    */
+	0x25, 0x01,        /*    Logical Maximum (1),    */
+	0x75, 0x01,        /*    Report Size (1),        */
+	0x95, 0x04,        /*    Report Count (4),       */
+	0x81, 0x02,        /*    Input (Variable),       */
+	0x95, 0x34,        /*    Report Count (52),      */
+	0x81, 0x01,        /*    Input (Constant),       */
+	0xC0               /*  End Collection            */
 };
 
+static const __u8 mousepen_m508x_control_rdesc[] = {
+	0x05, 0x0C,        /*  Usage Page (Consumer),        */
+	0x09, 0x01,        /*  Usage (Consumer Control),     */
+	0xA1, 0x01,        /*  Collection (Application),     */
+	0x85, 0x12,        /*    Report ID (18),             */
+	0x0A, 0x01, 0x02,  /*    Usage (AC New),             */
+	0x09, 0x40,        /*    Usage (Menu),               */
+	0x0A, 0x6A, 0x02,  /*    Usage (AC Delete),          */
+	0x0A, 0x1A, 0x02,  /*    Usage (AC Undo),            */
+	0x14,              /*    Logical Minimum (0),        */
+	0x25, 0x01,        /*    Logical Maximum (1),        */
+	0x75, 0x01,        /*    Report Size (1),            */
+	0x95, 0x04,        /*    Report Count (4),           */
+	0x81, 0x02,        /*    Input (Variable),           */
+	0x81, 0x01,        /*    Input (Constant),           */
+	0x15, 0xFF,        /*    Logical Minimum (-1),       */
+	0x95, 0x10,        /*    Report Count (16),          */
+	0x81, 0x01,        /*    Input (Constant),           */
+	0x0A, 0x35, 0x02,  /*    Usage (AC Scroll),          */
+	0x0A, 0x2F, 0x02,  /*    Usage (AC Zoom),            */
+	0x0A, 0x38, 0x02,  /*    Usage (AC Pan),             */
+	0x75, 0x08,        /*    Report Size (8),            */
+	0x95, 0x03,        /*    Report Count (3),           */
+	0x81, 0x06,        /*    Input (Variable, Relative), */
+	0x95, 0x01,        /*    Report Count (1),           */
+	0x81, 0x01,        /*    Input (Constant),           */
+	0xC0               /*  End Collection                */
+};
 
-/* Original PenSketch M912 report descriptor size */
-#define PENSKETCH_M912_RDESC_ORIG_SIZE	482
+static const __u8 easypen_m406xe_control_rdesc[] = {
+	0x05, 0x0C,        /*  Usage Page (Consumer),          */
+	0x09, 0x01,        /*  Usage (Consumer Control),       */
+	0xA1, 0x01,        /*  Collection (Application),       */
+	0x85, 0x12,        /*      Report ID (18),             */
+	0x14,              /*      Logical Minimum (0),        */
+	0x25, 0x01,        /*      Logical Maximum (1),        */
+	0x75, 0x01,        /*      Report Size (1),            */
+	0x95, 0x04,        /*      Report Count (4),           */
+	0x0A, 0x79, 0x02,  /*      Usage (AC Redo Or Repeat),  */
+	0x0A, 0x1A, 0x02,  /*      Usage (AC Undo),            */
+	0x0A, 0x2D, 0x02,  /*      Usage (AC Zoom In),         */
+	0x0A, 0x2E, 0x02,  /*      Usage (AC Zoom Out),        */
+	0x81, 0x02,        /*      Input (Variable),           */
+	0x95, 0x34,        /*      Report Count (52),          */
+	0x81, 0x03,        /*      Input (Constant, Variable), */
+	0xC0               /*  End Collection                  */
+};
+
+static const __u8 pensketch_t609a_control_rdesc[] = {
+	0x05, 0x0C,        /*  Usage Page (Consumer),    */
+	0x09, 0x01,        /*  Usage (Consumer Control), */
+	0xA1, 0x01,        /*  Collection (Application), */
+	0x85, 0x12,        /*    Report ID (18),         */
+	0x0A, 0x6A, 0x02,  /*    Usage (AC Delete),      */
+	0x14,              /*    Logical Minimum (0),    */
+	0x25, 0x01,        /*    Logical Maximum (1),    */
+	0x75, 0x01,        /*    Report Size (1),        */
+	0x95, 0x08,        /*    Report Count (8),       */
+	0x81, 0x02,        /*    Input (Variable),       */
+	0x95, 0x37,        /*    Report Count (55),      */
+	0x81, 0x01,        /*    Input (Constant),       */
+	0xC0               /*  End Collection            */
+};
 
-/* Fixed PenSketch M912 report descriptor */
-static __u8 pensketch_m912_rdesc_fixed[] = {
-	0x05, 0x01,                   /*  Usage Page (Desktop),           */
-	0x08,                         /*  Usage (00h),                    */
+static const struct kye_tablet_info {
+	__u32 product;
+	__s32 x_logical_maximum;
+	__s32 y_logical_maximum;
+	__s32 pressure_logical_maximum;
+	__s32 x_physical_maximum;
+	__s32 y_physical_maximum;
+	__s8 unit_exponent;
+	__s8 unit;
+	bool has_punk;
+	unsigned int control_rsize;
+	const __u8 *control_rdesc;
+} kye_tablets_info[] = {
+	{USB_DEVICE_ID_KYE_EASYPEN_M406,  /* 0x5005 */
+		15360, 10240, 1023,    6,   4,  0, 0x13, false,
+		sizeof(easypen_m406_control_rdesc), easypen_m406_control_rdesc},
+	{USB_DEVICE_ID_KYE_EASYPEN_M506,  /* 0x500F */
+		24576, 20480, 1023,    6,   5,  0, 0x13, false,
+		sizeof(easypen_m506_control_rdesc), easypen_m506_control_rdesc},
+	{USB_DEVICE_ID_KYE_EASYPEN_I405X,  /* 0x5010 */
+		14080, 10240, 1023,   55,  40, -1, 0x13, false},
+	{USB_DEVICE_ID_KYE_MOUSEPEN_I608X,  /* 0x5011 */
+		20480, 15360, 2047,    8,   6,  0, 0x13,  true},
+	{USB_DEVICE_ID_KYE_EASYPEN_M406W,  /* 0x5012 */
+		15360, 10240, 1023,    6,   4,  0, 0x13, false,
+		sizeof(easypen_m406w_control_rdesc), easypen_m406w_control_rdesc},
+	{USB_DEVICE_ID_KYE_EASYPEN_M610X,  /* 0x5013 */
+		40960, 25600, 1023, 1000, 625, -2, 0x13, false,
+		sizeof(easypen_m610x_control_rdesc), easypen_m610x_control_rdesc},
+	{USB_DEVICE_ID_KYE_EASYPEN_340,  /* 0x5014 */
+		10240,  7680, 1023,    4,   3,  0, 0x13, false},
+	{USB_DEVICE_ID_KYE_PENSKETCH_M912,  /* 0x5015 */
+		61440, 46080, 2047,   12,   9,  0, 0x13,  true,
+		sizeof(pensketch_m912_control_rdesc), pensketch_m912_control_rdesc},
+	{USB_DEVICE_ID_KYE_MOUSEPEN_M508WX,  /* 0x5016 */
+		40960, 25600, 2047,    8,   5,  0, 0x13,  true,
+		sizeof(mousepen_m508wx_control_rdesc), mousepen_m508wx_control_rdesc},
+	{USB_DEVICE_ID_KYE_MOUSEPEN_M508X,  /* 0x5017 */
+		40960, 25600, 2047,    8,   5,  0, 0x13,  true,
+		sizeof(mousepen_m508x_control_rdesc), mousepen_m508x_control_rdesc},
+	{USB_DEVICE_ID_KYE_EASYPEN_M406XE,  /* 0x5019 */
+		15360, 10240, 1023,    6,   4,  0, 0x13, false,
+		sizeof(easypen_m406xe_control_rdesc), easypen_m406xe_control_rdesc},
+	{USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2,  /* 0x501A */
+		40960, 30720, 2047,    8,   6,  0, 0x13,  true},
+	{USB_DEVICE_ID_KYE_PENSKETCH_T609A,  /* 0x501B */
+		43520, 28160, 1023,   85,  55, -1, 0x13, false,
+		sizeof(pensketch_t609a_control_rdesc), pensketch_t609a_control_rdesc},
+	{}
+};
+
+/* Fix indexes in kye_tablet_report_fixup if you change this */
+static const __u8 kye_tablet_rdesc[] = {
+	0x06, 0x00, 0xFF,             /*  Usage Page (FF00h),             */
+	0x09, 0x01,                   /*  Usage (01h),                    */
 	0xA1, 0x01,                   /*  Collection (Application),       */
 	0x85, 0x05,                   /*    Report ID (5),                */
-	0x06, 0x00, 0xFF,             /*    Usage Page (FF00h),           */
 	0x09, 0x01,                   /*    Usage (01h),                  */
 	0x15, 0x81,                   /*    Logical Minimum (-127),       */
 	0x25, 0x7F,                   /*    Logical Maximum (127),        */
@@ -382,30 +288,29 @@ static __u8 pensketch_m912_rdesc_fixed[] = {
 	0x95, 0x03,                   /*      Report Count (3),           */
 	0x81, 0x02,                   /*      Input (Variable),           */
 	0x95, 0x04,                   /*      Report Count (4),           */
-	0x81, 0x03,                   /*      Input (Constant, Variable), */
+	0x81, 0x01,                   /*      Input (Constant),           */
 	0x09, 0x32,                   /*      Usage (In Range),           */
 	0x95, 0x01,                   /*      Report Count (1),           */
 	0x81, 0x02,                   /*      Input (Variable),           */
 	0x75, 0x10,                   /*      Report Size (16),           */
-	0x95, 0x01,                   /*      Report Count (1),           */
 	0xA4,                         /*      Push,                       */
 	0x05, 0x01,                   /*      Usage Page (Desktop),       */
-	0x55, 0xFD,                   /*      Unit Exponent (-3),         */
-	0x65, 0x13,                   /*      Unit (Inch),                */
-	0x14,                         /*      Logical Minimum (0),        */
-	0x34,                         /*      Physical Minimum (0),       */
 	0x09, 0x30,                   /*      Usage (X),                  */
-	0x27, 0x00, 0xF0, 0x00, 0x00, /*      Logical Maximum (61440),    */
-	0x46, 0xE0, 0x2E,             /*      Physical Maximum (12000),   */
+	0x27, 0xFF, 0x7F, 0x00, 0x00, /*      Logical Maximum (32767),    */
+	0x34,                         /*      Physical Minimum (0),       */
+	0x47, 0x00, 0x00, 0x00, 0x00, /*      Physical Maximum (0),       */
+	0x65, 0x11,                   /*      Unit (Centimeter),          */
+	0x55, 0x00,                   /*      Unit Exponent (0),          */
+	0x75, 0x10,                   /*      Report Size (16),           */
 	0x81, 0x02,                   /*      Input (Variable),           */
 	0x09, 0x31,                   /*      Usage (Y),                  */
-	0x27, 0x00, 0xB4, 0x00, 0x00, /*      Logical Maximum (46080),    */
-	0x46, 0x28, 0x23,             /*      Physical Maximum (9000),    */
+	0x27, 0xFF, 0x7F, 0x00, 0x00, /*      Logical Maximum (32767),    */
+	0x47, 0x00, 0x00, 0x00, 0x00, /*      Physical Maximum (0),       */
 	0x81, 0x02,                   /*      Input (Variable),           */
 	0xB4,                         /*      Pop,                        */
+	0x05, 0x0D,                   /*      Usage Page (Digitizer),     */
 	0x09, 0x30,                   /*      Usage (Tip Pressure),       */
-	0x14,                         /*      Logical Minimum (0),        */
-	0x26, 0xFF, 0x07,             /*      Logical Maximum (2047),     */
+	0x27, 0xFF, 0x07, 0x00, 0x00, /*      Logical Maximum (2047),     */
 	0x81, 0x02,                   /*      Input (Variable),           */
 	0xC0,                         /*    End Collection,               */
 	0xC0,                         /*  End Collection,                 */
@@ -416,146 +321,47 @@ static __u8 pensketch_m912_rdesc_fixed[] = {
 	0x09, 0x21,                   /*    Usage (Puck),                 */
 	0xA0,                         /*    Collection (Physical),        */
 	0x05, 0x09,                   /*      Usage Page (Button),        */
-	0x75, 0x01,                   /*      Report Size (1),            */
 	0x19, 0x01,                   /*      Usage Minimum (01h),        */
 	0x29, 0x03,                   /*      Usage Maximum (03h),        */
 	0x14,                         /*      Logical Minimum (0),        */
 	0x25, 0x01,                   /*      Logical Maximum (1),        */
+	0x75, 0x01,                   /*      Report Size (1),            */
 	0x95, 0x03,                   /*      Report Count (3),           */
 	0x81, 0x02,                   /*      Input (Variable),           */
 	0x95, 0x04,                   /*      Report Count (4),           */
 	0x81, 0x01,                   /*      Input (Constant),           */
+	0x05, 0x0D,                   /*      Usage Page (Digitizer),     */
+	0x09, 0x32,                   /*      Usage (In Range),           */
 	0x95, 0x01,                   /*      Report Count (1),           */
-	0x0B, 0x32, 0x00, 0x0D, 0x00, /*      Usage (Digitizer In Range), */
-	0x14,                         /*      Logical Minimum (0),        */
-	0x25, 0x01,                   /*      Logical Maximum (1),        */
 	0x81, 0x02,                   /*      Input (Variable),           */
-	0xA4,                         /*      Push,                       */
 	0x05, 0x01,                   /*      Usage Page (Desktop),       */
-	0x75, 0x10,                   /*      Report Size (16),           */
-	0x95, 0x01,                   /*      Report Count (1),           */
-	0x55, 0xFD,                   /*      Unit Exponent (-3),         */
-	0x65, 0x13,                   /*      Unit (Inch),                */
-	0x14,                         /*      Logical Minimum (0),        */
-	0x34,                         /*      Physical Minimum (0),       */
+	0xA4,                         /*      Push,                       */
 	0x09, 0x30,                   /*      Usage (X),                  */
-	0x27, 0x00, 0xF0, 0x00, 0x00, /*      Logical Maximum (61440),    */
-	0x46, 0xE0, 0x2E,             /*      Physical Maximum (12000),   */
+	0x27, 0xFF, 0x7F, 0x00, 0x00, /*      Logical Maximum (32767),    */
+	0x34,                         /*      Physical Minimum (0),       */
+	0x47, 0x00, 0x00, 0x00, 0x00, /*      Physical Maximum (0),       */
+	0x65, 0x11,                   /*      Unit (Centimeter),          */
+	0x55, 0x00,                   /*      Unit Exponent (0),          */
+	0x75, 0x10,                   /*      Report Size (16),           */
 	0x81, 0x02,                   /*      Input (Variable),           */
 	0x09, 0x31,                   /*      Usage (Y),                  */
-	0x27, 0x00, 0xB4, 0x00, 0x00, /*      Logical Maximum (46080),    */
-	0x46, 0x28, 0x23,             /*      Physical Maximum (9000),    */
+	0x27, 0xFF, 0x7F, 0x00, 0x00, /*      Logical Maximum (32767),    */
+	0x47, 0x00, 0x00, 0x00, 0x00, /*      Physical Maximum (0),       */
 	0x81, 0x02,                   /*      Input (Variable),           */
+	0xB4,                         /*      Pop,                        */
 	0x09, 0x38,                   /*      Usage (Wheel),              */
+	0x15, 0xFF,                   /*      Logical Minimum (-1),       */
 	0x75, 0x08,                   /*      Report Size (8),            */
 	0x95, 0x01,                   /*      Report Count (1),           */
-	0x15, 0xFF,                   /*      Logical Minimum (-1),       */
-	0x25, 0x01,                   /*      Logical Maximum (1),        */
-	0x34,                         /*      Physical Minimum (0),       */
-	0x44,                         /*      Physical Maximum (0),       */
 	0x81, 0x06,                   /*      Input (Variable, Relative), */
-	0xB4,                         /*      Pop,                        */
+	0x81, 0x01,                   /*      Input (Constant),           */
 	0xC0,                         /*    End Collection,               */
-	0xC0,                         /*  End Collection,                 */
-	0x05, 0x0C,                   /*  Usage Page (Consumer),          */
-	0x09, 0x01,                   /*  Usage (Consumer Control),       */
-	0xA1, 0x01,                   /*  Collection (Application),       */
-	0x85, 0x12,                   /*    Report ID (18),               */
-	0x14,                         /*    Logical Minimum (0),          */
-	0x25, 0x01,                   /*    Logical Maximum (1),          */
-	0x75, 0x01,                   /*    Report Size (1),              */
-	0x95, 0x08,                   /*    Report Count (8),             */
-	0x05, 0x0C,                   /*    Usage Page (Consumer),        */
-	0x0A, 0x6A, 0x02,             /*    Usage (AC Delete),            */
-	0x0A, 0x1A, 0x02,             /*    Usage (AC Undo),              */
-	0x0A, 0x01, 0x02,             /*    Usage (AC New),               */
-	0x0A, 0x2F, 0x02,             /*    Usage (AC Zoom),              */
-	0x0A, 0x25, 0x02,             /*    Usage (AC Forward),           */
-	0x0A, 0x24, 0x02,             /*    Usage (AC Back),              */
-	0x0A, 0x2D, 0x02,             /*    Usage (AC Zoom In),           */
-	0x0A, 0x2E, 0x02,             /*    Usage (AC Zoom Out),          */
-	0x81, 0x02,                   /*    Input (Variable),             */
-	0x95, 0x30,                   /*    Report Count (48),            */
-	0x81, 0x03,                   /*    Input (Constant, Variable),   */
 	0xC0                          /*  End Collection                  */
 };
 
-/* Original EasyPen M406XE report descriptor size */
-#define EASYPEN_M406XE_RDESC_ORIG_SIZE	476
-
-/* Fixed EasyPen M406XE  report descriptor */
-static __u8 easypen_m406xe_rdesc_fixed[] = {
-	0x05, 0x01,         /*  Usage Page (Desktop),               */
-	0x09, 0x01,         /*  Usage (01h),                        */
-	0xA1, 0x01,         /*  Collection (Application),           */
-	0x85, 0x05,         /*      Report ID (5),                  */
-	0x09, 0x01,         /*      Usage (01h),                    */
-	0x15, 0x80,         /*      Logical Minimum (-128),         */
-	0x25, 0x7F,         /*      Logical Maximum (127),          */
-	0x75, 0x08,         /*      Report Size (8),                */
-	0x95, 0x07,         /*      Report Count (7),               */
-	0xB1, 0x02,         /*      Feature (Variable),             */
-	0xC0,               /*  End Collection,                     */
-	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
-	0x09, 0x01,         /*  Usage (Digitizer),                  */
-	0xA1, 0x01,         /*  Collection (Application),           */
-	0x85, 0x10,         /*      Report ID (16),                 */
-	0x09, 0x20,         /*      Usage (Stylus),                 */
-	0xA0,               /*      Collection (Physical),          */
-	0x14,               /*          Logical Minimum (0),        */
-	0x25, 0x01,         /*          Logical Maximum (1),        */
-	0x75, 0x01,         /*          Report Size (1),            */
-	0x09, 0x42,         /*          Usage (Tip Switch),         */
-	0x09, 0x44,         /*          Usage (Barrel Switch),      */
-	0x09, 0x46,         /*          Usage (Tablet Pick),        */
-	0x95, 0x03,         /*          Report Count (3),           */
-	0x81, 0x02,         /*          Input (Variable),           */
-	0x95, 0x04,         /*          Report Count (4),           */
-	0x81, 0x03,         /*          Input (Constant, Variable), */
-	0x09, 0x32,         /*          Usage (In Range),           */
-	0x95, 0x01,         /*          Report Count (1),           */
-	0x81, 0x02,         /*          Input (Variable),           */
-	0x75, 0x10,         /*          Report Size (16),           */
-	0x95, 0x01,         /*          Report Count (1),           */
-	0xA4,               /*          Push,                       */
-	0x05, 0x01,         /*          Usage Page (Desktop),       */
-	0x55, 0xFD,         /*          Unit Exponent (-3),         */
-	0x65, 0x13,         /*          Unit (Inch),                */
-	0x34,               /*          Physical Minimum (0),       */
-	0x09, 0x30,         /*          Usage (X),                  */
-	0x46, 0x70, 0x17,   /*          Physical Maximum (6000),    */
-	0x26, 0x00, 0x3C,   /*          Logical Maximum (15360),    */
-	0x81, 0x02,         /*          Input (Variable),           */
-	0x09, 0x31,         /*          Usage (Y),                  */
-	0x46, 0xA0, 0x0F,   /*          Physical Maximum (4000),    */
-	0x26, 0x00, 0x28,   /*          Logical Maximum (10240),    */
-	0x81, 0x02,         /*          Input (Variable),           */
-	0xB4,               /*          Pop,                        */
-	0x09, 0x30,         /*          Usage (Tip Pressure),       */
-	0x26, 0xFF, 0x03,   /*          Logical Maximum (1023),     */
-	0x81, 0x02,         /*          Input (Variable),           */
-	0xC0,               /*      End Collection,                 */
-	0xC0,               /*  End Collection                      */
-	0x05, 0x0C,         /*  Usage Page (Consumer),              */
-	0x09, 0x01,         /*  Usage (Consumer Control),           */
-	0xA1, 0x01,         /*  Collection (Application),           */
-	0x85, 0x12,         /*      Report ID (18),                 */
-	0x14,               /*      Logical Minimum (0),            */
-	0x25, 0x01,         /*      Logical Maximum (1),            */
-	0x75, 0x01,         /*      Report Size (1),                */
-	0x95, 0x04,         /*      Report Count (4),               */
-	0x0A, 0x79, 0x02,   /*      Usage (AC Redo Or Repeat),      */
-	0x0A, 0x1A, 0x02,   /*      Usage (AC Undo),                */
-	0x0A, 0x2D, 0x02,   /*      Usage (AC Zoom In),             */
-	0x0A, 0x2E, 0x02,   /*      Usage (AC Zoom Out),            */
-	0x81, 0x02,         /*      Input (Variable),               */
-	0x95, 0x34,         /*      Report Count (52),              */
-	0x81, 0x03,         /*      Input (Constant, Variable),     */
-	0xC0                /*  End Collection                      */
-};
-
 static __u8 *kye_consumer_control_fixup(struct hid_device *hdev, __u8 *rdesc,
-		unsigned int *rsize, int offset, const char *device_name) {
+		unsigned int *rsize, int offset, const char *device_name)
+{
 	/*
 	 * the fixup that need to be done:
 	 *   - change Usage Maximum in the Consumer Control
@@ -574,6 +380,60 @@ static __u8 *kye_consumer_control_fixup(struct hid_device *hdev, __u8 *rdesc,
 	return rdesc;
 }
 
+static __u8 *kye_tablet_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int *rsize)
+{
+	const struct kye_tablet_info *info;
+	unsigned int newsize;
+
+	if (*rsize < sizeof(kye_tablet_rdesc)) {
+		hid_warn(hdev,
+			 "tablet report size too small, or kye_tablet_rdesc unexpectedly large\n");
+		return rdesc;
+	}
+
+	for (info = kye_tablets_info; info->product; info++) {
+		if (hdev->product == info->product)
+			break;
+	}
+
+	if (!info->product) {
+		hid_err(hdev, "tablet unknown, someone forget to add kye_tablet_info entry?\n");
+		return rdesc;
+	}
+
+	newsize = info->has_punk ? sizeof(kye_tablet_rdesc) : 112;
+	memcpy(rdesc, kye_tablet_rdesc, newsize);
+
+	put_unaligned_le32(info->x_logical_maximum, rdesc + 66);
+	put_unaligned_le32(info->x_physical_maximum, rdesc + 72);
+	rdesc[77] = info->unit;
+	rdesc[79] = info->unit_exponent;
+	put_unaligned_le32(info->y_logical_maximum, rdesc + 87);
+	put_unaligned_le32(info->y_physical_maximum, rdesc + 92);
+	put_unaligned_le32(info->pressure_logical_maximum, rdesc + 104);
+
+	if (info->has_punk) {
+		put_unaligned_le32(info->x_logical_maximum, rdesc + 156);
+		put_unaligned_le32(info->x_physical_maximum, rdesc + 162);
+		rdesc[167] = info->unit;
+		rdesc[169] = info->unit_exponent;
+		put_unaligned_le32(info->y_logical_maximum, rdesc + 177);
+		put_unaligned_le32(info->y_physical_maximum, rdesc + 182);
+	}
+
+	if (info->control_rsize) {
+		if (newsize + info->control_rsize > *rsize)
+			hid_err(hdev, "control rdesc unexpectedly large");
+		else {
+			memcpy(rdesc + newsize, info->control_rdesc, info->control_rsize);
+			newsize += info->control_rsize;
+		}
+	}
+
+	*rsize = newsize;
+	return rdesc;
+}
+
 static __u8 *kye_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
@@ -602,42 +462,6 @@ static __u8 *kye_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 			rdesc[74] = 0x08;
 		}
 		break;
-	case USB_DEVICE_ID_KYE_EASYPEN_I405X:
-		if (*rsize == EASYPEN_I405X_RDESC_ORIG_SIZE) {
-			rdesc = easypen_i405x_rdesc_fixed;
-			*rsize = sizeof(easypen_i405x_rdesc_fixed);
-		}
-		break;
-	case USB_DEVICE_ID_KYE_MOUSEPEN_I608X:
-		if (*rsize == MOUSEPEN_I608X_RDESC_ORIG_SIZE) {
-			rdesc = mousepen_i608x_rdesc_fixed;
-			*rsize = sizeof(mousepen_i608x_rdesc_fixed);
-		}
-		break;
-	case USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2:
-		if (*rsize == MOUSEPEN_I608X_V2_RDESC_ORIG_SIZE) {
-			rdesc = mousepen_i608x_v2_rdesc_fixed;
-			*rsize = sizeof(mousepen_i608x_v2_rdesc_fixed);
-		}
-		break;
-	case USB_DEVICE_ID_KYE_EASYPEN_M610X:
-		if (*rsize == EASYPEN_M610X_RDESC_ORIG_SIZE) {
-			rdesc = easypen_m610x_rdesc_fixed;
-			*rsize = sizeof(easypen_m610x_rdesc_fixed);
-		}
-		break;
-	case USB_DEVICE_ID_KYE_EASYPEN_M406XE:
-		if (*rsize == EASYPEN_M406XE_RDESC_ORIG_SIZE) {
-			rdesc = easypen_m406xe_rdesc_fixed;
-			*rsize = sizeof(easypen_m406xe_rdesc_fixed);
-		}
-		break;
-	case USB_DEVICE_ID_KYE_PENSKETCH_M912:
-		if (*rsize == PENSKETCH_M912_RDESC_ORIG_SIZE) {
-			rdesc = pensketch_m912_rdesc_fixed;
-			*rsize = sizeof(pensketch_m912_rdesc_fixed);
-		}
-		break;
 	case USB_DEVICE_ID_GENIUS_GILA_GAMING_MOUSE:
 		rdesc = kye_consumer_control_fixup(hdev, rdesc, rsize, 104,
 					"Genius Gila Gaming Mouse");
@@ -650,18 +474,25 @@ static __u8 *kye_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		rdesc = kye_consumer_control_fixup(hdev, rdesc, rsize, 104,
 					"Genius Manticore Keyboard");
 		break;
+	case USB_DEVICE_ID_KYE_EASYPEN_M406:
+	case USB_DEVICE_ID_KYE_EASYPEN_M506:
+	case USB_DEVICE_ID_KYE_EASYPEN_I405X:
+	case USB_DEVICE_ID_KYE_MOUSEPEN_I608X:
+	case USB_DEVICE_ID_KYE_EASYPEN_M406W:
+	case USB_DEVICE_ID_KYE_EASYPEN_M610X:
+	case USB_DEVICE_ID_KYE_EASYPEN_340:
+	case USB_DEVICE_ID_KYE_PENSKETCH_M912:
+	case USB_DEVICE_ID_KYE_MOUSEPEN_M508WX:
+	case USB_DEVICE_ID_KYE_MOUSEPEN_M508X:
+	case USB_DEVICE_ID_KYE_EASYPEN_M406XE:
+	case USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2:
+	case USB_DEVICE_ID_KYE_PENSKETCH_T609A:
+		rdesc = kye_tablet_fixup(hdev, rdesc, rsize);
+		break;
 	}
 	return rdesc;
 }
 
-/**
- * kye_tablet_enable() - Enable fully-functional tablet mode by setting a special feature report.
- *
- * @hdev:	HID device
- *
- * The specific report ID and data were discovered by sniffing the
- * Windows driver traffic.
- */
 static int kye_tablet_enable(struct hid_device *hdev)
 {
 	struct list_head *list;
@@ -688,6 +519,14 @@ static int kye_tablet_enable(struct hid_device *hdev)
 
 	value = report->field[0]->value;
 
+	/*
+	 * The code is for DataFormat 2 of config xml. They have no obvious
+	 * meaning (at least not configurable in Windows driver) except enabling
+	 * fully-functional tablet mode (absolute mouse).
+	 *
+	 * Though there're magic codes for DataFormat 3 and 4, no devices use
+	 * these DataFormats.
+	 */
 	value[0] = 0x12;
 	value[1] = 0x10;
 	value[2] = 0x11;
@@ -717,12 +556,19 @@ static int kye_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	switch (id->product) {
+	case USB_DEVICE_ID_KYE_EASYPEN_M406:
+	case USB_DEVICE_ID_KYE_EASYPEN_M506:
 	case USB_DEVICE_ID_KYE_EASYPEN_I405X:
 	case USB_DEVICE_ID_KYE_MOUSEPEN_I608X:
-	case USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2:
+	case USB_DEVICE_ID_KYE_EASYPEN_M406W:
 	case USB_DEVICE_ID_KYE_EASYPEN_M610X:
-	case USB_DEVICE_ID_KYE_EASYPEN_M406XE:
+	case USB_DEVICE_ID_KYE_EASYPEN_340:
 	case USB_DEVICE_ID_KYE_PENSKETCH_M912:
+	case USB_DEVICE_ID_KYE_MOUSEPEN_M508WX:
+	case USB_DEVICE_ID_KYE_MOUSEPEN_M508X:
+	case USB_DEVICE_ID_KYE_EASYPEN_M406XE:
+	case USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2:
+	case USB_DEVICE_ID_KYE_PENSKETCH_T609A:
 		ret = kye_tablet_enable(hdev);
 		if (ret) {
 			hid_err(hdev, "tablet enabling failed\n");
@@ -748,24 +594,38 @@ static int kye_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 static const struct hid_device_id kye_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_ERGO_525V) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
+				USB_DEVICE_ID_GENIUS_GILA_GAMING_MOUSE) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
+				USB_DEVICE_ID_GENIUS_MANTICORE) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
+				USB_DEVICE_ID_GENIUS_GX_IMPERATOR) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
+				USB_DEVICE_ID_KYE_EASYPEN_M406) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
+				USB_DEVICE_ID_KYE_EASYPEN_M506) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
 				USB_DEVICE_ID_KYE_EASYPEN_I405X) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
 				USB_DEVICE_ID_KYE_MOUSEPEN_I608X) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
-				USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2) },
+				USB_DEVICE_ID_KYE_EASYPEN_M406W) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
 				USB_DEVICE_ID_KYE_EASYPEN_M610X) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
-				USB_DEVICE_ID_KYE_EASYPEN_M406XE) },
+				USB_DEVICE_ID_KYE_EASYPEN_340) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
-				USB_DEVICE_ID_GENIUS_GILA_GAMING_MOUSE) },
+				USB_DEVICE_ID_KYE_PENSKETCH_M912) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
-				USB_DEVICE_ID_GENIUS_GX_IMPERATOR) },
+				USB_DEVICE_ID_KYE_MOUSEPEN_M508WX) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
-				USB_DEVICE_ID_GENIUS_MANTICORE) },
+				USB_DEVICE_ID_KYE_MOUSEPEN_M508X) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
-				USB_DEVICE_ID_KYE_PENSKETCH_M912) },
+				USB_DEVICE_ID_KYE_EASYPEN_M406XE) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
+				USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE,
+				USB_DEVICE_ID_KYE_PENSKETCH_T609A) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, kye_devices);
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index be3ad02573de..fdb75af75b53 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -104,12 +104,20 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_1f4a), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IDEACOM, USB_DEVICE_ID_IDEACOM_IDC6680), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M610X), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M506), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_I405X), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_MOUSEPEN_I608X), HID_QUIRK_MULTI_INPUT },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406W), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M610X), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_340), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_PENSKETCH_M912), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_MOUSEPEN_M508WX), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_MOUSEPEN_M508X), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406XE), HID_QUIRK_MULTI_INPUT },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_MOUSEPEN_I608X_V2), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_PENSKETCH_T609A), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019), HID_QUIRK_ALWAYS_POLL },
-- 
2.39.0

