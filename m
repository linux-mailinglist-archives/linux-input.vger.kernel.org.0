Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 896177E445F
	for <lists+linux-input@lfdr.de>; Tue,  7 Nov 2023 16:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343941AbjKGPwn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Nov 2023 10:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343641AbjKGPvg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Nov 2023 10:51:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F39268C;
        Tue,  7 Nov 2023 07:49:23 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3506EC433C7;
        Tue,  7 Nov 2023 15:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699372163;
        bh=lgL1ycahHdkaTEuuWzq3a0UW7p+eaU+2mKq6BDh9aYI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=shhQteyDof8BlZggksy72iki6alzjtn6N0xOy9pgF9z1Sa0VCeFZax21CkZmULmKV
         1cPnvBZPlfj4sMlBPX5Qs6XnDRtcMh/t2BRvlJdXrai44sMORkcWRJjRkHRV77680B
         CtKVe8y8XLF2Vxl7rk1QrqvZm6Ui1O28Cznnhez+KMbWkGsnjUhFjRQPkky1KIpyxj
         MF7EjR8KSDz0dsLAXCV3Wo4Mh/70C+gWTkxzdjxrTuZ9AlHyHUMfI2mrOLJMYE+vNk
         thSGoNpkqQQcOaDKHOPp5+S/t99PTfYEqbZTSQ5Q7jFc5yX1q+z58Cx2/EaFxUPbCa
         eB9Dw1n5I/ZCg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mikhail Khvainitski <me@khvoinitsky.org>,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 14/34] HID: lenovo: Detect quirk-free fw on cptkbd and stop applying workaround
Date:   Tue,  7 Nov 2023 10:47:54 -0500
Message-ID: <20231107154846.3766119-14-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107154846.3766119-1-sashal@kernel.org>
References: <20231107154846.3766119-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mikhail Khvainitski <me@khvoinitsky.org>

[ Upstream commit 46a0a2c96f0f47628190f122c2e3d879e590bcbe ]

Built-in firmware of cptkbd handles scrolling by itself (when middle
button is pressed) but with issues: it does not support horizontal and
hi-res scrolling and upon middle button release it sends middle button
click even if there was a scrolling event. Commit 3cb5ff0220e3 ("HID:
lenovo: Hide middle-button press until release") workarounds last
issue but it's impossible to workaround scrolling-related issues
without firmware modification.

Likely, Dennis Schneider has reverse engineered the firmware and
provided an instruction on how to patch it [1]. However,
aforementioned workaround prevents userspace (libinput) from knowing
exact moment when middle button has been pressed down and performing
"On-Button scrolling". This commit detects correctly-behaving patched
firmware if cursor movement events has been received during middle
button being pressed and stops applying workaround for this device.

Link: https://hohlerde.org/rauch/en/elektronik/projekte/tpkbd-fix/ [1]

Signed-off-by: Mikhail Khvainitski <me@khvoinitsky.org>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-lenovo.c | 68 ++++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 44763c0da4441..9c1181313e44d 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -51,7 +51,12 @@ struct lenovo_drvdata {
 	int select_right;
 	int sensitivity;
 	int press_speed;
-	u8 middlebutton_state; /* 0:Up, 1:Down (undecided), 2:Scrolling */
+	/* 0: Up
+	 * 1: Down (undecided)
+	 * 2: Scrolling
+	 * 3: Patched firmware, disable workaround
+	 */
+	u8 middlebutton_state;
 	bool fn_lock;
 };
 
@@ -668,31 +673,48 @@ static int lenovo_event_cptkbd(struct hid_device *hdev,
 {
 	struct lenovo_drvdata *cptkbd_data = hid_get_drvdata(hdev);
 
-	/* "wheel" scroll events */
-	if (usage->type == EV_REL && (usage->code == REL_WHEEL ||
-			usage->code == REL_HWHEEL)) {
-		/* Scroll events disable middle-click event */
-		cptkbd_data->middlebutton_state = 2;
-		return 0;
-	}
+	if (cptkbd_data->middlebutton_state != 3) {
+		/* REL_X and REL_Y events during middle button pressed
+		 * are only possible on patched, bug-free firmware
+		 * so set middlebutton_state to 3
+		 * to never apply workaround anymore
+		 */
+		if (cptkbd_data->middlebutton_state == 1 &&
+				usage->type == EV_REL &&
+				(usage->code == REL_X || usage->code == REL_Y)) {
+			cptkbd_data->middlebutton_state = 3;
+			/* send middle button press which was hold before */
+			input_event(field->hidinput->input,
+				EV_KEY, BTN_MIDDLE, 1);
+			input_sync(field->hidinput->input);
+		}
 
-	/* Middle click events */
-	if (usage->type == EV_KEY && usage->code == BTN_MIDDLE) {
-		if (value == 1) {
-			cptkbd_data->middlebutton_state = 1;
-		} else if (value == 0) {
-			if (cptkbd_data->middlebutton_state == 1) {
-				/* No scrolling inbetween, send middle-click */
-				input_event(field->hidinput->input,
-					EV_KEY, BTN_MIDDLE, 1);
-				input_sync(field->hidinput->input);
-				input_event(field->hidinput->input,
-					EV_KEY, BTN_MIDDLE, 0);
-				input_sync(field->hidinput->input);
+		/* "wheel" scroll events */
+		if (usage->type == EV_REL && (usage->code == REL_WHEEL ||
+				usage->code == REL_HWHEEL)) {
+			/* Scroll events disable middle-click event */
+			cptkbd_data->middlebutton_state = 2;
+			return 0;
+		}
+
+		/* Middle click events */
+		if (usage->type == EV_KEY && usage->code == BTN_MIDDLE) {
+			if (value == 1) {
+				cptkbd_data->middlebutton_state = 1;
+			} else if (value == 0) {
+				if (cptkbd_data->middlebutton_state == 1) {
+					/* No scrolling inbetween, send middle-click */
+					input_event(field->hidinput->input,
+						EV_KEY, BTN_MIDDLE, 1);
+					input_sync(field->hidinput->input);
+					input_event(field->hidinput->input,
+						EV_KEY, BTN_MIDDLE, 0);
+					input_sync(field->hidinput->input);
+				}
+				cptkbd_data->middlebutton_state = 0;
 			}
-			cptkbd_data->middlebutton_state = 0;
+			return 1;
 		}
-		return 1;
 	}
 
 	if (usage->type == EV_KEY && usage->code == KEY_FN_ESC && value == 1) {
-- 
2.42.0

