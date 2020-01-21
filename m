Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01E6A1445DD
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2020 21:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbgAUUYF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jan 2020 15:24:05 -0500
Received: from nerf.fortress-managed.net ([64.62.190.231]:42822 "EHLO
        nerf.kain.org" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbgAUUYF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jan 2020 15:24:05 -0500
X-Greylist: delayed 311 seconds by postgrey-1.27 at vger.kernel.org; Tue, 21 Jan 2020 15:24:05 EST
Received: by nerf.kain.org (Postfix, from userid 1000)
        id 50D95C311; Tue, 21 Jan 2020 20:18:54 +0000 (UTC)
Date:   Tue, 21 Jan 2020 20:18:54 +0000
From:   Bryon Roche <kain@kain.org>
To:     linux-input@vger.kernel.org
Subject: [PATCH] Saitek X-52 Pro - Add HID quirk
Message-ID: <20200121201854.GB30451@kain.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello!

I've been using a Saitek X-52 Pro, and it has the same quirk as the
X52 in which it has duplicate HID descriptors for some of its
controls.  This patch adds the X52 Pro to the hid quirks list
accordingly.

Signed-off-by: Bryon Roche <kain@kain.org>

diff --cc drivers/hid/hid-ids.h
index 7e1689ef35f5,bdb4fefb683c..000000000000
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@@ -1002,7 -979,7 +1002,8 @@@
  #define USB_DEVICE_ID_SAITEK_RAT7	0x0cd7
  #define USB_DEVICE_ID_SAITEK_RAT9	0x0cfa
  #define USB_DEVICE_ID_SAITEK_MMO7	0x0cd0
 +#define USB_DEVICE_ID_SAITEK_X52	0x075c
+ #define USB_DEVICE_ID_SAITEK_X52PRO     0x0762
  
  #define USB_VENDOR_ID_SAMSUNG		0x0419
  #define USB_DEVICE_ID_SAMSUNG_IR_REMOTE	0x0001
diff --cc drivers/hid/hid-quirks.c
index d1b39c29e353,8c1f8b0ecf8b..000000000000
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@@ -144,7 -140,7 +144,8 @@@ static const struct hid_device_id hid_q
  	{ HID_USB_DEVICE(USB_VENDOR_ID_RETROUSB, USB_DEVICE_ID_RETROUSB_SNES_RETROPAD), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
  	{ HID_USB_DEVICE(USB_VENDOR_ID_RETROUSB, USB_DEVICE_ID_RETROUSB_SNES_RETROPORT), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
  	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_RUMBLEPAD), HID_QUIRK_BADPAD },
 +	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52PRO), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
  	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMICO, USB_DEVICE_ID_SEMICO_USB_KEYKOARD2), HID_QUIRK_NO_INIT_REPORTS },
  	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMICO, USB_DEVICE_ID_SEMICO_USB_KEYKOARD), HID_QUIRK_NO_INIT_REPORTS },
  	{ HID_USB_DEVICE(USB_VENDOR_ID_SENNHEISER, USB_DEVICE_ID_SENNHEISER_BTD500USB), HID_QUIRK_NOGET },

