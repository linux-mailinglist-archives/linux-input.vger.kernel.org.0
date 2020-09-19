Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E23271069
	for <lists+linux-input@lfdr.de>; Sat, 19 Sep 2020 22:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgISUE5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Sep 2020 16:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgISUE5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Sep 2020 16:04:57 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C554C0613CE;
        Sat, 19 Sep 2020 13:04:57 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id n22so9264024edt.4;
        Sat, 19 Sep 2020 13:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=VNdVm0qjWANV+k8o/qFZrx8yrtDDDYIfNRixrZTkFtI=;
        b=kskcrheTxsjTIrQVeP6MdQi4U5gZ/ntOTUiAAnZlvSwJADnMKFK4DlxPR1Xhyy+Zu+
         PMQgTNzkZBRJ9+T4tIfQ8WNrAdJrjZ+zfC4lvEjZmSW/Fn0vy0Kn9NBTSLCVpVbLlC25
         pkLT21r2ucwZsAiAsl11SZpR6ygnqgWwWc04fqtRT8fyK9XdpPkp9L5fv9kEF9j5ZD83
         pMtMFva23ct8DQGw2o1fKLuIpLYj4DpjBJtXutr+2CsZpqVkuQuM8uGty4A823sGV1Nr
         VGolbaVRUYi145kKu8Y+HzWvsUzxyUzD0esZot13I5bw9SxFpJjHykcvMGf4LL+ayDn4
         xNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=VNdVm0qjWANV+k8o/qFZrx8yrtDDDYIfNRixrZTkFtI=;
        b=DK0AOe/ugO7Oxc+Jy3+Z3RkxoR3BRZ2CT37KBYsbfbanwKm4MJxNECVMt/kGX3c61F
         fNlX6XhcODQlxhHOQQpcShy/g+M0VNlQrXMoJ48gNXoo+V26HH77/M2EurPljXP6liaI
         Hn+a6H2/BqZW9SApRfrBE//nN8eccIBs89hL7G/wbtahpDuDlDmf5Tg1dyx1shgQL+6K
         SYFYEhqTT2bh1a6MZESbVzg1bvlVScUZ6lAa2G9RTwJ29KldDmk1BPG94Q4xjPBAnuIC
         eS31oYvIARqhDriWLxw5gEA2J0uXJnwaCYVLTS7tdTSvj7l8ThkpExc/Vywzu6CIg7ON
         8VLA==
X-Gm-Message-State: AOAM532dyKz60RxLoNFTnVQV5h2m6oV+ZPQEKgu6oSEQIdlwGOp4+SIj
        htfxmDARIgtcVG/YYlQ+s4uXYImWUNJ3Pqdv4dPT1yRQW+i9Iw==
X-Google-Smtp-Source: ABdhPJzHKwVw+CxCv0ZligwmUeji7ZCv31u0VbhT9/h/+ebgnwuR0WCpOqOdSOlIQSTIOmt3TeykAg2ugseJGbyoEiA=
X-Received: by 2002:aa7:cad3:: with SMTP id l19mr43047942edt.352.1600545895900;
 Sat, 19 Sep 2020 13:04:55 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Mikael_Wikstr=C3=B6m?= <leakim.wikstrom@gmail.com>
Date:   Sat, 19 Sep 2020 22:04:45 +0200
Message-ID: <CADGsf-Gs9EM770jTVX=yABBLAT1rdfBYb5jam720yqez=D3VHg@mail.gmail.com>
Subject: [PATCH] HID: multitouch: Lenovo X1 Tablet Gen3 trackpoint and buttons
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

One more device that needs 40d5bb87 to resolve regression for the trackpoin=
t
and three mouse buttons on the type cover of the Lenovo X1 Tablet Gen3.

It is probably also needed for the Lenovo X1 Tablet Gen2 with PID 0x60a3

Signed-off-by: Mikael Wikstr=C3=B6m <leakim.wikstrom@gmail.com>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 74fc1df6e3c2..6a6e2c1b6090 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -727,6 +727,7 @@
 #define USB_DEVICE_ID_LENOVO_TP10UBKBD 0x6062
 #define USB_DEVICE_ID_LENOVO_TPPRODOCK 0x6067
 #define USB_DEVICE_ID_LENOVO_X1_COVER 0x6085
+#define USB_DEVICE_ID_LENOVO_X1_TAB3 0x60b5
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D 0x608d
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019 0x6019
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_602E 0x602e
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e3152155c4b8..99f041afd5c0 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1973,6 +1973,12 @@ static const struct hid_device_id mt_devices[] =3D {
  HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
  USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_7010) },

+ /* Lenovo X1 TAB Gen 3 */
+ { .driver_data =3D MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+ HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+    USB_VENDOR_ID_LENOVO,
+    USB_DEVICE_ID_LENOVO_X1_TAB3) },
+
  /* MosArt panels */
  { .driver_data =3D MT_CLS_CONFIDENCE_MINUS_ONE,
  MT_USB_DEVICE(USB_VENDOR_ID_ASUS,
--=20
2.26.2
