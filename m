Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4723C41C023
	for <lists+linux-input@lfdr.de>; Wed, 29 Sep 2021 09:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244705AbhI2Hwj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Sep 2021 03:52:39 -0400
Received: from devoid-pointer.net ([31.31.77.140]:34992 "EHLO
        broken.devoid-pointer.net" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S244241AbhI2Hwj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Sep 2021 03:52:39 -0400
X-Greylist: delayed 383 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 Sep 2021 03:52:37 EDT
Received: from [10.11.25.82] (unknown [147.231.236.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by broken.devoid-pointer.net (Postfix) with ESMTPSA id 3D0F42341C;
        Wed, 29 Sep 2021 09:43:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devoid-pointer.net;
        s=devptr_dkim; t=1632901436;
        bh=vDTyFOZc6lT3nYsLcegPAjLJGb29cO2saqfonnlRRRo=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=MnLlZdcHD043CNjkYG+WTLWYjN+qJmr/RFQOiODUtL84zTRIagJ/YDqcHPUaVTCFG
         2D23f8wrfL2evNMVPaUBin7j3avKr3d1ba4FTBkrHGyeiIEURYXo9TNRdLNsadepDN
         ywQUpqKciswA6DztwK8HNWLKDfu1YIosNM1QW5fk=
Message-ID: <5a90b82581ded600971076c3d4d28caa5fc24c33.camel@devoid-pointer.net>
Subject: Re: [PATCH 2/2] HID: lg4ff: do not return a value for deinit
From:   Michal =?ISO-8859-1?Q?Mal=FD?= <madcatxster@devoid-pointer.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 29 Sep 2021 09:43:56 +0200
In-Reply-To: <20210928083906.43983-3-benjamin.tissoires@redhat.com>
References: <20210928083906.43983-1-benjamin.tissoires@redhat.com>
         <20210928083906.43983-3-benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2021-09-28 at 10:39 +0200, Benjamin Tissoires wrote:
> When removing a device, we can not do much if there is an error while
> removing it. Use the common pattern of returning void there so we are
> not tempted to check on the return value.
> And honestly, we were not looking at it, so why bother?
> 
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> ---
>  drivers/hid/hid-lg4ff.c | 5 ++---
>  drivers/hid/hid-lg4ff.h | 4 ++--
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
> index 5e6a0cef2a06..ad75c86e0bf5 100644
> --- a/drivers/hid/hid-lg4ff.c
> +++ b/drivers/hid/hid-lg4ff.c
> @@ -1445,7 +1445,7 @@ int lg4ff_init(struct hid_device *hid)
>         return error;
>  }
>  
> -int lg4ff_deinit(struct hid_device *hid)
> +void lg4ff_deinit(struct hid_device *hid)
>  {
>         struct lg4ff_device_entry *entry;
>         struct lg_drv_data *drv_data;
> @@ -1453,7 +1453,7 @@ int lg4ff_deinit(struct hid_device *hid)
>         drv_data = hid_get_drvdata(hid);
>         if (!drv_data) {
>                 hid_err(hid, "Error while deinitializing device, no
> private driver data.\n");
> -               return -1;
> +               return;
>         }
>         entry = drv_data->device_props;
>         if (!entry)
> @@ -1489,5 +1489,4 @@ int lg4ff_deinit(struct hid_device *hid)
>         kfree(entry);
>  out:
>         dbg_hid("Device successfully unregistered\n");
> -       return 0;
>  }
> diff --git a/drivers/hid/hid-lg4ff.h b/drivers/hid/hid-lg4ff.h
> index 25bc88cd877e..4440e4ea2267 100644
> --- a/drivers/hid/hid-lg4ff.h
> +++ b/drivers/hid/hid-lg4ff.h
> @@ -10,14 +10,14 @@ int lg4ff_adjust_input_event(struct hid_device
> *hid, struct hid_field *field,
>  int lg4ff_raw_event(struct hid_device *hdev, struct hid_report
> *report,
>                 u8 *rd, int size, struct lg_drv_data *drv_data);
>  int lg4ff_init(struct hid_device *hdev);
> -int lg4ff_deinit(struct hid_device *hdev);
> +void lg4ff_deinit(struct hid_device *hdev);
>  #else
>  static inline int lg4ff_adjust_input_event(struct hid_device *hid,
> struct hid_field *field,
>                                            struct hid_usage *usage, s32
> value, struct lg_drv_data *drv_data) { return 0; }
>  static inline int lg4ff_raw_event(struct hid_device *hdev, struct
> hid_report *report,
>                 u8 *rd, int size, struct lg_drv_data *drv_data) {
> return 0; }
>  static inline int lg4ff_init(struct hid_device *hdev) { return 0; }
> -static inline int lg4ff_deinit(struct hid_device *hdev) { return 0; }
> +static inline void lg4ff_deinit(struct hid_device *hdev) { return; }
>  #endif
>  
>  #endif

I'll try to dig up some lg4ff hardware to make sure but AFAICT skipping
the init routines will make all of the devices look like standard HID
stuff. Mind that disabling lg4ff disables more than just FF for the
affected Logitech wheels but that probably doesn't matter.

Perhaps a bit better approach would be to remove the special handling
of these devices from the hid-lg driver altogether when the respective
submodules are switched off. That way the devices should be handled
just by the generic HID code and we won't need the dud functions at
all.

I only checked that this compiles. I can test this with real HW if you
find this acceptable.

MM

---

diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
index d40af911df63..f698c2f6e810 100644
--- a/drivers/hid/hid-lg.c
+++ b/drivers/hid/hid-lg.c
@@ -49,6 +49,19 @@
 #define FFG_RDESC_ORIG_SIZE	85
 #define FG_RDESC_ORIG_SIZE	82
 
+#ifndef CONFIG_LOGITECH_FF
+static int lgff_init(struct hid_device *hid) { return 0; }
+#endif
+#ifndef CONFIG_LOGIRUMBLEPAD2_FF
+static int lg2ff_init(struct hid_device *hid) { return 0; }
+#endif
+#ifndef CONFIG_LOGIG940_FF
+static int lg3ff_init(struct hid_device *hid) { return 0; }
+#endif
+#ifndef CONFIG_LOGIWHEELS_FF
+static int lg4ff_init(struct hid_device *hid) { return 0; }
+#endif
+
 /* Fixed report descriptors for Logitech Driving Force (and Pro)
  * wheel controllers
  *
@@ -729,9 +742,11 @@ static int lg_event(struct hid_device *hdev, struct hid_field *field,
 				-value);
 		return 1;
 	}
+#ifdef CONFIG_LOGIWHEELS_FF
 	if (drv_data->quirks & LG_FF4) {
 		return lg4ff_adjust_input_event(hdev, field, usage, value, drv_data);
 	}
+#endif
 
 	return 0;
 }
@@ -741,8 +756,10 @@ static int lg_raw_event(struct hid_device *hdev, struct hid_report *report,
 {
 	struct lg_drv_data *drv_data = hid_get_drvdata(hdev);
 
+#ifdef CONFIG_LOGIWHEELS_FF
 	if (drv_data->quirks & LG_FF4)
 		return lg4ff_raw_event(hdev, report, rd, size, drv_data);
+#endif
 
 	return 0;
 }
@@ -844,8 +861,10 @@ static int lg_probe(struct hid_device *hdev, const struct hid_device_id *id)
 static void lg_remove(struct hid_device *hdev)
 {
 	struct lg_drv_data *drv_data = hid_get_drvdata(hdev);
+#ifdef CONFIG_LOGIWHEELS_FF
 	if (drv_data->quirks & LG_FF4)
 		lg4ff_deinit(hdev);
+#endif
 	hid_hw_stop(hdev);
 	kfree(drv_data);
 }
@@ -869,45 +888,54 @@ static const struct hid_device_id lg_devices[] = {
 		.driver_data = LG_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_DUAL_ACTION),
 		.driver_data = LG_NOGET },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_WHEEL),
-		.driver_data = LG_NOGET | LG_FF4 },
-
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_RUMBLEPAD_CORD),
-		.driver_data = LG_FF2 },
+#ifdef CONFIG_LOGITECH_FF
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_RUMBLEPAD),
 		.driver_data = LG_FF },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_RUMBLEPAD2_2),
 		.driver_data = LG_FF },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G29_WHEEL),
-		.driver_data = LG_FF4 },
+
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_WINGMAN_F3D),
 		.driver_data = LG_FF },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_FORCE3D_PRO),
 		.driver_data = LG_FF },
+#endif
+#ifdef CONFIG_LOGIRUMBLEPAD2_FF
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_RUMBLEPAD_CORD),
+		.driver_data = LG_FF2 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_VIBRATION_WHEEL),
+		.driver_data = LG_FF2 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_RUMBLEPAD2),
+		.driver_data = LG_NOGET | LG_FF2 },
+#endif
+#ifdef CONFIG_LOGIG940_FF
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_FLIGHT_SYSTEM_G940),
+		.driver_data = LG_FF3 },
+#endif
+#ifdef CONFIG_LOGIWHEELS_FF
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_MOMO_WHEEL),
 		.driver_data = LG_NOGET | LG_FF4 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_MOMO_WHEEL2),
 		.driver_data = LG_FF4 },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_VIBRATION_WHEEL),
-		.driver_data = LG_FF2 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_WHEEL),
+		.driver_data = LG_NOGET | LG_FF4 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_DFP_WHEEL),
+		.driver_data = LG_NOGET | LG_FF4 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G27_WHEEL),
+		.driver_data = LG_FF4 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G25_WHEEL),
 		.driver_data = LG_FF4 },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_DFGT_WHEEL),
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G29_WHEEL),
 		.driver_data = LG_FF4 },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G27_WHEEL),
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_DFGT_WHEEL),
 		.driver_data = LG_FF4 },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_DFP_WHEEL),
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_WINGMAN_FFG),
 		.driver_data = LG_NOGET | LG_FF4 },
+#else  /* Wii wheel still needs a bit of special handling */
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_WII_WHEEL),
-		.driver_data = LG_FF4 },
+		.driver_data = 0 },
+#endif
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_WINGMAN_FG),
 		.driver_data = LG_NOGET },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_WINGMAN_FFG),
-		.driver_data = LG_NOGET | LG_FF4 },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_RUMBLEPAD2),
-		.driver_data = LG_NOGET | LG_FF2 },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_FLIGHT_SYSTEM_G940),
-		.driver_data = LG_FF3 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_SPACENAVIGATOR),
 		.driver_data = LG_RDESC_REL_ABS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_SPACETRAVELLER),
diff --git a/drivers/hid/hid-lg.h b/drivers/hid/hid-lg.h
index 3d8902ba1c6c..5bcb918f4741 100644
--- a/drivers/hid/hid-lg.h
+++ b/drivers/hid/hid-lg.h
@@ -9,20 +9,14 @@ struct lg_drv_data {
 
 #ifdef CONFIG_LOGITECH_FF
 int lgff_init(struct hid_device *hdev);
-#else
-static inline int lgff_init(struct hid_device *hdev) { return -1; }
 #endif
 
 #ifdef CONFIG_LOGIRUMBLEPAD2_FF
 int lg2ff_init(struct hid_device *hdev);
-#else
-static inline int lg2ff_init(struct hid_device *hdev) { return -1; }
 #endif
 
 #ifdef CONFIG_LOGIG940_FF
 int lg3ff_init(struct hid_device *hdev);
-#else
-static inline int lg3ff_init(struct hid_device *hdev) { return -1; }
 #endif
 
 #endif
diff --git a/drivers/hid/hid-lg4ff.h b/drivers/hid/hid-lg4ff.h
index e5c55d515ac2..c529135bba96 100644
--- a/drivers/hid/hid-lg4ff.h
+++ b/drivers/hid/hid-lg4ff.h
@@ -11,13 +11,6 @@ int lg4ff_raw_event(struct hid_device *hdev, struct hid_report *report,
 		u8 *rd, int size, struct lg_drv_data *drv_data);
 int lg4ff_init(struct hid_device *hdev);
 int lg4ff_deinit(struct hid_device *hdev);
-#else
-static inline int lg4ff_adjust_input_event(struct hid_device *hid, struct hid_field *field,
-					   struct hid_usage *usage, s32 value, struct lg_drv_data *drv_data) { return 0; }
-static inline int lg4ff_raw_event(struct hid_device *hdev, struct hid_report *report,
-		u8 *rd, int size, struct lg_drv_data *drv_data) { return 0; }
-static inline int lg4ff_init(struct hid_device *hdev) { return -1; }
-static inline int lg4ff_deinit(struct hid_device *hdev) { return -1; }
 #endif
 
 #endif


