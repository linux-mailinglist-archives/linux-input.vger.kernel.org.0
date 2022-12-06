Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA89644D17
	for <lists+linux-input@lfdr.de>; Tue,  6 Dec 2022 21:13:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiLFUNz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Dec 2022 15:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiLFUNk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Dec 2022 15:13:40 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53CF937FBB
        for <linux-input@vger.kernel.org>; Tue,  6 Dec 2022 12:11:35 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 6so14354855pgm.6
        for <linux-input@vger.kernel.org>; Tue, 06 Dec 2022 12:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rcUapuzIOLv1ChbTqErlZGz/ooTgkpZ+vmGq4+9eme0=;
        b=HS3nS3aG+T2LVV6nMWKra4RzUehyW4WbMsaEmuND/g1nKLScX0WYzpj/oOTCrA/Omv
         6LnaZ5B91HU+EXupBNvMD9jQKzcQA+Myerhx5M9gaJdTbK4w1GxjcL+3NLr1o9OR28rg
         5HIqoUyXJ1rS3fjcBK1mre3zmqdynG9egGzr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcUapuzIOLv1ChbTqErlZGz/ooTgkpZ+vmGq4+9eme0=;
        b=yWngjBb7jv89FZ+CCWWrEewuGtvY4N5NVHhWw9NzM3S1njCYvP93exVTwG8OlEttZC
         uobCT6TZG6rqf4JNY+7MhHZzkKj9dTx0Er+Ngi3mNtwC41HVnGGeFh6Z4IrOy2QEdgvi
         0oUXilZFr56ZYpq/mpsR/XeroWtu4Ajy9ZzKINv/OxDY0maLr/5HG3qqQY4qT/B1Eg3D
         T0r9kHc4Ee4+RVHIgJGG3FTgWiCzCcra0y1GVyFYZ9sn7MugQrUwZtjuElP1ApZsU004
         eXaBGOyW7cAOZSJaKazONI+j77YmtMiJhaaL5exbWwAoWWawsUGXOoDcsoKko5TiNZtc
         a4+A==
X-Gm-Message-State: ANoB5pkpLTGqOKM1DJcPSW7VBhqPEr9XZomkNmwnpDSeHzG2UgoOGcJO
        O6a9+6zbbsGTMx99+ztofAXg80CE4LP7c/TJ
X-Google-Smtp-Source: AA0mqf7IGqq6dcVoAWJPgk02QgfbbYGYFaEj6JGEYYXqJS2CCuy4WF4uk/qmbrKSUwDZg8mhDCNOzA==
X-Received: by 2002:a63:1609:0:b0:477:467f:3dc0 with SMTP id w9-20020a631609000000b00477467f3dc0mr59388811pgl.504.1670357494689;
        Tue, 06 Dec 2022 12:11:34 -0800 (PST)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com. [209.85.215.178])
        by smtp.gmail.com with ESMTPSA id f14-20020a170902684e00b0018971fba556sm13021351pln.139.2022.12.06.12.11.33
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 12:11:34 -0800 (PST)
Received: by mail-pg1-f178.google.com with SMTP id h193so14344368pgc.10
        for <linux-input@vger.kernel.org>; Tue, 06 Dec 2022 12:11:33 -0800 (PST)
X-Received: by 2002:a63:1607:0:b0:457:a1d3:48c3 with SMTP id
 w7-20020a631607000000b00457a1d348c3mr60775778pgl.465.1670357493343; Tue, 06
 Dec 2022 12:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20221206173819.1.I69657e84c0606b2e5ccfa9fedbf42b7676a1e129@changeid>
In-Reply-To: <20221206173819.1.I69657e84c0606b2e5ccfa9fedbf42b7676a1e129@changeid>
From:   Dmitry Torokhov <dtor@chromium.org>
Date:   Tue, 6 Dec 2022 12:11:17 -0800
X-Gmail-Original-Message-ID: <CAE_wzQ-WrjOgSADCn4v80ESwicOFif_Trn3Wrq=5toy2+y+q=g@mail.gmail.com>
Message-ID: <CAE_wzQ-WrjOgSADCn4v80ESwicOFif_Trn3Wrq=5toy2+y+q=g@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Add quirks for flipped axes
To:     Allen Ballway <ballway@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Allen,

On Tue, Dec 6, 2022 at 9:39 AM Allen Ballway <ballway@chromium.org> wrote:
>
> Certain touchscreen devices, such as the ELAN9034, are oriented
> incorrectly and report touches on opposite points on the X and Y axes.
> For example, a 100x200 screen touched at (10,20) would report (90, 180)
> and vice versa.
>
> This is fixed by adding device quirks to transform the touch points
> into the correct spaces, from X -> MAX(X) - X, and Y -> MAX(Y) - Y.
>
> Signed-off-by: Allen Ballway <ballway@chromium.org>
> ---
>
>  drivers/hid/hid-multitouch.c | 46 ++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 91a4d3fc30e08..5e14cc4b00f53 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -71,6 +71,8 @@ MODULE_LICENSE("GPL");
>  #define MT_QUIRK_SEPARATE_APP_REPORT   BIT(19)
>  #define MT_QUIRK_FORCE_MULTI_INPUT     BIT(20)
>  #define MT_QUIRK_DISABLE_WAKEUP                BIT(21)
> +#define MT_QUIRK_FLIP_X                        BIT(22)
> +#define MT_QUIRK_FLIP_Y                        BIT(23)
>
>  #define MT_INPUTMODE_TOUCHSCREEN       0x02
>  #define MT_INPUTMODE_TOUCHPAD          0x03
> @@ -212,6 +214,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
>  #define MT_CLS_GOOGLE                          0x0111
>  #define MT_CLS_RAZER_BLADE_STEALTH             0x0112
>  #define MT_CLS_SMART_TECH                      0x0113
> +#define MT_CLS_ELAN_FLIPPED                    0x0114
>
>  #define MT_DEFAULT_MAXCONTACT  10
>  #define MT_MAX_MAXCONTACT      250
> @@ -396,6 +399,17 @@ static const struct mt_class mt_classes[] = {
>                         MT_QUIRK_CONTACT_CNT_ACCURATE |
>                         MT_QUIRK_SEPARATE_APP_REPORT,
>         },input_abs_get_max(input, ABS_MT_POSITION_X) - *slot->x
> +       { .name = MT_CLS_ELAN_FLIPPED,
> +               .quirks = MT_QUIRK_ALWAYS_VALID |
> +                       MT_QUIRK_IGNORE_DUPLICATES |
> +                       MT_QUIRK_HOVERING |
> +                       MT_QUIRK_CONTACT_CNT_ACCURATE |
> +                       MT_QUIRK_STICKY_FINGERS |
> +                       MT_QUIRK_WIN8_PTP_BUTTONS |
> +                       MT_QUIRK_FLIP_X |
> +                       MT_QUIRK_FLIP_Y,
> +               .export_all_inputs = true },
> +
>         { }
>  };
>
> @@ -1115,10 +1129,30 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
>                         minor = minor >> 1;
>                 }
>
> -               input_event(input, EV_ABS, ABS_MT_POSITION_X, *slot->x);
> -               input_event(input, EV_ABS, ABS_MT_POSITION_Y, *slot->y);
> -               input_event(input, EV_ABS, ABS_MT_TOOL_X, *slot->cx);
> -               input_event(input, EV_ABS, ABS_MT_TOOL_Y, *slot->cy);
> +               if (quirks & MT_QUIRK_FLIP_X) {
> +                       /* Inputs with a flipped X axis need to report MAX - X */
> +                       int x = input_abs_get_max(input, ABS_MT_POSITION_X) - *slot->x;

Maybe

x = quirks & MT_QUIRK_FLIP_X ?
        input_abs_get_max(input, ABS_MT_POSITION_X) - *slot->x :
        *slot->x;

and then report it all together?

> +                       int cx = input_abs_get_max(input, ABS_MT_TOOL_X) - *slot->cx;

Would like to double-check that this conversion is actually needed.

> +
> +                       input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
> +                       input_event(input, EV_ABS, ABS_MT_TOOL_X, cx);
> +               } else {
> +                       input_event(input, EV_ABS, ABS_MT_POSITION_X, *slot->x);
> +                       input_event(input, EV_ABS, ABS_MT_TOOL_X, *slot->cx);
> +               }
> +
> +               if (quirks & MT_QUIRK_FLIP_Y) {
> +                       /* Inputs with a flipped Y axis need to report MAX - Y */
> +                       int y = input_abs_get_max(input, ABS_MT_POSITION_Y) - *slot->y;
> +                       int cy = input_abs_get_max(input, ABS_MT_TOOL_Y) - *slot->cy;
> +
> +                       input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
> +                       input_event(input, EV_ABS, ABS_MT_TOOL_Y, cy);
> +               } else {
> +                       input_event(input, EV_ABS, ABS_MT_POSITION_Y, *slot->y);
> +                       input_event(input, EV_ABS, ABS_MT_TOOL_Y, *slot->cy);
> +               }
> +
>                 input_event(input, EV_ABS, ABS_MT_DISTANCE, !*slot->tip_state);
>                 input_event(input, EV_ABS, ABS_MT_ORIENTATION, orientation);

I think we might need to do something about this too as orientation will change.

>                 input_event(input, EV_ABS, ABS_MT_PRESSURE, *slot->p);
> @@ -1963,6 +1997,10 @@ static const struct hid_device_id mt_devices[] = {
>                         USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_C002) },
>
>         /* Elan devices */
> +       { .driver_data = MT_CLS_ELAN_FLIPPED,
> +               HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
> +                       USB_VENDOR_ID_ELAN, 0x2dcd) },
> +

I believe this needs to be plumbed through i2c-hid and involve DMI check as I am
concerned that product 0x2dcd might have been used in other devices where it was
mounted in a different way.

>         { .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
>                 HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>                         USB_VENDOR_ID_ELAN, 0x313a) },
> --
> 2.39.0.rc0.267.gcb52ba06e7-goog
>

Thanks,
Dmitry
