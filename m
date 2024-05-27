Return-Path: <linux-input+bounces-3869-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74808D03F8
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 16:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8C2D1C213DF
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 14:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAA51A38F1;
	Mon, 27 May 2024 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jU7hwKW4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C571C1A38ED;
	Mon, 27 May 2024 14:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819405; cv=none; b=RwmjVKUDOKAi3154vb/XF+tAIV3Ri3btaxS8Uy4I+vmAvi4VaUTbJhS/TyphDEpVQFjjeDbPNjZiJrl5xQL4VM8JB2Jgj2d+O28jAcwWh6E3LnmEC9QxeRGdxBdk+NQnJZ/bormtb44+ZyN4HH9//y+qB4UVZXvgmTqlpX7HpzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819405; c=relaxed/simple;
	bh=gSlwN5js8MlJT3Vc2y1GjcwiAoMKOVUoZeb6E/zARnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yt+VreSIucj/cGiVadK5E3CMdaahuFYE2kJ4TtxzbGRrgOd47qLjSCd4Pyrsa3CIqLWd87KmuWHG3n7EJOZunaf0eDpGmSY8h4iEN9zBn580vhsqNBasfvW08ejaaBcsmP61DFTOuPiiqrX6XF3F5j7F7GfLwSN3vXsdqEWlOO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jU7hwKW4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C1CC32781;
	Mon, 27 May 2024 14:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716819405;
	bh=gSlwN5js8MlJT3Vc2y1GjcwiAoMKOVUoZeb6E/zARnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jU7hwKW45QphVb8qmkm6isNZrmx38JyJO3JQvPzVA9gwXpTLpLW+jngiI0m03UaT7
	 ILDOEjLUKS2dE99piWS8Kbe+tCkbhDdXUgZeaw4b9WzUo9IAoKqNi/i0Hqcubuzu5E
	 VFw1yBzzmIuGD233v82S+gupARwcW4Eap1jrhzyZsFDRD7K4sdnsCQ0Mwg4qz5qu6Y
	 jbKbJcOYEKJMNgVlhS0qNJ2CQKqTs/Gt2wQ16HcAdZVc8vM14ryZT6E+CCxNZobJAS
	 m/9+ftoTqZodPeUDKLZRSGaf9LRnspY4gzBSP74jUkXtAqCKUKsAnl/Rke9SfQEHcK
	 Dzt0JSNiamR3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 18/21] HID: asus: fix more n-key report descriptors if n-key quirked
Date: Mon, 27 May 2024 10:15:29 -0400
Message-ID: <20240527141551.3853516-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527141551.3853516-1-sashal@kernel.org>
References: <20240527141551.3853516-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
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


