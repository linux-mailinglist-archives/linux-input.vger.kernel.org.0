Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D5A1E3151
	for <lists+linux-input@lfdr.de>; Tue, 26 May 2020 23:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390356AbgEZVl5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 May 2020 17:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390013AbgEZVl4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 May 2020 17:41:56 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252FFC061A0F
        for <linux-input@vger.kernel.org>; Tue, 26 May 2020 14:41:56 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e1so22006748wrt.5
        for <linux-input@vger.kernel.org>; Tue, 26 May 2020 14:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=havcZYcntpUaTuVc4aKQNJ7HRoIHERFn8fZh0Ttliqo=;
        b=RaklLzLZhpVneR+m5a+cCh1yeSk9/AMovTLUCynASKw21Kw11EIY24bqWmZpOLS5Jk
         4+/5GQSw/gIVuIwn0KHJvV7vxIT44YhTU+ixgHJEvRcllDLv9dMutlU4LM8/TAtglaoO
         8bz1DXc4oR8sRp9jDAQTFWMgJW+TiPKRiFIeuEpBmZR8xMahh7+K2SCaB2JhWXEzOcmc
         4FqLLupNVhlKx3XQO5i44dxujpPmeB+vEgmqNVyQfGpO/g1SkYw3LR/DxujSuoDpdVdZ
         DJ/fIjrg+ykDnjj4ceEhe1aWNHKi7xU57CKKVZ6RCIjTs/zFcwNBWDKcX+veWR0ts2vO
         fAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=havcZYcntpUaTuVc4aKQNJ7HRoIHERFn8fZh0Ttliqo=;
        b=OOkCWZ6icd4NFECT7IaGCmsc+vZnmi7iFsCh/BfV5aYpI00hWjupHHySD8lM/0rDZP
         ozAAGvOFng4XymRjdgNhmjGAGGyvDaxya62VAjfuZwmdkfDHGctSZueHMIz12et08nmr
         QGIGfhdNoydaF4Dcipdka9mZY2ROXFBIciHdnxsimTO/wk5qvdFdo5gMTBzREFT37bPW
         qt0RUHDqln3l+CBualASFl+ExRTCqVXTKa0HTKa+Q3x5b8dwz7l5sgB1PY/7abzSCzt9
         3Yi6S+brdTlC60rQXyYE3R7U62FGcJbe8zCAPKylHHlR7sEJJczzh1Plj9R3/qUqq6og
         jR6Q==
X-Gm-Message-State: AOAM530lJAIjtGIfItICVIsTzGDdV4oOW2D4SzfScz0s/YcF6C4mgHqS
        oBSusWZChNNqIAV/J1FX+y3XHx9dEK899eLfAG4=
X-Google-Smtp-Source: ABdhPJzVxdqC/O02WjAqxnRzImiOmNpGLeZp8EqbFM5LeX/VYGmv16uyBp1PExORL6C9oSU13tAm36POsPwlI0NCVJs=
X-Received: by 2002:a5d:408e:: with SMTP id o14mr6474874wrp.84.1590529314830;
 Tue, 26 May 2020 14:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLGVGmS4i3fdH2rYeqSgqk3Gm=sxaLLMuKx4T1eY9ZvyEg@mail.gmail.com>
 <CANq1E4QUMssPJXvR4njunbV4+2-0ojYvvDxQSTX_0iFPGoTYVw@mail.gmail.com> <CANFaMLH69uwUrwcn060wCz1YxaDNS+jbbduXA6ORgO7Gst3=hw@mail.gmail.com>
In-Reply-To: <CANFaMLH69uwUrwcn060wCz1YxaDNS+jbbduXA6ORgO7Gst3=hw@mail.gmail.com>
From:   Daniel Morse <daniel.morse@gmail.com>
Date:   Tue, 26 May 2020 22:41:43 +0100
Message-ID: <CANFaMLHu3Eo5oZ3jMw_Rx6NGtJ1UePWiTtQm942DHqvP33EQTA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: Wiimote: Treat the d-pad as an analogue stick
To:     David Rheinsberg <david.rheinsberg@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
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

Changes from V1 to V2
* 3 if statements to control the behaviour, one to make the d-pad
register as button presses when the behaviour is disabled, and 2 to
make it act as an analog stick when enabled (once for each of the
motion plus states)
* the values for lx and ly are calculated and then passed to
input_report_abs() in one place, rather then calling
input_report_abs() from different places depending on how the values
are determined.
* using an array to map from button presses to analog value.
* reduced the values used to indicate the position of the analog stick
so they can fit inside a __s8

Signed-off-by: Daniel G. Morse <dmorse@speedfox.co.uk>
---
 drivers/hid/hid-wiimote-core.c    |  5 +++
 drivers/hid/hid-wiimote-modules.c | 67 ++++++++++++++++++++-----------
 drivers/hid/hid-wiimote.h         |  1 +
 3 files changed, 49 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 92874dbe4d4a..f83c6356879e 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -1870,6 +1870,11 @@ static const struct hid_device_id
wiimote_hid_devices[] = {
                 USB_DEVICE_ID_NINTENDO_WIIMOTE2) },
     { }
 };
+
+bool dpad_as_analog = false;
+module_param(dpad_as_analog, bool, 0644);
+MODULE_PARM_DESC(dpad_as_analog, "Use D-Pad as main analog input");
+
 MODULE_DEVICE_TABLE(hid, wiimote_hid_devices);

 static struct hid_driver wiimote_hid_driver = {
diff --git a/drivers/hid/hid-wiimote-modules.c
b/drivers/hid/hid-wiimote-modules.c
index 2c3925357857..cfd2f0f8318a 100644
--- a/drivers/hid/hid-wiimote-modules.c
+++ b/drivers/hid/hid-wiimote-modules.c
@@ -1088,12 +1088,28 @@ static void wiimod_classic_in_ext(struct
wiimote_data *wdata, const __u8 *ext)
      * is the same as before.
      */

+    __s8 digital_to_analog[3] = {0x20, 0, -0x20};
+
     if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
-        lx = ext[0] & 0x3e;
-        ly = ext[1] & 0x3e;
+        if (dpad_as_analog) {
+             lx = digital_to_analog[(1 - !(ext[4] & 0x80)
+                     + !(ext[1] & 0x01))];
+             ly = digital_to_analog[(1 - !(ext[4] & 0x40)
+                     + !(ext[0] & 0x01))];
+        } else {
+            lx = (ext[0] & 0x3e) - 0x20;
+            ly = (ext[1] & 0x3e) - 0x20;
+        }
     } else {
-        lx = ext[0] & 0x3f;
-        ly = ext[1] & 0x3f;
+        if (dpad_as_analog) {
+             lx = digital_to_analog[(1 - !(ext[4] & 0x80)
+                     + !(ext[5] & 0x02))];
+             ly = digital_to_analog[(1 - !(ext[4] & 0x40)
+                     + !(ext[5] & 0x01))];
+        } else {
+            lx = (ext[0] & 0x3f) - 0x20;
+            ly = (ext[1] & 0x3f) - 0x20;
+        }
     }

     rx = (ext[0] >> 3) & 0x18;
@@ -1110,19 +1126,13 @@ static void wiimod_classic_in_ext(struct
wiimote_data *wdata, const __u8 *ext)
     rt <<= 1;
     lt <<= 1;

-    input_report_abs(wdata->extension.input, ABS_HAT1X, lx - 0x20);
-    input_report_abs(wdata->extension.input, ABS_HAT1Y, ly - 0x20);
+    input_report_abs(wdata->extension.input, ABS_HAT1X, lx);
+    input_report_abs(wdata->extension.input, ABS_HAT1Y, ly);
     input_report_abs(wdata->extension.input, ABS_HAT2X, rx - 0x20);
     input_report_abs(wdata->extension.input, ABS_HAT2Y, ry - 0x20);
     input_report_abs(wdata->extension.input, ABS_HAT3X, rt);
     input_report_abs(wdata->extension.input, ABS_HAT3Y, lt);

-    input_report_key(wdata->extension.input,
-             wiimod_classic_map[WIIMOD_CLASSIC_KEY_RIGHT],
-             !(ext[4] & 0x80));
-    input_report_key(wdata->extension.input,
-             wiimod_classic_map[WIIMOD_CLASSIC_KEY_DOWN],
-             !(ext[4] & 0x40));
     input_report_key(wdata->extension.input,
              wiimod_classic_map[WIIMOD_CLASSIC_KEY_LT],
              !(ext[4] & 0x20));
@@ -1157,20 +1167,29 @@ static void wiimod_classic_in_ext(struct
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
+    if (!dpad_as_analog) {
         input_report_key(wdata->extension.input,
-             wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
-             !(ext[5] & 0x02));
+                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_RIGHT],
+                 !(ext[4] & 0x80));
         input_report_key(wdata->extension.input,
-             wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
-             !(ext[5] & 0x01));
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
     }

     input_sync(wdata->extension.input);
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
