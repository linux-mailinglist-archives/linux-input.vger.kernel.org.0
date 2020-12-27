Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952882E313D
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 14:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgL0NIu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 08:08:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgL0NIt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 08:08:49 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBCDC061794
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 05:08:09 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 23so18371232lfg.10
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 05:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elastisys.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A0Y7hnD5dYH8yHsms8gSHrFLlh1mGNgo1yqJoiiN+Wo=;
        b=B8b+TzXs6bNbn2gyR2IxfktTOwZfw6dK9FJXzeoDjxLqqUOHJv/LcdK7az4rTptz5I
         qua76S2NcbR/zSsr7Ouyauncn0uxSgItVlqh9zOAYo1A9pp8pHbI9+as/1ccas8LF07e
         yHh1F0W5+nKYoNXpRyHDL3JpP7aJd2EGv/DpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A0Y7hnD5dYH8yHsms8gSHrFLlh1mGNgo1yqJoiiN+Wo=;
        b=PxXPRDhhyi5pPvqQTOGndyLhVyNByBxfc1Rr/gUcpN2g0ZctR1cvaqengHWyDlvapE
         g5dfaQ20dYxcMP67bt30lIoiL73iwns4iH4yhUexUWIj3Zwp0j5chWvB4Aa2gSVUzso8
         se0U7K4iIdnEZzzIlV8t4TyFhY7Pd0XCsEf40631cwMESIRooeqUcfS8uA3wLGrpabNP
         LoXfz+TdZmS9F151H+vvjkSUK/ufvQAcclvi8GA7sAXzSVp2H4XDVsa7eGR/jZoNkbgZ
         +61WMdE9kUp9xLtXyTvrUSub1NolgdLSsZEWmoYwnqzgm96MsKVG5v25Yxovnfi8MHgC
         ntWw==
X-Gm-Message-State: AOAM532jh9SKHcRaecjPqVdQhxeJLtUV7lS/4/Ef56/N3Ik61G6Y7rD+
        in32BCU0C9Gv0h3Ijf276jE6Sw==
X-Google-Smtp-Source: ABdhPJzexSFGumKU1FkwebQnNNivt4RhrWvcZQkW+H9SfvsU2aZEfk2HGKAoer2DllpEQ8MNJizzZw==
X-Received: by 2002:a2e:7317:: with SMTP id o23mr20602568ljc.418.1609074487682;
        Sun, 27 Dec 2020 05:08:07 -0800 (PST)
Received: from localhost.localdomain (90-224-48-115-no56.tbcn.telia.com. [90.224.48.115])
        by smtp.gmail.com with ESMTPSA id n22sm4998216lfq.191.2020.12.27.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 05:08:07 -0800 (PST)
From:   Cristian Klein <cristian.klein@elastisys.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org,
        Cristian Klein <cristian.klein@elastisys.com>
Subject: [PATCH] HID: uclogic: Improve support for Trust Panora
Date:   Sun, 27 Dec 2020 14:08:15 +0100
Message-Id: <20201227130815.437433-1-cristian.klein@elastisys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After more discussions with the [libinput project][1], it has been
determined that the uclogic driver provides better support for this
tablet. Fortunately, the Trust Panora is physically and logically
identical with the UGEE G5, despite having a different USB vendor and
product ID.

[1]: https://gitlab.freedesktop.org/libinput/libinput/-/issues/482

Signed-off-by: Cristian Klein <cristian.klein@elastisys.com>
---
 drivers/hid/hid-quirks.c         | 1 -
 drivers/hid/hid-uclogic-core.c   | 2 ++
 drivers/hid/hid-uclogic-params.c | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index d9ca874dffa..186827b46a0 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -180,7 +180,6 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TOUCHPACK, USB_DEVICE_ID_TOUCHPACK_RTS), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TPV, USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCREEN_8882), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TPV, USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCREEN_8883), HID_QUIRK_NOGET },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_TRUST, USB_DEVICE_ID_TRUST_PANORA_TABLET), HID_QUIRK_MULTI_INPUT | HID_QUIRK_HIDINPUT_FORCE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TURBOX, USB_DEVICE_ID_TURBOX_KEYBOARD), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, USB_DEVICE_ID_UCLOGIC_TABLET_KNA5), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, USB_DEVICE_ID_UCLOGIC_TABLET_TWA60), HID_QUIRK_MULTI_INPUT },
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index 8e9c9e646cb..6a9865dd703 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -371,6 +371,8 @@ static const struct hid_device_id uclogic_devices[] = {
 				USB_DEVICE_ID_HUION_TABLET) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HUION,
 				USB_DEVICE_ID_HUION_HS64) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_TRUST,
+				USB_DEVICE_ID_TRUST_PANORA_TABLET) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC,
 				USB_DEVICE_ID_HUION_TABLET) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC,
diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index d26d8cd98ef..50e462d49d4 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -1045,6 +1045,8 @@ int uclogic_params_init(struct uclogic_params *params,
 			uclogic_params_init_with_pen_unused(&p);
 		}
 		break;
+	case VID_PID(USB_VENDOR_ID_TRUST,
+		     USB_DEVICE_ID_TRUST_PANORA_TABLET):
 	case VID_PID(USB_VENDOR_ID_UGEE,
 		     USB_DEVICE_ID_UGEE_TABLET_G5):
 		/* Ignore non-pen interfaces */
-- 
2.25.1

