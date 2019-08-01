Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BDD7D6A0
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2019 09:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730561AbfHAHr6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Aug 2019 03:47:58 -0400
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:43613 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbfHAHr6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Aug 2019 03:47:58 -0400
Received: from localhost.localdomain ([176.167.121.156])
        by mwinf5d80 with ME
        id jjnu200053NZnML03jnu6s; Thu, 01 Aug 2019 09:47:55 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 01 Aug 2019 09:47:55 +0200
X-ME-IP: 176.167.121.156
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] HID: usbhid: Use GFP_KERNEL instead of GFP_ATOMIC when applicable
Date:   Thu,  1 Aug 2019 09:47:59 +0200
Message-Id: <20190801074759.32738-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is no need to use GFP_ATOMIC when calling 'usb_alloc_coherent()'
here. These calls are done from probe functions and using GFP_KERNEL should
be safe.
The memory itself is used within some interrupts, but it is not a
problem, once it has been allocated.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hid/usbhid/usbkbd.c   | 4 ++--
 drivers/hid/usbhid/usbmouse.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
index d5b7a696a68c..63e8ef8beb45 100644
--- a/drivers/hid/usbhid/usbkbd.c
+++ b/drivers/hid/usbhid/usbkbd.c
@@ -239,11 +239,11 @@ static int usb_kbd_alloc_mem(struct usb_device *dev, struct usb_kbd *kbd)
 		return -1;
 	if (!(kbd->led = usb_alloc_urb(0, GFP_KERNEL)))
 		return -1;
-	if (!(kbd->new = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &kbd->new_dma)))
+	if (!(kbd->new = usb_alloc_coherent(dev, 8, GFP_KERNEL, &kbd->new_dma)))
 		return -1;
 	if (!(kbd->cr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL)))
 		return -1;
-	if (!(kbd->leds = usb_alloc_coherent(dev, 1, GFP_ATOMIC, &kbd->leds_dma)))
+	if (!(kbd->leds = usb_alloc_coherent(dev, 1, GFP_KERNEL, &kbd->leds_dma)))
 		return -1;
 
 	return 0;
diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
index 073127e65ac1..c89332017d5d 100644
--- a/drivers/hid/usbhid/usbmouse.c
+++ b/drivers/hid/usbhid/usbmouse.c
@@ -130,7 +130,7 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
 	if (!mouse || !input_dev)
 		goto fail1;
 
-	mouse->data = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &mouse->data_dma);
+	mouse->data = usb_alloc_coherent(dev, 8, GFP_KERNEL, &mouse->data_dma);
 	if (!mouse->data)
 		goto fail1;
 
-- 
2.20.1

