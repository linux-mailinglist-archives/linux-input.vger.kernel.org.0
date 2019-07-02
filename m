Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 274A75CBFC
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 10:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfGBIYj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 04:24:39 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46722 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbfGBIYj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 04:24:39 -0400
Received: by mail-qk1-f194.google.com with SMTP id x18so13214339qkn.13
        for <linux-input@vger.kernel.org>; Tue, 02 Jul 2019 01:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A16MuLuxo2n5s7zgpdCKMcQV5w6PFi2UfJLMkhB50Z0=;
        b=lBtHXkwoY4lwr63a1mAF0SvMgSxKW+1F+3mE4tC9NEBX0IduwrqadEWBiTnonO4kQ3
         GTu5Gp7zdUEjevatr44zAlZ958e4DBoecNR7f9aBwAL87ShfJpQuqMxsPSOehQw3zIru
         4KxmG885BX7nRSeIHCyN5OJyrLVw+S6iRPJWXXrg/EBpXg9vHQutk1uMWZnouhqDjU1j
         ta6Iy2pfWvM7Zij7sbnIPZQKxF5tQeFfj0Q875A8nWLWRTy3Wg9dIxsF0baK/s3oBdHP
         jqCg1FOBBq2xvcguZM4LzcWUKcU4q+IRVkWWprmvtRcuSKc7ENv8CbrtMfyOp10PreYH
         fHfA==
X-Gm-Message-State: APjAAAUk0darNn58yG2kFHy4RPb9q6K4eowasqqko+qNwTAyUl7IKS1q
        wPTQV4fHrYPiXafpKcoTF2xY4vRdbmGtLD2h8cf1jg==
X-Google-Smtp-Source: APXvYqzmWQVdq4Gm8wH+dz5piBx30ECwAQMK6AhAfdX0PwF9ZXpSRM8jcZ3Wti3Y69HeDuX/96j4A69Q0glDFp+zQXE=
X-Received: by 2002:a37:4c4e:: with SMTP id z75mr24535547qka.230.1562055878332;
 Tue, 02 Jul 2019 01:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190624152816.xbo2oqyviqbrpkur@lahvuun.homenetwork>
In-Reply-To: <20190624152816.xbo2oqyviqbrpkur@lahvuun.homenetwork>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 2 Jul 2019 10:24:27 +0200
Message-ID: <CAO-hwJJ7nnYftyBkjU3NXEMcLiBa29n7TL7ZfN+=QL0vESzZ=g@mail.gmail.com>
Subject: Re: [PATCH] HID: Add 044f:b320 ThrustMaster, Inc. 2 in 1 DT
To:     Ilya Trukhanov <lahvuun@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ilya,

On Mon, Jun 24, 2019 at 5:28 PM Ilya Trukhanov <lahvuun@gmail.com> wrote:
>
> Enable force feedback for the Thrustmaster Dual Trigger 2 in 1 Rumble Force
> gamepad. Compared to other Thrustmaster devices, left and right rumble
> motors here are swapped.
>
> Signed-off-by: Ilya Trukhanov <lahvuun@protonmail.com>
> ---
>  drivers/hid/hid-quirks.c |  1 +
>  drivers/hid/hid-tmff.c   | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index e5ca6fe2ca57..7408a4759b35 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -638,6 +638,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
>  #if IS_ENABLED(CONFIG_HID_THRUSTMASTER)
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb300) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb304) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb320) },

You should be able to drop this hunk from the patch.

>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb323) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb324) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb605) },
> diff --git a/drivers/hid/hid-tmff.c b/drivers/hid/hid-tmff.c
> index e12f2588ddeb..78b931d8617f 100644
> --- a/drivers/hid/hid-tmff.c
> +++ b/drivers/hid/hid-tmff.c
> @@ -76,6 +76,7 @@ static int tmff_play(struct input_dev *dev, void *data,
>         struct hid_field *ff_field = tmff->ff_field;
>         int x, y;
>         int left, right;        /* Rumbling */
> +       int motor_swap;
>
>         switch (effect->type) {
>         case FF_CONSTANT:
> @@ -100,6 +101,13 @@ static int tmff_play(struct input_dev *dev, void *data,
>                                         ff_field->logical_minimum,
>                                         ff_field->logical_maximum);
>
> +               /* 2-in-1 strong motor is left */
> +               if (hid->product == 0xb320) {

I think we better have a (local) #define for the PID here. You are
reusing it below.

Cheers,
Benjamin

> +                       motor_swap = left;
> +                       left = right;
> +                       right = motor_swap;
> +               }
> +
>                 dbg_hid("(left,right)=(%08x, %08x)\n", left, right);
>                 ff_field->value[0] = left;
>                 ff_field->value[1] = right;
> @@ -226,6 +234,8 @@ static const struct hid_device_id tm_devices[] = {
>                 .driver_data = (unsigned long)ff_rumble },
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb304),   /* FireStorm Dual Power 2 (and 3) */
>                 .driver_data = (unsigned long)ff_rumble },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb320),   /* Dual Trigger 2-in-1 */
> +               .driver_data = (unsigned long)ff_rumble },
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb323),   /* Dual Trigger 3-in-1 (PC Mode) */
>                 .driver_data = (unsigned long)ff_rumble },
>         { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb324),   /* Dual Trigger 3-in-1 (PS3 Mode) */
> --
> 2.22.0
>
