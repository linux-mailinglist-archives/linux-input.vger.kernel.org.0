Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 441531E9238
	for <lists+linux-input@lfdr.de>; Sat, 30 May 2020 17:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbgE3PEn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 May 2020 11:04:43 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:40417 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728927AbgE3PEm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 May 2020 11:04:42 -0400
Received: by mail-ej1-f68.google.com with SMTP id ds18so962664ejc.7
        for <linux-input@vger.kernel.org>; Sat, 30 May 2020 08:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=X+8wScorcl5bUo0xNotp/nOx/Z/GOVIpylgWA/jhOp8=;
        b=tkSlLsXT5hFQNJkQM2i1dn/dWpFj0Dh1ybEY81d4yjG3LOIV28d4pJlJHiBlxVOoDZ
         hRF3voxtlFqJEqtXlDjQnJB1JbaSuj8/yESzyl9vPdoIK68wWV4o5TuiuAlKlWPS1YFr
         4cbYmrQNdrX0zC6mMadr41Ajj9VLYZYgKzBOcHg03soYY8XQqRvH31NBa1sPWShTS6cz
         YrdXDYTbp5SwEog/ZoM/AjsBpo6oFzg03T0KjeC06ShBCpn42bFlrNqv+pBjWHjU3lti
         n18bYLvOIZ3aqSETCUtBW7im/kv3jHJlqe28BWaPxsq6LdQIVrl+QgZiExqZIhz2GT9/
         Mieg==
X-Gm-Message-State: AOAM531Lhy3dY8zMhP7quhHC1A1SWsNj8Fa5JL9k1U6bZp6ogguBcd8f
        CW9xJ2ITuCPqCdOX13vjfNLCx3mQhxk=
X-Google-Smtp-Source: ABdhPJxCeN67IuUwUGGcQ60AULy0HHvANBH5UEk7vTymi5J0bIElXilVn7PCS6NTMLu3vyqcj5fynw==
X-Received: by 2002:a17:906:ae93:: with SMTP id md19mr12249902ejb.4.1590851078691;
        Sat, 30 May 2020 08:04:38 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id o24sm10192121ejb.72.2020.05.30.08.04.37
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2020 08:04:38 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id d128so7073563wmc.1
        for <linux-input@vger.kernel.org>; Sat, 30 May 2020 08:04:37 -0700 (PDT)
X-Received: by 2002:a1c:9acf:: with SMTP id c198mr2359410wme.172.1590851077591;
 Sat, 30 May 2020 08:04:37 -0700 (PDT)
MIME-Version: 1.0
From:   Daniel Morse <dmorse@speedfox.co.uk>
Date:   Sat, 30 May 2020 16:04:26 +0100
X-Gmail-Original-Message-ID: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com>
Message-ID: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com>
Subject: [PATCH v3] HID: Wiimote: Treat the d-pad as an analogue stick
To:     David Rheinsberg <david.rheinsberg@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000005f370d05a6dee1a3"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--0000000000005f370d05a6dee1a3
Content-Type: text/plain; charset="UTF-8"

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

Changes from V3 to V3
* Moved the definition of dpad_as_analog in hid-wiimote.h
* Renamed the dpad_as_analog vaiable to wiimote_dpad_as_analog
* changed digital_to_analog from an __s8 to static const s8
* Removed the unnecessary braces when getting values from digital_to_analog

Note: I have also attached a patch file to this final version in
addition to the code in the body because gmail web client keeps
turning the tabs into spaces.

Signed-off-by: Daniel G. Morse <dmorse@speedfox.co.uk>
Reviewed-by: David Rheinsberg <david.rheinsberg@gmail.com>

From 8909feec10fda919d1ec46c95418d63ac52ee41f Mon Sep 17 00:00:00 2001
From: Speedfox <speedfox@speedfox.co.uk>
Date: Tue, 26 May 2020 02:55:50 +0100
Subject: [PATCH] Added option to make d-pad analog

Updates from code review
---
 drivers/hid/hid-wiimote-core.c    |  5 +++
 drivers/hid/hid-wiimote-modules.c | 67 ++++++++++++++++++++-----------
 drivers/hid/hid-wiimote.h         |  2 +
 3 files changed, 50 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
index 92874dbe4d4a..679e142fc850 100644
--- a/drivers/hid/hid-wiimote-core.c
+++ b/drivers/hid/hid-wiimote-core.c
@@ -1870,6 +1870,11 @@ static const struct hid_device_id
wiimote_hid_devices[] = {
                 USB_DEVICE_ID_NINTENDO_WIIMOTE2) },
     { }
 };
+
+bool wiimote_dpad_as_analog = false;
+module_param_named(dpad_as_analog, wiimote_dpad_as_analog, bool, 0644);
+MODULE_PARM_DESC(dpad_as_analog, "Use D-Pad as main analog input");
+
 MODULE_DEVICE_TABLE(hid, wiimote_hid_devices);

 static struct hid_driver wiimote_hid_driver = {
diff --git a/drivers/hid/hid-wiimote-modules.c
b/drivers/hid/hid-wiimote-modules.c
index 2c3925357857..213c58bf2495 100644
--- a/drivers/hid/hid-wiimote-modules.c
+++ b/drivers/hid/hid-wiimote-modules.c
@@ -1088,12 +1088,28 @@ static void wiimod_classic_in_ext(struct
wiimote_data *wdata, const __u8 *ext)
      * is the same as before.
      */

+    static const s8 digital_to_analog[3] = {0x20, 0, -0x20};
+
     if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
-        lx = ext[0] & 0x3e;
-        ly = ext[1] & 0x3e;
+        if (wiimote_dpad_as_analog) {
+            lx = digital_to_analog[1 - !(ext[4] & 0x80)
+                + !(ext[1] & 0x01)];
+            ly = digital_to_analog[1 - !(ext[4] & 0x40)
+                + !(ext[0] & 0x01)];
+        } else {
+            lx = (ext[0] & 0x3e) - 0x20;
+            ly = (ext[1] & 0x3e) - 0x20;
+        }
     } else {
-        lx = ext[0] & 0x3f;
-        ly = ext[1] & 0x3f;
+        if (wiimote_dpad_as_analog) {
+            lx = digital_to_analog[1 - !(ext[4] & 0x80)
+                + !(ext[5] & 0x02)];
+            ly = digital_to_analog[1 - !(ext[4] & 0x40)
+                + !(ext[5] & 0x01)];
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
+    if (!wiimote_dpad_as_analog) {
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
index b2a26a0a8f12..ad4ff837f43e 100644
--- a/drivers/hid/hid-wiimote.h
+++ b/drivers/hid/hid-wiimote.h
@@ -162,6 +162,8 @@ struct wiimote_data {
     struct work_struct init_worker;
 };

+extern bool wiimote_dpad_as_analog;
+
 /* wiimote modules */

 enum wiimod_module {
-- 
2.25.1

--0000000000005f370d05a6dee1a3
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Added-option-to-make-d-pad-analog.patch"
Content-Disposition: attachment; 
	filename="0001-Added-option-to-make-d-pad-analog.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_katrg6pp0>
X-Attachment-Id: f_katrg6pp0

RnJvbSA4OTA5ZmVlYzEwZmRhOTE5ZDFlYzQ2Yzk1NDE4ZDYzYWM1MmVlNDFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTcGVlZGZveCA8c3BlZWRmb3hAc3BlZWRmb3guY28udWs+CkRh
dGU6IFR1ZSwgMjYgTWF5IDIwMjAgMDI6NTU6NTAgKzAxMDAKU3ViamVjdDogW1BBVENIXSBBZGRl
ZCBvcHRpb24gdG8gbWFrZSBkLXBhZCBhbmFsb2cKClVwZGF0ZXMgZnJvbSBjb2RlIHJldmlldwot
LS0KIGRyaXZlcnMvaGlkL2hpZC13aWltb3RlLWNvcmUuYyAgICB8ICA1ICsrKwogZHJpdmVycy9o
aWQvaGlkLXdpaW1vdGUtbW9kdWxlcy5jIHwgNjcgKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLQogZHJpdmVycy9oaWQvaGlkLXdpaW1vdGUuaCAgICAgICAgIHwgIDIgKwogMyBmaWxlcyBj
aGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2hpZC9oaWQtd2lpbW90ZS1jb3JlLmMgYi9kcml2ZXJzL2hpZC9oaWQtd2lpbW90ZS1j
b3JlLmMKaW5kZXggOTI4NzRkYmU0ZDRhLi42NzllMTQyZmM4NTAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvaGlkL2hpZC13aWltb3RlLWNvcmUuYworKysgYi9kcml2ZXJzL2hpZC9oaWQtd2lpbW90ZS1j
b3JlLmMKQEAgLTE4NzAsNiArMTg3MCwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhpZF9kZXZp
Y2VfaWQgd2lpbW90ZV9oaWRfZGV2aWNlc1tdID0gewogCQkJCVVTQl9ERVZJQ0VfSURfTklOVEVO
RE9fV0lJTU9URTIpIH0sCiAJeyB9CiB9OworCitib29sIHdpaW1vdGVfZHBhZF9hc19hbmFsb2cg
PSBmYWxzZTsKK21vZHVsZV9wYXJhbV9uYW1lZChkcGFkX2FzX2FuYWxvZywgd2lpbW90ZV9kcGFk
X2FzX2FuYWxvZywgYm9vbCwgMDY0NCk7CitNT0RVTEVfUEFSTV9ERVNDKGRwYWRfYXNfYW5hbG9n
LCAiVXNlIEQtUGFkIGFzIG1haW4gYW5hbG9nIGlucHV0Iik7CisKIE1PRFVMRV9ERVZJQ0VfVEFC
TEUoaGlkLCB3aWltb3RlX2hpZF9kZXZpY2VzKTsKIAogc3RhdGljIHN0cnVjdCBoaWRfZHJpdmVy
IHdpaW1vdGVfaGlkX2RyaXZlciA9IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC13aWlt
b3RlLW1vZHVsZXMuYyBiL2RyaXZlcnMvaGlkL2hpZC13aWltb3RlLW1vZHVsZXMuYwppbmRleCAy
YzM5MjUzNTc4NTcuLjIxM2M1OGJmMjQ5NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvaGlkLXdp
aW1vdGUtbW9kdWxlcy5jCisrKyBiL2RyaXZlcnMvaGlkL2hpZC13aWltb3RlLW1vZHVsZXMuYwpA
QCAtMTA4OCwxMiArMTA4OCwyOCBAQCBzdGF0aWMgdm9pZCB3aWltb2RfY2xhc3NpY19pbl9leHQo
c3RydWN0IHdpaW1vdGVfZGF0YSAqd2RhdGEsIGNvbnN0IF9fdTggKmV4dCkKIAkgKiBpcyB0aGUg
c2FtZSBhcyBiZWZvcmUuCiAJICovCiAKKwlzdGF0aWMgY29uc3QgczggZGlnaXRhbF90b19hbmFs
b2dbM10gPSB7MHgyMCwgMCwgLTB4MjB9OworCiAJaWYgKHdkYXRhLT5zdGF0ZS5mbGFncyAmIFdJ
SVBST1RPX0ZMQUdfTVBfQUNUSVZFKSB7Ci0JCWx4ID0gZXh0WzBdICYgMHgzZTsKLQkJbHkgPSBl
eHRbMV0gJiAweDNlOworCQlpZiAod2lpbW90ZV9kcGFkX2FzX2FuYWxvZykgeworCQkJbHggPSBk
aWdpdGFsX3RvX2FuYWxvZ1sxIC0gIShleHRbNF0gJiAweDgwKQorCQkJCSsgIShleHRbMV0gJiAw
eDAxKV07CisJCQlseSA9IGRpZ2l0YWxfdG9fYW5hbG9nWzEgLSAhKGV4dFs0XSAmIDB4NDApCisJ
CQkJKyAhKGV4dFswXSAmIDB4MDEpXTsKKwkJfSBlbHNlIHsKKwkJCWx4ID0gKGV4dFswXSAmIDB4
M2UpIC0gMHgyMDsKKwkJCWx5ID0gKGV4dFsxXSAmIDB4M2UpIC0gMHgyMDsKKwkJfQogCX0gZWxz
ZSB7Ci0JCWx4ID0gZXh0WzBdICYgMHgzZjsKLQkJbHkgPSBleHRbMV0gJiAweDNmOworCQlpZiAo
d2lpbW90ZV9kcGFkX2FzX2FuYWxvZykgeworCQkJbHggPSBkaWdpdGFsX3RvX2FuYWxvZ1sxIC0g
IShleHRbNF0gJiAweDgwKQorCQkJCSsgIShleHRbNV0gJiAweDAyKV07CisJCQlseSA9IGRpZ2l0
YWxfdG9fYW5hbG9nWzEgLSAhKGV4dFs0XSAmIDB4NDApCisJCQkJKyAhKGV4dFs1XSAmIDB4MDEp
XTsKKwkJfSBlbHNlIHsKKwkJCWx4ID0gKGV4dFswXSAmIDB4M2YpIC0gMHgyMDsKKwkJCWx5ID0g
KGV4dFsxXSAmIDB4M2YpIC0gMHgyMDsKKwkJfQogCX0KIAogCXJ4ID0gKGV4dFswXSA+PiAzKSAm
IDB4MTg7CkBAIC0xMTEwLDE5ICsxMTI2LDEzIEBAIHN0YXRpYyB2b2lkIHdpaW1vZF9jbGFzc2lj
X2luX2V4dChzdHJ1Y3Qgd2lpbW90ZV9kYXRhICp3ZGF0YSwgY29uc3QgX191OCAqZXh0KQogCXJ0
IDw8PSAxOwogCWx0IDw8PSAxOwogCi0JaW5wdXRfcmVwb3J0X2Ficyh3ZGF0YS0+ZXh0ZW5zaW9u
LmlucHV0LCBBQlNfSEFUMVgsIGx4IC0gMHgyMCk7Ci0JaW5wdXRfcmVwb3J0X2Ficyh3ZGF0YS0+
ZXh0ZW5zaW9uLmlucHV0LCBBQlNfSEFUMVksIGx5IC0gMHgyMCk7CisJaW5wdXRfcmVwb3J0X2Fi
cyh3ZGF0YS0+ZXh0ZW5zaW9uLmlucHV0LCBBQlNfSEFUMVgsIGx4KTsKKwlpbnB1dF9yZXBvcnRf
YWJzKHdkYXRhLT5leHRlbnNpb24uaW5wdXQsIEFCU19IQVQxWSwgbHkpOwogCWlucHV0X3JlcG9y
dF9hYnMod2RhdGEtPmV4dGVuc2lvbi5pbnB1dCwgQUJTX0hBVDJYLCByeCAtIDB4MjApOwogCWlu
cHV0X3JlcG9ydF9hYnMod2RhdGEtPmV4dGVuc2lvbi5pbnB1dCwgQUJTX0hBVDJZLCByeSAtIDB4
MjApOwogCWlucHV0X3JlcG9ydF9hYnMod2RhdGEtPmV4dGVuc2lvbi5pbnB1dCwgQUJTX0hBVDNY
LCBydCk7CiAJaW5wdXRfcmVwb3J0X2Ficyh3ZGF0YS0+ZXh0ZW5zaW9uLmlucHV0LCBBQlNfSEFU
M1ksIGx0KTsKIAotCWlucHV0X3JlcG9ydF9rZXkod2RhdGEtPmV4dGVuc2lvbi5pbnB1dCwKLQkJ
CSB3aWltb2RfY2xhc3NpY19tYXBbV0lJTU9EX0NMQVNTSUNfS0VZX1JJR0hUXSwKLQkJCSAhKGV4
dFs0XSAmIDB4ODApKTsKLQlpbnB1dF9yZXBvcnRfa2V5KHdkYXRhLT5leHRlbnNpb24uaW5wdXQs
Ci0JCQkgd2lpbW9kX2NsYXNzaWNfbWFwW1dJSU1PRF9DTEFTU0lDX0tFWV9ET1dOXSwKLQkJCSAh
KGV4dFs0XSAmIDB4NDApKTsKIAlpbnB1dF9yZXBvcnRfa2V5KHdkYXRhLT5leHRlbnNpb24uaW5w
dXQsCiAJCQkgd2lpbW9kX2NsYXNzaWNfbWFwW1dJSU1PRF9DTEFTU0lDX0tFWV9MVF0sCiAJCQkg
IShleHRbNF0gJiAweDIwKSk7CkBAIC0xMTU3LDIwICsxMTY3LDI5IEBAIHN0YXRpYyB2b2lkIHdp
aW1vZF9jbGFzc2ljX2luX2V4dChzdHJ1Y3Qgd2lpbW90ZV9kYXRhICp3ZGF0YSwgY29uc3QgX191
OCAqZXh0KQogCQkJIHdpaW1vZF9jbGFzc2ljX21hcFtXSUlNT0RfQ0xBU1NJQ19LRVlfWlJdLAog
CQkJICEoZXh0WzVdICYgMHgwNCkpOwogCi0JaWYgKHdkYXRhLT5zdGF0ZS5mbGFncyAmIFdJSVBS
T1RPX0ZMQUdfTVBfQUNUSVZFKSB7Ci0JCWlucHV0X3JlcG9ydF9rZXkod2RhdGEtPmV4dGVuc2lv
bi5pbnB1dCwKLQkJCSB3aWltb2RfY2xhc3NpY19tYXBbV0lJTU9EX0NMQVNTSUNfS0VZX0xFRlRd
LAotCQkJICEoZXh0WzFdICYgMHgwMSkpOwotCQlpbnB1dF9yZXBvcnRfa2V5KHdkYXRhLT5leHRl
bnNpb24uaW5wdXQsCi0JCQkgd2lpbW9kX2NsYXNzaWNfbWFwW1dJSU1PRF9DTEFTU0lDX0tFWV9V
UF0sCi0JCQkgIShleHRbMF0gJiAweDAxKSk7Ci0JfSBlbHNlIHsKKwlpZiAoIXdpaW1vdGVfZHBh
ZF9hc19hbmFsb2cpIHsKIAkJaW5wdXRfcmVwb3J0X2tleSh3ZGF0YS0+ZXh0ZW5zaW9uLmlucHV0
LAotCQkJIHdpaW1vZF9jbGFzc2ljX21hcFtXSUlNT0RfQ0xBU1NJQ19LRVlfTEVGVF0sCi0JCQkg
IShleHRbNV0gJiAweDAyKSk7CisJCQkJIHdpaW1vZF9jbGFzc2ljX21hcFtXSUlNT0RfQ0xBU1NJ
Q19LRVlfUklHSFRdLAorCQkJCSAhKGV4dFs0XSAmIDB4ODApKTsKIAkJaW5wdXRfcmVwb3J0X2tl
eSh3ZGF0YS0+ZXh0ZW5zaW9uLmlucHV0LAotCQkJIHdpaW1vZF9jbGFzc2ljX21hcFtXSUlNT0Rf
Q0xBU1NJQ19LRVlfVVBdLAotCQkJICEoZXh0WzVdICYgMHgwMSkpOworCQkJCSB3aWltb2RfY2xh
c3NpY19tYXBbV0lJTU9EX0NMQVNTSUNfS0VZX0RPV05dLAorCQkJCSAhKGV4dFs0XSAmIDB4NDAp
KTsKKworCQlpZiAod2RhdGEtPnN0YXRlLmZsYWdzICYgV0lJUFJPVE9fRkxBR19NUF9BQ1RJVkUp
IHsKKwkJCWlucHV0X3JlcG9ydF9rZXkod2RhdGEtPmV4dGVuc2lvbi5pbnB1dCwKKwkJCQkgd2lp
bW9kX2NsYXNzaWNfbWFwW1dJSU1PRF9DTEFTU0lDX0tFWV9MRUZUXSwKKwkJCQkgIShleHRbMV0g
JiAweDAxKSk7CisJCQlpbnB1dF9yZXBvcnRfa2V5KHdkYXRhLT5leHRlbnNpb24uaW5wdXQsCisJ
CQkJIHdpaW1vZF9jbGFzc2ljX21hcFtXSUlNT0RfQ0xBU1NJQ19LRVlfVVBdLAorCQkJCSAhKGV4
dFswXSAmIDB4MDEpKTsKKwkJfSBlbHNlIHsKKwkJCWlucHV0X3JlcG9ydF9rZXkod2RhdGEtPmV4
dGVuc2lvbi5pbnB1dCwKKwkJCQkgd2lpbW9kX2NsYXNzaWNfbWFwW1dJSU1PRF9DTEFTU0lDX0tF
WV9MRUZUXSwKKwkJCQkgIShleHRbNV0gJiAweDAyKSk7CisJCQlpbnB1dF9yZXBvcnRfa2V5KHdk
YXRhLT5leHRlbnNpb24uaW5wdXQsCisJCQkJIHdpaW1vZF9jbGFzc2ljX21hcFtXSUlNT0RfQ0xB
U1NJQ19LRVlfVVBdLAorCQkJCSAhKGV4dFs1XSAmIDB4MDEpKTsKKwkJfQogCX0KIAogCWlucHV0
X3N5bmMod2RhdGEtPmV4dGVuc2lvbi5pbnB1dCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9o
aWQtd2lpbW90ZS5oIGIvZHJpdmVycy9oaWQvaGlkLXdpaW1vdGUuaAppbmRleCBiMmEyNmEwYThm
MTIuLmFkNGZmODM3ZjQzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9oaWQvaGlkLXdpaW1vdGUuaAor
KysgYi9kcml2ZXJzL2hpZC9oaWQtd2lpbW90ZS5oCkBAIC0xNjIsNiArMTYyLDggQEAgc3RydWN0
IHdpaW1vdGVfZGF0YSB7CiAJc3RydWN0IHdvcmtfc3RydWN0IGluaXRfd29ya2VyOwogfTsKIAor
ZXh0ZXJuIGJvb2wgd2lpbW90ZV9kcGFkX2FzX2FuYWxvZzsKKwogLyogd2lpbW90ZSBtb2R1bGVz
ICovCiAKIGVudW0gd2lpbW9kX21vZHVsZSB7Ci0tIAoyLjI1LjEKCg==
--0000000000005f370d05a6dee1a3--
