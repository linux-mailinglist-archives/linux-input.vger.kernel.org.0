Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECDCAB23A
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2019 08:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732510AbfIFGLh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Sep 2019 02:11:37 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:39077 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729318AbfIFGLg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Sep 2019 02:11:36 -0400
Received: by mail-vs1-f67.google.com with SMTP id y62so3317233vsb.6;
        Thu, 05 Sep 2019 23:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=slg7uN4SvyjjmqCyA16E57RHtlNyBvfp+SaMsUPiedI=;
        b=ob+u8HrwT46IfOn9XzzWSMuDeSABDv6iOHsYLVHBvIzxO4Zwrh9ESMUq4zbHHh40mP
         OKZ2N6nZuA9ISOjXmhW6ijTVavAfqbWp7iu+023lfZyz2/UW4EvC1FbhL/vdbESao4Qr
         ZskTSjzOyMaYewWaifhKuNBpXTG0DRKyUzplP/cNiHaujxP6a1+ClCXqcDgy8FvtxvpY
         gQZnygHuc+99qp4jZZ1fJqeICqqn+cet7dUyLVtVMEycUb2CmS+cm//Xl0HOHwGS8P4e
         HiHILGS8Ujtn6T+wLxYimK1tgMr4lVdp/FLTdma59kdOsBmYHCT0c67h0PMWKTd9eabM
         b5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=slg7uN4SvyjjmqCyA16E57RHtlNyBvfp+SaMsUPiedI=;
        b=ikx60qi5brNsohkguuZ2Jth+qGlmS6rxxKVs+xd/08bvhlVwgEM3j4ZDqr4wm9EL0F
         mqQ9cFTw4MQ4iLY5XMM3OxjRjBYujrQ2FXMlBNF7adKGwWm+1Bsh7kGIUYNSuGcJNYYd
         JzP8D4kRHx7DGCnIXOCF0ZKBQboPoghL+z0Dg1h2d+pCXzMtOFuinbhjk/yVKEsYU3pV
         OVzexInGCdAJ3ZnFNq4JJ/wbCghquY/ZutO+LbTUyfV0SUn2pNiZ5JfHmvUu8VbD51fK
         AjPPMs+LGnyjpW0LrualeevyPu5IudRqDB+76b+O79fYrlwDqy98uQTLAVU+SgN8wfFM
         BhyA==
X-Gm-Message-State: APjAAAUJTNQj3/ykjCbtk7rxTJc+uJCGJ/lb8eC740fmqYuCuKFbofPW
        vBYp4p93xSkyj09jAarPqYdrc2iB+P3mSXjuAF+60Yb3c28=
X-Google-Smtp-Source: APXvYqxGptjapVHShpKI3atRh7D1xhiLnffy2++ZvPGvDvkjhjLdqMObkGL5M9aURIj5ubITCJx7ykTYHyy5rIoIYOQ=
X-Received: by 2002:a67:70c7:: with SMTP id l190mr4040201vsc.147.1567750295368;
 Thu, 05 Sep 2019 23:11:35 -0700 (PDT)
MIME-Version: 1.0
From:   Ethan Warth <redyoshi49q@gmail.com>
Date:   Fri, 6 Sep 2019 01:11:08 -0500
Message-ID: <CAAPc1Th4mgE=ntLY=NXn2Jbfgi0OBpZ5R2sYGhWJ_4+syuPA9w@mail.gmail.com>
Subject: [PATCH] HID: add support for 0079:1846 Mayflash/Dragonrise USB
 Gamecube Adapter
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From 32bdfb1d652cc38ab13f8616df58dee726201785 Mon Sep 17 00:00:00 2001
From: Ethan Warth <redyoshi49q@gmail.com>
Date: Wed, 4 Sep 2019 16:07:45 -0500
Subject: [PATCH] HID: add support for 0079:1846 Mayflash/Dragonrise USB Gam=
ecube
 Adapter

Mayflash/Dragonrise seems to have yet another device ID for one of their
Gamecube controller adapters.  Previous to this commit, the adapter
registered only one /dev/input/js* device, and all controller inputs (from
any controller) were mapped to this device.  This patch defines the 1846
USB device ID and enables the HID_QUIRK_MULTI_INPUT quirk for it, which
fixes that (with the patch, four /dev/input/js* devices are created, one
for each of the four controller ports).
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-mf.c     | 2 ++
 drivers/hid/hid-quirks.c | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0a00be19f7a0..9cd909985a4c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -362,6 +362,7 @@
 #define USB_DEVICE_ID_DRAGONRISE_DOLPHINBAR    0x1803
 #define USB_DEVICE_ID_DRAGONRISE_GAMECUBE1    0x1843
 #define USB_DEVICE_ID_DRAGONRISE_GAMECUBE2    0x1844
+#define USB_DEVICE_ID_DRAGONRISE_GAMECUBE3    0x1846

 #define USB_VENDOR_ID_DWAV        0x0eef
 #define USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER    0x0001
diff --git a/drivers/hid/hid-mf.c b/drivers/hid/hid-mf.c
index fc75f30f537c..92d7ecd41a78 100644
--- a/drivers/hid/hid-mf.c
+++ b/drivers/hid/hid-mf.c
@@ -153,6 +153,8 @@ static const struct hid_device_id mf_devices[] =3D {
         .driver_data =3D HID_QUIRK_MULTI_INPUT },
     { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_GAMECUBE2),
         .driver_data =3D 0 }, /* No quirk required */
+    { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_GAMECUBE3),
+        .driver_data =3D HID_QUIRK_MULTI_INPUT },
     { }
 };
 MODULE_DEVICE_TABLE(hid, mf_devices);
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 166f41f3173b..a11f1abb029e 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -72,6 +72,7 @@ static const struct hid_device_id hid_quirks[] =3D {
     { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_REDRAGON_SEYMUR2),
HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
     { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_DOLPHINBAR), HID_QUIRK_MULTI_INPUT },
     { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_GAMECUBE1), HID_QUIRK_MULTI_INPUT },
+    { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_GAMECUBE3), HID_QUIRK_MULTI_INPUT },
     { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_PS3), HID_QUIRK_MULTI_INPUT },
     { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_WIIU), HID_QUIRK_MULTI_INPUT },
     { HID_USB_DEVICE(USB_VENDOR_ID_DWAV,
USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER), HID_QUIRK_MULTI_INPUT |
HID_QUIRK_NOGET },
@@ -476,6 +477,7 @@ static const struct hid_device_id
hid_have_special_driver[] =3D {
     { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_DOLPHINBAR) },
     { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_GAMECUBE1) },
     { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_GAMECUBE2) },
+    { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
USB_DEVICE_ID_DRAGONRISE_GAMECUBE3) },
 #endif
 #if IS_ENABLED(CONFIG_HID_MICROSOFT)
     { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT,
USB_DEVICE_ID_MS_COMFORT_MOUSE_4500) },
--=20
2.17.1

Some lines added in the patch exceed the recommended line width; this is
so that the added lines can share a consistent format with other lines in
the adjacent code.

Signed-off-by: Ethan Warth <redyoshi49q@gmail.com>



Perfect normality is impossible.  Be unique!
   =E2=80=95redyoshi49q
