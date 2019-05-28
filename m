Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD3CC2CD20
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 19:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfE1RHQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 13:07:16 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46995 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfE1RHP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 May 2019 13:07:15 -0400
Received: by mail-qk1-f195.google.com with SMTP id a132so23691293qkb.13
        for <linux-input@vger.kernel.org>; Tue, 28 May 2019 10:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G39Rpo20bfV9oatIjPpZxfb3OklAE1CP3oejmY6Bb+A=;
        b=aTUf93MmtuB66THrovA8g/lP1ZO092rCoKfnUwm6EO7mlDIwS+n9OzUOLoMQzKhJRe
         mAyAYLF2KnxPwrWSKc7sjbE2TKfBp9ddcQybZhAqTAUp7cZTgJ0RG8/npOr1uPjjHTd9
         CX4QcB4bzfCV0PjosiRYxzOP4WDYENM7sBTJFYuTnyYfwZ+6QpJDCKK5wBgTR6iDIvHG
         FepDxvWb4Gs9WZvitNPXORHvl1NH/bIbUGLF940XYDaGXuRTUmw2fj5xZv2g5aB5lWyZ
         Zou7o/jfOLp3oPa5HMG2N4a0Z2Crt3Z9/ZfI19XcBUngus76h9d7UvrN+NcyQFcYzc9C
         x9dw==
X-Gm-Message-State: APjAAAWacvq8yUZkKBU2J1PawbMCU+c/EAoIzaaXj6UqNsWpwywJ8SbB
        NEBpQr3JJXolj4fDZSfQlSnTUxpN+2DJ5f0147TioQ==
X-Google-Smtp-Source: APXvYqz50MAdAghe/dbH5vV1XdaL2gTZYN8AjpGl/kDte8UNYm/HKs2JKnk+mG2ve5ottnQoxD1txRvBsAMpQvEfcus=
X-Received: by 2002:a0c:baa7:: with SMTP id x39mr51546711qvf.100.1559063234889;
 Tue, 28 May 2019 10:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190528162924.32754-1-pedro@pedrovanzella.com>
In-Reply-To: <20190528162924.32754-1-pedro@pedrovanzella.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 28 May 2019 19:07:02 +0200
Message-ID: <CAO-hwJ+zAvDizJRpykky+D3pf1M1NhFGWztwyA4mJEv8C+nO-w@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-logitech-hidpp: detect wireless lightspeed devices
To:     Pedro Vanzella <pedro@pedrovanzella.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 28, 2019 at 6:30 PM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
>
> Send a low device index when the device is connected via the lightspeed
> receiver so that the receiver will pass the message along to the device
> instead of responding. If we don't do that, we end up thinking it's a
> hidpp10 device and miss out on all new features available to newer devices.
>
> This will enable correct detection of the following models:
> G603, GPro, G305, G613, G900 and G903, and possibly others.

Thanks for the patch.
However, there is already support for this receiver in Linus' tree:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/hid/hid-logitech-dj.c?id=f5fb57a74e88bd1788f57bf77d587c91d4dc9d57

With kernel 5.2-rc1, the connected device should already be handled by
hid-logitech-hidpp :)

Cheers,
Benjamin

>
> Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 72fc9c0566db..621fce141d9f 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -62,6 +62,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
>  #define HIDPP_QUIRK_CLASS_K400                 BIT(2)
>  #define HIDPP_QUIRK_CLASS_G920                 BIT(3)
>  #define HIDPP_QUIRK_CLASS_K750                 BIT(4)
> +#define HIDPP_QUIRK_CLASS_LIGHTSPEED           BIT(5)
>
>  /* bits 2..20 are reserved for classes */
>  /* #define HIDPP_QUIRK_CONNECT_EVENTS          BIT(21) disabled */
> @@ -236,7 +237,11 @@ static int __hidpp_send_report(struct hid_device *hdev,
>          * set the device_index as the receiver, it will be overwritten by
>          * hid_hw_request if needed
>          */
> -       hidpp_report->device_index = 0xff;
> +       if (hidpp->quirks & HIDPP_QUIRK_CLASS_LIGHTSPEED) {
> +               hidpp_report->device_index = 0x01;
> +       } else {
> +               hidpp_report->device_index = 0xff;
> +       }
>
>         if (hidpp->quirks & HIDPP_QUIRK_FORCE_OUTPUT_REPORTS) {
>                 ret = hid_hw_output_report(hdev, (u8 *)hidpp_report, fields_count);
> @@ -3753,6 +3758,9 @@ static const struct hid_device_id hidpp_devices[] = {
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC06B) },
>         { /* Logitech G900 Gaming Mouse over USB */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC081) },
> +       { /* Logitech Gaming Mice over Lightspeed Receiver */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC539),
> +         .driver_data = HIDPP_QUIRK_CLASS_LIGHTSPEED },
>         { /* Logitech G920 Wheel over USB */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G920_WHEEL),
>                 .driver_data = HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_REPORTS},
> --
> 2.21.0
>
