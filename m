Return-Path: <linux-input+bounces-7601-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA099A91A0
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 22:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D8EF1C2401F
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 20:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6D31E47C5;
	Mon, 21 Oct 2024 20:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b="iQaT7NUx"
X-Original-To: linux-input@vger.kernel.org
Received: from matoro.tk (matoro.tk [104.188.251.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681941C9EDD;
	Mon, 21 Oct 2024 20:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.188.251.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729543867; cv=none; b=FIiRgUCItOxC//LSXC0bJvj6ToX3Orx1eltk3R8i3w1VfsJCOuOMT7Vk+Ghmmh+ESsbyULqdc3qF20BFtO+u8B51PgxiUG6RmqxdzDlj07UHW1pF7JdwYJNKIDKnS5cwGqN0ZCCxDoizv9dKJqrg9LdMkyAT+8805/5MkQHBwGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729543867; c=relaxed/simple;
	bh=owsn1q/hvcIZGEc2BuA64YfBEhtF/nMpTR5LxSzQUwQ=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=gABZw7yB3WYYViBFcZ0o/SL9ImsPmuZRdIn3auqgBpQpijUjR7h7jupNlGjC/Y8Xue6f9XN17ongHcg5z+y0cbI2k6vTbEWDHLSFNZ2ZGbfboXh4HFpiCwGsMqQOKKuj1HY7F2lw3xql78KO/n26iessYgB9T6t7A/CUIFOSNx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk; spf=pass smtp.mailfrom=matoro.tk; dkim=pass (4096-bit key) header.d=matoro.tk header.i=@matoro.tk header.b=iQaT7NUx; arc=none smtp.client-ip=104.188.251.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=matoro.tk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matoro.tk
DKIM-Signature: a=rsa-sha256; bh=4AoEF/INFuOSvZ5yTzU8RRLz1qRNjLhxw4DMjISGWWM=;
 c=relaxed/relaxed; d=matoro.tk;
 h=Subject:Subject:Sender:To:To:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@matoro.tk; s=20240828; t=1729542952; v=1; x=1729974952;
 b=iQaT7NUxeo4cDq2HUa0+f41L6SbFSe3vI8lqA1lBFVUf9hGXfxsZAZw/H7R6OlAj0YRpylhg
 Z696ElGZjr6eIqkQKCzO5HUfIti6rYzLZgeNifEaIeoPXLfSjVX3NRgFyz8fxHhEiwgSjvSnBpi
 YlxYgPdjh2C6KNMDPYea+NbLKtA9LTO/ZOH3EfhI0zLGx4aXRzVTQsJtA7zRVHXVQI+Le0snP/U
 xj0rIo3hkB0ENb3KQvJHHNeTuDl2Zmui66WIxNmR9AiL8xH06YwKM6qviaj9bcebCgiOKKZPmQO
 hsfGRSOqnxwwVKtlSJTAvix/jdwd3JwIX90lyLB5lO9aoGEB/CzoVbIbUCntjm+o55afZWcWn9t
 8mcG1wp5F6CAgoJ2M6YibCVu+LKf+Ln/vZ10SOO2gil8RZk+32wNmRvGthMkoiMeKv/AHdq/Q/H
 sJbSRYl2EzCmCq4o6evSc4tYksqV1Agah98ez6Oy6W2suVU3QrQyKQabeFaeAhbm6wtvyHJ5yMI
 dvtm0tv6Xm/Lhx12fWgwYxO1ga0kuWIxiSV/o99V1e0wI9tUowkPkZo9tvQbSo5MM7YfNIjtmnT
 DOw+Zq/E98owE5tDOr1/HOmmDc5jmeyzKPV/FcF8oYln4PrQsYhZQvPonFKML0C85NFMcSVN/J9
 uvXPz9ik1c4=
Received: by matoro.tk (envelope-sender
 <matoro_mailinglist_kernel@matoro.tk>) with ESMTPS id 4eb3a98f; Mon, 21 Oct
 2024 16:35:52 -0400
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 21 Oct 2024 16:35:52 -0400
From: matoro <matoro_mailinglist_kernel@matoro.tk>
To: linux-input@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: xpad - enable & autodetect Flydigi extra buttons
Message-ID: <42fe05eb92b4b03791a78c8cbc552562@matoro.tk>
X-Sender: matoro_mailinglist_kernel@matoro.tk
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

This adds a framework for supporting additional features on devices
piggybacking an existing USB vendor/product ID but distinguishing
themselves via the idProduct field.  This is necessary because the
Flydigi Vader Pro series controllers reuse the same vendor/product ID as
orginal Microsoft Xbox 360 controllers.

The MAP_FLYDIGI_BUTTONS is a new mapping for the C, Z, and Circle face
buttons on Flydigi 360-compatible controllers.  It has been tested on
the Vader 3 Pro and Vader 4 Pro.

These controllers additionally have 4 back paddles, same as the Xbox
Elite controller, so it is included in the extra feature list.

Thanks-to: Matthew Carter <m@ahungry.com>
See: https://github.com/paroj/xpad/pull/268
Signed-off-by: Matoro Mahri <matoro_mailinglist_kernel@matoro.tk>
---
  drivers/input/joystick/xpad.c | 53 ++++++++++++++++++++++++++++++++++-
  1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 2b8370ecf42a..5088a97de73e 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -83,6 +83,7 @@
  #define MAP_SELECT_BUTTON		(1 << 3)
  #define MAP_PADDLES			(1 << 4)
  #define MAP_PROFILE_BUTTON		(1 << 5)
+#define MAP_FLYDIGI_BUTTONS		(1 << 6)

  #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
  				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
@@ -387,6 +388,19 @@ static const struct xpad_device {
  	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
  };

+// A "flavor" is an aftermarket variant of an existing model supporting
+// additional features.
+static const struct xpad_flavor {
+	u16 idVendor;
+	u16 idProduct;
+	char *product;
+	u8 mapping;
+} xpad_flavor[] = {
+	{ 0x045e, 0x028e, "Flydigi VADER3", MAP_PADDLES | MAP_FLYDIGI_BUTTONS },
+	{ 0x045e, 0x028e, "Flydigi VADER4", MAP_PADDLES | MAP_FLYDIGI_BUTTONS },
+	{ 0x0000, 0x0000, NULL, 0 }
+};
+
  /* buttons shared with xbox and xbox360 */
  static const signed short xpad_common_btn[] = {
  	BTN_A, BTN_B, BTN_X, BTN_Y,			/* "analog" buttons */
@@ -444,6 +458,13 @@ static const signed short xpad_btn_paddles[] = {
  	-1						/* terminating entry */
  };

+/* used for extra buttons in addition to paddles on Flydigi Vader Pro 
series*/
+static const signed short xpad_btn_extra[] = {
+	BTN_TRIGGER_HAPPY9, BTN_TRIGGER_HAPPY10, /* C, Z face buttons */
+	BTN_TRIGGER_HAPPY11,			 /* circle */
+	-1						/* terminating entry */
+};
+
  /*
   * Xbox 360 has a vendor-specific class, so we cannot match it with only
   * USB_INTERFACE_INFO (also specifically refused by USB subsystem), so we
@@ -898,6 +919,17 @@ static void xpad360_process_packet(struct usb_xpad 
*xpad, struct input_dev *dev,
  		input_report_abs(dev, ABS_RZ, data[5]);
  	}

+	/* Additional buttons for Flydigi Vader Pro series presenting as 360 pad. 
*/
+	if (xpad->mapping & MAP_FLYDIGI_BUTTONS) {
+		input_report_key(dev, BTN_TRIGGER_HAPPY9, data[19] & BIT(0));   // C
+		input_report_key(dev, BTN_TRIGGER_HAPPY10, data[19] & BIT(1));  // Z
+		input_report_key(dev, BTN_TRIGGER_HAPPY5, data[19] & BIT(3));   // 
Leftmost paddle (M2)
+		input_report_key(dev, BTN_TRIGGER_HAPPY6, data[19] & BIT(5));   // Second 
to leftmost (M4)
+		input_report_key(dev, BTN_TRIGGER_HAPPY7, data[19] & BIT(4));   // Second 
to rightmost (M3)
+		input_report_key(dev, BTN_TRIGGER_HAPPY8, data[19] & BIT(2));   // 
Rightmost paddle (M1)
+		input_report_key(dev, BTN_TRIGGER_HAPPY11, data[20] & BIT(0));  // Circle
+	}
+
  	input_sync(dev);

  	/* XBOX360W controllers can't be turned off without driver assistance */
@@ -1958,6 +1990,13 @@ static int xpad_init_input(struct usb_xpad *xpad)
  			input_set_capability(input_dev, EV_KEY, xpad_btn_paddles[i]);
  	}

+	/* set up extra face buttons if the controller has them */
+	if (xpad->mapping & MAP_FLYDIGI_BUTTONS) {
+		for (i = 0; xpad_btn_extra[i] >= 0; i++) {
+			input_set_capability(input_dev, EV_KEY, xpad_btn_extra[i]);
+		}
+	}
+
  	/*
  	 * This should be a simple else block. However historically
  	 * xbox360w has mapped DPAD to buttons while xbox360 did not. This
@@ -2012,7 +2051,7 @@ static int xpad_probe(struct usb_interface *intf, const 
struct usb_device_id *id
  	struct usb_device *udev = interface_to_usbdev(intf);
  	struct usb_xpad *xpad;
  	struct usb_endpoint_descriptor *ep_irq_in, *ep_irq_out;
-	int i, error;
+	int i, j, error;

  	if (intf->cur_altsetting->desc.bNumEndpoints != 2)
  		return -ENODEV;
@@ -2046,6 +2085,18 @@ static int xpad_probe(struct usb_interface *intf, 
const struct usb_device_id *id
  	xpad->udev = udev;
  	xpad->intf = intf;
  	xpad->mapping = xpad_device[i].mapping;
+
+	if (udev->product) {	// Only worry about extra flavors if a product string 
is present
+		for(j = 0; xpad_flavor[j].idVendor; j++) {
+			if (le16_to_cpu(udev->descriptor.idVendor) == xpad_flavor[j].idVendor &&
+			    le16_to_cpu(udev->descriptor.idProduct) == xpad_flavor[j].idProduct 
&&
+			    !strcmp(udev->product, xpad_flavor[j].product)) {
+				xpad->mapping |= xpad_flavor[j].mapping;
+				break;
+			}
+		}
+	}
+
  	xpad->xtype = xpad_device[i].xtype;
  	xpad->name = xpad_device[i].name;
  	xpad->packet_type = PKT_XB;
-- 
2.47.0


