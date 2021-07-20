Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855AF3CF8E8
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 13:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbhGTK4w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 06:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53993 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236395AbhGTK40 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 06:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626781024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lrONlxWvpImPwBny70DcEOZbzXa2If9j7txd1xRQWig=;
        b=dW4u06vwY4+f+viCGT8zsfrkRE17QiknvdXz/3hDFEDsjTE15uWRTeca3hHjXdrBgzmkXd
        9nLKdTFlseuVNOa5+dQTKX/Z4zaplPvriHTgjOs3mrJiJaEbPArcUg2s3QYtezT70J6PA9
        tWs1wpMrjjPIhKpqHuoABeq6wUqNgGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-UvZTHZIxPienEWnk92Brng-1; Tue, 20 Jul 2021 07:37:00 -0400
X-MC-Unique: UvZTHZIxPienEWnk92Brng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86FC281C85D;
        Tue, 20 Jul 2021 11:36:59 +0000 (UTC)
Received: from [10.36.114.171] (ovpn-114-171.ams2.redhat.com [10.36.114.171])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 73BC210016F5;
        Tue, 20 Jul 2021 11:36:57 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: sony: support for the ghlive ps4 dongles
To:     Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>,
        Pascal Giard <pascal.giard@etsmtl.ca>
References: <20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca>
Message-ID: <951c38d5-934e-eca7-a025-9cf074771764@redhat.com>
Date:   Tue, 20 Jul 2021 13:36:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel (and Pascal),

[adding Roderick in Cc who is dealing with the Sony driver from Sony
itself :) ]


On Thu, Jul 15, 2021 at 9:58 PM Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca> wrote:
>
> This commit adds support for the Guitar Hero Live PS4 dongles.

I was about to ask you to add some regression tests to
https://gitlab.freedesktop.org/libevdev/hid-tools/-/blob/master/tests/test_sony.py

This would likely have avoided the previous patch that was required and
cc-ed to stable.

But after looking slightly at the patch, I realized that the Guitar Hero
code uses direct USB calls, which is not something we can emulate at the
hid-tools level.

However, after a second look at the code, I think that this part of the
code just reimplements its own HID SET_OUTPUT code, and that is
something we can easily emulate.

Could you check if the following patch is still working properly on a
PS3 dongle? and if so, add your PS4 support on top?

---
commit 10e14f105553d2bd88bc7748e87154c5a8131e9e
Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue Jul 20 11:44:10 2021 +0200

     HID: sony: GHL: do not use raw USB calls
     
     We can rely on HID to do the job for us.
     This simplifies the code and also allows to implement regression tests.
     
     Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index b3722c51ec78..901f61d286e8 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -37,7 +37,6 @@
  #include <linux/idr.h>
  #include <linux/input/mt.h>
  #include <linux/crc32.h>
-#include <linux/usb.h>
  #include <linux/timer.h>
  #include <asm/unaligned.h>
  
@@ -92,7 +91,7 @@
   * https://github.com/ghlre/GHLtarUtility/blob/master/PS3Guitar.cs
   * Note: The Wii U and PS3 dongles happen to share the same!
   */
-static const u16 ghl_ps3wiiu_magic_value = 0x201;
+static const u16 ghl_ps3wiiu_magic_report = 1;
  static const char ghl_ps3wiiu_magic_data[] = {
  	0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
  };
@@ -597,7 +596,6 @@ struct sony_sc {
  	/* DS4 calibration data */
  	struct ds4_calibration_data ds4_calib_data[6];
  	/* GH Live */
-	struct urb *ghl_urb;
  	struct timer_list ghl_poke_timer;
  };
  
@@ -622,56 +620,29 @@ static inline void sony_schedule_work(struct sony_sc *sc,
  	}
  }
  
-static void ghl_magic_poke_cb(struct urb *urb)
-{
-	struct sony_sc *sc = urb->context;
-
-	if (urb->status < 0)
-		hid_err(sc->hdev, "URB transfer failed : %d", urb->status);
-
-	mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
-}
-
  static void ghl_magic_poke(struct timer_list *t)
  {
  	int ret;
  	struct sony_sc *sc = from_timer(sc, t, ghl_poke_timer);
+	const int buf_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
+	u8 *buf;
  
-	ret = usb_submit_urb(sc->ghl_urb, GFP_ATOMIC);
-	if (ret < 0)
-		hid_err(sc->hdev, "usb_submit_urb failed: %d", ret);
-}
-
-static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
-{
-	struct usb_ctrlrequest *cr;
-	u16 poke_size;
-	u8 *databuf;
-	unsigned int pipe;
-
-	poke_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
-	pipe = usb_sndctrlpipe(usbdev, 0);
+	buf = kmemdup(ghl_ps3wiiu_magic_data, buf_size, GFP_KERNEL);
+	if (!buf)
+		return;
  
-	cr = devm_kzalloc(&sc->hdev->dev, sizeof(*cr), GFP_ATOMIC);
-	if (cr == NULL)
-		return -ENOMEM;
+	ret = hid_hw_raw_request(sc->hdev, ghl_ps3wiiu_magic_report, buf,
+				 buf_size,
+				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
+	if (ret < 0) {
+		hid_err(sc->hdev, "can't poke ghl magic\n");
+		goto out;
+	}
  
-	databuf = devm_kzalloc(&sc->hdev->dev, poke_size, GFP_ATOMIC);
-	if (databuf == NULL)
-		return -ENOMEM;
+	mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
  
-	cr->bRequestType =
-		USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;
-	cr->bRequest = USB_REQ_SET_CONFIGURATION;
-	cr->wValue = cpu_to_le16(ghl_ps3wiiu_magic_value);
-	cr->wIndex = 0;
-	cr->wLength = cpu_to_le16(poke_size);
-	memcpy(databuf, ghl_ps3wiiu_magic_data, poke_size);
-	usb_fill_control_urb(
-		sc->ghl_urb, usbdev, pipe,
-		(unsigned char *) cr, databuf, poke_size,
-		ghl_magic_poke_cb, sc);
-	return 0;
+out:
+	kfree(buf);
  }
  
  static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
@@ -2968,7 +2939,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
  	int ret;
  	unsigned long quirks = id->driver_data;
  	struct sony_sc *sc;
-	struct usb_device *usbdev;
  	unsigned int connect_mask = HID_CONNECT_DEFAULT;
  
  	if (!strcmp(hdev->name, "FutureMax Dance Mat"))
@@ -2988,7 +2958,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
  	sc->quirks = quirks;
  	hid_set_drvdata(hdev, sc);
  	sc->hdev = hdev;
-	usbdev = to_usb_device(sc->hdev->dev.parent->parent);
  
  	ret = hid_parse(hdev);
  	if (ret) {
@@ -3031,15 +3000,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
  	}
  
  	if (sc->quirks & GHL_GUITAR_PS3WIIU) {
-		sc->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
-		if (!sc->ghl_urb)
-			return -ENOMEM;
-		ret = ghl_init_urb(sc, usbdev);
-		if (ret) {
-			hid_err(hdev, "error preparing URB\n");
-			return ret;
-		}
-
  		timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
  		mod_timer(&sc->ghl_poke_timer,
  			  jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
@@ -3054,7 +3014,6 @@ static void sony_remove(struct hid_device *hdev)
  
  	if (sc->quirks & GHL_GUITAR_PS3WIIU) {
  		del_timer_sync(&sc->ghl_poke_timer);
-		usb_free_urb(sc->ghl_urb);
  	}
  
  	hid_hw_close(hdev);
---

Cheers,
Benjamin


>
> These dongles require a "magic" USB interrupt message to be sent
> every 8 seconds otherwise the dongle will not report events where
> the strumbar is hit while a fret is being held.
>
> Note that the GHL_GUITAR_POKE_INTERVAL is reduced to 8 seconds in order
> to support PS3, Wii U, and PS4 GHL dongles.
>
> Also note that the constant for vendor id 0x1430 has been renamed from
> Activision to RedOctane as self-declared by the device.
>
> Co-developed-by: Pascal Giard <pascal.giard@etsmtl.ca>
> Signed-off-by: Pascal Giard <pascal.giard@etsmtl.ca>
> Signed-off-by: Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
> ---
>  drivers/hid/Kconfig    |  2 +-
>  drivers/hid/hid-ids.h  |  7 ++--
>  drivers/hid/hid-sony.c | 76 +++++++++++++++++++++++++++++++++++++-----
>  3 files changed, 72 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 160554903ef9..b743e7f2587a 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -952,7 +952,7 @@ config HID_SONY
>           * Buzz controllers
>           * Sony PS3 Blue-ray Disk Remote Control (Bluetooth)
>           * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
> -         * Guitar Hero Live PS3 and Wii U guitar dongles
> +         * Guitar Hero Live PS3, Wii U, and PS4 guitar dongles
>           * Guitar Hero PS3 and PC guitar dongles
>
>  config SONY_FF
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 8f1893e68112..55990018836a 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -41,9 +41,6 @@
>  #define USB_VENDOR_ID_ACTIONSTAR       0x2101
>  #define USB_DEVICE_ID_ACTIONSTAR_1011  0x1011
>
> -#define USB_VENDOR_ID_ACTIVISION       0x1430
> -#define USB_DEVICE_ID_ACTIVISION_GUITAR_DONGLE 0x474c
> -
>  #define USB_VENDOR_ID_ADS_TECH         0x06e1
>  #define USB_DEVICE_ID_ADS_TECH_RADIO_SI470X    0xa155
>
> @@ -1018,6 +1015,10 @@
>  #define USB_VENDOR_ID_REALTEK          0x0bda
>  #define USB_DEVICE_ID_REALTEK_READER   0x0152
>
> +#define USB_VENDOR_ID_REDOCTANE                0x1430
> +#define USB_DEVICE_ID_REDOCTANE_GUITAR_DONGLE  0x474c
> +#define USB_DEVICE_ID_REDOCTANE_PS4_GHLIVE_DONGLE      0x07bb
> +
>  #define USB_VENDOR_ID_RETROUSB         0xf000
>  #define USB_DEVICE_ID_RETROUSB_SNES_RETROPAD   0x0003
>  #define USB_DEVICE_ID_RETROUSB_SNES_RETROPORT  0x00f1
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index b3722c51ec78..a8ff6f767e5d 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -11,8 +11,9 @@
>   *  Copyright (c) 2013 Colin Leitner <colin.leitner@gmail.com>
>   *  Copyright (c) 2014-2016 Frank Praznik <frank.praznik@gmail.com>
>   *  Copyright (c) 2018 Todd Kelner
> - *  Copyright (c) 2020 Pascal Giard <pascal.giard@etsmtl.ca>
> + *  Copyright (c) 2020-2021 Pascal Giard <pascal.giard@etsmtl.ca>
>   *  Copyright (c) 2020 Sanjay Govind <sanjay.govind9@gmail.com>
> + *  Copyright (c) 2021 Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
>   */
>
>  /*
> @@ -62,6 +63,7 @@
>  #define SHANWAN_GAMEPAD           BIT(16)
>  #define GH_GUITAR_CONTROLLER      BIT(17)
>  #define GHL_GUITAR_PS3WIIU        BIT(18)
> +#define GHL_GUITAR_PS4            BIT(19)
>
>  #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
>  #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
> @@ -85,7 +87,10 @@
>  #define NSG_MRXU_MAX_X 1667
>  #define NSG_MRXU_MAX_Y 1868
>
> -#define GHL_GUITAR_POKE_INTERVAL 10 /* In seconds */
> +/* The PS3/Wii U dongles require a poke every 10 seconds, but the PS4
> + * requires one every 8 seconds. Using 8 seconds for all for simplicity.
> + */
> +#define GHL_GUITAR_POKE_INTERVAL 8 /* In seconds */
>  #define GUITAR_TILT_USAGE 44
>
>  /* Magic value and data taken from GHLtarUtility:
> @@ -97,6 +102,13 @@ static const char ghl_ps3wiiu_magic_data[] = {
>         0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
>  };
>
> +/* Magic data for the PS4 dongles sniffed with a USB protocol
> + * analyzer.
> + */
> +static const char ghl_ps4_magic_data[] = {
> +       0x30, 0x02, 0x08, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00
> +};
> +
>  /* PS/3 Motion controller */
>  static u8 motion_rdesc[] = {
>         0x05, 0x01,         /*  Usage Page (Desktop),               */
> @@ -642,7 +654,7 @@ static void ghl_magic_poke(struct timer_list *t)
>                 hid_err(sc->hdev, "usb_submit_urb failed: %d", ret);
>  }
>
> -static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
> +static int ghl_init_urb_ps3wiiu(struct sony_sc *sc, struct usb_device *usbdev)
>  {
>         struct usb_ctrlrequest *cr;
>         u16 poke_size;
> @@ -674,6 +686,47 @@ static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
>         return 0;
>  }
>
> +static int ghl_init_urb_ps4(struct sony_sc *sc, struct usb_device *usbdev)
> +{
> +       int i;
> +       struct usb_interface *intf;
> +       struct usb_endpoint_descriptor *ep;
> +       u16 poke_size;
> +       u8 *databuf;
> +       unsigned int pipe;
> +       struct usb_endpoint_descriptor *ep_irq_out = NULL;
> +
> +       intf = to_usb_interface(sc->hdev->dev.parent);
> +       if (intf->cur_altsetting->desc.bNumEndpoints != 2)
> +               return -ENODEV;
> +
> +       for (i = 0; i < intf->cur_altsetting->desc.bNumEndpoints; i++) {
> +               ep = &intf->cur_altsetting->endpoint[i].desc;
> +
> +               if (usb_endpoint_xfer_int(ep)) {
> +                       if (usb_endpoint_dir_out(ep))
> +                               ep_irq_out = ep;
> +               }
> +       }
> +
> +       if (!ep_irq_out)
> +               return -ENODEV;
> +
> +       poke_size = ARRAY_SIZE(ghl_ps4_magic_data);
> +       pipe = usb_sndintpipe(usbdev, ep_irq_out->bEndpointAddress);
> +
> +       databuf = devm_kzalloc(&sc->hdev->dev, poke_size, GFP_ATOMIC);
> +       if (databuf == NULL)
> +               return -ENOMEM;
> +
> +       memcpy(databuf, ghl_ps4_magic_data, poke_size);
> +       usb_fill_int_urb(
> +               sc->ghl_urb, usbdev, pipe,
> +               databuf, poke_size,
> +               ghl_magic_poke_cb, sc, ep_irq_out->bInterval);
> +       return 0;
> +}
> +
>  static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
>                           struct hid_field *field, struct hid_usage *usage,
>                           unsigned long **bit, int *max)
> @@ -3030,21 +3083,23 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
>                 return -ENODEV;
>         }
>
> -       if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> +       if (sc->quirks & (GHL_GUITAR_PS3WIIU | GHL_GUITAR_PS4)) {
>                 sc->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
>                 if (!sc->ghl_urb)
>                         return -ENOMEM;
> -               ret = ghl_init_urb(sc, usbdev);
> +
> +               if (sc->quirks & GHL_GUITAR_PS3WIIU)
> +                       ret = ghl_init_urb_ps3wiiu(sc, usbdev);
> +               else if (sc->quirks & GHL_GUITAR_PS4)
> +                       ret = ghl_init_urb_ps4(sc, usbdev);
>                 if (ret) {
>                         hid_err(hdev, "error preparing URB\n");
>                         return ret;
>                 }
> -
>                 timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
>                 mod_timer(&sc->ghl_poke_timer,
>                           jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
>         }
> -
>         return ret;
>  }
>
> @@ -3052,7 +3107,7 @@ static void sony_remove(struct hid_device *hdev)
>  {
>         struct sony_sc *sc = hid_get_drvdata(hdev);
>
> -       if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> +       if (sc->quirks & (GHL_GUITAR_PS3WIIU | GHL_GUITAR_PS4)) {
>                 del_timer_sync(&sc->ghl_poke_timer);
>                 usb_free_urb(sc->ghl_urb);
>         }
> @@ -3172,11 +3227,14 @@ static const struct hid_device_id sony_devices[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY_RHYTHM, USB_DEVICE_ID_SONY_PS3WIIU_GHLIVE_DONGLE),
>                 .driver_data = GHL_GUITAR_PS3WIIU | GH_GUITAR_CONTROLLER },
>         /* Guitar Hero PC Guitar Dongle */
> -       { HID_USB_DEVICE(USB_VENDOR_ID_ACTIVISION, USB_DEVICE_ID_ACTIVISION_GUITAR_DONGLE),
> +       { HID_USB_DEVICE(USB_VENDOR_ID_REDOCTANE, USB_DEVICE_ID_REDOCTANE_GUITAR_DONGLE),
>                 .driver_data = GH_GUITAR_CONTROLLER },
>         /* Guitar Hero PS3 World Tour Guitar Dongle */
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY_RHYTHM, USB_DEVICE_ID_SONY_PS3_GUITAR_DONGLE),
>                 .driver_data = GH_GUITAR_CONTROLLER },
> +       /* Guitar Hero Live PS4 guitar dongles */
> +       { HID_USB_DEVICE(USB_VENDOR_ID_REDOCTANE, USB_DEVICE_ID_REDOCTANE_PS4_GHLIVE_DONGLE),
> +               .driver_data = GHL_GUITAR_PS4 | GH_GUITAR_CONTROLLER },
>         { }
>  };
>  MODULE_DEVICE_TABLE(hid, sony_devices);
> --
> 2.25.1
>

