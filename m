Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2BF5B848
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 11:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbfGAJpU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 05:45:20 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42465 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbfGAJpU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 05:45:20 -0400
Received: by mail-qk1-f195.google.com with SMTP id b18so10423663qkc.9
        for <linux-input@vger.kernel.org>; Mon, 01 Jul 2019 02:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=694qDh9BDxcj1N2mz3/rX1SC3R2VBxUhHD3EdWt+GVA=;
        b=tFVAQOzvyA7mrU20PAbPb9ckR1yj+Uea8YxzZlYzeiCGZ1orqYaiCgdtAHxbt+t5Ji
         cdbZeoILi/tQTzwuSpZyMIAN+idV913V0SDXjjBIl4ME2tdcV+UOK2+PIb9L4mfgNa24
         kz+haPwv0Mn5O8FMreg/faLH1+lbR4fz6DkViLdy8o1ZtpY4ebeKArS/j7T3Y+Z4qxjh
         IwXhKO2Hm29qBlQVQ3xrDwOSdYPxKRp6MLlGtqkq+Orxga8lAjK7ajP7plyvYZl4JIf7
         3w/8fyr++cKvWjA5nEnLlV2PWH7K8zmu/2wMtzNXoEPq6c2KIUCqzYMbTNTWdZOIsQGX
         HgmA==
X-Gm-Message-State: APjAAAXAs6UjtyJK25VMbTtHH5zFUSbQsJH4O3P9TVEf8lmIQGhdABx5
        yApKzlRSp5nMSzbWEqTYIodgxVeXdE+2EgjKKEClBw==
X-Google-Smtp-Source: APXvYqwwP0HZB1g00Pn1cFlfoQA/RR89wmUW0tmBi6NRGlAJdmqmN+eufNg+MQzt3FH2MtaAK3wyZEtFSk9T+2JlTwg=
X-Received: by 2002:a05:620a:1456:: with SMTP id i22mr19245545qkl.170.1561974319581;
 Mon, 01 Jul 2019 02:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190626140618.8944-1-hadess@hadess.net>
In-Reply-To: <20190626140618.8944-1-hadess@hadess.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 1 Jul 2019 11:45:08 +0200
Message-ID: <CAO-hwJJDf68gqgJZHQtAdjZcEzuL+LbOJD=OYHtod1xN6G+GjA@mail.gmail.com>
Subject: Re: [PATCH v3] HID: sb0540: add support for Creative SB0540 IR receivers
To:     Bastien Nocera <hadess@hadess.net>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <bnocera@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bastien,

On Wed, Jun 26, 2019 at 4:07 PM Bastien Nocera <hadess@hadess.net> wrote:
>
> From: Bastien Nocera <bnocera@redhat.com>
>
> Add a new hid driver for the Creative SB0540 IR receiver. This receiver
> is usually coupled with an RM-1500 or an RM-1800 remote control.
>
> The scrollwheels on the RM-1800 remote are not bound, as they are
> labelled for specific audio controls that don't usually exist on most
> systems. They can be remapped using standard Linux keyboard
> remapping tools.

Much better commit message :)
Thanks!

I have a few nitpicks however

>
> Signed-off-by: Bastien Nocera <bnocera@redhat.com>
> ---
>  drivers/hid/Kconfig               |   9 ++
>  drivers/hid/Makefile              |   1 +
>  drivers/hid/hid-creative-sb0540.c | 254 ++++++++++++++++++++++++++++++
>  drivers/hid/hid-ids.h             |   1 +
>  4 files changed, 265 insertions(+)
>  create mode 100644 drivers/hid/hid-creative-sb0540.c
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 3872e03d9a59..f16c4bd822e4 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -273,6 +273,15 @@ config HID_CP2112
>         and gpiochip to expose these functions of the CP2112. The
>         customizable USB descriptor fields are exposed as sysfs attributes.
>
> +config HID_CREATIVE_SB0540
> +       tristate "Creative SB0540 infrared receiver"
> +       depends on USB_HID
> +       ---help---

checkpatch.pl complains here that new help texts should use "help" not
"---help---"

And BTW, checkpatch.pl complains *a lot*, so please fix most of the
warnings in the next submission (not sure you can go to 0 for a new
driver, but you should be able to get rid of most of them).

> +       Support for Creative infrared SB0540-compatible remote controls, such
> +       as the RM-1500 and RM-1800 remotes.
> +
> +       Say Y here if you want support for Creative SB0540 infrared receiver.
> +
>  config HID_CYPRESS
>         tristate "Cypress mouse and barcode readers"
>         depends on HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index cc5d827c9164..1ad662fe37b6 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_HID_ALPS)                += hid-alps.o
>  obj-$(CONFIG_HID_ACRUX)                += hid-axff.o
>  obj-$(CONFIG_HID_APPLE)                += hid-apple.o
>  obj-$(CONFIG_HID_APPLEIR)      += hid-appleir.o
> +obj-$(CONFIG_HID_CREATIVE_SB0540)      += hid-creative-sb0540.c
>  obj-$(CONFIG_HID_ASUS)         += hid-asus.o
>  obj-$(CONFIG_HID_AUREAL)       += hid-aureal.o
>  obj-$(CONFIG_HID_BELKIN)       += hid-belkin.o
> diff --git a/drivers/hid/hid-creative-sb0540.c b/drivers/hid/hid-creative-sb0540.c
> new file mode 100644
> index 000000000000..a94542cbdd33
> --- /dev/null
> +++ b/drivers/hid/hid-creative-sb0540.c
> @@ -0,0 +1,254 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * HID driver for the Creative SB0540 receiver
> + *
> + * Copyright (C) 2019 Red Hat Inc. All Rights Reserved
> + *
> + */
> +
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +#include "hid-ids.h"
> +
> +MODULE_AUTHOR("Bastien Nocera <hadess@hadess.net>");
> +MODULE_DESCRIPTION("HID Creative SB0540 receiver");
> +MODULE_LICENSE("GPL");
> +
> +static const unsigned short creative_sb0540_key_table[] = {
> +       KEY_POWER,
> +       KEY_RESERVED,           /* text: 24bit */
> +       KEY_RESERVED,           /* 24bit wheel up */
> +       KEY_RESERVED,           /* 24bit wheel down */
> +       KEY_RESERVED,           /* text: CMSS */
> +       KEY_RESERVED,           /* CMSS wheel Up */
> +       KEY_RESERVED,           /* CMSS wheel Down */
> +       KEY_RESERVED,           /* text: EAX */
> +       KEY_RESERVED,           /* EAX wheel up */
> +       KEY_RESERVED,           /* EAX wheel down */
> +       KEY_RESERVED,           /* text: 3D Midi */
> +       KEY_RESERVED,           /* 3D Midi wheel up */
> +       KEY_RESERVED,           /* 3D Midi wheel down */
> +       KEY_MUTE,
> +       KEY_VOLUMEUP,
> +       KEY_VOLUMEDOWN,
> +       KEY_UP,
> +       KEY_LEFT,
> +       KEY_RIGHT,
> +       KEY_REWIND,
> +       KEY_OK,
> +       KEY_FASTFORWARD,
> +       KEY_DOWN,
> +       KEY_AGAIN,              /* text: Return, symbol: Jump to */
> +       KEY_PLAY,               /* text: Start */
> +       KEY_ESC,                /* text: Cancel */
> +       KEY_RECORD,
> +       KEY_OPTION,
> +       KEY_MENU,               /* text: Display */
> +       KEY_PREVIOUS,
> +       KEY_PLAYPAUSE,
> +       KEY_NEXT,
> +       KEY_SLOW,
> +       KEY_STOP,
> +       KEY_NUMERIC_1,
> +       KEY_NUMERIC_2,
> +       KEY_NUMERIC_3,
> +       KEY_NUMERIC_4,
> +       KEY_NUMERIC_5,
> +       KEY_NUMERIC_6,
> +       KEY_NUMERIC_7,
> +       KEY_NUMERIC_8,
> +       KEY_NUMERIC_9,
> +       KEY_NUMERIC_0
> +};
> +
> +/* Codes and keys from lirc's
> + * remotes/creative/lircd.conf.alsa_usb
> + * order and size must match creative_sb0540_key_table[] above */

Please follow the kernel coding style:
/*
 * Codes and keys from lirc's
 * remotes/creative/lircd.conf.alsa_usb
 * order and size must match creative_sb0540_key_table[] above
 */

And same for all the multi-line comments.

> +static const unsigned short creative_sb0540_codes[] = {
> +       0x619E,
> +       0x916E,
> +       0x926D,
> +       0x936C,
> +       0x718E,
> +       0x946B,
> +       0x956A,
> +       0x8C73,
> +       0x9669,
> +       0x9768,
> +       0x9867,
> +       0x9966,
> +       0x9A65,
> +       0x6E91,
> +       0x629D,
> +       0x639C,
> +       0x7B84,
> +       0x6B94,
> +       0x728D,
> +       0x8778,
> +       0x817E,
> +       0x758A,
> +       0x8D72,
> +       0x8E71,
> +       0x8877,
> +       0x7C83,
> +       0x738C,
> +       0x827D,
> +       0x7689,
> +       0x7F80,
> +       0x7986,
> +       0x7A85,
> +       0x7D82,
> +       0x857A,
> +       0x8B74,
> +       0x8F70,
> +       0x906F,
> +       0x8A75,
> +       0x847B,
> +       0x7887,
> +       0x8976,
> +       0x837C,
> +       0x7788,
> +       0x807F
> +};
> +
> +struct creative_sb0540 {
> +       struct input_dev *input_dev;
> +       struct hid_device *hid;
> +       unsigned short keymap[ARRAY_SIZE(creative_sb0540_key_table)];
> +};
> +
> +static inline u64 reverse(u64 data, int bits)
> +{
> +       int i;
> +       u64 c;
> +
> +       c = 0;
> +       for (i = 0; i < bits; i++) {
> +               c |= (u64) (((data & (((u64) 1) << i)) ? 1 : 0)) << (bits - 1 - i);
> +       }
> +       return (c);
> +}
> +
> +static int get_key(struct creative_sb0540 *creative_sb0540, u64 keycode)
> +{
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(creative_sb0540_codes); i++) {
> +               if (creative_sb0540_codes[i] == keycode)
> +                       return creative_sb0540->keymap[i];
> +       }
> +
> +       return 0;
> +
> +}
> +
> +static int creative_sb0540_raw_event(struct hid_device *hid, struct hid_report *report,
> +        u8 *data, int len)
> +{
> +       struct creative_sb0540 *creative_sb0540 = hid_get_drvdata(hid);
> +       u64 code, main_code;
> +       int key;
> +
> +       if (len != 6)
> +               goto out;
> +
> +       /* From daemons/hw_hiddev.c sb0540_rec() in lirc */
> +       code = reverse(data[5], 8);
> +       main_code = (code << 8) + ((~code) & 0xff);
> +
> +       /* Flip to get values in the same format as
> +        * remotes/creative/lircd.conf.alsa_usb in lirc */
> +       main_code = ((main_code & 0xff) << 8) + ((main_code & 0xff00) >> 8);
> +
> +       key = get_key(creative_sb0540, main_code);
> +       if (key == 0 || key == KEY_RESERVED) {
> +               hid_err(hid, "Could not get a key for main_code %llX\n", main_code);
> +               goto out;

I don't really like the got out here.

Why not changing the condition above to
if (key && key != KEY_RESERVED) and include the block below in the true case?

> +       }
> +
> +       input_report_key(creative_sb0540->input_dev, key, 1);
> +       input_report_key(creative_sb0540->input_dev, key, 0);
> +       input_sync(creative_sb0540->input_dev);
> +
> +out:
> +       /* let hidraw and hiddev handle the report */
> +       return 0;
> +}
> +
> +static int creative_sb0540_input_configured(struct hid_device *hid,
> +               struct hid_input *hidinput)
> +{
> +       struct input_dev *input_dev = hidinput->input;
> +       struct creative_sb0540 *creative_sb0540 = hid_get_drvdata(hid);
> +       int i;
> +
> +       creative_sb0540->input_dev = input_dev;
> +
> +       input_dev->keycode = creative_sb0540->keymap;
> +       input_dev->keycodesize = sizeof(unsigned short);
> +       input_dev->keycodemax = ARRAY_SIZE(creative_sb0540->keymap);
> +
> +       input_dev->evbit[0] = BIT(EV_KEY) | BIT(EV_REP);
> +
> +       memcpy(creative_sb0540->keymap, creative_sb0540_key_table, sizeof(creative_sb0540->keymap));
> +       for (i = 0; i < ARRAY_SIZE(creative_sb0540_key_table); i++)
> +               set_bit(creative_sb0540->keymap[i], input_dev->keybit);
> +       clear_bit(KEY_RESERVED, input_dev->keybit);
> +
> +       return 0;
> +}
> +
> +static int creative_sb0540_input_mapping(struct hid_device *hid,
> +               struct hid_input *hi, struct hid_field *field,
> +               struct hid_usage *usage, unsigned long **bit, int *max)
> +{

Please add a comment here that we are remapping them ourselves, so we
can skip the hid-input processing.

> +       return -1;
> +}
> +
> +static int creative_sb0540_probe(struct hid_device *hid, const struct hid_device_id *id)
> +{
> +       int ret;
> +       struct creative_sb0540 *creative_sb0540;
> +
> +       creative_sb0540 = devm_kzalloc(&hid->dev, sizeof(struct creative_sb0540), GFP_KERNEL);
> +       if (!creative_sb0540)
> +               return -ENOMEM;
> +
> +       creative_sb0540->hid = hid;
> +
> +       /* force input as some remotes bypass the input registration */
> +       hid->quirks |= HID_QUIRK_HIDINPUT_FORCE;

Does this still applies to your remote?

Cheers,
Benjamin

> +
> +       hid_set_drvdata(hid, creative_sb0540);
> +
> +       ret = hid_parse(hid);
> +       if (ret) {
> +               hid_err(hid, "parse failed\n");
> +               return ret;
> +       }
> +
> +       ret = hid_hw_start(hid, HID_CONNECT_DEFAULT);
> +       if (ret) {
> +               hid_err(hid, "hw start failed\n");
> +               return ret;
> +       }
> +
> +       return ret;
> +}
> +
> +static const struct hid_device_id creative_sb0540_devices[] = {
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CREATIVELABS, USB_DEVICE_ID_CREATIVE_SB0540) },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(hid, creative_sb0540_devices);
> +
> +static struct hid_driver creative_sb0540_driver = {
> +       .name = "creative-sb0540",
> +       .id_table = creative_sb0540_devices,
> +       .raw_event = creative_sb0540_raw_event,
> +       .input_configured = creative_sb0540_input_configured,
> +       .probe = creative_sb0540_probe,
> +       .input_mapping = creative_sb0540_input_mapping,
> +};
> +module_hid_driver(creative_sb0540_driver);
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 826324997686..206b7065da86 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -312,6 +312,7 @@
>  #define USB_VENDOR_ID_CREATIVELABS     0x041e
>  #define USB_DEVICE_ID_CREATIVE_SB_OMNI_SURROUND_51     0x322c
>  #define USB_DEVICE_ID_PRODIKEYS_PCMIDI 0x2801
> +#define USB_DEVICE_ID_CREATIVE_SB0540  0x3100
>
>  #define USB_VENDOR_ID_CVTOUCH          0x1ff7
>  #define USB_DEVICE_ID_CVTOUCH_SCREEN   0x0013
> --
> 2.21.0
>
