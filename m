Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060E91CB2C3
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 17:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgEHP0S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 11:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgEHP0R (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 11:26:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46E2C061A0C
        for <linux-input@vger.kernel.org>; Fri,  8 May 2020 08:26:15 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id o14so1033737ljp.4
        for <linux-input@vger.kernel.org>; Fri, 08 May 2020 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elastisys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ay6cOOUq5Ku1GzTzY8Tlv4JfTAQBuf3zCfjQt6SFmbs=;
        b=joL8t7Ogu7XDyECnETEUujzstZTTDc9lF+FG+a29oehuM8Ta/wPlVXKOBOUPwy28EU
         M9GnZfwwwZcjZDPSSHZIi6sfKOadc7pqPmnt5HG//sHdw27WjpKB2mhDl7tOH2c/+Phg
         d7WHt9gorEZ05CotkAiRbBZC4V9E18DVK3MdrT/nTy5hUQNCFWurigiNE4VH3S7CvqlF
         WCE1LfXyiuLmUHkl6uCFsiW8NyzSow6xkxvOj/cm/GWQbZLujJU5klGLl3sIXhI6JCdo
         NYkni+i4Gk0aL52DZt+cOKtKs4coAeBQSKgln+3pBmBwPzh2+5kBc82E2s2h8/BIGueH
         pb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ay6cOOUq5Ku1GzTzY8Tlv4JfTAQBuf3zCfjQt6SFmbs=;
        b=h30zob3NZVL1kZGzXhpq505FSS+ckDrOZ6Y4U7tpFMlvH+hrcMeGLkNB+AWWFB5G6x
         Vj72yOJxncIXUrz53OsS/54Nn0x3ZtRtNVytv6eJKHYZiB+u7b+HH8Olqq4SsFjPHoxM
         elG9De5oV+G/BpUDE1gGAfB3cXeMqSZkQvXmE4BEWslWgpAEdJvUyUGFE2NYX5pvT/VZ
         aComaNozYeTQwGQgYixoETibSL/xpo6crf0faTb8VTmuGA25aCf9C1YHzCEzpukJ+gQP
         0gDLWIZ8BfL7Cu8ZXkr0XKt1bWlLVO5DYQ52ZFH0mY01lM+a5p7FuputFGgj0b3qxBp6
         qDtg==
X-Gm-Message-State: AOAM530Wf+X3VCzrvNuk4CAmuxDM3DPFwqwvkGs7oUbgn4HLKu28hTjd
        +9ZGOYVrNGEDPFnndy7+TInlaQ==
X-Google-Smtp-Source: ABdhPJwHBZm0ZsBEiJ3p6BLYlCCneE3ALP+doNgWNsrisxG75515a0Qc2QmXlV4J1WN2stWUBIwSSA==
X-Received: by 2002:a05:651c:50e:: with SMTP id o14mr2139418ljp.52.1588951574078;
        Fri, 08 May 2020 08:26:14 -0700 (PDT)
Received: from localhost.localdomain (90-224-48-115-no56.tbcn.telia.com. [90.224.48.115])
        by smtp.gmail.com with ESMTPSA id i3sm1394104ljg.82.2020.05.08.08.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 08:26:13 -0700 (PDT)
From:   Cristian Klein <cristian.klein@elastisys.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org,
        Cristian Klein <cristian.klein@elastisys.com>
Subject: [PATCH] Add quirks for Trust Panora Graphic Tablet
Date:   Fri,  8 May 2020 17:26:04 +0200
Message-Id: <20200508152604.21143-1-cristian.klein@elastisys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Trust Panora Graphic Tablet has two interfaces. Interface zero
reports pen movement, pen pressure and pen buttons. Interface one
reports tablet buttons and tablet scroll. Both use the mouse protocol.

Without these quirks, libinput gets confused about what device it talks
to.

For completeness, here is the usbhid-dump:

```
$ sudo usbhid-dump -d 145f:0212
003:013:001:DESCRIPTOR         1588949402.559961
 05 0D 09 01 A1 01 85 07 A1 02 09 00 75 08 95 07
 81 02 C0 C0 09 0E A1 01 85 05 09 23 A1 02 09 52
 09 53 25 0A 75 08 95 02 B1 02 C0 C0 05 0C 09 36
 A1 00 85 06 05 09 19 01 29 20 15 00 25 01 95 20
 75 01 81 02 C0

003:013:000:DESCRIPTOR         1588949402.563942
 05 01 09 02 A1 01 85 08 09 01 A1 00 05 09 19 01
 29 03 15 00 25 01 95 03 75 01 81 02 95 05 81 01
 05 01 09 30 09 31 09 38 09 00 15 81 25 7F 75 08
 95 04 81 06 C0 C0 05 01 09 02 A1 01 85 09 09 01
 A1 00 05 09 19 01 29 03 15 00 25 01 95 03 75 01
 81 02 95 05 81 01 05 01 09 30 09 31 26 FF 7F 95
 02 75 10 81 02 05 0D 09 30 26 FF 03 95 01 75 10
 81 02 C0 C0 05 01 09 00 A1 01 85 04 A1 00 26 FF
 00 09 00 75 08 95 07 B1 02 C0 C0
```

Signed-off-by: Cristian Klein <cristian.klein@elastisys.com>
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 1c71a1aa7..f03f1cc91 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1157,6 +1157,9 @@
 #define USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCREEN_8882	0x8882
 #define USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCREEN_8883	0x8883
 
+#define USB_VENDOR_ID_TRUST             0x145f
+#define USB_DEVICE_ID_TRUST_PANORA_TABLET   0x0212
+
 #define USB_VENDOR_ID_TURBOX		0x062a
 #define USB_DEVICE_ID_TURBOX_KEYBOARD	0x0201
 #define USB_DEVICE_ID_ASUS_MD_5110	0x5110
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index e4cb543de..ca8b5c261 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -168,6 +168,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TOUCHPACK, USB_DEVICE_ID_TOUCHPACK_RTS), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TPV, USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCREEN_8882), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TPV, USB_DEVICE_ID_TPV_OPTICAL_TOUCHSCREEN_8883), HID_QUIRK_NOGET },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_TRUST, USB_DEVICE_ID_TRUST_PANORA_TABLET), HID_QUIRK_MULTI_INPUT | HID_QUIRK_HIDINPUT_FORCE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TURBOX, USB_DEVICE_ID_TURBOX_KEYBOARD), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, USB_DEVICE_ID_UCLOGIC_TABLET_KNA5), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, USB_DEVICE_ID_UCLOGIC_TABLET_TWA60), HID_QUIRK_MULTI_INPUT },
-- 
2.20.1

