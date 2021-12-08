Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DE046D6C7
	for <lists+linux-input@lfdr.de>; Wed,  8 Dec 2021 16:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235864AbhLHPW2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Dec 2021 10:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54014 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234098AbhLHPW2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Dec 2021 10:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638976735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=V1eeeUHLXLC8bDQSjYSqndTRaDy0Gpu0xM3DBhR0gZ8=;
        b=QAjIdrpqTv4uBsKJb03Fwy347Ed6q+25Nvi9FyXJULjNd9QnFMW3vwjljNSG4/A8fBg4PY
        M54KWHX2ddNlCOSprpftWHwoeayNrgHjNq8Sl+IrFLcCY9J6DI5YZph23399Ch+5o+dj1h
        QLJHJA8o5Zi4ETvNT9/E0AMjP5BN35c=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-ldO4FLQCMbW3lJfogxi96g-1; Wed, 08 Dec 2021 10:18:54 -0500
X-MC-Unique: ldO4FLQCMbW3lJfogxi96g-1
Received: by mail-pf1-f199.google.com with SMTP id 184-20020a6217c1000000b0049f9aad0040so1717556pfx.21
        for <linux-input@vger.kernel.org>; Wed, 08 Dec 2021 07:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V1eeeUHLXLC8bDQSjYSqndTRaDy0Gpu0xM3DBhR0gZ8=;
        b=rTrGu5+gG2/6OIv/WSRZPujKlpduxBbSYekygtRFjFt1iSvVs/hqxH8bHMK/DDDK0W
         ms5WhxiaJEOil7kE1cf4ViKS1hIh8zAURh2wTGIMbUwc9UW5uZC8mvy44ucGOSbv1Cbi
         S72WorT3A972mhGslb2FB9jnFsKrRKpdH20RVVBjq263RqcN9z2y7N/wTp9ycwnGUbrP
         l6Wj99qILCkIYDnEBYJrBOKnSjrlyUeilesWKxK3ddYRuBD9RQWAGM9HVGV2ldjweOLg
         RdLiAYweK2aapNrsYlTnH8yl9hYiPIMAqgPgldiB5MMCU0enTt4gcqa8SWAaxwksJGV1
         QlhQ==
X-Gm-Message-State: AOAM532OOc4/ozhv+TvjA1laX7PUnZY0B6ATjmdG3KtvDv0krS4plJEb
        hEYxwNRto6KUw9sh3Jfflqe5a59aOaCl8RzgVTv3i+49c05Tw0FRqzhbDyD+Oa1E5yQML0oCGaa
        dmP07oyHnyYM8DcN0XSPWiLjANDtktN7oREFCEYE=
X-Received: by 2002:a63:ef44:: with SMTP id c4mr29386664pgk.146.1638976733616;
        Wed, 08 Dec 2021 07:18:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys2Q7QBy4eNh//DTIinl3pAybA34E74Ky32JhqlXhCoTaqg8gTWcGvGDVwnawsb8FU3vTUaqFyljdgK/0a2do=
X-Received: by 2002:a63:ef44:: with SMTP id c4mr29386645pgk.146.1638976733367;
 Wed, 08 Dec 2021 07:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20211201164301.44653-1-tero.kristo@linux.intel.com> <20211201164301.44653-4-tero.kristo@linux.intel.com>
In-Reply-To: <20211201164301.44653-4-tero.kristo@linux.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 8 Dec 2021 16:18:42 +0100
Message-ID: <CAO-hwJ+hzHNZVUrL9vC02t4GMBnaLym_vz7JT6+_cKEK8wEAMA@mail.gmail.com>
Subject: Re: [RFCv3 3/7] HID: core: Add support for USI style events
To:     Tero Kristo <tero.kristo@linux.intel.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 1, 2021 at 5:43 PM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>
> Add support for Universal Stylus Interface (USI) style events to the HID
> core and input layers.
>
> Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
> ---
>  drivers/hid/hid-input.c                | 18 ++++++++++++++++++
>  include/linux/mod_devicetable.h        |  2 +-
>  include/uapi/linux/hid.h               | 10 ++++++++++
>  include/uapi/linux/input-event-codes.h | 22 ++++++++++++++--------
>  4 files changed, 43 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 73c2edda742e..b428ee9b4d9b 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -829,6 +829,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                         }
>                         break;
>
> +               case 0x38: /* Transducer Index */
> +                       map_msc(MSC_PEN_ID);

This is the new slot version for pens, I am not sure we really want to
blindly introduce that without testing.

Do you have a panel that supports multiple values (at once) for this
usage (2 pens???). If not, I would simply skip that usage until we get
an actual hardware that makes use of it.

> +                       break;
> +
>                 case 0x3b: /* Battery Strength */
>                         hidinput_setup_battery(device, HID_INPUT_REPORT, field, false);
>                         usage->type = EV_PWR;
> @@ -876,6 +880,20 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                         map_msc(MSC_SERIAL);
>                         break;
>
> +               case 0x5c: map_msc(MSC_PEN_COLOR);              break;
> +               case 0x5e: map_msc(MSC_PEN_LINE_WIDTH);         break;

We already have ABS_TOOL_WIDTH which seems to relate to that very closely.

> +
> +               case 0x70:
> +               case 0x71:
> +               case 0x72:
> +               case 0x73:
> +               case 0x74:
> +               case 0x75:
> +               case 0x76:
> +               case 0x77:
> +                       map_msc(MSC_PEN_LINE_STYLE);

Nope, this is wrong. It took me a long time to understand the report
descriptor (see my last reply to your v2).
Basically, we need one input event for each value between 0x72 and
0x77. HID core should translate the array of 1 element into a set of
{depressed usage, pressed usage} and from the user-space, we will get
"MSC_PEN_STYLE_CHISEL_MARKER 1" for instance.

And *maybe* we could even use KEY events there, so we could remap them
(but that's a very distant maybe).

> +                       break;
> +
>                 default:  goto unknown;
>                 }
>                 break;
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index ae2e75d15b21..4ff40be7676b 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -322,7 +322,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_KEY_MAX                0x2ff
>  #define INPUT_DEVICE_ID_REL_MAX                0x0f
>  #define INPUT_DEVICE_ID_ABS_MAX                0x3f
> -#define INPUT_DEVICE_ID_MSC_MAX                0x07
> +#define INPUT_DEVICE_ID_MSC_MAX                0x09
>  #define INPUT_DEVICE_ID_LED_MAX                0x0f
>  #define INPUT_DEVICE_ID_SND_MAX                0x07
>  #define INPUT_DEVICE_ID_FF_MAX         0x7f
> diff --git a/include/uapi/linux/hid.h b/include/uapi/linux/hid.h
> index 861bfbbfc565..60ef9b615a1a 100644
> --- a/include/uapi/linux/hid.h
> +++ b/include/uapi/linux/hid.h
> @@ -255,6 +255,7 @@
>  #define HID_DG_TOUCH                           0x000d0033
>  #define HID_DG_UNTOUCH                         0x000d0034
>  #define HID_DG_TAP                             0x000d0035
> +#define HID_DG_TRANSDUCER_INDEX                        0x000d0038
>  #define HID_DG_TABLETFUNCTIONKEY               0x000d0039
>  #define HID_DG_PROGRAMCHANGEKEY                        0x000d003a
>  #define HID_DG_BATTERYSTRENGTH                 0x000d003b
> @@ -267,6 +268,15 @@
>  #define HID_DG_BARRELSWITCH                    0x000d0044
>  #define HID_DG_ERASER                          0x000d0045
>  #define HID_DG_TABLETPICK                      0x000d0046
> +#define HID_DG_PEN_COLOR                       0x000d005c
> +#define HID_DG_PEN_LINE_WIDTH                  0x000d005e
> +#define HID_DG_PEN_LINE_STYLE                  0x000d0070
> +#define HID_DG_PEN_LINE_STYLE_INK              0x000d0072
> +#define HID_DG_PEN_LINE_STYLE_PENCIL           0x000d0073
> +#define HID_DG_PEN_LINE_STYLE_HIGHLIGHTER      0x000d0074
> +#define HID_DG_PEN_LINE_STYLE_CHISEL_MARKER    0x000d0075
> +#define HID_DG_PEN_LINE_STYLE_BRUSH            0x000d0076
> +#define HID_DG_PEN_LINE_STYLE_NO_PREFERENCE    0x000d0077

Could you integrate that patch before my patch "HID: export the
various HID defines from the spec in the uapi"? And also have it as a
separate patch from the mapping?
This way I can schedule that part earlier before we settle on the
actual user space usages.

>
>  #define HID_CP_CONSUMERCONTROL                 0x000c0001
>  #define HID_CP_NUMERICKEYPAD                   0x000c0002
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 225ec87d4f22..98295f71941a 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -901,14 +901,20 @@
>   * Misc events
>   */
>
> -#define MSC_SERIAL             0x00
> -#define MSC_PULSELED           0x01
> -#define MSC_GESTURE            0x02
> -#define MSC_RAW                        0x03
> -#define MSC_SCAN               0x04
> -#define MSC_TIMESTAMP          0x05
> -#define MSC_MAX                        0x07
> -#define MSC_CNT                        (MSC_MAX+1)
> +#define MSC_SERIAL                     0x00
> +#define MSC_PULSELED                   0x01
> +#define MSC_GESTURE                    0x02
> +#define MSC_RAW                                0x03
> +#define MSC_SCAN                       0x04
> +#define MSC_TIMESTAMP                  0x05
> +/* USI Pen events */
> +#define MSC_PEN_ID                     0x06
> +#define MSC_PEN_COLOR                  0x07
> +#define MSC_PEN_LINE_WIDTH             0x08

PEN_LINE_WIDTH should be dropped.

> +#define MSC_PEN_LINE_STYLE             0x09

Again, PEN_LINE_STYLE is HID only and we should only map the values,
not the title of the array.

Cheers,
Benjamin

> +/* TODO: Add USI diagnostic & battery events too */
> +#define MSC_MAX                                0x09
> +#define MSC_CNT                                (MSC_MAX + 1)
>
>  /*
>   * LEDs
> --
> 2.25.1
>

