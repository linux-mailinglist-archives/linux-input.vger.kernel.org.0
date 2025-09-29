Return-Path: <linux-input+bounces-15168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C236BA9E0D
	for <lists+linux-input@lfdr.de>; Mon, 29 Sep 2025 17:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01D541921DCE
	for <lists+linux-input@lfdr.de>; Mon, 29 Sep 2025 15:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9B730B520;
	Mon, 29 Sep 2025 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=makarenk.ooo header.i=@makarenk.ooo header.b="wbOBlkAH"
X-Original-To: linux-input@vger.kernel.org
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889CA1F94A;
	Mon, 29 Sep 2025 15:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759161269; cv=none; b=uQERfZ+a6TqP6mVvCzueOiKcB4cgwgNlUbI90WwyYnQpqsYv+V+e/fhkMidiqEhpEswvjLqb7XA0DEdZ0VpnU7IaZrTiXKGjnUUVX/9AUMJD361GtcQDEZ/HAQAKEfArZyx4zK+luCoPdZxChGQ9ZdYe0YtTaa+0Hw6TltzKWmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759161269; c=relaxed/simple;
	bh=f384yOVi7AEvY/jgfA3iqNoGzpBT36RscpwIWsMWCHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uskTQ16n2/zoQoNIwad4GrGZtYvhTCRivvwntrKkLuG4TWC7wNFRKwzWC2N7RmTz+pzthR0WIovyKsztbTtz87vRkn3cW17ut09zAAr/diccpl6GxdV/rGcqKn9m4jyUKCDwg+pHQnoyHB/y71G6FAv/Uazl+AMYNNLxgOYfVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=makarenk.ooo; spf=pass smtp.mailfrom=makarenk.ooo; dkim=pass (1024-bit key) header.d=makarenk.ooo header.i=@makarenk.ooo header.b=wbOBlkAH; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=makarenk.ooo
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makarenk.ooo
Received: from home-pc (62-82-40.netrun.cytanet.com.cy [62.228.82.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: oleg@makarenk.ooo)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 4928544E5B;
	Mon, 29 Sep 2025 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=makarenk.ooo;
	s=default; t=1759160869;
	bh=eUVUtz+LZXcjf8iE4l26qQB8KWhabSZqtPqiogH/O6U=;
	h=From:To:Cc:Subject:Date;
	b=wbOBlkAH8TUDxI9vhrfdWETCW+nxkEQuld9bTHzRTJW5foibasbL17EbEAFD3Bcz2
	 RXpbWSQJtGlTuj0qFKjLj0miEZFrqpUwMN09TYq0DVp5CvkSYo8LTCNs5lIc6Nou9S
	 Rr2WlRSL4nb4vgQd+DSZ8e3fB2NK7HD7hd3qhGcg=
From: Oleg Makarenko <oleg@makarenk.ooo>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Oleg Makarenko <oleg@makarenk.ooo>
Subject: [PATCH] HID: quirks: Add ALWAYS_POLL quirk for VRS R295 steering wheel
Date: Mon, 29 Sep 2025 18:46:11 +0300
Message-ID: <20250929154639.1014717-1-oleg@makarenk.ooo>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds ALWAYS_POLL quirk for the VRS R295 steering wheel joystick.
This device reboots itself every 8-10 seconds if it is not polled.

Signed-off-by: Oleg Makarenko <oleg@makarenk.ooo>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 149798754570..2e56b6740fcf 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1430,6 +1430,7 @@
 
 #define USB_VENDOR_ID_VRS	0x0483
 #define USB_DEVICE_ID_VRS_DFP	0xa355
+#define USB_DEVICE_ID_VRS_R295	0xa44c
 
 #define USB_VENDOR_ID_VTL		0x0306
 #define USB_DEVICE_ID_VTL_MULTITOUCH_FF3F	0xff3f
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index f619ed10535d..b451157d6e6e 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -206,6 +206,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, USB_DEVICE_ID_UCLOGIC_TABLET_KNA5), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC, USB_DEVICE_ID_UCLOGIC_TABLET_TWA60), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_UGTIZER, USB_DEVICE_ID_UGTIZER_TABLET_WP5540), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_VRS, USB_DEVICE_ID_VRS_R295), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, USB_DEVICE_ID_WALTOP_MEDIA_TABLET_10_6_INCH), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, USB_DEVICE_ID_WALTOP_MEDIA_TABLET_14_1_INCH), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, USB_DEVICE_ID_WALTOP_SIRIUS_BATTERY_FREE_TABLET), HID_QUIRK_MULTI_INPUT },
-- 
2.51.0


