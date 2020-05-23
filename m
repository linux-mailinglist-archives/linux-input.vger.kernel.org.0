Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAA91DFB48
	for <lists+linux-input@lfdr.de>; Sun, 24 May 2020 00:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgEWWDG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 May 2020 18:03:06 -0400
Received: from mail-ed1-f50.google.com ([209.85.208.50]:33738 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgEWWDG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 May 2020 18:03:06 -0400
Received: by mail-ed1-f50.google.com with SMTP id e10so12105062edq.0
        for <linux-input@vger.kernel.org>; Sat, 23 May 2020 15:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=B96X9yS/OrCbQszIetBufKzfFwXxmf34NjkypwQ0wJc=;
        b=DT9j8uI50vtQU4lKnN8DZiOdYu7j/5Nk3TqrlLAFgfu6RHJwvBK9JscRl1Grt0a3HD
         Y+2CQ3TmwxA81Qx03oVWIbVLuekpPUElKbSgizVKvFUCIvYkhYXThne96QS/7rm0osPG
         zFqMSwHnOBxyrblh+NLKxdJZwd4bSgwhuQ0xRKRqR4rmeFqb6l+KeIBd6w/X6WmclsCV
         VnBpmCRDn+OrX87Wlh8jw7osxgW+Id49UrRoyE4ow4tHQ+LFBs00KCQKBH/E82sYEfWU
         4qcLKMgKJQa4MZK4SL9pv5FJtNMUCZTuR6qYSkjEtVmbNMx/6TIv8zMmnfNVnYxQWruv
         u10A==
X-Gm-Message-State: AOAM530Xg9nxkJbFIkckgceIGEsI0gQsYzovL4TNQ0o9KbBIpxquGKRI
        /cyQPYuAmUo47z2m5JcYY995T8cvLo0P8A==
X-Google-Smtp-Source: ABdhPJzltkiNWZwq2lBQhC5Ujohw1aAZLidfLpB9WQ4/wraCE4esLvkbN1GaSbXMFArexInniWa+VQ==
X-Received: by 2002:a50:9e6a:: with SMTP id z97mr8321283ede.375.1590271383602;
        Sat, 23 May 2020 15:03:03 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id h20sm11578189eja.61.2020.05.23.15.03.03
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2020 15:03:03 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id h17so13721238wrc.8
        for <linux-input@vger.kernel.org>; Sat, 23 May 2020 15:03:03 -0700 (PDT)
X-Received: by 2002:adf:b786:: with SMTP id s6mr8354180wre.287.1590271382712;
 Sat, 23 May 2020 15:03:02 -0700 (PDT)
MIME-Version: 1.0
From:   Daniel Morse <dmorse@speedfox.co.uk>
Date:   Sat, 23 May 2020 23:02:51 +0100
X-Gmail-Original-Message-ID: <CANFaMLGVGmS4i3fdH2rYeqSgqk3Gm=sxaLLMuKx4T1eY9ZvyEg@mail.gmail.com>
Message-ID: <CANFaMLGVGmS4i3fdH2rYeqSgqk3Gm=sxaLLMuKx4T1eY9ZvyEg@mail.gmail.com>
Subject: [PATCH[ HID: Wiimote: Treat the d-pad as an analogue stick
To:     linux-input@vger.kernel.org, dh.herrmann@googlemail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The controllers from the Super Nintendo Classic Edition (AKA the SNES
Mini) appear as a Classic Controller Pro when connected to a Wii
Remote. All the buttons work as the same, with the d-pad being mapped
the same as the d-pad on the Classic Controller Pro. This differs from
the behaviour of most controllers with d-pads and no analogue sticks,
where the d-pad maps to ABS_HAT1X for left and right, and ABS_HAT1Y
for up and down. This patch adds an option to the hid-wiimote module
to make the Super Nintendo Classic Controller behave this way.

The patch has been tested with a Super Nintendo Classic Controller
plugged into a Wii Remote in both with the option both enabled and
disabled. When enabled the d-pad acts as the analogue control, and
when disabled it acts as it did before the patch was applied. This
patch has not been tested with e Wii Classic Controller (either the
original or the pro version) as I do not have one of these
controllers.

Although I have not tested it with these controllers, I think it is
likely this patch will also work with the NES Classic Edition
Controllers.

Signed-off-by: Daniel G. Morse <dmorse@speedfox.co.uk>
---
 drivers/hid/hid-wiimote-core.c    |  6 ++
 drivers/hid/hid-wiimote-modules.c | 98 +++++++++++++++++++++++--------
 drivers/hid/hid-wiimote.h         |  1 +
 3 files changed, 82 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 92874dbe4d4a..4e75d7b7446f 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -1870,6 +1870,12 @@ static const struct hid_device_id
wiimote_hid_devices[] = {
                 USB_DEVICE_ID_NINTENDO_WIIMOTE2) },
     { }
 };
+
+bool dpad_as_analog = false;
+module_param(dpad_as_analog, bool, 0644);
+MODULE_PARM_DESC(dpad_as_analog,
+        "Treats the D-Pad as the main analog input");
+
 MODULE_DEVICE_TABLE(hid, wiimote_hid_devices);

 static struct hid_driver wiimote_hid_driver = {
diff --git a/drivers/hid/hid-wiimote-modules.c
b/drivers/hid/hid-wiimote-modules.c
index 2c3925357857..2c491c92cd8e 100644
--- a/drivers/hid/hid-wiimote-modules.c
+++ b/drivers/hid/hid-wiimote-modules.c
@@ -1110,19 +1110,85 @@ static void wiimod_classic_in_ext(struct
wiimote_data *wdata, const __u8 *ext)
     rt <<= 1;
     lt <<= 1;

-    input_report_abs(wdata->extension.input, ABS_HAT1X, lx - 0x20);
-    input_report_abs(wdata->extension.input, ABS_HAT1Y, ly - 0x20);
     input_report_abs(wdata->extension.input, ABS_HAT2X, rx - 0x20);
     input_report_abs(wdata->extension.input, ABS_HAT2Y, ry - 0x20);
     input_report_abs(wdata->extension.input, ABS_HAT3X, rt);
     input_report_abs(wdata->extension.input, ABS_HAT3Y, lt);
+    if(dpad_as_analog) {
+        if(wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE){
+            if((ext[4] & 0x80) && !(ext[1] & 0x01)) {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1X, 0x7F);
+            } else if(!(ext[4] & 0x80) && (ext[1] & 0x01)) {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1X, 0xFF);
+            } else {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1X, 0x00);
+            }
+
+            if((ext[4] & 0x40) && !(ext[0] & 0x01)) {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1Y, 0x7F);
+            } else if(!(ext[4] & 0x40) && (ext[0] & 0x01)) {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1Y, 0xFF);
+            } else {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1Y, 0x00);
+            }
+        } else {
+            if((ext[4] & 0x80) && !(ext[5] & 0x02)) {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1X, 0x7F);
+            } else if(!(ext[4] & 0x80) && (ext[5] & 0x02)) {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1X, 0xFF);
+            } else {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1X, 0x00);
+            }
+
+            if((ext[4] & 0x40) && !(ext[5] & 0x01)) {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1Y, 0x7F);
+            } else if(!(ext[4] & 0x40) && (ext[5] & 0x01)) {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1Y, 0xFF);
+            } else {
+                input_report_abs(wdata->extension.input,
+                        ABS_HAT1Y, 0x00);
+            }
+        }
+
+    } else {
+        input_report_abs(wdata->extension.input, ABS_HAT1X, lx - 0x20);
+        input_report_abs(wdata->extension.input, ABS_HAT1Y, ly - 0x20);
+        input_report_key(wdata->extension.input,
+                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_RIGHT],
+                 !(ext[4] & 0x80));
+        input_report_key(wdata->extension.input,
+                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_DOWN],
+                 !(ext[4] & 0x40));
+
+        if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
+            input_report_key(wdata->extension.input,
+                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
+                 !(ext[1] & 0x01));
+            input_report_key(wdata->extension.input,
+                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
+                 !(ext[0] & 0x01));
+        } else {
+            input_report_key(wdata->extension.input,
+                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
+                 !(ext[5] & 0x02));
+            input_report_key(wdata->extension.input,
+                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
+                 !(ext[5] & 0x01));
+        }
+    }
+

-    input_report_key(wdata->extension.input,
-             wiimod_classic_map[WIIMOD_CLASSIC_KEY_RIGHT],
-             !(ext[4] & 0x80));
-    input_report_key(wdata->extension.input,
-             wiimod_classic_map[WIIMOD_CLASSIC_KEY_DOWN],
-             !(ext[4] & 0x40));
     input_report_key(wdata->extension.input,
              wiimod_classic_map[WIIMOD_CLASSIC_KEY_LT],
              !(ext[4] & 0x20));
@@ -1157,21 +1223,7 @@ static void wiimod_classic_in_ext(struct
wiimote_data *wdata, const __u8 *ext)
              wiimod_classic_map[WIIMOD_CLASSIC_KEY_ZR],
              !(ext[5] & 0x04));

-    if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
-        input_report_key(wdata->extension.input,
-             wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
-             !(ext[1] & 0x01));
-        input_report_key(wdata->extension.input,
-             wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
-             !(ext[0] & 0x01));
-    } else {
-        input_report_key(wdata->extension.input,
-             wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
-             !(ext[5] & 0x02));
-        input_report_key(wdata->extension.input,
-             wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
-             !(ext[5] & 0x01));
-    }
+

     input_sync(wdata->extension.input);
 }
diff --git a/drivers/hid/hid-wiimote.h b/drivers/hid/hid-wiimote.h
index b2a26a0a8f12..0079801f599c 100644
--- a/drivers/hid/hid-wiimote.h
+++ b/drivers/hid/hid-wiimote.h
@@ -372,4 +372,5 @@ static inline int wiimote_cmd_wait_noint(struct
wiimote_data *wdata)
         return 0;
 }

+extern bool dpad_as_analog;
 #endif
--
2.25.1
