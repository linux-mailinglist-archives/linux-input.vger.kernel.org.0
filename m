Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEA94EB38
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2019 16:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfFUOxR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jun 2019 10:53:17 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38636 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUOxR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jun 2019 10:53:17 -0400
Received: by mail-pg1-f194.google.com with SMTP id z75so893858pgz.5;
        Fri, 21 Jun 2019 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GoE2Orc5MXhxi85M/gd8MdklhhXDFLFTeptMP8vj//U=;
        b=RbjhldILBm/iPj8lCfjcyYHEAbw9X4D7WzTlZO57UxqppDImM1TSaLcaptJ++8NWpj
         Ryh09I1L2xBuf9o7wUCWs2dFuJ+5LoVLFjFWSwE99tjNSnRkmSJXteL4/J80zUUuqu8T
         dxonnK9e6v8K/pow+B1qfhCpYNDtnuMpZrbTlvxee2IUABi4yZ/MVIqeTwS2GqB+lBOa
         BVFzMY6W5dnBcX/38S+WNrF28lRWD1q2VuKClO011EHJsjLpFlu2pgoVaoSH5uww5YdY
         gAq4Xch50MOl2PMeBobX+LmsFtQdVYqmRonzY8weUQLMK4encgwqdbGTPRbB7w4DRiIv
         bzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GoE2Orc5MXhxi85M/gd8MdklhhXDFLFTeptMP8vj//U=;
        b=sCt7DjtZ7jYuUaGAmYOYQAanpZK5ujATB6Th2pQMzNQDctKwAo5zK5+WQU2Ci0c+st
         OBFNwsI+Xkk91Xm6NAoCOJT1KRbOCbJ3rAMKHX1EhNXNWkRtFM7SMmFr85HeO2ZKbZxA
         +qHNrLJ2VNnMrHoZ1cDhuewZ2aGd/QGSBKlwhykEZI+hn8VH3YverGaH+fKAIx4jPcAV
         79fRgVJVHLssbyvQsyUGZLjO8NWJqg2qqInJ2Mv1GNDmex0J4sUaYmJ7c8HJYwM93ELz
         mHcRS3WOKB+gY/bnrarMzdAp4RtS0dH6KoESPB4h1oUoEbR4NaBCfB9XDTfGqPnnEAlB
         V0tg==
X-Gm-Message-State: APjAAAW4k6Hydj6gsCQa+3R6V8Oy4gZB5CQ05SSnDkR1CU0/bvw8Svkj
        8vkxzSalfgjpVD06/woRZDu32RaU
X-Google-Smtp-Source: APXvYqwqJ2Oh5t4hPHl5lZRDZWIN2HOVufUdWysP/evikimxv7K9gh/ukx311Ef/oxwPZh3nG9m7TA==
X-Received: by 2002:a17:90a:8a15:: with SMTP id w21mr7253348pjn.134.1561128796252;
        Fri, 21 Jun 2019 07:53:16 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id t2sm3099032pgo.61.2019.06.21.07.53.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 07:53:15 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v8 2/5] HID: quirks: Refactor ELAN 400 and 401 handling
Date:   Fri, 21 Jun 2019 07:53:12 -0700
Message-Id: <20190621145312.38688-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
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

