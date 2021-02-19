Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B8131FEDF
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 19:40:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhBSSjj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Feb 2021 13:39:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhBSSji (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Feb 2021 13:39:38 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BE4C061574;
        Fri, 19 Feb 2021 10:38:57 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id o38so5271767pgm.9;
        Fri, 19 Feb 2021 10:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FTUgtYc7VIUobepJZIEoX1e6J1q5pO7hKw9teVZYk/Q=;
        b=gLeEKFOt7btkQZYxRTycOuWRGNxehR0yTQxKLypQD54LFl02xz4B/E+Zw8vf8SoQwx
         vepJDpbB4K+MJgqAl6Ud7MDklOdmBjEI1X4QlT9I9Shd7QVr43LH3wfd7J5nv4xD4VhR
         FQ4aUx7zDBWjaqhcAmdF5ge1WjZYmIC/AbqpuDASktjLEi27QjFKXFcjAqA/e7sGZyu1
         bt2pVVq6MoxlOSbtvbPToZyqnsljMtB9Sevv35hB1k55x775UjDBX+GtxE2WWbfN0kL8
         G/EB3r7dSnrhsAByjm3jc7mKpTv9DnaetJgObP+rHQ7+0IrENVFzXO2M5Owuk6Z9/sgO
         3hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FTUgtYc7VIUobepJZIEoX1e6J1q5pO7hKw9teVZYk/Q=;
        b=K6V40Y6XB4p6B4W14OqnZA2W8IkWexSbJcgpJJLzMoQegl+JnKfrPWboW30bF+5s3v
         AX+WUBRRc/8kykPh27+BJViLl88t81nLcaZkbN7h5RWgRa49J8TkvT+kCi73JBgWI1Tn
         S4x6Bn0CbhvJ8DB9gzdw/ehj9GMM/ZbYrXxA3AL7aBSJnJ4TZJqZMr7lXMVtPzdcwU7m
         0UznFtjunP0TANaruIgSXmfyYEpYesrX5aJLSM94LtFoqg1BZWswVFo02uzbRDeUST/y
         XWYszG9LLBqgY/AxjpKe0j2yd5ak7v9HjypP/EHi6NCLMkwxYhPEUhd7ggF2oaXuA1z5
         RC8w==
X-Gm-Message-State: AOAM532YrhLU/xpgiXhX938ZeXm+o7B9A0WqY1Wbz5hmPj1z8HY5eQW6
        85VphnS/oioLgGJTPyBYAH8daO6qJxRQ4K+8lUV7FNyAGxo=
X-Google-Smtp-Source: ABdhPJwHxKjtHuyKYRX07DRT0KUQs/q9ul9k8Tczr19IH9XzTtsYSG/9S9pfiuztDcHhkek0ixPbH0kVEMdPIpKPj+4=
X-Received: by 2002:a63:f44:: with SMTP id 4mr9546016pgp.178.1613759937075;
 Fri, 19 Feb 2021 10:38:57 -0800 (PST)
MIME-Version: 1.0
From:   Mister Fix-IT <mrfixit2001@gmail.com>
Date:   Fri, 19 Feb 2021 13:38:45 -0500
Message-ID: <CAHa7zJO6Fd7F3EVLXTM4uQNY+Ur00sQXY+9JtnbMeX7dBE5sNw@mail.gmail.com>
Subject: [PATCH] HID: sony: Fix rumble over bluetooth on shanwan sixaxis and
 add gasia support
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Adam Smith <mrfixit2001@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The bluez sixaxis driver has a new patch submitted that allows for the
proper passing of the device name through to the kernel when connected
over bluetooth.
https://patches.linaro.org/patch/384498/

Prior to the referenced bluez patch, applicable sixaxis devices were
all being named "Sony PLAYSTATION(R)3 Controller", a static value from
a struct. Moving forward, the device name will be pulled from the udev
HID_NAME property and we can now properly identify Shanwan and Gasia
sixaxis devices in the hid driver.

Some sixaxis shanwan controllers have an issue with rumble over
bluetooth - every rumble event continues for 10 seconds and then all
rumble events do not work for the following 10 seconds after that.

I was able to identify that sending a soft-reset to the gamepad will
stop the 10 second rumble, which led me to discovering that these
delays are due to a timeout waiting for HIDP_WAITING_FOR_SEND_ACK in
hidp_set_raw_report.

So I've added a report-timeout member to the hid device struct and set
it's default to the 10 seconds that was previously hard coded. I then
change this value to zero in the sony hid driver probe for shanwan
bluetooth devices to make rumble work properly.

There is already a quirk for shanwan devices, but the existing quirk
should only be applied on the USB bus, so I have changed this quirk to
be named appropriately, added that check when applied, and added a new
quirk for shanwan bluetooth devices.

I have also changed the way the shanwan quirks are detected - instead
of searching for a single specific device name, it will now apply when
the device name includes "shanwan" in it at all. An example why this
is important would be that I have a shanwan device that is identified
as "Shanwan     PLAYSTATION(R)3 Controller" - yes there are 5 spaces
after Shanwan. I then use the same method to detect gasia devices,
which share a similar code path as shanwan usb devices.

Lastly, the report struct had members for rumble duration that were
not being populated or passed to the report that's sent to the
gamepad. This may be because ff memless tries to control this, but the
default values in the sixaxis report were previously hard-set in the
data. I have added these so that the report data being sent to the
gamepad has the proper duration included.

Signed-off-by: Adam Smith <mrfixit2001@gmail.com>
---
 drivers/hid/hid-sony.c    | 71 ++++++++++++++++++++++++++++++++++++-----------
 include/linux/hid.h       |  1 +
 net/bluetooth/hidp/core.c |  4 ++-
 3 files changed, 59 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index e3a557d..ff49296 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -58,8 +58,10 @@
 #define FUTUREMAX_DANCE_MAT       BIT(13)
 #define NSG_MR5U_REMOTE_BT        BIT(14)
 #define NSG_MR7U_REMOTE_BT        BIT(15)
-#define SHANWAN_GAMEPAD           BIT(16)
-#define GHL_GUITAR_PS3WIIU        BIT(17)
+#define SHANWAN_GAMEPAD_USB       BIT(16)
+#define SHANWAN_GAMEPAD_BT        BIT(17)
+#define GHL_GUITAR_PS3WIIU        BIT(18)
+#define GASIA_GAMEPAD             BIT(19)

 #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
 #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
@@ -573,6 +575,7 @@ struct sony_sc {
 #ifdef CONFIG_SONY_FF
  u8 left;
  u8 right;
+ u8 length;
 #endif

  u8 mac_address[6];
@@ -1664,7 +1667,7 @@ static int sixaxis_set_operational_usb(struct
hid_device *hdev)
  * But the USB interrupt would cause SHANWAN controllers to
  * start rumbling non-stop, so skip step 3 for these controllers.
  */
- if (sc->quirks & SHANWAN_GAMEPAD)
+ if (sc->quirks & SHANWAN_GAMEPAD_USB)
  goto out;

  ret = hid_hw_output_report(hdev, buf, 1);
@@ -2217,7 +2220,7 @@ static void sixaxis_send_output_report(struct sony_sc *sc)
  static const union sixaxis_output_report_01 default_report = {
  .buf = {
  0x01,
- 0x01, 0xff, 0x00, 0xff, 0x00,
+ 0x01, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00,
  0xff, 0x27, 0x10, 0x00, 0x32,
  0xff, 0x27, 0x10, 0x00, 0x32,
@@ -2229,6 +2232,7 @@ static void sixaxis_send_output_report(struct sony_sc *sc)
  struct sixaxis_output_report *report =
  (struct sixaxis_output_report *)sc->output_report_dmabuf;
  int n;
+ u8 duration;

  /* Initialize the report with default values */
  memcpy(report, &default_report, sizeof(struct sixaxis_output_report));
@@ -2236,6 +2240,13 @@ static void sixaxis_send_output_report(struct
sony_sc *sc)
 #ifdef CONFIG_SONY_FF
  report->rumble.right_motor_on = sc->right ? 1 : 0;
  report->rumble.left_motor_force = sc->left;
+
+ duration = sc->length;
+ if (duration > 0xff || duration == 0) duration = 0xff;
+ else if (duration < 4) duration = 4;
+
+ report->rumble.left_duration = duration;
+ report->rumble.right_duration = duration;
 #endif

  report->leds_bitmap |= sc->led_state[0] << 1;
@@ -2263,14 +2274,18 @@ static void sixaxis_send_output_report(struct
sony_sc *sc)
  }
  }

- /* SHANWAN controllers require output reports via intr channel */
- if (sc->quirks & SHANWAN_GAMEPAD)
- hid_hw_output_report(sc->hdev, (u8 *)report,
- sizeof(struct sixaxis_output_report));
- else
- hid_hw_raw_request(sc->hdev, report->report_id, (u8 *)report,
- sizeof(struct sixaxis_output_report),
- HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
+ /*
+ * Some Shanwan and Gasia controllers require output reports via intr channel
+ * So try hid_hw_output_report first and if it fails then use
hid_hw_raw_request
+ */
+ if (sc->quirks & (SHANWAN_GAMEPAD_USB | GASIA_GAMEPAD))
+ if(hid_hw_output_report(sc->hdev, (u8 *)report,
+ sizeof(struct sixaxis_output_report)) >= 0)
+ return;
+
+ hid_hw_raw_request(sc->hdev, report->report_id, (u8 *)report,
+ sizeof(struct sixaxis_output_report),
+ HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
 }

 static void dualshock4_send_output_report(struct sony_sc *sc)
@@ -2409,6 +2424,7 @@ static int sony_play_effect(struct input_dev
*dev, void *data,

  sc->left = effect->u.rumble.strong_magnitude / 256;
  sc->right = effect->u.rumble.weak_magnitude / 256;
+ sc->length = effect->replay.length / 256;

  sony_schedule_work(sc, SONY_WORKER_STATE);
  return 0;
@@ -2976,17 +2992,31 @@ static int sony_input_configured(struct
hid_device *hdev,

 static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
- int ret;
+ int ret, i;
  unsigned long quirks = id->driver_data;
  struct sony_sc *sc;
  unsigned int connect_mask = HID_CONNECT_DEFAULT;
+ char name[128];
+
+ // Get the device name in all uppercase
+ strncpy(name, hdev->name, 128);
+ for (i = 0; name[i] != '\0'; i++)
+ if(name[i] >= 'a' && name[i] <= 'z')
+ name[i] = name[i] -32;
+
+ if (strstr(name, "SHANWAN")) {
+ if(quirks & SIXAXIS_CONTROLLER_BT)
+ quirks |= SHANWAN_GAMEPAD_BT;
+ else if(quirks & SIXAXIS_CONTROLLER_USB)
+ quirks |= SHANWAN_GAMEPAD_USB;
+ }
+
+ if (strstr(name, "GASIA")) && (quirks & SIXAXIS_CONTROLLER))
+ quirks |= GASIA_GAMEPAD;

  if (!strcmp(hdev->name, "FutureMax Dance Mat"))
  quirks |= FUTUREMAX_DANCE_MAT;

- if (!strcmp(hdev->name, "SHANWAN PS3 GamePad"))
- quirks |= SHANWAN_GAMEPAD;
-
  sc = devm_kzalloc(&hdev->dev, sizeof(*sc), GFP_KERNEL);
  if (sc == NULL) {
  hid_err(hdev, "can't alloc sony descriptor\n");
@@ -3039,6 +3069,15 @@ static int sony_probe(struct hid_device *hdev,
const struct hid_device_id *id)
  return -ENODEV;
  }

+#ifdef CONFIG_SONY_FF
+ /* Rumble on some shanwan sixaxis bluetooth gamepads will get "stuck" waiting
+ * on HIDP_WAITING_FOR_SEND_ACK, so don't wait for the response at all.
+ * This must be set AFTER the HID has been started and claimed.
+ */
+ if (sc->quirks & SHANWAN_GAMEPAD_BT)
+ hdev->report_timeout = 0;
+#endif
+
  if (sc->quirks & GHL_GUITAR_PS3WIIU) {
  timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
  mod_timer(&sc->ghl_poke_timer,
diff --git a/include/linux/hid.h b/include/linux/hid.h
index c39d71e..b4a4f54 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -562,6 +562,7 @@ struct hid_device { /* device report descriptor */
  unsigned country; /* HID country */
  struct hid_report_enum report_enum[HID_REPORT_TYPES];
  struct work_struct led_work; /* delayed LED worker */
+ int report_timeout; /* seconds to wait for HIDP_WAITING_FOR_SEND_ACK */

  struct semaphore driver_input_lock; /* protects the current driver */
  struct device dev; /* device */
diff --git a/net/bluetooth/hidp/core.c b/net/bluetooth/hidp/core.c
index 0db48c8..b44aef0 100644
--- a/net/bluetooth/hidp/core.c
+++ b/net/bluetooth/hidp/core.c
@@ -354,7 +354,7 @@ static int hidp_set_raw_report(struct hid_device
*hid, unsigned char reportnum,
  res = wait_event_interruptible_timeout(session->report_queue,
  !test_bit(HIDP_WAITING_FOR_SEND_ACK, &session->flags)
  || atomic_read(&session->terminate),
- 10*HZ);
+ hid->report_timeout*HZ);
  if (res == 0) {
  /* timeout */
  ret = -EIO;
@@ -780,6 +780,8 @@ static int hidp_setup_hid(struct hidp_session *session,
  hid->version = req->version;
  hid->country = req->country;

+ hid->report_timeout = 10;
+
  strscpy(hid->name, req->name, sizeof(hid->name));

  snprintf(hid->phys, sizeof(hid->phys), "%pMR",
