Return-Path: <linux-input+bounces-5923-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133D196214B
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF46A2850D1
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA5E15B10A;
	Wed, 28 Aug 2024 07:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="gVU+plci"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D36156864;
	Wed, 28 Aug 2024 07:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830491; cv=none; b=taIpiEPnPrT2Kasz+CiGqUd6Xegfs1o45Sb+yHKBdKhfGrBRfB41wkUD9vRDRNPO9jnzGAcYGs51cdXFsGkO9M7Xbm9Qbw5iXPlSkBtjEllsxXN3mYakh6EXu03tUg4TZF2M0iBjoCIyuzX2TVp+89+v0EF0lS84nq9pW4/qAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830491; c=relaxed/simple;
	bh=L9jgYtjf8srMfqrOG45jsF9QeGhwU0PL8fFvFVe9sBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnH0CfkFIZ7hiF08b2+7JMnH394gX2gAK9Myhe05qHrxxVyfc2Pt44Hf0QGbU272PKxq6mG2nyo283PsZN3YtNb/CTGhveVFmme0lFI8VXRUEalBaKZqy6w3yyt/q/9DNQmrKY19Bfdu0DhY3LGALS+HbjSHuGHOVNCq3vUbN0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=gVU+plci; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830488;
	bh=L9jgYtjf8srMfqrOG45jsF9QeGhwU0PL8fFvFVe9sBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gVU+plcieJOAfv/PsObmkgeQV6yo6QOnki/dnGl/rUG7joaYbswpbJI7mH3akFACx
	 AYpZMZu4kPA1oAuwiIzHvcyeJmc9Y0AklPx/vjmTuvoKf34W4WFpMBU4iYZJnr71wi
	 tpvmMjsgRUF5wveWmixR7lMVm6uS2GFvmfUV8lT4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:32 +0200
Subject: [PATCH 13/14] HID: lg: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-13-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=6182;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=L9jgYtjf8srMfqrOG45jsF9QeGhwU0PL8fFvFVe9sBU=;
 b=4dVfk6+Bw6ECQUnQujIz3qr3vU1o9o4tfsLV/t3+zdMI/ektqVE2nhJJsuEtEvY1xlAfiF0rr
 0bw6fJIrRwpBikcxAzVDgY2dNQ5+afXkZXQ3S9InVrRkbTBKPeCeylx
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-lg.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
index a9be918e2b5c..c1feeb1dd077 100644
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
@@ -431,6 +431,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	struct lg_drv_data *drv_data = hid_get_drvdata(hdev);
+	const __u8 *ret = NULL;
 
 	if ((drv_data->quirks & LG_RDESC) && *rsize >= 91 && rdesc[83] == 0x26 &&
 			rdesc[84] == 0x8c && rdesc[85] == 0x02) {
@@ -453,7 +454,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == FG_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Wingman Formula GP report descriptor\n");
-			rdesc = fg_rdesc_fixed;
+			ret = fg_rdesc_fixed;
 			*rsize = sizeof(fg_rdesc_fixed);
 		} else {
 			hid_info(hdev,
@@ -466,7 +467,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == FFG_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Wingman Formula Force GP report descriptor\n");
-			rdesc = ffg_rdesc_fixed;
+			ret = ffg_rdesc_fixed;
 			*rsize = sizeof(ffg_rdesc_fixed);
 		}
 		break;
@@ -476,7 +477,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == DF_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Driving Force report descriptor\n");
-			rdesc = df_rdesc_fixed;
+			ret = df_rdesc_fixed;
 			*rsize = sizeof(df_rdesc_fixed);
 		}
 		break;
@@ -485,7 +486,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == MOMO_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Momo Force (Red) report descriptor\n");
-			rdesc = momo_rdesc_fixed;
+			ret = momo_rdesc_fixed;
 			*rsize = sizeof(momo_rdesc_fixed);
 		}
 		break;
@@ -494,7 +495,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == MOMO2_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Momo Racing Force (Black) report descriptor\n");
-			rdesc = momo2_rdesc_fixed;
+			ret = momo2_rdesc_fixed;
 			*rsize = sizeof(momo2_rdesc_fixed);
 		}
 		break;
@@ -503,7 +504,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == FV_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Formula Vibration report descriptor\n");
-			rdesc = fv_rdesc_fixed;
+			ret = fv_rdesc_fixed;
 			*rsize = sizeof(fv_rdesc_fixed);
 		}
 		break;
@@ -512,7 +513,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		if (*rsize == DFP_RDESC_ORIG_SIZE) {
 			hid_info(hdev,
 				"fixing up Logitech Driving Force Pro report descriptor\n");
-			rdesc = dfp_rdesc_fixed;
+			ret = dfp_rdesc_fixed;
 			*rsize = sizeof(dfp_rdesc_fixed);
 		}
 		break;
@@ -529,6 +530,8 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		break;
 	}
 
+	if (ret)
+		return ret;
 	return rdesc;
 }
 

-- 
2.46.0


