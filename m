Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BA32F726D
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 06:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733268AbhAOFnF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jan 2021 00:43:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732050AbhAOFnD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jan 2021 00:43:03 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78029C0613C1
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 21:42:22 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id c13so4774245pfi.12
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 21:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXTbsaS6H4Ghx0J+qaw9xAaaRN5cjVy0tgXARVSG3ps=;
        b=etC/qhNNiWp7kRSZcd6MqutX0gjJbzqY9zEpb5gF0MXS+DecsJD/m0Fw7esVhHDtix
         YpbzlnKiW6JWyeWnMvEbmrHqg7/obf8grcLPmbk6KId1yBnU+TLAyYGsNvXH2mvyQvon
         x9o+/EUvesBOjyvWaBjHe1GB/k8cOhsuziF7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXTbsaS6H4Ghx0J+qaw9xAaaRN5cjVy0tgXARVSG3ps=;
        b=gG6lR9aM5dfDi3KsUDSr5eRSqF+CLWQQkZvK4FJgCLhY6QND5MCDyyhi65dvhtzDpa
         IqaEeZXFvAQMJwqvagfIh1xpbpNOTmw8Z/vaP477E86BzqiKqTemXYPzpL+mrHIxws3+
         rzKdhG9ETsUQ/fW6quVyc9B+94CdpqYUKQjaDb+LEtWLIFY//7ORQznwWtHPHwWTOsCa
         +4Ed65Mwn0OdkSXTn4iw0BeQbcr5W4vczICXxHMDLVcN1QpcdMvEu7J4U5qfFSkXxYRe
         2TyBWWhcg0lEecyT1M8fURk/TnZJOqFungngxQNOlhEvH6gSfqgeHF1+xU4GCk85zmAm
         eNXQ==
X-Gm-Message-State: AOAM530BGLIEW/RUwc/xry42prAymClbkTrfFLNFu+gSfc/tucBnDcr4
        artpvH/t/8fIqA9+8JACGibDaQ==
X-Google-Smtp-Source: ABdhPJzk/19Q9XsN+7SxwD9L8IiVCttvSzbCek/YwL2sB0OpDh89eChVdjVoU0wfcOtmqstCewbc7w==
X-Received: by 2002:a63:520d:: with SMTP id g13mr11007316pgb.289.1610689341942;
        Thu, 14 Jan 2021 21:42:21 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:7220:84ff:fe09:41dc])
        by smtp.gmail.com with ESMTPSA id w2sm6885852pfj.110.2021.01.14.21.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 21:42:21 -0800 (PST)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dtor@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: google: Get HID report on probe to confirm tablet switch state
Date:   Fri, 15 Jan 2021 13:42:16 +0800
Message-Id: <20210115134212.v2.1.I41b9795e4b5bda7209eb9099aebdc6a29677391e@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This forces reading the base folded state anytime the device is
probed, to make sure it's in sync.

This is useful after a reboot, if the device re-enumerates for
any reason (e.g. ESD shock), or if the driver is unbound/rebound
(debugging/testing).

Without this, the tablet switch state is only synchronized after a
key is pressed (since the device would then send a report that
includes the switch state), leading to strange UX (e.g. UI
mode changes when a key is pressed after reboot).

This is not a problem on detachable base attach, as the device,
by itself, sends a report after it is booted up.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
Instead of all this manual parsing, it'd be easier to just call:
hid_hw_request(hdev, report, HID_REQ_GET_REPORT);
However, that fails silently as hdev->driver_input_lock is held
during probe (or even some callbacks like input_configured.

Changes in v2:
 - Improve commit message description.

 drivers/hid/hid-google-hammer.c | 85 +++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 85a054f1ce38..d9319622da44 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -392,30 +392,34 @@ static int hammer_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return 0;
 }
 
-static int hammer_event(struct hid_device *hid, struct hid_field *field,
-			struct hid_usage *usage, __s32 value)
+static void hammer_folded_event(struct hid_device *hdev, bool folded)
 {
 	unsigned long flags;
 
-	if (usage->hid == HID_USAGE_KBD_FOLDED) {
-		spin_lock_irqsave(&cbas_ec_lock, flags);
+	spin_lock_irqsave(&cbas_ec_lock, flags);
 
-		/*
-		 * If we are getting events from Whiskers that means that it
-		 * is attached to the lid.
-		 */
-		cbas_ec.base_present = true;
-		cbas_ec.base_folded = value;
-		hid_dbg(hid, "%s: base: %d, folded: %d\n", __func__,
-			cbas_ec.base_present, cbas_ec.base_folded);
-
-		if (cbas_ec.input) {
-			input_report_switch(cbas_ec.input,
-					    SW_TABLET_MODE, value);
-			input_sync(cbas_ec.input);
-		}
+	/*
+	 * If we are getting events from Whiskers that means that it
+	 * is attached to the lid.
+	 */
+	cbas_ec.base_present = true;
+	cbas_ec.base_folded = folded;
+	hid_dbg(hdev, "%s: base: %d, folded: %d\n", __func__,
+		cbas_ec.base_present, cbas_ec.base_folded);
 
-		spin_unlock_irqrestore(&cbas_ec_lock, flags);
+	if (cbas_ec.input) {
+		input_report_switch(cbas_ec.input, SW_TABLET_MODE, folded);
+		input_sync(cbas_ec.input);
+	}
+
+	spin_unlock_irqrestore(&cbas_ec_lock, flags);
+}
+
+static int hammer_event(struct hid_device *hid, struct hid_field *field,
+			struct hid_usage *usage, __s32 value)
+{
+	if (usage->hid == HID_USAGE_KBD_FOLDED) {
+		hammer_folded_event(hid, value);
 		return 1; /* We handled this event */
 	}
 
@@ -457,6 +461,47 @@ static bool hammer_has_backlight_control(struct hid_device *hdev)
 				HID_GD_KEYBOARD, HID_AD_BRIGHTNESS);
 }
 
+static void hammer_get_folded_state(struct hid_device *hdev)
+{
+	struct hid_report *report;
+	char *buf;
+	int len, rlen;
+	int a;
+
+	report = hdev->report_enum[HID_INPUT_REPORT].report_id_hash[0x0];
+
+	if (!report || report->maxfield < 1)
+		return;
+
+	len = hid_report_len(report) + 1;
+
+	buf = kmalloc(len, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	rlen = hid_hw_raw_request(hdev, report->id, buf, len, report->type, HID_REQ_GET_REPORT);
+
+	if (rlen != len) {
+		hid_warn(hdev, "Unable to read base folded state: %d (expected %d)\n", rlen, len);
+		goto out;
+	}
+
+	for (a = 0; a < report->maxfield; a++) {
+		struct hid_field *field = report->field[a];
+
+		if (field->usage->hid == HID_USAGE_KBD_FOLDED) {
+			u32 value = hid_field_extract(hdev, buf+1,
+					field->report_offset, field->report_size);
+
+			hammer_folded_event(hdev, value);
+			break;
+		}
+	}
+
+out:
+	kfree(buf);
+}
+
 static int hammer_probe(struct hid_device *hdev,
 			const struct hid_device_id *id)
 {
@@ -481,6 +526,8 @@ static int hammer_probe(struct hid_device *hdev,
 		error = hid_hw_open(hdev);
 		if (error)
 			return error;
+
+		hammer_get_folded_state(hdev);
 	}
 
 	if (hammer_has_backlight_control(hdev)) {
-- 
2.30.0.284.gd98b1dd5eaa7-goog

