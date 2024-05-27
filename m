Return-Path: <linux-input+bounces-3863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF928D032E
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 16:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A19E29ECC6
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 14:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5957B16F286;
	Mon, 27 May 2024 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkyriQ/z"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F416F27F;
	Mon, 27 May 2024 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819197; cv=none; b=aaqsKA58XlIqef8srpKuR6WaWCBXaYGWKhG7bu5o5leSkobK1er0ZMb03CYFEAb1dxnw20LHDX+Pedm2xioKwRms0jOa9ClmrylVj/XVbqDluH8FE9VkhpatVckrHh9fIx4YkoE3nDCchjp9X0AssfuCf3CTP7vnOd/XR8DJZ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819197; c=relaxed/simple;
	bh=gSlwN5js8MlJT3Vc2y1GjcwiAoMKOVUoZeb6E/zARnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zgd4HeMXPtzFa6EY/kOJ5jMgxUxUQDui0UvRjLlBx7Og9b4mIOo3Xey4bDDPt7z83++ZxsDZEGvctiGx6lc+zbG1AcToQe06QvkE0d817GZm6qhqZNrTq5bcWZV8MIgNo4MJ3pfsEzyFeyt/rKWA994k4p3ofc7LRxxC3lR5T7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkyriQ/z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3827C2BBFC;
	Mon, 27 May 2024 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716819196;
	bh=gSlwN5js8MlJT3Vc2y1GjcwiAoMKOVUoZeb6E/zARnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PkyriQ/zDIgWLbIHScylhMq/tO3CL5+D3qRrut7lP3YDgvJlAt08lxFXNusjmPc+0
	 vrdaoF7fFZtSLd4kB+/r/BuwTE3LT8dq3z0sXMbN866OPlBUO1RJCB0DdLyMqAEvIS
	 /pKGqApcYymCLISONl5ryc6Y0lnSyQ9E3HxW/+1NI3GsNSFYSUF1LfCWv5/MkH7+kv
	 Olw0MrcdsIZDlx35Xt5Avhvp8cntDvoAEKdsZJgnvVfG0p5kiOjB5OiG7cNGnHOCpe
	 Ll1QAjUNXmXrJ31incpySaFlfWb3O48eXhvn/VbEuKwOOazL8h0gWP1Ia5nEud+QkX
	 vB+HWw2QoO4oA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 29/35] HID: asus: fix more n-key report descriptors if n-key quirked
Date: Mon, 27 May 2024 10:11:34 -0400
Message-ID: <20240527141214.3844331-29-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527141214.3844331-1-sashal@kernel.org>
References: <20240527141214.3844331-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.2
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

[ Upstream commit 59d2f5b7392e988a391e6924e177c1a68d50223d ]

Adjusts the report descriptor for N-Key devices to
make the output count 0x01 which completely avoids
the need for a block of filtering.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-asus.c | 51 ++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 78cdfb8b9a7ae..d6d8a028623a7 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -335,36 +335,20 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (drvdata->quirks & QUIRK_MEDION_E1239T)
 		return asus_e1239t_event(drvdata, data, size);
 
-	if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) {
+	/*
+	 * Skip these report ID, the device emits a continuous stream associated
+	 * with the AURA mode it is in which looks like an 'echo'.
+	 */
+	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
+		return -1;
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
 		/*
-		 * Skip these report ID, the device emits a continuous stream associated
-		 * with the AURA mode it is in which looks like an 'echo'.
+		 * G713 and G733 send these codes on some keypresses, depending on
+		 * the key pressed it can trigger a shutdown event if not caught.
 		*/
-		if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
-				report->id == FEATURE_KBD_LED_REPORT_ID2) {
+		if (data[0] == 0x02 && data[1] == 0x30) {
 			return -1;
-		/* Additional report filtering */
-		} else if (report->id == FEATURE_KBD_REPORT_ID) {
-			/*
-			 * G14 and G15 send these codes on some keypresses with no
-			 * discernable reason for doing so. We'll filter them out to avoid
-			 * unmapped warning messages later.
-			*/
-			if (data[1] == 0xea || data[1] == 0xec || data[1] == 0x02 ||
-					data[1] == 0x8a || data[1] == 0x9e) {
-				return -1;
-			}
 		}
-		if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
-			/*
-			 * G713 and G733 send these codes on some keypresses, depending on
-			 * the key pressed it can trigger a shutdown event if not caught.
-			*/
-			if(data[0] == 0x02 && data[1] == 0x30) {
-				return -1;
-			}
-		}
-
 	}
 
 	if (drvdata->quirks & QUIRK_ROG_CLAYMORE_II_KEYBOARD) {
@@ -1250,6 +1234,19 @@ static __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		rdesc[205] = 0x01;
 	}
 
+	/* match many more n-key devices */
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		for (int i = 0; i < *rsize + 1; i++) {
+			/* offset to the count from 0x5a report part always 14 */
+			if (rdesc[i] == 0x85 && rdesc[i + 1] == 0x5a &&
+			    rdesc[i + 14] == 0x95 && rdesc[i + 15] == 0x05) {
+				hid_info(hdev, "Fixing up Asus N-Key report descriptor\n");
+				rdesc[i + 15] = 0x01;
+				break;
+			}
+		}
+	}
+
 	return rdesc;
 }
 
@@ -1319,4 +1316,4 @@ static struct hid_driver asus_driver = {
 };
 module_hid_driver(asus_driver);
 
-MODULE_LICENSE("GPL");
\ No newline at end of file
+MODULE_LICENSE("GPL");
-- 
2.43.0


