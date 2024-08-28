Return-Path: <linux-input+bounces-5924-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE24396214D
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 691051F26E16
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F0C158A33;
	Wed, 28 Aug 2024 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="LmusHfKh"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450DD166311;
	Wed, 28 Aug 2024 07:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830495; cv=none; b=DVV3+K3cv0WnH7mekcCbvaSbh1/RJJ/lU/O3+8PZHka99N5UXah4kxEDthdJ82E/soe7LnJ9tfKvS48cb3W0p9d7wt8a9Ntu/BjxL45p6LKFSDfdlcR79ClBN/fp27AbJYtPIiYQDMyJJXkTZr57cplwR0IatDnnCviE0AQYuBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830495; c=relaxed/simple;
	bh=MwAlLHUtJ1IxZ/RzJ941tIqGwsyXgczRgeyDKCYUepM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PAsNjpOwzAaizK4AS0fY3XUQEWWDQmkIoHiZ5jEj4J98Z4hjnLEwi5jlfEyEwVu8zpOk4+LDgKqB+ebp8IdBmTa3rlADALYVC0Iq4Lp+GL8dWvPPEnWnKuS52vHtZIj3liK6QJctl7jeif8XKyMwfwNvF/g6RGD169L7o0MJog4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=LmusHfKh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830492;
	bh=MwAlLHUtJ1IxZ/RzJ941tIqGwsyXgczRgeyDKCYUepM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LmusHfKhRyuG7xW+NSbJO0JPioz+tOGLvYr5m+2wao6rULvPIdsiVov7acdff68zH
	 k+u5w27zpm21O1/pIMsFnrq3XXU7waja2ZNjxEy6Zi+PqIbGrWg0qmwXag1K9llItS
	 FgRJl9rHE8g655HbVlqLddsgYxr7HUeFd84uquO8=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:31 +0200
Subject: [PATCH 12/14] HID: waltop: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-12-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=5657;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=MwAlLHUtJ1IxZ/RzJ941tIqGwsyXgczRgeyDKCYUepM=;
 b=CO/PKvv1vnxqDE9XKA46wVLHU7XZbQJqeXsqVcxIW1CM7l9QXmEjksGrcCll1MN8WesyjEGUK
 WPEIbLrXvvNDYMNn+CzWcgrSd+4vAD5RnBv5W8ztUTFeTAB7CKw2+m8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-waltop.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-waltop.c b/drivers/hid/hid-waltop.c
index 137a682ef5fb..be34be27d4d5 100644
--- a/drivers/hid/hid-waltop.c
+++ b/drivers/hid/hid-waltop.c
@@ -43,7 +43,7 @@
 #define SLIM_TABLET_5_8_INCH_RDESC_ORIG_SIZE	222
 
 /* Fixed Slim Tablet 5.8 inch descriptor */
-static __u8 slim_tablet_5_8_inch_rdesc_fixed[] = {
+static const __u8 slim_tablet_5_8_inch_rdesc_fixed[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x02,         /*  Usage (Pen),                        */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -94,7 +94,7 @@ static __u8 slim_tablet_5_8_inch_rdesc_fixed[] = {
 #define SLIM_TABLET_12_1_INCH_RDESC_ORIG_SIZE	269
 
 /* Fixed Slim Tablet 12.1 inch descriptor */
-static __u8 slim_tablet_12_1_inch_rdesc_fixed[] = {
+static const __u8 slim_tablet_12_1_inch_rdesc_fixed[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x02,         /*  Usage (Pen),                        */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -145,7 +145,7 @@ static __u8 slim_tablet_12_1_inch_rdesc_fixed[] = {
 #define Q_PAD_RDESC_ORIG_SIZE	241
 
 /* Fixed Q Pad descriptor */
-static __u8 q_pad_rdesc_fixed[] = {
+static const __u8 q_pad_rdesc_fixed[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x02,         /*  Usage (Pen),                        */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -198,7 +198,7 @@ static __u8 q_pad_rdesc_fixed[] = {
 /*
  * Fixed report descriptor for tablet with PID 0038.
  */
-static __u8 pid_0038_rdesc_fixed[] = {
+static const __u8 pid_0038_rdesc_fixed[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x02,         /*  Usage (Pen),                        */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -249,7 +249,7 @@ static __u8 pid_0038_rdesc_fixed[] = {
 #define MEDIA_TABLET_10_6_INCH_RDESC_ORIG_SIZE	300
 
 /* Fixed Media Tablet 10.6 inch descriptor */
-static __u8 media_tablet_10_6_inch_rdesc_fixed[] = {
+static const __u8 media_tablet_10_6_inch_rdesc_fixed[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x02,         /*  Usage (Pen),                        */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -362,7 +362,7 @@ static __u8 media_tablet_10_6_inch_rdesc_fixed[] = {
 #define MEDIA_TABLET_14_1_INCH_RDESC_ORIG_SIZE	309
 
 /* Fixed Media Tablet 14.1 inch descriptor */
-static __u8 media_tablet_14_1_inch_rdesc_fixed[] = {
+static const __u8 media_tablet_14_1_inch_rdesc_fixed[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x02,         /*  Usage (Pen),                        */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -473,7 +473,7 @@ static __u8 media_tablet_14_1_inch_rdesc_fixed[] = {
 #define SIRIUS_BATTERY_FREE_TABLET_RDESC_ORIG_SIZE	335
 
 /* Fixed Sirius Battery Free Tablet descriptor */
-static __u8 sirius_battery_free_tablet_rdesc_fixed[] = {
+static const __u8 sirius_battery_free_tablet_rdesc_fixed[] = {
 	0x05, 0x0D,         /*  Usage Page (Digitizer),             */
 	0x09, 0x02,         /*  Usage (Pen),                        */
 	0xA1, 0x01,         /*  Collection (Application),           */
@@ -605,44 +605,44 @@ static const __u8 *waltop_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	switch (hdev->product) {
 	case USB_DEVICE_ID_WALTOP_SLIM_TABLET_5_8_INCH:
 		if (*rsize == SLIM_TABLET_5_8_INCH_RDESC_ORIG_SIZE) {
-			rdesc = slim_tablet_5_8_inch_rdesc_fixed;
 			*rsize = sizeof(slim_tablet_5_8_inch_rdesc_fixed);
+			return slim_tablet_5_8_inch_rdesc_fixed;
 		}
 		break;
 	case USB_DEVICE_ID_WALTOP_SLIM_TABLET_12_1_INCH:
 		if (*rsize == SLIM_TABLET_12_1_INCH_RDESC_ORIG_SIZE) {
-			rdesc = slim_tablet_12_1_inch_rdesc_fixed;
 			*rsize = sizeof(slim_tablet_12_1_inch_rdesc_fixed);
+			return slim_tablet_12_1_inch_rdesc_fixed;
 		}
 		break;
 	case USB_DEVICE_ID_WALTOP_Q_PAD:
 		if (*rsize == Q_PAD_RDESC_ORIG_SIZE) {
-			rdesc = q_pad_rdesc_fixed;
 			*rsize = sizeof(q_pad_rdesc_fixed);
+			return q_pad_rdesc_fixed;
 		}
 		break;
 	case USB_DEVICE_ID_WALTOP_PID_0038:
 		if (*rsize == PID_0038_RDESC_ORIG_SIZE) {
-			rdesc = pid_0038_rdesc_fixed;
 			*rsize = sizeof(pid_0038_rdesc_fixed);
+			return pid_0038_rdesc_fixed;
 		}
 		break;
 	case USB_DEVICE_ID_WALTOP_MEDIA_TABLET_10_6_INCH:
 		if (*rsize == MEDIA_TABLET_10_6_INCH_RDESC_ORIG_SIZE) {
-			rdesc = media_tablet_10_6_inch_rdesc_fixed;
 			*rsize = sizeof(media_tablet_10_6_inch_rdesc_fixed);
+			return media_tablet_10_6_inch_rdesc_fixed;
 		}
 		break;
 	case USB_DEVICE_ID_WALTOP_MEDIA_TABLET_14_1_INCH:
 		if (*rsize == MEDIA_TABLET_14_1_INCH_RDESC_ORIG_SIZE) {
-			rdesc = media_tablet_14_1_inch_rdesc_fixed;
 			*rsize = sizeof(media_tablet_14_1_inch_rdesc_fixed);
+			return media_tablet_14_1_inch_rdesc_fixed;
 		}
 		break;
 	case USB_DEVICE_ID_WALTOP_SIRIUS_BATTERY_FREE_TABLET:
 		if (*rsize == SIRIUS_BATTERY_FREE_TABLET_RDESC_ORIG_SIZE) {
-			rdesc = sirius_battery_free_tablet_rdesc_fixed;
 			*rsize = sizeof(sirius_battery_free_tablet_rdesc_fixed);
+			return sirius_battery_free_tablet_rdesc_fixed;
 		}
 		break;
 	}

-- 
2.46.0


