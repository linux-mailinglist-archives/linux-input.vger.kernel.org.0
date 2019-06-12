Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD8E4496D
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfFMRRG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:17:06 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46658 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbfFLV1Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:27:25 -0400
Received: by mail-pl1-f194.google.com with SMTP id e5so7144092pls.13;
        Wed, 12 Jun 2019 14:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y+wv7iX7SMqE+W9hLG2VgA3zTP87AXC2cEtK/8C9IT8=;
        b=b5m+xNA8Efyi+r2WOXDP2kSW3aiv+dZt9eBtAIRennxzgY2X3R6YColvPxqu06SZRi
         rxgcZlXpRDI7HJOdhFF85t2GdKbVenHQmRdJRm9ZH/fsynL/axVRXmVbaWxxKFRwt2m3
         jD1N+oEwZNgFrldWru6EI4uhMJLzZPMjfQ8mR1g8WtQHKQSspy95XIrCG+suvIs06Lje
         LXbdhsbh/D0u11MxwKsR4T8iINWGaCwCs+PLXp7sPYKFcI6ijgDBg/eiE/TNlIoYj+ek
         3E+XGNy8URB1pqNwrxNeFrBaJPke+3K7fEZ4D9oyZO8LEUeGAjqPFxKIJtZQ31dsy/UG
         E98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y+wv7iX7SMqE+W9hLG2VgA3zTP87AXC2cEtK/8C9IT8=;
        b=lJzpnXQDYIv+6d4lzdiXob3iQZ43/DBsl3fRW8VqHHv2X06YVM0G7c9CvLIlrrpaAN
         LStIGorhcx31KJIIlJKsGKxhFgT3er275I/g3gqTMey8duvHuGXCbNTpQIYFpRFqvRPH
         EYeVbkPntBV1CWcUI0r5EQ7Cik1IV8Cv2UcVnLS6+TPrPvN1QcyxVXcRHfUoOoYbEB1H
         vQdu67fkmEgUh+ElI087snEcfpgFnMll1JO894bCpxf6QBZ+2q0JVuAdsVPM+NBaz5j4
         5g1Kbj1S0lJlEFrSnvIBg9lrxUHsJMr2m6fL2T9WxFSYQfAw0msU9ZpJMGqWyQNPLJhR
         x13w==
X-Gm-Message-State: APjAAAXOtwLayoFppv5m8WJ1mdel27aO7zHba6JZD91xgF2lzDhp8WqV
        BL940wvfwf6at8s6rh4yfAo=
X-Google-Smtp-Source: APXvYqyk+af3ljb+IEPx5dom264fLKvAzHu11B+zZ0MFoNlDkLVB49AGCOThA8e2flaZ57ISyJF88A==
X-Received: by 2002:a17:902:b497:: with SMTP id y23mr59306507plr.309.1560374844699;
        Wed, 12 Jun 2019 14:27:24 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id y133sm505346pfb.28.2019.06.12.14.27.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 14:27:24 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org
Cc:     hdegoede@redhat.com, bjorn.andersson@linaro.org, agross@kernel.org,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v6 2/5] HID: quirks: Refactor ELAN 400 and 401 handling
Date:   Wed, 12 Jun 2019 14:27:21 -0700
Message-Id: <20190612212721.32195-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
References: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
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
which is now in a header file that hid-quirks can access, use that to
implement a blacklist in hid-quirks so that only the devices that need to
be handled by elan_i2c get rejected by hid-quirks, and everything else is
handled by default.

Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/hid/hid-quirks.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index e5ca6fe2ca57..bd81bb090222 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
+#include <linux/input/elan-i2c-ids.h>
 
 #include "hid-ids.h"
 
@@ -914,6 +915,8 @@ static const struct hid_device_id hid_mouse_ignore_list[] = {
 
 bool hid_ignore(struct hid_device *hdev)
 {
+	int i;
+
 	if (hdev->quirks & HID_QUIRK_NO_IGNORE)
 		return false;
 	if (hdev->quirks & HID_QUIRK_IGNORE)
@@ -978,18 +981,20 @@ bool hid_ignore(struct hid_device *hdev)
 		break;
 	case USB_VENDOR_ID_ELAN:
 		/*
-		 * Many Elan devices have a product id of 0x0401 and are handled
-		 * by the elan_i2c input driver. But the ACPI HID ELAN0800 dev
-		 * is not (and cannot be) handled by that driver ->
-		 * Ignore all 0x0401 devs except for the ELAN0800 dev.
+		 * Blacklist of everything that gets handled by the elan_i2c
+		 * input driver.  This avoids disabling valid touchpads and
+		 * other ELAN devices.
 		 */
-		if (hdev->product == 0x0401 &&
-		    strncmp(hdev->name, "ELAN0800", 8) != 0)
-			return true;
-		/* Same with product id 0x0400 */
-		if (hdev->product == 0x0400 &&
-		    strncmp(hdev->name, "QTEC0001", 8) != 0)
-			return true;
+		if ((hdev->product == 0x0401 || hdev->product == 0x0400)) {
+			for (i = 0; strlen(elan_acpi_id[i].id); ++i)
+				if (!strncmp(hdev->name, elan_acpi_id[i].id,
+					     strlen(elan_acpi_id[i].id)))
+					return true;
+			for (i = 0; strlen(elan_of_match[i].name); ++i)
+				if (!strncmp(hdev->name, elan_of_match[i].name,
+					     strlen(elan_of_match[i].name)))
+					return true;
+		}
 		break;
 	}
 
-- 
2.17.1

