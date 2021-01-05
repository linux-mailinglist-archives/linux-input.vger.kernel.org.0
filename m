Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D88CD2EA683
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 09:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbhAEIV6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Jan 2021 03:21:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33371 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726097AbhAEIV6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 5 Jan 2021 03:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609834829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Yo8vj28rroGHjX5G/06Yuy0ggyf0UCBpjXyA/So7xZk=;
        b=UatUADdIM7Z5XTmy9On/anf+uEifuVZiJgqYRZJq70H1YqdLOA8Bzi8/tZC0JInTEUalPq
        c+HkL+VqtCWoC53a1yBYcmNwUZL/SbgVusq3yP7uhGPRDnSaKT8KDOblNbwo10IlTgBaxu
        zpCDFN62/PQpjsmjYWtZmOKnu2Bvzv4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-pTmVNzSfPiiM3hlgerpDIw-1; Tue, 05 Jan 2021 03:20:28 -0500
X-MC-Unique: pTmVNzSfPiiM3hlgerpDIw-1
Received: by mail-pg1-f200.google.com with SMTP id t17so17341784pgu.1
        for <linux-input@vger.kernel.org>; Tue, 05 Jan 2021 00:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yo8vj28rroGHjX5G/06Yuy0ggyf0UCBpjXyA/So7xZk=;
        b=jKQjDRKOA5L/j1FWekTjYHo+KWCegdVGh9X3Nn//9eX5sKKs7zXZi77YBd63R/mJE1
         8FhJGaSu1JP7nepxA+ao5DMNVe5XgMjn81E9M8oJjBZ521E1C/6m5VMnhgtVnmm6D9pD
         I+NeGWFXcZRjHx5OXIpDJ6lWK9owy06aXz+v1W1X7l77m2bMXiMshLAf5owP5E5y8B70
         FH0Vm5bwZJhm7JqTimIrB4Rrx+yl6umz/GnB4eDNBqL112pW0hU15JuxIHCPG40NnYfK
         sBshMB4CnpbGXq/dlTH6VpeXnFX4P8N8HF+hrVxHuUyn9wpeX2JI1Od2f1l2dxbfwXK/
         15Hw==
X-Gm-Message-State: AOAM533caBW90TOAEs9gwLNpdEbMjYU91rCYKQUZub86gWh861x+/IIM
        IKDCu6gH9dOP7064rH3AAS4T3WA9QGUVr41PRgZHHxkgJQNzjLDLlFUYA+PdU/yrhefrAsnEJff
        aFMgrWjwMQ3sdq8L+lCChPzFzL7zm9GGGGvJO4DI=
X-Received: by 2002:a17:90a:12c4:: with SMTP id b4mr2999200pjg.234.1609834827145;
        Tue, 05 Jan 2021 00:20:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0PXc3kzWxxtIgbzjdKwnQakQSUqT4ERAp35jy7MLbIRFETuxn299bNyKfxkOas7Cos1+vMzIf3wgXRUyiGAc=
X-Received: by 2002:a17:90a:12c4:: with SMTP id b4mr2999175pjg.234.1609834826807;
 Tue, 05 Jan 2021 00:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-2-roderick@gaikai.com>
In-Reply-To: <20210102223109.996781-2-roderick@gaikai.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 5 Jan 2021 09:20:15 +0100
Message-ID: <CAO-hwJL9Dj9t1xyp+Hx95dZ7JqxQ4sexwfP8sxVKmsud_40+ZA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] HID: playstation: initial DualSense USB support.
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Roderick,

Thanks for the v2. I'll also let the reviewers of v1 do a second pass
on this version, but I have one comment here:

On Sat, Jan 2, 2021 at 11:31 PM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> Implement support for PlayStation DualSense gamepad in USB mode.
> Support features include buttons and sticks, which adhere to the
> Linux gamepad spec.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> ---
>  MAINTAINERS                   |   6 +
>  drivers/hid/Kconfig           |   9 +
>  drivers/hid/Makefile          |   1 +
>  drivers/hid/hid-ids.h         |   1 +
>  drivers/hid/hid-playstation.c | 321 ++++++++++++++++++++++++++++++++++
>  drivers/hid/hid-quirks.c      |   3 +
>  6 files changed, 341 insertions(+)
>  create mode 100644 drivers/hid/hid-playstation.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f81d598a8556..0ecae30af074 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7918,6 +7918,12 @@ F:       drivers/hid/
>  F:     include/linux/hid*
>  F:     include/uapi/linux/hid*
>
> +HID PLAYSTATION DRIVER
> +M:     Roderick Colenbrander <roderick.colenbrander@sony.com>
> +L:     linux-input@vger.kernel.org
> +S:     Supported
> +F:     drivers/hid/hid-playstation.c
> +
>  HID SENSOR HUB DRIVERS
>  M:     Jiri Kosina <jikos@kernel.org>
>  M:     Jonathan Cameron <jic23@kernel.org>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 7bdda1b5b221..d3258e806998 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -853,6 +853,15 @@ config HID_PLANTRONICS
>
>           Say M here if you may ever plug in a Plantronics USB audio device.
>
> +config HID_PLAYSTATION
> +       tristate "PlayStation HID Driver"
> +       default !EXPERT
> +       depends on HID
> +       help
> +         Provides support for Sony PS5 controllers including support for
> +         its special functionalities e.g. touchpad, lights and motion
> +         sensors.
> +
>  config HID_PRIMAX
>         tristate "Primax non-fully HID-compliant devices"
>         depends on HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 014d21fe7dac..3cdbfb60ca57 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -94,6 +94,7 @@ hid-picolcd-$(CONFIG_HID_PICOLCD_CIR) += hid-picolcd_cir.o
>  hid-picolcd-$(CONFIG_DEBUG_FS)         += hid-picolcd_debugfs.o
>
>  obj-$(CONFIG_HID_PLANTRONICS)  += hid-plantronics.o
> +obj-$(CONFIG_HID_PLAYSTATION)  += hid-playstation.o
>  obj-$(CONFIG_HID_PRIMAX)       += hid-primax.o
>  obj-$(CONFIG_HID_REDRAGON)     += hid-redragon.o
>  obj-$(CONFIG_HID_RETRODE)      += hid-retrode.o
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 4c5f23640f9c..70c51ec6395c 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1072,6 +1072,7 @@
>  #define USB_DEVICE_ID_SONY_PS4_CONTROLLER      0x05c4
>  #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_2    0x09cc
>  #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE       0x0ba0
> +#define USB_DEVICE_ID_SONY_PS5_CONTROLLER      0x0ce6
>  #define USB_DEVICE_ID_SONY_MOTION_CONTROLLER   0x03d5
>  #define USB_DEVICE_ID_SONY_NAVIGATION_CONTROLLER       0x042f
>  #define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER             0x0002
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> new file mode 100644
> index 000000000000..3d5fe9069c26
> --- /dev/null
> +++ b/drivers/hid/hid-playstation.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  HID driver for Sony DualSense(TM) controller.
> + *
> + *  Copyright (c) 2020 Sony Interactive Entertainment
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/crc32.h>
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/input/mt.h>
> +#include <linux/module.h>
> +
> +#include <asm/unaligned.h>
> +
> +#include "hid-ids.h"
> +
> +#define HID_PLAYSTATION_VERSION_PATCH 0x8000
> +
> +/* Base class for playstation devices. */
> +struct ps_device {
> +       struct hid_device *hdev;
> +
> +       int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
> +};
> +
> +#define DS_INPUT_REPORT_USB                    0x01
> +
> +/* Button masks for DualSense input report. */
> +#define DS_BUTTONS0_HAT_SWITCH GENMASK(3, 0)
> +#define DS_BUTTONS0_SQUARE     BIT(4)
> +#define DS_BUTTONS0_CROSS      BIT(5)
> +#define DS_BUTTONS0_CIRCLE     BIT(6)
> +#define DS_BUTTONS0_TRIANGLE   BIT(7)
> +#define DS_BUTTONS1_L1         BIT(0)
> +#define DS_BUTTONS1_R1         BIT(1)
> +#define DS_BUTTONS1_L2         BIT(2)
> +#define DS_BUTTONS1_R2         BIT(3)
> +#define DS_BUTTONS1_CREATE     BIT(4)
> +#define DS_BUTTONS1_OPTIONS    BIT(5)
> +#define DS_BUTTONS1_L3         BIT(6)
> +#define DS_BUTTONS1_R3         BIT(7)
> +#define DS_BUTTONS2_PS_HOME    BIT(0)
> +#define DS_BUTTONS2_TOUCHPAD   BIT(1)
> +
> +struct dualsense {
> +       struct ps_device base;
> +       struct input_dev *gamepad;
> +};
> +
> +struct dualsense_touch_point {
> +       uint8_t contact;
> +       uint8_t x_lo;
> +       uint8_t x_hi:4, y_lo:4;
> +       uint8_t y_hi;
> +} __packed;
> +
> +/* Main DualSense input report excluding any BT/USB specific headers. */
> +struct dualsense_input_report {
> +       uint8_t x, y;
> +       uint8_t rx, ry;
> +       uint8_t z, rz;
> +       uint8_t seq_number;
> +       uint8_t buttons[4];
> +       uint8_t reserved[4];
> +
> +       /* Motion sensors */
> +       __le16 gyro[3]; /* x, y, z */
> +       __le16 accel[3]; /* x, y, z */
> +       __le32 sensor_timestamp;
> +       uint8_t reserved2;
> +
> +       /* Touchpad */
> +       struct dualsense_touch_point points[2];
> +
> +       uint8_t reserved3[12];
> +       uint8_t status;
> +       uint8_t reserved4[11];
> +} __packed;
> +
> +/* Common gamepad buttons across DualShock 3 / 4 and DualSense.
> + * Note: for device with a touchpad, touchpad button is not included
> + *        as it will be part of the touchpad device.
> + */
> +static const int ps_gamepad_buttons[] = {
> +       BTN_WEST, /* Square */
> +       BTN_NORTH, /* Triangle */
> +       BTN_EAST, /* Circle */
> +       BTN_SOUTH, /* Cross */
> +       BTN_TL, /* L1 */
> +       BTN_TR, /* R1 */
> +       BTN_TL2, /* L2 */
> +       BTN_TR2, /* R2 */
> +       BTN_SELECT, /* Create (PS5) / Share (PS4) */
> +       BTN_START, /* Option */
> +       BTN_THUMBL, /* L3 */
> +       BTN_THUMBR, /* R3 */
> +       BTN_MODE, /* PS Home */
> +};
> +
> +static const struct {int x; int y; } ps_gamepad_hat_mapping[] = {
> +       {0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1},
> +       {0, 0}
> +};
> +
> +static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, const char *name_suffix)
> +{
> +       struct input_dev *input_dev;
> +
> +       input_dev = devm_input_allocate_device(&hdev->dev);
> +       if (!input_dev)
> +               return ERR_PTR(-ENOMEM);
> +
> +       input_dev->id.bustype = hdev->bus;
> +       input_dev->id.vendor = hdev->vendor;
> +       input_dev->id.product = hdev->product;
> +       input_dev->id.version = hdev->version;
> +       input_dev->uniq = hdev->uniq;
> +
> +       if (name_suffix) {
> +               input_dev->name = devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s %s", hdev->name,
> +                               name_suffix);
> +               if (!input_dev->name)
> +                       return ERR_PTR(-ENOMEM);
> +       } else {
> +               input_dev->name = hdev->name;
> +       }
> +
> +       input_set_drvdata(input_dev, hdev);
> +
> +       return input_dev;
> +}
> +
> +static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
> +{
> +       struct input_dev *gamepad;
> +       unsigned int i;
> +       int ret;
> +
> +       gamepad = ps_allocate_input_dev(hdev, NULL);
> +       if (IS_ERR(gamepad))
> +               return ERR_PTR(-ENOMEM);
> +
> +       input_set_abs_params(gamepad, ABS_X, 0, 255, 0, 0);
> +       input_set_abs_params(gamepad, ABS_Y, 0, 255, 0, 0);
> +       input_set_abs_params(gamepad, ABS_Z, 0, 255, 0, 0);
> +       input_set_abs_params(gamepad, ABS_RX, 0, 255, 0, 0);
> +       input_set_abs_params(gamepad, ABS_RY, 0, 255, 0, 0);
> +       input_set_abs_params(gamepad, ABS_RZ, 0, 255, 0, 0);
> +
> +       input_set_abs_params(gamepad, ABS_HAT0X, -1, 1, 0, 0);
> +       input_set_abs_params(gamepad, ABS_HAT0Y, -1, 1, 0, 0);
> +
> +       for (i = 0; i < ARRAY_SIZE(ps_gamepad_buttons); i++)
> +               input_set_capability(gamepad, EV_KEY, ps_gamepad_buttons[i]);
> +
> +       ret = input_register_device(gamepad);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return gamepad;
> +}
> +
> +static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *report,
> +               u8 *data, int size)
> +{
> +       struct hid_device *hdev = ps_dev->hdev;
> +       struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
> +       struct dualsense_input_report *ds_report;
> +       uint8_t value;
> +
> +       /* DualSense in USB uses the full HID report for reportID 1, but
> +        * Bluetooth uses a minimal HID report for reportID 1 and reports
> +        * the full report using reportID 49.
> +        */
> +       if (report->id == DS_INPUT_REPORT_USB && hdev->bus == BUS_USB) {
> +               ds_report = (struct dualsense_input_report *)&data[1];
> +       } else {
> +               hid_err(hdev, "Unhandled reportID=%d\n", report->id);
> +               return -1;
> +       }
> +
> +       input_report_abs(ds->gamepad, ABS_X,  ds_report->x);
> +       input_report_abs(ds->gamepad, ABS_Y,  ds_report->y);
> +       input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
> +       input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
> +       input_report_abs(ds->gamepad, ABS_Z,  ds_report->z);
> +       input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
> +
> +       value = ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
> +       if (value > 7)
> +               value = 8; /* center */
> +       input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[value].x);
> +       input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[value].y);
> +
> +       input_report_key(ds->gamepad, BTN_WEST,   ds_report->buttons[0] & DS_BUTTONS0_SQUARE);
> +       input_report_key(ds->gamepad, BTN_SOUTH,  ds_report->buttons[0] & DS_BUTTONS0_CROSS);
> +       input_report_key(ds->gamepad, BTN_EAST,   ds_report->buttons[0] & DS_BUTTONS0_CIRCLE);
> +       input_report_key(ds->gamepad, BTN_NORTH,  ds_report->buttons[0] & DS_BUTTONS0_TRIANGLE);
> +       input_report_key(ds->gamepad, BTN_TL,     ds_report->buttons[1] & DS_BUTTONS1_L1);
> +       input_report_key(ds->gamepad, BTN_TR,     ds_report->buttons[1] & DS_BUTTONS1_R1);
> +       input_report_key(ds->gamepad, BTN_TL2,    ds_report->buttons[1] & DS_BUTTONS1_L2);
> +       input_report_key(ds->gamepad, BTN_TR2,    ds_report->buttons[1] & DS_BUTTONS1_R2);
> +       input_report_key(ds->gamepad, BTN_SELECT, ds_report->buttons[1] & DS_BUTTONS1_CREATE);
> +       input_report_key(ds->gamepad, BTN_START,  ds_report->buttons[1] & DS_BUTTONS1_OPTIONS);
> +       input_report_key(ds->gamepad, BTN_THUMBL, ds_report->buttons[1] & DS_BUTTONS1_L3);
> +       input_report_key(ds->gamepad, BTN_THUMBR, ds_report->buttons[1] & DS_BUTTONS1_R3);
> +       input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
> +       input_sync(ds->gamepad);
> +
> +       return 0;
> +}
> +
> +static struct ps_device *dualsense_create(struct hid_device *hdev)
> +{
> +       struct dualsense *ds;
> +       int ret;
> +
> +       ds = devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
> +       if (!ds)
> +               return ERR_PTR(-ENOMEM);
> +
> +       /* Patch version to allow userspace to distinguish between
> +        * hid-generic vs hid-playstation axis and button mapping.
> +        */
> +       hdev->version |= HID_PLAYSTATION_VERSION_PATCH;
> +
> +       ds->base.hdev = hdev;
> +       ds->base.parse_report = dualsense_parse_report;
> +       hid_set_drvdata(hdev, ds);
> +
> +       ds->gamepad = ps_gamepad_create(hdev);
> +       if (IS_ERR(ds->gamepad)) {
> +               ret = PTR_ERR(ds->gamepad);
> +               goto err;
> +       }
> +
> +       return &ds->base;
> +
> +err:
> +       return ERR_PTR(ret);
> +}
> +
> +static int ps_raw_event(struct hid_device *hdev, struct hid_report *report,
> +               u8 *data, int size)
> +{
> +       struct ps_device *dev = hid_get_drvdata(hdev);
> +
> +       if (dev && dev->parse_report)
> +               return dev->parse_report(dev, report, data, size);
> +
> +       return 0;
> +}
> +
> +static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +       struct ps_device *dev;
> +       int ret;
> +
> +       ret = hid_parse(hdev);
> +       if (ret) {
> +               hid_err(hdev, "parse failed\n");
> +               return ret;
> +       }
> +
> +       ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +       if (ret) {
> +               hid_err(hdev, "hw start failed\n");
> +               return ret;
> +       }
> +
> +       ret = hid_hw_open(hdev);
> +       if (ret) {
> +               hid_err(hdev, "hw open failed\n");
> +               goto err_stop;
> +       }
> +
> +       if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> +               dev = dualsense_create(hdev);
> +               if (IS_ERR(dev)) {
> +                       hid_err(hdev, "Failed to create dualsense.\n");
> +                       ret = PTR_ERR(dev);
> +                       goto err_close;
> +               }
> +       }
> +
> +       return ret;
> +
> +err_close:
> +       hid_hw_close(hdev);
> +err_stop:
> +       hid_hw_stop(hdev);
> +       return ret;
> +}
> +
> +static void ps_remove(struct hid_device *hdev)
> +{
> +       hid_hw_close(hdev);
> +       hid_hw_stop(hdev);
> +}
> +
> +static const struct hid_device_id ps_devices[] = {
> +       { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(hid, ps_devices);
> +
> +static struct hid_driver ps_driver = {
> +       .name             = "playstation",
> +       .id_table         = ps_devices,
> +       .probe            = ps_probe,
> +       .remove           = ps_remove,
> +       .raw_event        = ps_raw_event,
> +};
> +
> +module_hid_driver(ps_driver);
> +
> +MODULE_AUTHOR("Sony Interactive Entertainment");
> +MODULE_DESCRIPTION("HID Driver for PlayStation peripherals.");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index d9ca874dffac..1ca46cb445be 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -565,6 +565,9 @@ static const struct hid_device_id hid_have_special_driver[] = {
>  #if IS_ENABLED(CONFIG_HID_PLANTRONICS)
>         { HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
>  #endif
> +#if IS_ENABLED(CONFIG_HID_PLAYSTATION)
> +       { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
> +#endif

Can you please drop this hunk?

The DS controller "works" fine with hid-generic, and I'd rather not
have this list grows just for the sake of it.

Cheers,
Benjamin

>  #if IS_ENABLED(CONFIG_HID_PRIMAX)
>         { HID_USB_DEVICE(USB_VENDOR_ID_PRIMAX, USB_DEVICE_ID_PRIMAX_KEYBOARD) },
>  #endif
> --
> 2.26.2
>

