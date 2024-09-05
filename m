Return-Path: <linux-input+bounces-6259-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F2096DED6
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 17:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 899231F21EDD
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 15:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD7219DF4D;
	Thu,  5 Sep 2024 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="hFslVvBP"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621754AEF5;
	Thu,  5 Sep 2024 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551327; cv=none; b=Yft+qYX1WWoPYbk0bDc2P3sPbTNMCdT9LMHPm2TUfoyYKE1bxH28liA+yNx6o/L+exqeF1czPlVdACPdtxyOq7lNAj9hK11fWdk56y2lyr3EYjDGcPraHH3kukMyKH8xmOaxQw58crKT5Ikh5Kg7aR74LRCWRRbwo8mVNmT2jMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551327; c=relaxed/simple;
	bh=iuKUSIwsvffLBaB2DJcbfk/Du2YlTt1aynhuNujcksg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XR1G8b98Pv5T5j+PgpUazXjrBs7/tdzwTdZpDTO77HfIkVXJRG8s1tfMZW9oWqg2gXayLLOfbUHgNrJfcAQIjt1WrDPvPWSP4f+M0fbTL7c0EJo48zXps2q1O1uWjaiMHAwUGB7kxeAxCp8qAIz8TtN06OmUYj2UFjdCWP2Gu00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=hFslVvBP; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1725551321;
	bh=iuKUSIwsvffLBaB2DJcbfk/Du2YlTt1aynhuNujcksg=;
	h=From:Date:Subject:To:Cc:From;
	b=hFslVvBP6Sz5eRJ+LY4mMdGyrdUPlJ+TGtK91HHEqHNwoM4ghm1yLxr1A+qvnEqbZ
	 DNMpwt7m2vVmQeV0tQyPsgwek2B5FO3bmGZnl+ToQZXe3/1oiaqmX//1m2RcC1yS0g
	 fVIx860E1QKXd/h/hrxyONd07fJqsS+q5CR3Ogv0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 05 Sep 2024 17:48:38 +0200
Subject: [PATCH v2] HID: lg: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240905-hid-const-fixup-2-v2-1-70915e0cc1c7@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIANXS2WYC/23OPRKDIBAF4Ks41CHDj6JY5R4ZC8FNoEEDSJJxv
 HtQixRJ+XZnv30LCuAtBNQWC/KQbLCjy4GdCqRN7+6A7ZAzYoSVpCEcGztgPboQ8c2+5gkzXGt
 Bel0xWXGK8t3kIa9289od2cNjznQ8hl85P9rcmpMft1GEajX0VJWyTQxtkrEhjv69l010p45er
 PnTK1FMsBBcSUYJKCEvT7AhBG1mc3YQUbeu6wdo6GPEAQEAAA==
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725551321; l=6779;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=iuKUSIwsvffLBaB2DJcbfk/Du2YlTt1aynhuNujcksg=;
 b=di8TajzkNUrNNge0GOnmzULcI+a+fExo9r429erKwQsW3gWR+z/611AluL6Y0kPRhMe+SvmD9
 XBY6GKyLkZABUFGVfinizsNm7U0EQR2FuSaUJQ/i0GT16rljTM0RIL9
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Now that the HID core can handle const report descriptors,
constify them where possible.

This is based upon hid/for-6.12/constify-rdesc.
---
Changes in v2:
- Drop all already applied patches
- Rework return logic in hid-lg.c
- Link to v1: https://lore.kernel.org/r/20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net
---
 drivers/hid/hid-lg.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
index a9be918e2b5c..9a2cfa018bd3 100644
--- a/drivers/hid/hid-lg.c
+++ b/drivers/hid/hid-lg.c
@@ -58,7 +58,7 @@
  * These descriptors remove the combined Y axis and instead report
  * separate throttle (Y) and brake (RZ).
  */
-static __u8 df_rdesc_fixed[] = {
+static const __u8 df_rdesc_fixed[] = {
 0x05, 0x01,         /*  Usage Page (Desktop),                   */
 0x09, 0x04,         /*  Usage (Joystick),                       */
 0xA1, 0x01,         /*  Collection (Application),               */
@@ -124,7 +124,7 @@ static __u8 df_rdesc_fixed[] = {
 0xC0                /*  End Collection                          */
 };
 
-static __u8 dfp_rdesc_fixed[] = {
+static const __u8 dfp_rdesc_fixed[] = {
 0x05, 0x01,         /*  Usage Page (Desktop),                   */
 0x09, 0x04,         /*  Usage (Joystick),                       */
 0xA1, 0x01,         /*  Collection (Application),               */
@@ -172,7 +172,7 @@ static __u8 dfp_rdesc_fixed[] = {
 0xC0                /*  End Collection                          */
 };
 
-static __u8 fv_rdesc_fixed[] = {
+static const __u8 fv_rdesc_fixed[] = {
 0x05, 0x01,         /*  Usage Page (Desktop),                   */
 0x09, 0x04,         /*  Usage (Joystick),                       */
 0xA1, 0x01,         /*  Collection (Application),               */
@@ -239,7 +239,7 @@ static __u8 fv_rdesc_fixed[] = {
 0xC0                /*  End Collection                          */
 };
 
-static __u8 momo_rdesc_fixed[] = {
+static const __u8 momo_rdesc_fixed[] = {
 0x05, 0x01,         /*  Usage Page (Desktop),               */
 0x09, 0x04,         /*  Usage (Joystick),                   */
 0xA1, 0x01,         /*  Collection (Application),           */
@@ -285,7 +285,7 @@ static __u8 momo_rdesc_fixed[] = {
 0xC0                /*  End Collection                      */
 };
 
-static __u8 momo2_rdesc_fixed[] = {
+static const __u8 momo2_rdesc_fixed[] = {
 0x05, 0x01,         /*  Usage Page (Desktop),               */
 0x09, 0x04,         /*  Usage (Joystick),                   */
 0xA1, 0x01,         /*  Collection (Application),           */
@@ -333,7 +333,7 @@ static __u8 momo2_rdesc_fixed[] = {
 0xC0                /*  End Collection                      */
 };
 
-static __u8 ffg_rdesc_fixed[] = {
+static const __u8 ffg_rdesc_fixed[] = {
 0x05, 0x01,         /*  Usage Page (Desktop),               */
 0x09, 0x04,         /*  Usage (Joystik),                    */
 0xA1, 0x01,         /*  Collection (Application),           */
@@ -379,7 +379,7 @@ static __u8 ffg_rdesc_fixed[] = {
 0xC0                /*  End Collection                      */
 };
 
-static __u8 fg_rdesc_fixed[] = {
+static const __u8 fg_rdesc_fixed[] = {
 0x05, 0x01,         /*  Usage Page (Desktop),               */
 0x09, 0x04,         /*  Usage (Joystik),                    */
 0xA1, 0x01,         /*  Collection (Application),           */
@@ -453,8 +453,8 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == FG_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Wingman Formula GP report descriptor\n");
-			rdesc = fg_rdesc_fixed;
 			*rsize = sizeof(fg_rdesc_fixed);
+			return fg_rdesc_fixed;
 		} else {
 			hid_info(hdev,
 				"rdesc size test failed for formula gp\n");
@@ -466,8 +466,8 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == FFG_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Wingman Formula Force GP report descriptor\n");
-			rdesc = ffg_rdesc_fixed;
 			*rsize = sizeof(ffg_rdesc_fixed);
+			return ffg_rdesc_fixed;
 		}
 		break;
 
@@ -476,8 +476,8 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == DF_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Driving Force report descriptor\n");
-			rdesc = df_rdesc_fixed;
 			*rsize = sizeof(df_rdesc_fixed);
+			return df_rdesc_fixed;
 		}
 		break;
 
@@ -485,8 +485,8 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == MOMO_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Momo Force (Red) report descriptor\n");
-			rdesc = momo_rdesc_fixed;
 			*rsize = sizeof(momo_rdesc_fixed);
+			return momo_rdesc_fixed;
 		}
 		break;
 
@@ -494,8 +494,8 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == MOMO2_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Momo Racing Force (Black) report descriptor\n");
-			rdesc = momo2_rdesc_fixed;
 			*rsize = sizeof(momo2_rdesc_fixed);
+			return momo2_rdesc_fixed;
 		}
 		break;
 
@@ -503,8 +503,8 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == FV_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Formula Vibration report descriptor\n");
-			rdesc = fv_rdesc_fixed;
 			*rsize = sizeof(fv_rdesc_fixed);
+			return fv_rdesc_fixed;
 		}
 		break;
 
@@ -512,8 +512,8 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == DFP_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Driving Force Pro report descriptor\n");
-			rdesc = dfp_rdesc_fixed;
 			*rsize = sizeof(dfp_rdesc_fixed);
+			return dfp_rdesc_fixed;
 		}
 		break;
 

---
base-commit: 03f8dc1d0a3823229a761f202bc1a6e63d5b4ba0
change-id: 20240803-hid-const-fixup-2-7c60ac529531
prerequisite-change-id: 20240730-hid-const-fixup-8b01cbda1b49:v2
prerequisite-patch-id: 92216ced5d79ee5578fbe1c24c994b6fd550d1fb
prerequisite-patch-id: 4dd3e0fa6b0387f2a722c2bb924fc9c3b784f49d
prerequisite-patch-id: 7a5b42060b989b053d2bc71d52e0281815da542d
prerequisite-patch-id: 15809fd82225c2d44cdbed2d570d621ba7378cec
prerequisite-patch-id: baba272935e0f16c67170413cadb682b535b3a6d
prerequisite-patch-id: 4e6017ca6b8df87fe8270fffd43a585eddba88c7
prerequisite-patch-id: 06023fde4515232fdcc4044b252aa42ed9a47885

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


