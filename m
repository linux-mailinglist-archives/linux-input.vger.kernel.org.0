Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2617C4D079
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2019 16:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfFTOfk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jun 2019 10:35:40 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38266 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbfFTOfj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jun 2019 10:35:39 -0400
Received: by mail-pl1-f195.google.com with SMTP id g4so1477995plb.5;
        Thu, 20 Jun 2019 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GoE2Orc5MXhxi85M/gd8MdklhhXDFLFTeptMP8vj//U=;
        b=HUEgxAgHQ4h/hWDS/gJN1/028nSfoQIe8/GMSmnBC5Y7R9pYzkBkCFJBW75YZChLUR
         HVxecQ9JsKKv4Jt3e3SiXsZCHeFgWcNvXp/sEOHrrgLzJbPdF40JkBzn/pd1AqHoyTB2
         s4UEwkzjJpYuwB4l+xVd5Ac9480abzckfJIluuoRGif4cnRzxKzru+IHAdXFJ4YLFBg6
         lzDmaXlzBQpdGeA1UN/e5cAPJnAGTPG7hU7tW1Z45fT36oXdh7xPauELKilAKCggnwDe
         YurjujiSVWNkloGxdaa5aoMGl26IcmD3WClsCRw21vKEuTe/ipMQNu5l8iukRmkZ33+H
         rYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GoE2Orc5MXhxi85M/gd8MdklhhXDFLFTeptMP8vj//U=;
        b=EqryrWbOjy41lTP/H9nqDkyWxm8pY4DJI4/eqwq+y7/epEx/EoFFgHfCp9rhvuT/dF
         O1JLyh8kLi3zNEhYFhiQMeZvs2gDwwLM5LQaCT5KMGYGmzsSVrcdslSfUdgnLQ6P9tX+
         sTF3fLnTH3vaSYwjkrXGHLs1Jzyh20X8y04E0F0mMyR5IGR9Fgjs9vmThHnUgpnhwTZm
         RhidHuv4BabA/HYLx1JvXZ3CFXr45gbdrCFgimakMduyKmp0otiqoOhy674DL/mMdmf0
         8t2CVRDe8sPNq/VS75/kehmW9/uiaFl+LXWhnQDtc5I9Wyq8+qOvuQJ5fsoNn9QeBH96
         FFXQ==
X-Gm-Message-State: APjAAAV69vVX6fKJrAItiV1z7sWhTFxhg/F5n9R1EaMOt8FUoLRYCtrq
        Y6B9YJOnluPasqdWvgvo6gbUAApL
X-Google-Smtp-Source: APXvYqwjGTPXKRpdrQcIahMMMzkoG/uDb4UWmg3LBL3O7Ipm+7JSBRov8JLyC7K3N8ZNnBFNMN8tXA==
X-Received: by 2002:a17:902:8683:: with SMTP id g3mr1390011plo.201.1561041339154;
        Thu, 20 Jun 2019 07:35:39 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id b15sm22439945pfi.141.2019.06.20.07.35.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 07:35:38 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v7 2/5] HID: quirks: Refactor ELAN 400 and 401 handling
Date:   Thu, 20 Jun 2019 07:35:34 -0700
Message-Id: <20190620143534.11931-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com>
References: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com>
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
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-quirks.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index e5ca6fe2ca57..48ed4caf0ebc 100644
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
@@ -978,18 +981,15 @@ bool hid_ignore(struct hid_device *hdev)
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
+		if ((hdev->product == 0x0401 || hdev->product == 0x0400))
+			for (i = 0; strlen(elan_acpi_id[i].id); ++i)
+				if (!strncmp(hdev->name, elan_acpi_id[i].id,
+					     strlen(elan_acpi_id[i].id)))
+					return true;
 		break;
 	}
 
-- 
2.17.1

