Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501C78BA84
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 15:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729239AbfHMNiS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 09:38:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40697 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729233AbfHMNiQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 09:38:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0A25DC05168C;
        Tue, 13 Aug 2019 13:38:16 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-117-165.ams2.redhat.com [10.36.117.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B45136E6F0;
        Tue, 13 Aug 2019 13:38:14 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 1/2] Revert "HID: logitech-hidpp: add USB PID for a few more supported mice"
Date:   Tue, 13 Aug 2019 15:38:06 +0200
Message-Id: <20190813133807.12384-2-benjamin.tissoires@redhat.com>
In-Reply-To: <20190813133807.12384-1-benjamin.tissoires@redhat.com>
References: <20190813133807.12384-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 13 Aug 2019 13:38:16 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This partially reverts commit 27fc32fd9417968a459d43d9a7c50fd423d53eb9.

It turns out that the G502 has some issues with hid-logitech-hidpp:
when plugging it in, the driver tries to contact it but it fails.
So the driver bails out leaving only the mouse event node available.

This timeout is problematic as it introduce a delay in the boot,
and having only the mouse event node means that the hardware
macros keys can not be relayed to the userspace.

Filipe and I just gave a shot at the following devices:

G403 Wireless (0xC082)
G703 (0xC087)
G703 Hero (0xC090)
G903 (0xC086)
G903 Hero (0xC091)
G Pro (0xC088)

Reverting the device we are not sure that works flawlessly.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-logitech-hidpp.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 21268c9fa71a..343052b117a9 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3749,30 +3749,10 @@ static const struct hid_device_id hidpp_devices[] = {
 
 	{ L27MHZ_DEVICE(HID_ANY_ID) },
 
-	{ /* Logitech G203/Prodigy Gaming Mouse */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC084) },
-	{ /* Logitech G302 Gaming Mouse */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC07F) },
-	{ /* Logitech G303 Gaming Mouse */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC080) },
-	{ /* Logitech G400 Gaming Mouse */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC07E) },
 	{ /* Logitech G403 Wireless Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC082) },
-	{ /* Logitech G403 Gaming Mouse */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC083) },
-	{ /* Logitech G403 Hero Gaming Mouse over USB */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC08F) },
-	{ /* Logitech G502 Proteus Core Gaming Mouse */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC07D) },
-	{ /* Logitech G502 Proteus Spectrum Gaming Mouse over USB */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC332) },
-	{ /* Logitech G502 Hero Gaming Mouse over USB */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC08B) },
 	{ /* Logitech G700 Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC06B) },
-	{ /* Logitech G700s Gaming Mouse over USB */
-	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC07C) },
 	{ /* Logitech G703 Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC087) },
 	{ /* Logitech G703 Hero Gaming Mouse over USB */
-- 
2.19.2

