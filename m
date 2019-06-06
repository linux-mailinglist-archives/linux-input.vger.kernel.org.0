Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2179637948
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 18:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729473AbfFFQOu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 12:14:50 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36233 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729274AbfFFQOt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jun 2019 12:14:49 -0400
Received: by mail-pf1-f195.google.com with SMTP id u22so1812422pfm.3;
        Thu, 06 Jun 2019 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=B5wLl+YS4U2tVksgO85z+E1LoD1/vOzmBbZ1zPgToTM=;
        b=NbDOayxz82/pq+sYAsE0vSZg6qdBsf1iqDMh+s6sdXVJCGiRmr6iHTPoeoLzt/Dmpn
         cor/xSOqOXRQXPi41KlkPmdGK74yoIn0yWSGmorf/GmiKDCr1smSUqam2YFA1fyodNCa
         7mw+Ibzysa2S6WcKljI0v88OJPWvN0iCqzj7k4DIjYCyABLQdiN/DBAsbEWRk6X+VcXX
         PGU8ZurIWWtYeR2ZMIEGeGmgAyWcTE5g7KFLSPlxTUfY0XLzGZFHQlFs2meuiWZoP9yZ
         ZAbBU8Oxa2a9rSzh7yYFS+CAIt2mZVuLkGGAsH94lz2tyNQiNqqfCxMrYkDMvnzabXcZ
         2S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=B5wLl+YS4U2tVksgO85z+E1LoD1/vOzmBbZ1zPgToTM=;
        b=QqYbYTIw3Kbetj1AHfqt/AwWgrl0Z1tWkMSam8GFOQHnZILwofunxLf3ZRUgRk7DAQ
         cZtsZz7J45Xk5XDBXPwucvybcAGUPf8BB5Dy1J7CzVY2L71Uz75fQUNq3RGeL7JeaX/c
         AJIiIoWwr2n6qlCDmF6o8KZ9SgTT6cWFU9Xlkb+h0l9BxygSG1w//VrvOt1sVybH+yif
         O9fGdV4lB/BWa1V3Mh9o758dosGnbqDc3MaTUjpQlUQIsAvbyzf0Aw1hdUXg9nflaZ0+
         m+jSSuPe3sBHst3xX4Q/AQQczO2qJ3UYwYJ0PnQBIzny5hjlgX+iIXPdn74h62GU3xDn
         +KlA==
X-Gm-Message-State: APjAAAWIVvLKgot+l6DnYedUZGVo5/dC+32bz2Zser1nf+POo0n3cc6l
        bBKYgd/62PTA5ap2tCr0kIc=
X-Google-Smtp-Source: APXvYqx2xEvbqnn+jfpsZPwqPflY1KYU7GD3on/WcUO2MMjSiX6Bl6xhhkAUmQKNl/mVJhfn9bI7OA==
X-Received: by 2002:a63:db47:: with SMTP id x7mr4023799pgi.259.1559837689142;
        Thu, 06 Jun 2019 09:14:49 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id n7sm2370070pgi.54.2019.06.06.09.14.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 09:14:48 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org
Cc:     bjorn.andersson@linaro.org, lee.jones@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org,
        david.brown@linaro.org, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 2/3] HID: quirks: Refactor ELAN 400 and 401 handling
Date:   Thu,  6 Jun 2019 09:13:22 -0700
Message-Id: <20190606161322.47192-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606161055.47089-1-jeffrey.l.hugo@gmail.com>
References: <20190606161055.47089-1-jeffrey.l.hugo@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There needs to be coordination between hid-quirks and the elan_i2c driver
about which devices are handled by what drivers.  Currently, both use
whitelists, which results in valid devices being unhandled by default,
when they should not be rejected by hid-quirks.  This is quickly becoming
an issue.

Since elan_i2c has a maintained whitelist of what devices it will handle,
use that to implement a blacklist in hid-quirks so that only the devices
that need to be handled by elan_i2c get rejected by hid-quirks, and
everything else is handled by default.  The downside is the whitelist and
blacklist need to be kept in sync.

Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/hid/hid-quirks.c | 78 ++++++++++++++++++++++++++++++++++------
 1 file changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index e5ca6fe2ca57..edebd0700e3d 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -912,8 +912,66 @@ static const struct hid_device_id hid_mouse_ignore_list[] = {
 	{ }
 };
 
+/* 
+ * List of device names that elan_i2c is handling and HID should ignore.  Must
+ * be kept in sync with elan_i2c
+ */
+static const char *hid_elan_i2c_ignore[] = {
+	"ELAN0000",
+	"ELAN0100",
+	"ELAN0600",
+	"ELAN0601",
+	"ELAN0602",
+	"ELAN0603",
+	"ELAN0604",
+	"ELAN0605",
+	"ELAN0606",
+	"ELAN0607",
+	"ELAN0608",
+	"ELAN0609",
+	"ELAN060B",
+	"ELAN060C",
+	"ELAN060F",
+	"ELAN0610",
+	"ELAN0611",
+	"ELAN0612",
+	"ELAN0613",
+	"ELAN0614",
+	"ELAN0615",
+	"ELAN0616",
+	"ELAN0617",
+	"ELAN0618",
+	"ELAN0619",
+	"ELAN061A",
+	"ELAN061B",
+	"ELAN061C",
+	"ELAN061D",
+	"ELAN061E",
+	"ELAN061F",
+	"ELAN0620",
+	"ELAN0621",
+	"ELAN0622",
+	"ELAN0623",
+	"ELAN0624",
+	"ELAN0625",
+	"ELAN0626",
+	"ELAN0627",
+	"ELAN0628",
+	"ELAN0629",
+	"ELAN062A",
+	"ELAN062B",
+	"ELAN062C",
+	"ELAN062D",
+	"ELAN0631",
+	"ELAN0632",
+	"ELAN1000",
+	"elan,ekth3000",
+	"" /* sentinel */
+};
 bool hid_ignore(struct hid_device *hdev)
 {
+	int i;
+
 	if (hdev->quirks & HID_QUIRK_NO_IGNORE)
 		return false;
 	if (hdev->quirks & HID_QUIRK_IGNORE)
@@ -978,18 +1036,16 @@ bool hid_ignore(struct hid_device *hdev)
 		break;
 	case USB_VENDOR_ID_ELAN:
 		/*
-		 * Many Elan devices have a product id of 0x0401 and are handled
-		 * by the elan_i2c input driver. But the ACPI HID ELAN0800 dev
-		 * is not (and cannot be) handled by that driver ->
-		 * Ignore all 0x0401 devs except for the ELAN0800 dev.
+		 * Blacklist of everything that gets handled by the elan_i2c
+		 * input driver.  This should be kept in sync with the whitelist
+		 * that exists in that driver.  This avoids disabling valid
+		 * touchpads and other ELAN devices.
 		 */
-		if (hdev->product == 0x0401 &&
-		    strncmp(hdev->name, "ELAN0800", 8) != 0)
-			return true;
-		/* Same with product id 0x0400 */
-		if (hdev->product == 0x0400 &&
-		    strncmp(hdev->name, "QTEC0001", 8) != 0)
-			return true;
+		if ((hdev->product == 0x0401 || hdev->product == 0x0400))
+			for (i = 0; strlen(hid_elan_i2c_ignore[i]); ++i)
+				if (!strncmp(hdev->name, hid_elan_i2c_ignore[i],
+					    strlen(hid_elan_i2c_ignore[i])))
+					return true;
 		break;
 	}
 
-- 
2.17.1

