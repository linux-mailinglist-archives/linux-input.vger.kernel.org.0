Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B701E06BC
	for <lists+linux-input@lfdr.de>; Mon, 25 May 2020 08:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729713AbgEYGNm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 May 2020 02:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbgEYGNl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 May 2020 02:13:41 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70482C061A0E
        for <linux-input@vger.kernel.org>; Sun, 24 May 2020 23:13:41 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id g20so7615893qvb.9
        for <linux-input@vger.kernel.org>; Sun, 24 May 2020 23:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W771P64u6dOvRzBUjnpx0KnAfDXvZmh+a1k1C0ohM0U=;
        b=bys9pSpV0BnXIhw3BeapwkEQ9GDQiPeICi9RYTwTUHolSJPTqw2JE7zA/G+/1+SwmQ
         1m6CFpbyhD/fLue9NcZLLXDAfFc8ngKxI35ysGkxvfsvqcDbBbPyQnl9iqmrSj64+co7
         CprAmmVKXwpg+px2qhe1wHcH6n57rF7emyU+H1U/dQ02Q+YgsiPGjaSbz54w8cMdpY0a
         IlByYhWoyrT9XnjC3VK2Rs9HX8wcakbeov+AO46bIPx70xCVRkwI0HH2uWOnphL+7/n/
         hzHMgVZiHjRGgwCMl/qR2Hs3Kp0i99R+rbeTNjXjEfg3jnxe/vn9A93PuvkZ2SLAx2xF
         czRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W771P64u6dOvRzBUjnpx0KnAfDXvZmh+a1k1C0ohM0U=;
        b=QWTFidTI2JPao+W4IqdHe58srYahwGjVkPncpGMQaSv7667tTeVYAwB8Gfm80bzKPI
         y0ApdQ7TuQzezt0xYWMwppD2KzuujpFmvv1CS3TDpehoNFyMzyI7lxcGS7q0VKQowQI+
         rdwkrKKG6okG/tgtHl1ddUcrC+3ZZqPfhJfDQGDdaYI5p3uEqmWUdjADAja+FBuJayBF
         s+31DrycpFcqQFuwBzjEQT/pnoWitCWN5gopntg9E1NxCGOLmOhfC1T7Ie+nUG0IZcPP
         nKBFp1/k+bekYiLXV2nuIct4dVraUxzpz9PyHhdhthbBhvtDz5ZLhWwp8Dif1NJFUC3u
         4DtQ==
X-Gm-Message-State: AOAM530KNCJX76yyY74wZNabgY50142g18VzzUHfYR8pFuCG7IhI4MIa
        5bGs1JfqtAtQASWn6M0XXXmC4GxKVU6GX8CUxNCeW0qk
X-Google-Smtp-Source: ABdhPJxAuPbOtTrm/dl+J/oRBo7xvTO3P+KYPJOq2gLpP/Whlo4uxgD4sCX257iqswkx2f0y8T+Dq2BPuM9kdOVcZM8=
X-Received: by 2002:ad4:5290:: with SMTP id v16mr14648265qvr.240.1590387220542;
 Sun, 24 May 2020 23:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLGVGmS4i3fdH2rYeqSgqk3Gm=sxaLLMuKx4T1eY9ZvyEg@mail.gmail.com>
In-Reply-To: <CANFaMLGVGmS4i3fdH2rYeqSgqk3Gm=sxaLLMuKx4T1eY9ZvyEg@mail.gmail.com>
From:   David Rheinsberg <david.rheinsberg@gmail.com>
Date:   Mon, 25 May 2020 08:13:29 +0200
Message-ID: <CANq1E4QUMssPJXvR4njunbV4+2-0ojYvvDxQSTX_0iFPGoTYVw@mail.gmail.com>
Subject: Re: [PATCH[ HID: Wiimote: Treat the d-pad as an analogue stick
To:     Daniel Morse <dmorse@speedfox.co.uk>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On Sun, May 24, 2020 at 12:03 AM Daniel Morse <dmorse@speedfox.co.uk> wrote:
>
> The controllers from the Super Nintendo Classic Edition (AKA the SNES
> Mini) appear as a Classic Controller Pro when connected to a Wii
> Remote. All the buttons work as the same, with the d-pad being mapped
> the same as the d-pad on the Classic Controller Pro. This differs from
> the behaviour of most controllers with d-pads and no analogue sticks,
> where the d-pad maps to ABS_HAT1X for left and right, and ABS_HAT1Y
> for up and down. This patch adds an option to the hid-wiimote module
> to make the Super Nintendo Classic Controller behave this way.
>
> The patch has been tested with a Super Nintendo Classic Controller
> plugged into a Wii Remote in both with the option both enabled and
> disabled. When enabled the d-pad acts as the analogue control, and
> when disabled it acts as it did before the patch was applied. This
> patch has not been tested with e Wii Classic Controller (either the
> original or the pro version) as I do not have one of these
> controllers.
>
> Although I have not tested it with these controllers, I think it is
> likely this patch will also work with the NES Classic Edition
> Controllers.
>
> Signed-off-by: Daniel G. Morse <dmorse@speedfox.co.uk>
> ---
>  drivers/hid/hid-wiimote-core.c    |  6 ++
>  drivers/hid/hid-wiimote-modules.c | 98 +++++++++++++++++++++++--------
>  drivers/hid/hid-wiimote.h         |  1 +
>  3 files changed, 82 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
> index 92874dbe4d4a..4e75d7b7446f 100644
> --- a/drivers/hid/hid-wiimote-core.c
> +++ b/drivers/hid/hid-wiimote-core.c
> @@ -1870,6 +1870,12 @@ static const struct hid_device_id
> wiimote_hid_devices[] = {
>                  USB_DEVICE_ID_NINTENDO_WIIMOTE2) },
>      { }
>  };
> +
> +bool dpad_as_analog = false;
> +module_param(dpad_as_analog, bool, 0644);
> +MODULE_PARM_DESC(dpad_as_analog,
> +        "Treats the D-Pad as the main analog input");

This can be put on one line:

    MODULE_PARM_DESC(dpad_as_analog, "Use D-Pad as main analog input");

(I would also slightly adjust the description as suggested).

> +
>  MODULE_DEVICE_TABLE(hid, wiimote_hid_devices);
>
>  static struct hid_driver wiimote_hid_driver = {
> diff --git a/drivers/hid/hid-wiimote-modules.c
> b/drivers/hid/hid-wiimote-modules.c
> index 2c3925357857..2c491c92cd8e 100644
> --- a/drivers/hid/hid-wiimote-modules.c
> +++ b/drivers/hid/hid-wiimote-modules.c
> @@ -1110,19 +1110,85 @@ static void wiimod_classic_in_ext(struct
> wiimote_data *wdata, const __u8 *ext)
>      rt <<= 1;
>      lt <<= 1;
>
> -    input_report_abs(wdata->extension.input, ABS_HAT1X, lx - 0x20);
> -    input_report_abs(wdata->extension.input, ABS_HAT1Y, ly - 0x20);
>      input_report_abs(wdata->extension.input, ABS_HAT2X, rx - 0x20);
>      input_report_abs(wdata->extension.input, ABS_HAT2Y, ry - 0x20);
>      input_report_abs(wdata->extension.input, ABS_HAT3X, rt);
>      input_report_abs(wdata->extension.input, ABS_HAT3Y, lt);
> +    if(dpad_as_analog) {
> +        if(wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE){

Missing space between `if` and `(`, as well as `(` and `{`.

And more missing spaces between your `if` and opening parentheses below.

> +            if((ext[4] & 0x80) && !(ext[1] & 0x01)) {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1X, 0x7F);
> +            } else if(!(ext[4] & 0x80) && (ext[1] & 0x01)) {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1X, 0xFF);
> +            } else {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1X, 0x00);
> +            }
> +
> +            if((ext[4] & 0x40) && !(ext[0] & 0x01)) {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1Y, 0x7F);
> +            } else if(!(ext[4] & 0x40) && (ext[0] & 0x01)) {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1Y, 0xFF);
> +            } else {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1Y, 0x00);
> +            }
> +        } else {
> +            if((ext[4] & 0x80) && !(ext[5] & 0x02)) {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1X, 0x7F);
> +            } else if(!(ext[4] & 0x80) && (ext[5] & 0x02)) {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1X, 0xFF);
> +            } else {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1X, 0x00);
> +            }
> +
> +            if((ext[4] & 0x40) && !(ext[5] & 0x01)) {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1Y, 0x7F);
> +            } else if(!(ext[4] & 0x40) && (ext[5] & 0x01)) {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1Y, 0xFF);
> +            } else {
> +                input_report_abs(wdata->extension.input,
> +                        ABS_HAT1Y, 0x00);
> +            }
> +        }
> +

I would prefer if we calculated these values up-front and then just
call input_report_abs() once. It nicely splits data-calculation from
data-reporting and makes it easier to read (I think). Also, we can
then simplify the digital-to-analog conversion, to avoid all the
conditionals.

What do you think of something like this:

    unsigned int digital_to_analog[3] = [0xff, 0x00, 0x7f];

    if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
        if (dpad_as_analog) {
            lx = digital_to_analog[1 + !!(ext[4] & 0x80) - !!(ext[1] & 0x01)];
            ly = digital_to_analog[1 + !!(ext[4] & 0x40) - !!(ext[0] & 0x01)];
        } else {
            lx = (ext[0] & 0x3e) - 0x20;
            ly = (ext[1] & 0x3e) - 0x20;
        }
    } else {
        if (dpad_as_analog) {
            lx = digital_to_analog[1 + !!(ext[4] & 0x80) - !!(ext[5] & 0x02)];
            ly = digital_to_analog[1 + !!(ext[4] & 0x40) - !!(ext[5] & 0x01)];
        } else {
            lx = (ext[0] & 0x3f) - 0x20;
            ly = (ext[1] & 0x3f) - 0x20;
        }
    }

    input_report_abs(wdata->extension.input, ABS_HAT1X, lx);
    input_report_abs(wdata->extension.input, ABS_HAT1X, ly);
    ...
    if (!dpad_as_analog) {
        ...report-keys-as-before...
    }

> +    } else {
> +        input_report_abs(wdata->extension.input, ABS_HAT1X, lx - 0x20);
> +        input_report_abs(wdata->extension.input, ABS_HAT1Y, ly - 0x20);
> +        input_report_key(wdata->extension.input,
> +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_RIGHT],
> +                 !(ext[4] & 0x80));
> +        input_report_key(wdata->extension.input,
> +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_DOWN],
> +                 !(ext[4] & 0x40));
> +
> +        if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
> +            input_report_key(wdata->extension.input,
> +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
> +                 !(ext[1] & 0x01));
> +            input_report_key(wdata->extension.input,
> +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
> +                 !(ext[0] & 0x01));
> +        } else {
> +            input_report_key(wdata->extension.input,
> +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
> +                 !(ext[5] & 0x02));
> +            input_report_key(wdata->extension.input,
> +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
> +                 !(ext[5] & 0x01));
> +        }
> +    }
> +
>

^^Usually no double-newlines in kernel-code.

> -    input_report_key(wdata->extension.input,
> -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_RIGHT],
> -             !(ext[4] & 0x80));
> -    input_report_key(wdata->extension.input,
> -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_DOWN],
> -             !(ext[4] & 0x40));
>      input_report_key(wdata->extension.input,
>               wiimod_classic_map[WIIMOD_CLASSIC_KEY_LT],
>               !(ext[4] & 0x20));
> @@ -1157,21 +1223,7 @@ static void wiimod_classic_in_ext(struct
> wiimote_data *wdata, const __u8 *ext)
>               wiimod_classic_map[WIIMOD_CLASSIC_KEY_ZR],
>               !(ext[5] & 0x04));
>
> -    if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
> -        input_report_key(wdata->extension.input,
> -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
> -             !(ext[1] & 0x01));
> -        input_report_key(wdata->extension.input,
> -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
> -             !(ext[0] & 0x01));
> -    } else {
> -        input_report_key(wdata->extension.input,
> -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
> -             !(ext[5] & 0x02));
> -        input_report_key(wdata->extension.input,
> -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
> -             !(ext[5] & 0x01));
> -    }
> +
>

^^There is usually no double-newlines in kernel-code.

This patch looks fine to me. I wonder though whether we will just end
up with lots of remappings if we add this for every mismatch between
two controller mappings. All the information is still reported
consistently by the kernel. It is just user-space that needs to fetch
the right data.

There has never been wide-spread agreement on which data a controller
should report. We have different drivers returning information in
different IDs. This gets more problematic the more information a
driver returns, as the ID space for ABS axes is quite limited.
Generally, for any non-standard input I recommend user-space to remap
driver data to their internal data. This way, you do not care what
information is exactly returned by the kernel. Similar issues existed
with DirectInput/XInput as part of DirectX, but they did provide easy
remappings.

I am unsure about this patch. Hmmm. It is simple enough, and you can
modify the module-parameters without reloading the module, so this
should be fine.

Thanks
David

>      input_sync(wdata->extension.input);
>  }
> diff --git a/drivers/hid/hid-wiimote.h b/drivers/hid/hid-wiimote.h
> index b2a26a0a8f12..0079801f599c 100644
> --- a/drivers/hid/hid-wiimote.h
> +++ b/drivers/hid/hid-wiimote.h
> @@ -372,4 +372,5 @@ static inline int wiimote_cmd_wait_noint(struct
> wiimote_data *wdata)
>          return 0;
>  }
>
> +extern bool dpad_as_analog;
>  #endif
> --
> 2.25.1
