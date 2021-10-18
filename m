Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8D0432958
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 23:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhJRV5N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 17:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhJRV5M (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 17:57:12 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39352C06161C;
        Mon, 18 Oct 2021 14:55:01 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id k3so6046904ilo.7;
        Mon, 18 Oct 2021 14:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TalGu0MMIR7zMbpLgPht+0jBS5F9Emp81Ltjv+/4fb8=;
        b=S69I+UNQ/RgHeQFEiRRIFQFwyx3cWM9poZZvEFEDnP9ty1jwBNaS49S8qLPumV/hBP
         htDpg5do7M89TVbp0WIgDW2iDuSDzxtGoSV62tuyFmzgOOzCDoB6Z94xZ5leGbXdL3wl
         TUSADrKXkAmxwdLM2zs4ECAX8kikaz1nLv1HPo5unIs7NUqHxzsyCKT7toWqI0+sqQuD
         v1aWcjUNExN/yvRd3PsR5IkhhCm/HSN5gQGxbwLOHwjO7EHMH9NlCOyM2BVA/T4wM+hs
         EYGpASauTeX3n7kOMBTEFYr2CDfhK/Y5LEp3MOrWQUKgEsTe7/JyNejzOCrARlspBiRr
         Pm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TalGu0MMIR7zMbpLgPht+0jBS5F9Emp81Ltjv+/4fb8=;
        b=CFgCxzuEzG//Xsz/f7P6UYmMKzdg0SDK/KrAHC4uqWPM48142KOCVBmxB/tMi/ZPcW
         yVn1WiSzkvSdqxoxftmqV5wdV7XmyR8wuPKDafLq02w0CjAHS/KucO+6kNc0dZIUjkL6
         h8sLLcb2UP4XkYOz4TbMC83XwL1TDiI/IwInc8FQhmxWjsSfY4JCkdHQS6fJ2Umxfh5R
         DOTIurN8eGQgbdb8vJ82PPfNbpG3g25zdTLo6MgBDryd4XVMnCpqQVz8rcjZFVaWjOOj
         e4/AX/8Wx/yhyIw90UvW1DJCHJKtbVCYANho3E/MrB8nz+RPx9FyTXqAgTq2X7aZtFAv
         p8Jg==
X-Gm-Message-State: AOAM532yOLIqFN47UdZmBcbZS6mqBv8Hyu3+zxJtVm88HMSCczPixOeL
        EUNyo6xKW+UfIThZ4oIVpwUC+9Cd1/lqTrIlMnc=
X-Google-Smtp-Source: ABdhPJxuHmbxEEQGiMuJRqarx7V9JqvIEhCaD+/RfukuA+LHMVgcqbdX24133jaF6wE8QM/Srdjl6IFQL7gjwljPy4c=
X-Received: by 2002:a05:6e02:1885:: with SMTP id o5mr15797830ilu.221.1634594100573;
 Mon, 18 Oct 2021 14:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211009114313.17967-1-alistair@alistair23.me> <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
In-Reply-To: <CAF8JNh+OUzvAHA9tBrH2d_WxWPXRgiunhGO5KV4-fqVG+tUOyQ@mail.gmail.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Tue, 19 Oct 2021 07:54:34 +1000
Message-ID: <CAKmqyKM8S14zu7Ck_97tUqkZJLa7AufM-gDKOHgmjsSABNfObA@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] HID: wacom_sys: Add support for flipping the data values
To:     Ping Cheng <pinglinux@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 19, 2021 at 3:42 AM Ping Cheng <pinglinux@gmail.com> wrote:
>
> Hi Alistair,
>
> On Sat, Oct 9, 2021, 4:44 AM Alistair Francis <alistair@alistair23.me> wrote:
>>
>> Add support to the Wacom HID device for flipping the values based on
>> device tree settings. This allows us to support devices where the panel
>> is installed in a different orientation, such as the reMarkable2.
>
>
> This device was designed for hid-generic driver, if it's not driven by wacom_i2c.c or an out of tree driver.
>
> wacom.ko doesn't support vid 0x2d1f devices.
>
> Nacked-by: Ping Cheng <Ping.Cheng@wacom.com>

Any ideas how to support the hardware then?

I can't use the wacom_i2c driver as the panel supports I2C HID. But I
can't use the I2C HID driver as I need the values flipped to support
the installed orientation.

Alistair

>
> Sorry about that,
> Ping
>
>> Signed-off-by: Alistair Francis <alistair@alistair23.me>
>> ---
>>  .../bindings/input/hid-over-i2c.txt           | 20 ++++++
>>  drivers/hid/wacom_sys.c                       | 25 ++++++++
>>  drivers/hid/wacom_wac.c                       | 61 +++++++++++++++++++
>>  drivers/hid/wacom_wac.h                       | 13 ++++
>>  4 files changed, 119 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
>> index c76bafaf98d2..16ebd7c46049 100644
>> --- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
>> +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
>> @@ -33,6 +33,26 @@ device-specific compatible properties, which should be used in addition to the
>>  - post-power-on-delay-ms: time required by the device after enabling its regulators
>>    or powering it on, before it is ready for communication.
>>
>> +  flip-tilt-x:
>> +    type: boolean
>> +    description: Flip the tilt X values read from device
>> +
>> +  flip-tilt-y:
>> +    type: boolean
>> +    description: Flip the tilt Y values read from device
>> +
>> +  flip-pos-x:
>> +    type: boolean
>> +    description: Flip the X position values read from device
>> +
>> +  flip-pos-y:
>> +    type: boolean
>> +    description: Flip the Y position values read from device
>> +
>> +  flip-distance:
>> +    type: boolean
>> +    description: Flip the distance values read from device
>> +
>>  Example:
>>
>>         i2c-hid-dev@2c {
>> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
>> index 93f49b766376..47d9590b10bd 100644
>> --- a/drivers/hid/wacom_sys.c
>> +++ b/drivers/hid/wacom_sys.c
>> @@ -10,6 +10,7 @@
>>
>>  #include "wacom_wac.h"
>>  #include "wacom.h"
>> +#include <linux/of.h>
>>  #include <linux/input/mt.h>
>>
>>  #define WAC_MSG_RETRIES                5
>> @@ -2730,6 +2731,28 @@ static void wacom_mode_change_work(struct work_struct *work)
>>         return;
>>  }
>>
>> +static void wacom_of_read(struct hid_device *hdev, struct wacom_wac *wacom_wac)
>> +{
>> +       if (IS_ENABLED(CONFIG_OF)) {
>> +               wacom_wac->flip_tilt_x = of_property_read_bool(hdev->dev.parent->of_node,
>> +                                                       "flip-tilt-x");
>> +               wacom_wac->flip_tilt_y = of_property_read_bool(hdev->dev.parent->of_node,
>> +                                                       "flip-tilt-y");
>> +               wacom_wac->flip_pos_x = of_property_read_bool(hdev->dev.parent->of_node,
>> +                                                       "flip-pos-x");
>> +               wacom_wac->flip_pos_y = of_property_read_bool(hdev->dev.parent->of_node,
>> +                                                       "flip-pos-y");
>> +               wacom_wac->flip_distance = of_property_read_bool(hdev->dev.parent->of_node,
>> +                                                       "flip-distance");
>> +       } else {
>> +               wacom_wac->flip_tilt_x = false;
>> +               wacom_wac->flip_tilt_y = false;
>> +               wacom_wac->flip_pos_x = false;
>> +               wacom_wac->flip_pos_y = false;
>> +               wacom_wac->flip_distance = false;
>> +       }
>> +}
>> +
>>  static int wacom_probe(struct hid_device *hdev,
>>                 const struct hid_device_id *id)
>>  {
>> @@ -2797,6 +2820,8 @@ static int wacom_probe(struct hid_device *hdev,
>>                                  error);
>>         }
>>
>> +       wacom_of_read(hdev, wacom_wac);
>> +
>>         wacom_wac->probe_complete = true;
>>         return 0;
>>  }
>> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
>> index 33a6908995b1..c01f683e23fa 100644
>> --- a/drivers/hid/wacom_wac.c
>> +++ b/drivers/hid/wacom_wac.c
>> @@ -3261,6 +3261,63 @@ static int wacom_status_irq(struct wacom_wac *wacom_wac, size_t len)
>>         return 0;
>>  }
>>
>> +static int wacom_of_irq(struct wacom_wac *wacom_wac, size_t len)
>> +{
>> +       const struct wacom_features *features = &wacom_wac->features;
>> +       unsigned char *data = wacom_wac->data;
>> +       struct input_dev *input = wacom_wac->pen_input;
>> +       unsigned int x, y, pressure;
>> +       unsigned char tsw, f1, f2, ers;
>> +       short tilt_x, tilt_y, distance;
>> +
>> +       if (!IS_ENABLED(CONFIG_OF))
>> +               return 0;
>> +
>> +       tsw = data[1] & WACOM_TIP_SWITCH_bm;
>> +       ers = data[1] & WACOM_ERASER_bm;
>> +       f1 = data[1] & WACOM_BARREL_SWITCH_bm;
>> +       f2 = data[1] & WACOM_BARREL_SWITCH_2_bm;
>> +       x = le16_to_cpup((__le16 *)&data[2]);
>> +       y = le16_to_cpup((__le16 *)&data[4]);
>> +       pressure = le16_to_cpup((__le16 *)&data[6]);
>> +
>> +       /* Signed */
>> +       tilt_x = get_unaligned_le16(&data[9]);
>> +       tilt_y = get_unaligned_le16(&data[11]);
>> +
>> +       distance = get_unaligned_le16(&data[13]);
>> +
>> +       /* keep touch state for pen events */
>> +       if (!wacom_wac->shared->touch_down)
>> +               wacom_wac->tool[0] = (data[1] & 0x0c) ?
>> +                       BTN_TOOL_RUBBER : BTN_TOOL_PEN;
>> +
>> +       wacom_wac->shared->touch_down = data[1] & 0x20;
>> +
>> +       // Flip the values based on properties from the device tree
>> +
>> +       // Default to a negative value for distance as HID compliant Wacom
>> +       // devices generally specify the hovering distance as negative.
>> +       distance = wacom_wac->flip_distance ? distance : -distance;
>> +       x = wacom_wac->flip_pos_x ? (features->x_max - x) : x;
>> +       y = wacom_wac->flip_pos_y ? (features->y_max - y) : y;
>> +       tilt_x = wacom_wac->flip_tilt_x ? -tilt_x : tilt_x;
>> +       tilt_y = wacom_wac->flip_tilt_y ? -tilt_y : tilt_y;
>> +
>> +       input_report_key(input, BTN_TOUCH, tsw || ers);
>> +       input_report_key(input, wacom_wac->tool[0], wacom_wac->shared->touch_down);
>> +       input_report_key(input, BTN_STYLUS, f1);
>> +       input_report_key(input, BTN_STYLUS2, f2);
>> +       input_report_abs(input, ABS_X, x);
>> +       input_report_abs(input, ABS_Y, y);
>> +       input_report_abs(input, ABS_PRESSURE, pressure);
>> +       input_report_abs(input, ABS_DISTANCE, distance);
>> +       input_report_abs(input, ABS_TILT_X, tilt_x);
>> +       input_report_abs(input, ABS_TILT_Y, tilt_y);
>> +
>> +       return 1;
>> +}
>> +
>>  void wacom_wac_irq(struct wacom_wac *wacom_wac, size_t len)
>>  {
>>         bool sync;
>> @@ -3379,6 +3436,10 @@ void wacom_wac_irq(struct wacom_wac *wacom_wac, size_t len)
>>                         sync = wacom_remote_irq(wacom_wac, len);
>>                 break;
>>
>> +       case HID_GENERIC:
>> +               sync = wacom_of_irq(wacom_wac, len);
>> +               break;
>> +
>>         default:
>>                 sync = false;
>>                 break;
>> diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
>> index 8b2d4e5b2303..4dd5a56bf347 100644
>> --- a/drivers/hid/wacom_wac.h
>> +++ b/drivers/hid/wacom_wac.h
>> @@ -157,6 +157,14 @@
>>  #define WACOM_HID_WT_Y                  (WACOM_HID_UP_WACOMTOUCH | 0x131)
>>  #define WACOM_HID_WT_REPORT_VALID       (WACOM_HID_UP_WACOMTOUCH | 0x1d0)
>>
>> +// Bitmasks (for data[3])
>> +#define WACOM_TIP_SWITCH_bm         (1 << 0)
>> +#define WACOM_BARREL_SWITCH_bm      (1 << 1)
>> +#define WACOM_ERASER_bm             (1 << 2)
>> +#define WACOM_INVERT_bm             (1 << 3)
>> +#define WACOM_BARREL_SWITCH_2_bm    (1 << 4)
>> +#define WACOM_IN_RANGE_bm           (1 << 5)
>> +
>>  #define WACOM_BATTERY_USAGE(f) (((f)->hid == HID_DG_BATTERYSTRENGTH) || \
>>                                  ((f)->hid == WACOM_HID_WD_BATTERY_CHARGING) || \
>>                                  ((f)->hid == WACOM_HID_WD_BATTERY_LEVEL))
>> @@ -357,6 +365,11 @@ struct wacom_wac {
>>         bool has_mode_change;
>>         bool is_direct_mode;
>>         bool is_invalid_bt_frame;
>> +       bool flip_tilt_x;
>> +       bool flip_tilt_y;
>> +       bool flip_pos_x;
>> +       bool flip_pos_y;
>> +       bool flip_distance;
>>  };
>>
>>  #endif
>> --
>> 2.31.1
>>
