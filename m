Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8AE1D992B
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 20:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404890AbfJPS37 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Oct 2019 14:29:59 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45609 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403921AbfJPS36 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Oct 2019 14:29:58 -0400
Received: by mail-pl1-f193.google.com with SMTP id u12so11641954pls.12;
        Wed, 16 Oct 2019 11:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hvcS0GPGgj0yc1Pyi9HzxvjjgsKfH8J62dj1ItCzLg0=;
        b=O9YFnGz7PNUveGDRZlRQ50ShQGtpWUW9JC8cBMl6BNssEmQwHgnkpTTI+8S3DJzhHe
         qfVQT/idJsPUmBI9y9aN2XK8fh7VnBSJ51dEUdNv2snHKL+09VVDmT6OqI5eetEyuMrT
         1aEDexWWxqCW1rF38wXuVukBpGpzs/r2fVo3zrDOvttuFZ5qwOW7x116Lvwwe8JoBm13
         3+1cwReNV51UY+z4pQPrYwY5Mp7EL2ZaTXNecKXoGuxn3Vkuy5g6GXB4gx7tKqI6rBAz
         vEqYRY38xKhQb554C/xsK69vItEHG3ix39FIgReJ3j1r9szBw+5VBqsSER6R9cUgcYh0
         sR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hvcS0GPGgj0yc1Pyi9HzxvjjgsKfH8J62dj1ItCzLg0=;
        b=TX2iOjYsxdOpXCCt6HBhvCx/IJLzZSd9StmP/5GHeXXufUi0iW/3D44zyjSHmD+HdE
         d6unLBdBtYECTEwjzWT+Kmx/Twme+mbn3ScM5/39VyR6hfdvkb5C7PbsszUAAfGwpGoq
         GxlB6vBj8+bSeJ0naQ+X2UngB8Y5iTQgz+pzPfuTswGTDtT0qFUupiFzkNKt1O4oDgXb
         sWDwfDk87yY1XHoBVk8qpCouGadEPWGdCOKAMnfEAiRZvGXwUFAaevv/NOfFhTE4QcA9
         f5rGlwCX0usWQGZoajS8zj+hB3w59XmGKaUWuwsC/5NvLu5bem3TV6dQQqa2VMHA/m8h
         TFew==
X-Gm-Message-State: APjAAAVjY70mXGbaBeaNgFClp3oEBSz3E5WyUsvK034Iv61TfzwMd5mZ
        DsdwGHHPLG1XlTiqirlyUFm+yxaYIVE=
X-Google-Smtp-Source: APXvYqy7y9X98pDMfQf/ZDPQdpI8Cn4yAww0OZiX8VwOa4QxZUaa9I7EmiMLs61UoEVnfVT0CtWcAA==
X-Received: by 2002:a17:902:bd47:: with SMTP id b7mr42701792plx.28.1571250597611;
        Wed, 16 Oct 2019 11:29:57 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:8061:1b46:c3ff:7f12:48ed:6323])
        by smtp.gmail.com with ESMTPSA id z4sm2980127pjt.17.2019.10.16.11.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 11:29:56 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Sam Bazely <sambazley@fastmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        Austin Palmer <austinp@valvesoftware.com>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 2/3] HID: logitech-hidpp: rework device validation
Date:   Wed, 16 Oct 2019 11:29:34 -0700
Message-Id: <20191016182935.5616-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016182935.5616-1-andrew.smirnov@gmail.com>
References: <20191016182935.5616-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

G920 device only advertises REPORT_ID_HIDPP_LONG and
REPORT_ID_HIDPP_VERY_LONG in its HID report descriptor, so querying
for REPORT_ID_HIDPP_SHORT with optional=false will always fail and
prevent G920 to be recognized as a valid HID++ device.

To fix this and improve some other aspects, modify
hidpp_validate_device() as follows:

  - Inline the code of hidpp_validate_report() to simplify
    distingushing between non-present and invalid report descriptors

  - Drop the check for id >= HID_MAX_IDS || id < 0 since all of our
    IDs are static and known to satisfy that at compile time

  - Change the algorithms to check all possible report
    types (including very long report) and deem the device as a valid
    HID++ device if it supports at least one

  - Treat invalid report length as a hard stop for the validation
    algorithm, meaning that if any of the supported reports has
    invalid length we assume the worst and treat the device as a
    generic HID device.

  - Fold initialization of hidpp->very_long_report_length into
    hidpp_validate_device() since it already fetches very long report
    length and validates its value

Fixes: fe3ee1ec007b ("HID: logitech-hidpp: allow non HID++ devices to be handled by this module")
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=204191
Reported-by: Sam Bazely <sambazley@fastmail.com>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
Cc: Austin Palmer <austinp@valvesoftware.com>
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org # 5.2+
---
 drivers/hid/hid-logitech-hidpp.c | 54 ++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 85911586b3b6..8c4be991f387 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3498,34 +3498,45 @@ static int hidpp_get_report_length(struct hid_device *hdev, int id)
 	return report->field[0]->report_count + 1;
 }
 
-static bool hidpp_validate_report(struct hid_device *hdev, int id,
-				  int expected_length, bool optional)
+static bool hidpp_validate_device(struct hid_device *hdev)
 {
-	int report_length;
+	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
+	int id, report_length, supported_reports = 0;
+
+	id = REPORT_ID_HIDPP_SHORT;
+	report_length = hidpp_get_report_length(hdev, id);
+	if (report_length) {
+		if (report_length < HIDPP_REPORT_SHORT_LENGTH)
+			goto bad_device;
 
-	if (id >= HID_MAX_IDS || id < 0) {
-		hid_err(hdev, "invalid HID report id %u\n", id);
-		return false;
+		supported_reports++;
 	}
 
+	id = REPORT_ID_HIDPP_LONG;
 	report_length = hidpp_get_report_length(hdev, id);
-	if (!report_length)
-		return optional;
+	if (report_length) {
+		if (report_length < HIDPP_REPORT_LONG_LENGTH)
+			goto bad_device;
 
-	if (report_length < expected_length) {
-		hid_warn(hdev, "not enough values in hidpp report %d\n", id);
-		return false;
+		supported_reports++;
 	}
 
-	return true;
-}
+	id = REPORT_ID_HIDPP_VERY_LONG;
+	report_length = hidpp_get_report_length(hdev, id);
+	if (report_length) {
+		if (report_length > HIDPP_REPORT_LONG_LENGTH &&
+		    report_length < HIDPP_REPORT_VERY_LONG_MAX_LENGTH)
+			goto bad_device;
 
-static bool hidpp_validate_device(struct hid_device *hdev)
-{
-	return hidpp_validate_report(hdev, REPORT_ID_HIDPP_SHORT,
-				     HIDPP_REPORT_SHORT_LENGTH, false) &&
-	       hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
-				     HIDPP_REPORT_LONG_LENGTH, true);
+		supported_reports++;
+		hidpp->very_long_report_length = report_length;
+	}
+
+	return supported_reports;
+
+bad_device:
+	hid_warn(hdev, "not enough values in hidpp report %d\n", id);
+	return false;
 }
 
 static bool hidpp_application_equals(struct hid_device *hdev,
@@ -3572,11 +3583,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
 	}
 
-	hidpp->very_long_report_length =
-		hidpp_get_report_length(hdev, REPORT_ID_HIDPP_VERY_LONG);
-	if (hidpp->very_long_report_length > HIDPP_REPORT_VERY_LONG_MAX_LENGTH)
-		hidpp->very_long_report_length = HIDPP_REPORT_VERY_LONG_MAX_LENGTH;
-
 	if (id->group == HID_GROUP_LOGITECH_DJ_DEVICE)
 		hidpp->quirks |= HIDPP_QUIRK_UNIFYING;
 
-- 
2.21.0

