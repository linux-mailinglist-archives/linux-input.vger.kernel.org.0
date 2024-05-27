Return-Path: <linux-input+bounces-3872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFCF8D0433
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 16:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DF651F21599
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 14:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7428A205E11;
	Mon, 27 May 2024 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQlr8mPM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E63205E0D;
	Mon, 27 May 2024 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819480; cv=none; b=J2QNEsmo2MDmzQnJpswGoDvUDVSxMhc4u6vpjpKknPUzmNXqvdAFTbt4TEXTQDIRpg3az9BDj/iOkpv9lK6VRQFBVkfzbpPfVc2afJJe3zRKxTZoQ5ysa28pBbtG2xdALt9YGVblr5OkxG5wO9mDRa4kDejW8mei2H8nrpZWHI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819480; c=relaxed/simple;
	bh=Oy+uPGv8q64uPCvQB/65sl+z7SpQSG1ThUFTJWIWhgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCcGcngZdBJjqnvnpEbl9JQsxcbe5jxzJcfEv8iOQxj6RiK8ql6UBOmEligAAxdeCSnmBHZYVAaQ0qkhlYpztk0m9BD8uhdzKGnRaNY9XEDiw4W3/UJHtjHDhA1jvZgLeb+kp4HvVdfJ2opM621shRtMAhI/3r7vEDcYHXozrUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQlr8mPM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D8FC32789;
	Mon, 27 May 2024 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716819479;
	bh=Oy+uPGv8q64uPCvQB/65sl+z7SpQSG1ThUFTJWIWhgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lQlr8mPMl7PS59m1x+nmE6kIGp9eoI8IzbXNwOYYfbU4bJFszhO9sCxyVLxJfnZqZ
	 EfznLQzb0NNp33VRU4f72AjbxRPluIYE19OOjrRBOI6yd/s8iXUB7DaxeYflwmy8WX
	 H2/NU84gC227qQifldLLRXdqBTwkT7B3n7eyokgl2FypL5uCDVtCiHFZd1mPZBsUxG
	 uur9ls7uo+q2tsF8BJ8i2R0EeFm+3M+y08q0jsEGSi1xSHeJaEYGtTLnKuDzLp8sn7
	 NGRkNXq01pac4VtqJxXIL++bs6J4h8SQscCcqK3J9Jnno7CONhHIxs+QvXFoH4micM
	 /TL3OZKKQubfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 15/17] HID: asus: fix more n-key report descriptors if n-key quirked
Date: Mon, 27 May 2024 10:16:52 -0400
Message-ID: <20240527141712.3853988-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527141712.3853988-1-sashal@kernel.org>
References: <20240527141712.3853988-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.92
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
 drivers/hid/hid-asus.c | 49 ++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 220d6b2af4d3f..70f3495a22fc5 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -334,36 +334,20 @@ static int asus_raw_event(struct hid_device *hdev,
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
@@ -1262,6 +1246,19 @@ static __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
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
 
-- 
2.43.0


