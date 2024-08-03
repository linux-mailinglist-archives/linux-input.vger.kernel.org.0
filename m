Return-Path: <linux-input+bounces-5306-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 491AC9469B7
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 14:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD4C2281F38
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 12:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0CD152DF7;
	Sat,  3 Aug 2024 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="YS12Lf8G"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A73A1514C8;
	Sat,  3 Aug 2024 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688483; cv=none; b=gRyRga/ltVHKpcLS0KrKX2bMMjiJLXHkA3HsAtMdDQMohw2/djAdrQezkp7sIMhnxMCM4qXBne21iBJsEHVAO00Efx7GeSXl7afTxtJ/dGZgKOkr1EFna6JD5ZSiCZ1shIQ5UbGK4nSKfIItpYBvi+0Au/IaWK8Me3FqGttZWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688483; c=relaxed/simple;
	bh=+C0q+6SeCM8ie2UVKdGSp6GzuQxPn6WirnDXPC1ZgD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZGa5ldkpC+tjHCJBJgqi3PKG/f+4xkBm8PbNiMmt9xE3X7aTMY64jAEHPj66jjBffEUuwHY+aG7fDe2BMzw8nAW3hBk15aHhpT9OabwcAlJWAVSlW9FuC4CPECbzJvZGet5VXNxQqoD0Y/V/4VbOEpJn+DD/JT36im9iV5qQM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=YS12Lf8G; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722688475;
	bh=+C0q+6SeCM8ie2UVKdGSp6GzuQxPn6WirnDXPC1ZgD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YS12Lf8GesTdSLNw1FxmLK8PnO7oKzayWw1hvV/+LCa+jNGOMVDgSYqsPDBqzl/0I
	 BF16mEzHP6k72pzKaXVZe95yhwxJfXDn5MWXEfmatmiD2rgguehAsSMutM2MKnnKSa
	 H86JJBi8eNNAsvGH0DGe6t9YfDNN6w049d48rV+o=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 03 Aug 2024 14:34:22 +0200
Subject: [PATCH v2 6/7] HID: change return type of report_fixup() to const
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240803-hid-const-fixup-v2-6-f53d7a7b29d8@weissschuh.net>
References: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
In-Reply-To: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722688475; l=30321;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=+C0q+6SeCM8ie2UVKdGSp6GzuQxPn6WirnDXPC1ZgD4=;
 b=1MIhMOTX28RsVV8zMxEBzutJIMyJtITZWnOhH43KIOyo/4icgfA4EuA7unSMpY469Whn7NMm1
 lnRM9jQkVH/Bf7urxNvI9wjGXgbOqDoDJWeK57DfkACAWyBRL9f2n85
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

By allowing the drivers to return a "const *" they can constify their
static report arrays.
This makes it clear to driver authors that the HID core will not modify
those reports and they can be reused for multiple devices.
Furthermore security is slightly improved as those reports are protected
against accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-apple.c          | 2 +-
 drivers/hid/hid-asus.c           | 2 +-
 drivers/hid/hid-aureal.c         | 2 +-
 drivers/hid/hid-bigbenff.c       | 2 +-
 drivers/hid/hid-cherry.c         | 2 +-
 drivers/hid/hid-chicony.c        | 4 ++--
 drivers/hid/hid-cmedia.c         | 2 +-
 drivers/hid/hid-corsair.c        | 4 ++--
 drivers/hid/hid-cougar.c         | 4 ++--
 drivers/hid/hid-cypress.c        | 2 +-
 drivers/hid/hid-dr.c             | 4 ++--
 drivers/hid/hid-elecom.c         | 2 +-
 drivers/hid/hid-gembird.c        | 2 +-
 drivers/hid/hid-glorious.c       | 2 +-
 drivers/hid/hid-holtek-kbd.c     | 2 +-
 drivers/hid/hid-holtek-mouse.c   | 4 ++--
 drivers/hid/hid-ite.c            | 2 +-
 drivers/hid/hid-keytouch.c       | 2 +-
 drivers/hid/hid-kye.c            | 2 +-
 drivers/hid/hid-lenovo.c         | 2 +-
 drivers/hid/hid-lg.c             | 2 +-
 drivers/hid/hid-logitech-hidpp.c | 4 ++--
 drivers/hid/hid-macally.c        | 4 ++--
 drivers/hid/hid-magicmouse.c     | 4 ++--
 drivers/hid/hid-maltron.c        | 4 ++--
 drivers/hid/hid-microsoft.c      | 2 +-
 drivers/hid/hid-monterey.c       | 2 +-
 drivers/hid/hid-nti.c            | 2 +-
 drivers/hid/hid-ortek.c          | 2 +-
 drivers/hid/hid-petalynx.c       | 2 +-
 drivers/hid/hid-prodikeys.c      | 2 +-
 drivers/hid/hid-pxrc.c           | 4 ++--
 drivers/hid/hid-redragon.c       | 2 +-
 drivers/hid/hid-saitek.c         | 2 +-
 drivers/hid/hid-samsung.c        | 2 +-
 drivers/hid/hid-semitek.c        | 4 ++--
 drivers/hid/hid-sensor-hub.c     | 2 +-
 drivers/hid/hid-sigmamicro.c     | 4 ++--
 drivers/hid/hid-sony.c           | 2 +-
 drivers/hid/hid-steelseries.c    | 4 ++--
 drivers/hid/hid-sunplus.c        | 2 +-
 drivers/hid/hid-topre.c          | 4 ++--
 drivers/hid/hid-uclogic-core.c   | 2 +-
 drivers/hid/hid-viewsonic.c      | 4 ++--
 drivers/hid/hid-vrc2.c           | 4 ++--
 drivers/hid/hid-waltop.c         | 2 +-
 drivers/hid/hid-winwing.c        | 2 +-
 drivers/hid/hid-xiaomi.c         | 4 ++--
 drivers/hid/hid-zydacron.c       | 2 +-
 include/linux/hid.h              | 2 +-
 50 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index af5cf94f9dea..7e1ae2a2bcc2 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -620,7 +620,7 @@ static void apple_battery_timer_tick(struct timer_list *t)
  * MacBook JIS keyboard has wrong logical maximum
  * Magic Keyboard JIS has wrong logical maximum
  */
-static __u8 *apple_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *apple_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	struct apple_sc *asc = hid_get_drvdata(hdev);
diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 37e6d25593c2..05ab96fe48d3 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1119,7 +1119,7 @@ static const __u8 asus_g752_fixed_rdesc[] = {
         0x2A, 0xFF, 0x00,		/*   Usage Maximum (0xFF)       */
 };
 
-static __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
diff --git a/drivers/hid/hid-aureal.c b/drivers/hid/hid-aureal.c
index cf1a562d8523..896304148a87 100644
--- a/drivers/hid/hid-aureal.c
+++ b/drivers/hid/hid-aureal.c
@@ -18,7 +18,7 @@
 
 #include "hid-ids.h"
 
-static __u8 *aureal_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *aureal_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	if (*rsize >= 54 && rdesc[52] == 0x25 && rdesc[53] == 0x01) {
diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index be17af3d9c0c..a2ff60dd834c 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -464,7 +464,7 @@ static int bigben_probe(struct hid_device *hid,
 	return error;
 }
 
-static __u8 *bigben_report_fixup(struct hid_device *hid, __u8 *rdesc,
+static const __u8 *bigben_report_fixup(struct hid_device *hid, __u8 *rdesc,
 	unsigned int *rsize)
 {
 	if (*rsize == PID0902_RDESC_ORIG_SIZE) {
diff --git a/drivers/hid/hid-cherry.c b/drivers/hid/hid-cherry.c
index 549c73b05b8d..a504632febfc 100644
--- a/drivers/hid/hid-cherry.c
+++ b/drivers/hid/hid-cherry.c
@@ -22,7 +22,7 @@
  * Cherry Cymotion keyboard have an invalid HID report descriptor,
  * that needs fixing before we can parse it.
  */
-static __u8 *ch_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *ch_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	if (*rsize >= 18 && rdesc[11] == 0x3c && rdesc[12] == 0x02) {
diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
index 99954c6b3242..5776ec2e7159 100644
--- a/drivers/hid/hid-chicony.c
+++ b/drivers/hid/hid-chicony.c
@@ -88,8 +88,8 @@ static int ch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return 1;
 }
 
-static __u8 *ch_switch12_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-		unsigned int *rsize)
+static const __u8 *ch_switch12_report_fixup(struct hid_device *hdev,
+		__u8 *rdesc, unsigned int *rsize)
 {
 	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
 	
diff --git a/drivers/hid/hid-cmedia.c b/drivers/hid/hid-cmedia.c
index cab42047bc99..01009c95613c 100644
--- a/drivers/hid/hid-cmedia.c
+++ b/drivers/hid/hid-cmedia.c
@@ -199,7 +199,7 @@ static struct hid_driver cmhid_driver = {
 	.input_mapping = cmhid_input_mapping,
 };
 
-static __u8 *cmhid_hs100b_report_fixup(struct hid_device *hid, __u8 *rdesc,
+static const __u8 *cmhid_hs100b_report_fixup(struct hid_device *hid, __u8 *rdesc,
 				       unsigned int *rsize)
 {
 	if (*rsize == HS100B_RDESC_ORIG_SIZE) {
diff --git a/drivers/hid/hid-corsair.c b/drivers/hid/hid-corsair.c
index 702f50e9841d..62b99f5c3cf8 100644
--- a/drivers/hid/hid-corsair.c
+++ b/drivers/hid/hid-corsair.c
@@ -690,8 +690,8 @@ static int corsair_input_mapping(struct hid_device *dev,
  * - USB ID 1b1c:1b3e, sold as Scimitar RGB Pro Gaming mouse
  */
 
-static __u8 *corsair_mouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-        unsigned int *rsize)
+static const __u8 *corsair_mouse_report_fixup(struct hid_device *hdev,
+	__u8 *rdesc, unsigned int *rsize)
 {
 	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
 
diff --git a/drivers/hid/hid-cougar.c b/drivers/hid/hid-cougar.c
index cb8bd8aae15b..906794d9fc55 100644
--- a/drivers/hid/hid-cougar.c
+++ b/drivers/hid/hid-cougar.c
@@ -103,8 +103,8 @@ static void cougar_fix_g6_mapping(void)
 /*
  * Constant-friendly rdesc fixup for mouse interface
  */
-static __u8 *cougar_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-				 unsigned int *rsize)
+static const __u8 *cougar_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				       unsigned int *rsize)
 {
 	if (rdesc[2] == 0x09 && rdesc[3] == 0x02 &&
 	    (rdesc[115] | rdesc[116] << 8) >= HID_MAX_USAGES) {
diff --git a/drivers/hid/hid-cypress.c b/drivers/hid/hid-cypress.c
index b952b235e70a..98548201feec 100644
--- a/drivers/hid/hid-cypress.c
+++ b/drivers/hid/hid-cypress.c
@@ -67,7 +67,7 @@ static __u8 *va_logical_boundary_fixup(struct hid_device *hdev, __u8 *rdesc,
 	return rdesc;
 }
 
-static __u8 *cp_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *cp_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	unsigned long quirks = (unsigned long)hid_get_drvdata(hdev);
diff --git a/drivers/hid/hid-dr.c b/drivers/hid/hid-dr.c
index c88224a96e9e..b24f9bc743e1 100644
--- a/drivers/hid/hid-dr.c
+++ b/drivers/hid/hid-dr.c
@@ -228,8 +228,8 @@ static __u8 pid0011_rdesc_fixed[] = {
 	0xC0                /*  End Collection                  */
 };
 
-static __u8 *dr_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-				unsigned int *rsize)
+static const __u8 *dr_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				   unsigned int *rsize)
 {
 	switch (hdev->product) {
 	case 0x0011:
diff --git a/drivers/hid/hid-elecom.c b/drivers/hid/hid-elecom.c
index 5973a3bab29f..defcf91fdd14 100644
--- a/drivers/hid/hid-elecom.c
+++ b/drivers/hid/hid-elecom.c
@@ -53,7 +53,7 @@ static void mouse_button_fixup(struct hid_device *hdev,
 	rdesc[padding_bit + 1] = MOUSE_BUTTONS_MAX - nbuttons;
 }
 
-static __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	switch (hdev->product) {
diff --git a/drivers/hid/hid-gembird.c b/drivers/hid/hid-gembird.c
index c42593fe7116..20a8de766e56 100644
--- a/drivers/hid/hid-gembird.c
+++ b/drivers/hid/hid-gembird.c
@@ -57,7 +57,7 @@ static const __u8 gembird_jpd_fixed_rdesc[] = {
 	0x81, 0x02,			/*   Input (Data,Var,Abs)	*/
 };
 
-static __u8 *gembird_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *gembird_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	__u8 *new_rdesc;
diff --git a/drivers/hid/hid-glorious.c b/drivers/hid/hid-glorious.c
index 281b3a7187ce..5bbd81248053 100644
--- a/drivers/hid/hid-glorious.c
+++ b/drivers/hid/hid-glorious.c
@@ -26,7 +26,7 @@ MODULE_DESCRIPTION("HID driver for Glorious PC Gaming Race mice");
  * keyboard HID report, causing keycodes to be misinterpreted.
  * Fix this by setting Usage Minimum to 0 in that report.
  */
-static __u8 *glorious_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *glorious_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	if (*rsize == 213 &&
diff --git a/drivers/hid/hid-holtek-kbd.c b/drivers/hid/hid-holtek-kbd.c
index 1f014ac54e14..794d609c2e31 100644
--- a/drivers/hid/hid-holtek-kbd.c
+++ b/drivers/hid/hid-holtek-kbd.c
@@ -102,7 +102,7 @@ static __u8 holtek_kbd_rdesc_fixed[] = {
 	0xC0,               /*  End Collection                                */
 };
 
-static __u8 *holtek_kbd_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *holtek_kbd_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
diff --git a/drivers/hid/hid-holtek-mouse.c b/drivers/hid/hid-holtek-mouse.c
index 343730c28e2d..b618a1646c13 100644
--- a/drivers/hid/hid-holtek-mouse.c
+++ b/drivers/hid/hid-holtek-mouse.c
@@ -29,8 +29,8 @@
  * - USB ID 04d9:a0c2, sold as ETEKCITY Scroll T-140 Gaming Mouse
  */
 
-static __u8 *holtek_mouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-		unsigned int *rsize)
+static const __u8 *holtek_mouse_report_fixup(struct hid_device *hdev,
+		__u8 *rdesc, unsigned int *rsize)
 {
 	struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
 
diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 6a7281bc27c9..8e42780a2663 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -13,7 +13,7 @@
 
 #define QUIRK_TOUCHPAD_ON_OFF_REPORT		BIT(0)
 
-static __u8 *ite_report_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int *rsize)
+static const __u8 *ite_report_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int *rsize)
 {
 	unsigned long quirks = (unsigned long)hid_get_drvdata(hdev);
 
diff --git a/drivers/hid/hid-keytouch.c b/drivers/hid/hid-keytouch.c
index a972943baaea..6e3033bb80dd 100644
--- a/drivers/hid/hid-keytouch.c
+++ b/drivers/hid/hid-keytouch.c
@@ -24,7 +24,7 @@ static __u8 keytouch_fixed_rdesc[] = {
 0x26, 0xff, 0x00, 0x05, 0x07, 0x19, 0x00, 0x2a, 0xff, 0x00, 0x81, 0x00, 0xc0
 };
 
-static __u8 *keytouch_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *keytouch_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	hid_info(hdev, "fixing up Keytouch IEC report descriptor\n");
diff --git a/drivers/hid/hid-kye.c b/drivers/hid/hid-kye.c
index ca2ba3da2458..32344331282f 100644
--- a/drivers/hid/hid-kye.c
+++ b/drivers/hid/hid-kye.c
@@ -466,7 +466,7 @@ static __u8 *kye_tablet_fixup(struct hid_device *hdev, __u8 *rdesc, unsigned int
 	return rdesc;
 }
 
-static __u8 *kye_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *kye_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	switch (hdev->product) {
diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index e5e72aa5260a..3b0c779ce8f7 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -133,7 +133,7 @@ static const __u8 lenovo_tpIIbtkbd_need_fixup_collection[] = {
 	0x81, 0x01,		/*   Input (Const,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
 };
 
-static __u8 *lenovo_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *lenovo_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	switch (hdev->product) {
diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
index cfe2f4f6e93f..a9be918e2b5c 100644
--- a/drivers/hid/hid-lg.c
+++ b/drivers/hid/hid-lg.c
@@ -427,7 +427,7 @@ static __u8 fg_rdesc_fixed[] = {
  * above the logical maximum described in descriptor. This extends
  * the original value of 0x28c of logical maximum to 0x104d
  */
-static __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	struct lg_drv_data *drv_data = hid_get_drvdata(hdev);
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 400d70e6dbe2..0e33fa0eb8db 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3767,8 +3767,8 @@ static int hidpp_initialize_hires_scroll(struct hidpp_device *hidpp)
 /* Generic HID++ devices                                                      */
 /* -------------------------------------------------------------------------- */
 
-static u8 *hidpp_report_fixup(struct hid_device *hdev, u8 *rdesc,
-			      unsigned int *rsize)
+static const u8 *hidpp_report_fixup(struct hid_device *hdev, u8 *rdesc,
+				    unsigned int *rsize)
 {
 	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
 
diff --git a/drivers/hid/hid-macally.c b/drivers/hid/hid-macally.c
index aea46e522008..fe7576458afa 100644
--- a/drivers/hid/hid-macally.c
+++ b/drivers/hid/hid-macally.c
@@ -18,8 +18,8 @@ MODULE_LICENSE("GPL");
  * The Macally ikey keyboard says that its logical and usage maximums are both
  * 101, but the power key is 102 and the equals key is 103
  */
-static __u8 *macally_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-				 unsigned int *rsize)
+static const __u8 *macally_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+					unsigned int *rsize)
 {
 	if (*rsize >= 60 && rdesc[53] == 0x65 && rdesc[59] == 0x65) {
 		hid_info(hdev,
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 2eb285b97fc0..8a73b59e0827 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -907,8 +907,8 @@ static void magicmouse_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 }
 
-static __u8 *magicmouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-				     unsigned int *rsize)
+static const __u8 *magicmouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+					   unsigned int *rsize)
 {
 	/*
 	 * Change the usage from:
diff --git a/drivers/hid/hid-maltron.c b/drivers/hid/hid-maltron.c
index caba0def938c..374c64dd82c2 100644
--- a/drivers/hid/hid-maltron.c
+++ b/drivers/hid/hid-maltron.c
@@ -137,8 +137,8 @@ static u8 maltron_rdesc[] = {
 	0xC0               /* End Collection                     */
 };
 
-static __u8 *maltron_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-				  unsigned int *rsize)
+static const __u8 *maltron_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+					unsigned int *rsize)
 {
 	if (*rsize == sizeof(maltron_rdesc_o) &&
 	    !memcmp(maltron_rdesc_o, rdesc, sizeof(maltron_rdesc_o))) {
diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
index 4cf0fcddb379..18ac21c0bcb2 100644
--- a/drivers/hid/hid-microsoft.c
+++ b/drivers/hid/hid-microsoft.c
@@ -56,7 +56,7 @@ struct xb1s_ff_report {
 	__u8	loop_count;
 } __packed;
 
-static __u8 *ms_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *ms_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	struct ms_data *ms = hid_get_drvdata(hdev);
diff --git a/drivers/hid/hid-monterey.c b/drivers/hid/hid-monterey.c
index 989681f73d77..3089be990afe 100644
--- a/drivers/hid/hid-monterey.c
+++ b/drivers/hid/hid-monterey.c
@@ -18,7 +18,7 @@
 
 #include "hid-ids.h"
 
-static __u8 *mr_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *mr_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	if (*rsize >= 31 && rdesc[29] == 0x05 && rdesc[30] == 0x09) {
diff --git a/drivers/hid/hid-nti.c b/drivers/hid/hid-nti.c
index 1952e9ca5f45..03f7dd491228 100644
--- a/drivers/hid/hid-nti.c
+++ b/drivers/hid/hid-nti.c
@@ -29,7 +29,7 @@ MODULE_DESCRIPTION("HID driver for Network Technologies USB-SUN keyboard adapter
 /*
  * NTI Sun keyboard adapter has wrong logical maximum in report descriptor
  */
-static __u8 *nti_usbsun_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *nti_usbsun_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	if (*rsize >= 60 && rdesc[53] == 0x65 && rdesc[59] == 0x65) {
diff --git a/drivers/hid/hid-ortek.c b/drivers/hid/hid-ortek.c
index 99e3b06a8331..f27297269a7f 100644
--- a/drivers/hid/hid-ortek.c
+++ b/drivers/hid/hid-ortek.c
@@ -22,7 +22,7 @@
 
 #include "hid-ids.h"
 
-static __u8 *ortek_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *ortek_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	if (*rsize >= 56 && rdesc[54] == 0x25 && rdesc[55] == 0x01) {
diff --git a/drivers/hid/hid-petalynx.c b/drivers/hid/hid-petalynx.c
index 5e47634bb07d..1a986f077ce1 100644
--- a/drivers/hid/hid-petalynx.c
+++ b/drivers/hid/hid-petalynx.c
@@ -19,7 +19,7 @@
 #include "hid-ids.h"
 
 /* Petalynx Maxter Remote has maximum for consumer page set too low */
-static __u8 *pl_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *pl_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	if (*rsize >= 62 && rdesc[39] == 0x2a && rdesc[40] == 0xf5 &&
diff --git a/drivers/hid/hid-prodikeys.c b/drivers/hid/hid-prodikeys.c
index 757361593e52..3d08c190a935 100644
--- a/drivers/hid/hid-prodikeys.c
+++ b/drivers/hid/hid-prodikeys.c
@@ -728,7 +728,7 @@ static int pcmidi_snd_terminate(struct pcmidi_snd *pm)
 /*
  * PC-MIDI report descriptor for report id is wrong.
  */
-static __u8 *pk_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *pk_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	if (*rsize == 178 &&
diff --git a/drivers/hid/hid-pxrc.c b/drivers/hid/hid-pxrc.c
index b0e517f9cde7..ef38730e78ab 100644
--- a/drivers/hid/hid-pxrc.c
+++ b/drivers/hid/hid-pxrc.c
@@ -42,8 +42,8 @@ static __u8 pxrc_rdesc_fixed[] = {
 	0xC0,              // End Collection
 };
 
-static __u8 *pxrc_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-				unsigned int *rsize)
+static const __u8 *pxrc_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				     unsigned int *rsize)
 {
 	hid_info(hdev, "fixing up PXRC report descriptor\n");
 	*rsize = sizeof(pxrc_rdesc_fixed);
diff --git a/drivers/hid/hid-redragon.c b/drivers/hid/hid-redragon.c
index 07d803513f27..20d28ed75c1e 100644
--- a/drivers/hid/hid-redragon.c
+++ b/drivers/hid/hid-redragon.c
@@ -33,7 +33,7 @@
  * key codes are generated.
  */
 
-static __u8 *redragon_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *redragon_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	unsigned int *rsize)
 {
 	if (*rsize >= 102 && rdesc[100] == 0x81 && rdesc[101] == 0x00) {
diff --git a/drivers/hid/hid-saitek.c b/drivers/hid/hid-saitek.c
index 85ac8def368f..6fe7c087c594 100644
--- a/drivers/hid/hid-saitek.c
+++ b/drivers/hid/hid-saitek.c
@@ -66,7 +66,7 @@ static int saitek_probe(struct hid_device *hdev,
 	return 0;
 }
 
-static __u8 *saitek_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *saitek_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	struct saitek_sc *ssc = hid_get_drvdata(hdev);
diff --git a/drivers/hid/hid-samsung.c b/drivers/hid/hid-samsung.c
index d4e27142245c..f3908a9e04e6 100644
--- a/drivers/hid/hid-samsung.c
+++ b/drivers/hid/hid-samsung.c
@@ -469,7 +469,7 @@ static int samsung_universal_kbd_input_mapping(struct hid_device *hdev,
 	return 1;
 }
 
-static __u8 *samsung_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *samsung_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	unsigned int *rsize)
 {
 	if (hdev->product == USB_DEVICE_ID_SAMSUNG_IR_REMOTE && hid_is_usb(hdev))
diff --git a/drivers/hid/hid-semitek.c b/drivers/hid/hid-semitek.c
index 710766f6839d..4fbec5fd87ce 100644
--- a/drivers/hid/hid-semitek.c
+++ b/drivers/hid/hid-semitek.c
@@ -11,8 +11,8 @@
 
 #include "hid-ids.h"
 
-static __u8 *semitek_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-                                  unsigned int *rsize)
+static const __u8 *semitek_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+					unsigned int *rsize)
 {
 	/* In the report descriptor for interface 2, fix the incorrect
 	   description of report ID 0x04 (the report contains a
diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index 26e93a331a51..7bd86eef6ec7 100644
--- a/drivers/hid/hid-sensor-hub.c
+++ b/drivers/hid/hid-sensor-hub.c
@@ -580,7 +580,7 @@ void sensor_hub_device_close(struct hid_sensor_hub_device *hsdev)
 }
 EXPORT_SYMBOL_GPL(sensor_hub_device_close);
 
-static __u8 *sensor_hub_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *sensor_hub_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	/*
diff --git a/drivers/hid/hid-sigmamicro.c b/drivers/hid/hid-sigmamicro.c
index 2e7058ac0e9d..c87276d7ba0d 100644
--- a/drivers/hid/hid-sigmamicro.c
+++ b/drivers/hid/hid-sigmamicro.c
@@ -99,8 +99,8 @@ static const __u8 sm_0059_rdesc[] = {
 	0xc0,                    /* End Collection                      166 */
 };
 
-static __u8 *sm_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-			     unsigned int *rsize)
+static const __u8 *sm_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				   unsigned int *rsize)
 {
 	if (*rsize == sizeof(sm_0059_rdesc) &&
 	    !memcmp(sm_0059_rdesc, rdesc, *rsize)) {
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index eac75f98f08a..8e2e914bd236 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -743,7 +743,7 @@ static int sixaxis_mapping(struct hid_device *hdev, struct hid_input *hi,
 	return -1;
 }
 
-static u8 *sony_report_fixup(struct hid_device *hdev, u8 *rdesc,
+static const u8 *sony_report_fixup(struct hid_device *hdev, u8 *rdesc,
 		unsigned int *rsize)
 {
 	struct sony_sc *sc = hid_get_drvdata(hdev);
diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 2154e14f55f1..895da49e8ead 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -570,8 +570,8 @@ static void steelseries_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 }
 
-static __u8 *steelseries_srws1_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-		unsigned int *rsize)
+static const __u8 *steelseries_srws1_report_fixup(struct hid_device *hdev,
+		__u8 *rdesc, unsigned int *rsize)
 {
 	if (hdev->vendor != USB_VENDOR_ID_STEELSERIES ||
 	    hdev->product != USB_DEVICE_ID_STEELSERIES_SRWS1)
diff --git a/drivers/hid/hid-sunplus.c b/drivers/hid/hid-sunplus.c
index f32e60d4420f..64e4cff8ca1d 100644
--- a/drivers/hid/hid-sunplus.c
+++ b/drivers/hid/hid-sunplus.c
@@ -18,7 +18,7 @@
 
 #include "hid-ids.h"
 
-static __u8 *sp_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *sp_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	if (*rsize >= 112 && rdesc[104] == 0x26 && rdesc[105] == 0x80 &&
diff --git a/drivers/hid/hid-topre.c b/drivers/hid/hid-topre.c
index d1d5ca310ead..848361f6225d 100644
--- a/drivers/hid/hid-topre.c
+++ b/drivers/hid/hid-topre.c
@@ -21,8 +21,8 @@ MODULE_LICENSE("GPL");
  * events it's actually sending. It claims to send array events but is instead
  * sending variable events.
  */
-static __u8 *topre_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-				 unsigned int *rsize)
+static const __u8 *topre_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				      unsigned int *rsize)
 {
 	if (*rsize >= 119 && rdesc[69] == 0x29 && rdesc[70] == 0xe7 &&
 						 rdesc[71] == 0x81 && rdesc[72] == 0x00) {
diff --git a/drivers/hid/hid-uclogic-core.c b/drivers/hid/hid-uclogic-core.c
index b176f9c0dd52..f6a1572b3728 100644
--- a/drivers/hid/hid-uclogic-core.c
+++ b/drivers/hid/hid-uclogic-core.c
@@ -50,7 +50,7 @@ static void uclogic_inrange_timeout(struct timer_list *t)
 	input_sync(input);
 }
 
-static __u8 *uclogic_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *uclogic_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 					unsigned int *rsize)
 {
 	struct uclogic_drvdata *drvdata = hid_get_drvdata(hdev);
diff --git a/drivers/hid/hid-viewsonic.c b/drivers/hid/hid-viewsonic.c
index 668c2adb77b6..86f41e3fcb95 100644
--- a/drivers/hid/hid-viewsonic.c
+++ b/drivers/hid/hid-viewsonic.c
@@ -70,8 +70,8 @@ static __u8 pd1011_rdesc_fixed[] = {
 	0xC0                    /*  End Collection                      */
 };
 
-static __u8 *viewsonic_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-				    unsigned int *rsize)
+static const __u8 *viewsonic_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+					  unsigned int *rsize)
 {
 	switch (hdev->product) {
 	case USB_DEVICE_ID_VIEWSONIC_PD1011:
diff --git a/drivers/hid/hid-vrc2.c b/drivers/hid/hid-vrc2.c
index 80a2b7ef5e66..9a4840b524ba 100644
--- a/drivers/hid/hid-vrc2.c
+++ b/drivers/hid/hid-vrc2.c
@@ -38,8 +38,8 @@ static __u8 vrc2_rdesc_fixed[] = {
 	0xC0,              // End Collection
 };
 
-static __u8 *vrc2_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-				unsigned int *rsize)
+static const __u8 *vrc2_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				     unsigned int *rsize)
 {
 	hid_info(hdev, "fixing up VRC-2 report descriptor\n");
 	*rsize = sizeof(vrc2_rdesc_fixed);
diff --git a/drivers/hid/hid-waltop.c b/drivers/hid/hid-waltop.c
index 1e590c61eef5..137a682ef5fb 100644
--- a/drivers/hid/hid-waltop.c
+++ b/drivers/hid/hid-waltop.c
@@ -599,7 +599,7 @@ static __u8 sirius_battery_free_tablet_rdesc_fixed[] = {
 	0xC0                /*  End Collection                      */
 };
 
-static __u8 *waltop_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *waltop_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	switch (hdev->product) {
diff --git a/drivers/hid/hid-winwing.c b/drivers/hid/hid-winwing.c
index 10a5d87ccb96..86b64c0ced12 100644
--- a/drivers/hid/hid-winwing.c
+++ b/drivers/hid/hid-winwing.c
@@ -165,7 +165,7 @@ static __u8 original_rdesc_buttons[] = {
  * This module skips numbers 32-63, unused on some throttle grips.
  */
 
-static __u8 *winwing_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *winwing_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	int sig_length = sizeof(original_rdesc_buttons);
diff --git a/drivers/hid/hid-xiaomi.c b/drivers/hid/hid-xiaomi.c
index a97a90afad33..035733fce2e1 100644
--- a/drivers/hid/hid-xiaomi.c
+++ b/drivers/hid/hid-xiaomi.c
@@ -61,8 +61,8 @@ static __u8 mi_silent_mouse_rdesc_fixed[] = {
 	0xC0                /*  End Collection                      */
 };
 
-static __u8 *xiaomi_report_fixup(struct hid_device *hdev, __u8 *rdesc,
-				 unsigned int *rsize)
+static const __u8 *xiaomi_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				       unsigned int *rsize)
 {
 	switch (hdev->product) {
 	case USB_DEVICE_ID_MI_SILENT_MOUSE:
diff --git a/drivers/hid/hid-zydacron.c b/drivers/hid/hid-zydacron.c
index 998a3db19c1f..3bdb26f45592 100644
--- a/drivers/hid/hid-zydacron.c
+++ b/drivers/hid/hid-zydacron.c
@@ -24,7 +24,7 @@ struct zc_device {
 * Zydacron remote control has an invalid HID report descriptor,
 * that needs fixing before we can parse it.
 */
-static __u8 *zc_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+static const __u8 *zc_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	unsigned int *rsize)
 {
 	if (*rsize >= 253 &&
diff --git a/include/linux/hid.h b/include/linux/hid.h
index c5fb43db0f2e..3a998fa3812d 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -822,7 +822,7 @@ struct hid_driver {
 			struct hid_usage *usage, __s32 value);
 	void (*report)(struct hid_device *hdev, struct hid_report *report);
 
-	__u8 *(*report_fixup)(struct hid_device *hdev, __u8 *buf,
+	const __u8 *(*report_fixup)(struct hid_device *hdev, __u8 *buf,
 			unsigned int *size);
 
 	int (*input_mapping)(struct hid_device *hdev,

-- 
2.46.0


