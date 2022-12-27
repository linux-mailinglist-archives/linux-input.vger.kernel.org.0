Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE8B656CDA
	for <lists+linux-input@lfdr.de>; Tue, 27 Dec 2022 17:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiL0Q22 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Dec 2022 11:28:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiL0Q21 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Dec 2022 11:28:27 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F3DDCC
        for <linux-input@vger.kernel.org>; Tue, 27 Dec 2022 08:28:25 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-47fc4e98550so47790367b3.13
        for <linux-input@vger.kernel.org>; Tue, 27 Dec 2022 08:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vg8Tc94Mop41P7ffQ8b8i0S3favWIpClblDca3K7MM=;
        b=Pa/1x2ld32oWyfqWed1GfpnoG2sAT2YYH1pxWlOLhKQuD87cQ1/2YjC64UKm2QpUZJ
         Wv6zfs8tRZIWE+uMAdKJu7bucZ8v+lPnE/GUudZK3MrqWTzBABDroMsAPtA2LtxUcNs1
         2x/hym/ytFCCksV2J3yuvkVkYIjrY0u9ZM52HMwsxZCX+qP+h58KY2czkauebue0Sfbi
         eq0s7gKB9pfbEjMrZ5UXKDova0XkH7HmO4ooDUwzSY9NkdJSon8aKZBCjjx6S4TPUnaj
         VrhuJLv667Y6+zI6og8zIMBf66poee78AKh9vJ7IZo9SVWy+cK6I7Lp11xeWFBmpAP7q
         Hb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vg8Tc94Mop41P7ffQ8b8i0S3favWIpClblDca3K7MM=;
        b=AuhZ9uTnB+wnP4cpTQrSZG6uiGAb4iPIh3yZzAu/YQV4KZj4v3iLBaYFkBT/G7yEjk
         WUjJW1QiHuOHZ+kR9w0vK7FYTvomTjInQL9BDG9XVEfBpiZMyISk65I14Y9/p07H9ohL
         V0HBxyJECm1Gju05nPYMRcgK4jOD9aksJ/tARNzFZELgoGjYBuwpTIJpS+bNtxzCByf5
         +QpkBW+JJfLVbfiOuB04m0vHQSzEK6xXqrpPpMatcdgQjp7tsCxC856tAmJ45BPGl/HS
         bnRKXdDG/GVYOxFdXCxoji2B5Cx/+4T2MSAfh9UKQuOZJLPc712OSvDRDFmxGrmcN/9L
         DCWw==
X-Gm-Message-State: AFqh2kruyqANscf+Fr/EwM0aQF+BjzJvYwMsh7+NTwx4yYOcKaup7idv
        +/K9OtuiPcf4OpdDFFpEYGf3R30nCPIbcwOEp5c=
X-Google-Smtp-Source: AMrXdXuwLm0zBhVxRqO3CF3WqiPLb/EllI8OWyW8xn116EkByhuU1U6q2khnE6B8WcPEF+2e+4Y7mHIlUWRKz5dwrOA=
X-Received: by 2002:a0d:dd4f:0:b0:425:7131:1f38 with SMTP id
 g76-20020a0ddd4f000000b0042571311f38mr3328498ywe.517.1672158505056; Tue, 27
 Dec 2022 08:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20221223172130.938395-1-giuseppe.bilotta@gmail.com>
In-Reply-To: <20221223172130.938395-1-giuseppe.bilotta@gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Tue, 27 Dec 2022 08:28:14 -0800
Message-ID: <CAEc3jaBwTHiC5_JBdYm1eO-zdingohQsbndGEPWnTbRSW_tzmw@mail.gmail.com>
Subject: Re: [RFC PATCH] HID: support the NACON / BigBen PS4 / PC Compact controller
To:     Giuseppe Bilotta <giuseppe.bilotta@gmail.com>
Cc:     Linux Input ML <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Giuseppe,

Thanks for your work so far. My first thought was 'yikes what an ugly
device'. I'm not really sure what the best way of handling it is.

First is the device a HID device? It would normally be picked up by
hid-generic. You can try dumping the HID descriptors.

It is a bit ugly if the device has to spawn multiple drivers. My
initial gut feeling would have been to complete the support within the
xpad driver. My understanding of our licensed controllers is that the
HID protocol they use is different from the DS4 protocol, so it is
really like handling an entire new device needing its own HID report
parsing. So, no matter what each driver would have needed some changes
to deal with the device properly and it is probably smallest in xpad.
You mention access flipping and then the touchpad.

Thanks,
Roderick

On Fri, Dec 23, 2022 at 9:25 AM Giuseppe Bilotta
<giuseppe.bilotta@gmail.com> wrote:
>
> ---
>
> I have recently come into possession of a NACON / Big Ben Interactive
> USB wired PC Compact controller (USB vendor:device 146b:0603).
> This is advertised as an =C2=ABofficially licensed PS4=E2=84=A2 wired con=
troller=C2=BB
> that =C2=ABalso boasts full compatibility with PC games=C2=BB.
>
> It is supposed to be similar to a DualShock 4 controller except for the
> lack of built-in speaker, light bar and =E2=80=9CSIXAXIS=E2=80=9D motion =
sensor.
> In particular, in addition to the typical gamepad goodies, it has a
> built-in touchpad and an audio jack.
>
> As things are currently, the Linux kernel automatically matches it with
> the xpad driver, that detects this as a =E2=80=9CGeneric X-Box controller=
=E2=80=9D.
> This kind of works, but in addition to minor issues such as the default
> axis mapping being wrong (which could be fixed in the xpad driver),
> the major downside for the xpad driver binding to the controller
> is that it fails to expose the touchpad and the audio jack.
>
> My hope was to let the xpad driver skip this device, and to manage it
> through the hid subsystem, expecting the hid-sony and/or hid-playstation
> drivers to be able to manage it.
>
> However, I obviously don't understand enough about how the hid driver
> manages the bindings, and so far I've been at a loss about making this
> work. The hack to ignore the device in xpad works, although it's a
> horrible hack that probably shouldn't be needed in the first place,
> but the HID subsystem doesn't seem to pick up the device.
> This patch is my very poor (and currently NOT WORKING) attempt,
> and since I'm obviously going at this all wrong, I'd be glad for
> any recommendations on how to approach this.
>
> Cheers,
>
> Giuseppe Bilotta
>
>
>  drivers/hid/hid-ids.h         | 1 +
>  drivers/hid/hid-playstation.c | 5 ++++-
>  drivers/hid/hid-quirks.c      | 1 +
>  drivers/hid/hid-sony.c        | 3 +++
>  drivers/input/joystick/xpad.c | 5 +++++
>  5 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 82713ef3aaa6..78d993415071 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -250,6 +250,7 @@
>  #define USB_VENDOR_ID_BETOP_2185V2BFM  0x20bc
>
>  #define USB_VENDOR_ID_BIGBEN   0x146b
> +#define USB_DEVICE_ID_BIGBEN_PC_COMPACT_CONTROLLER     0x0603
>  #define USB_DEVICE_ID_BIGBEN_PS3OFMINIPAD      0x0902
>
>  #define USB_VENDOR_ID_BTC              0x046e
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index f399bf0d3c8c..8302394479bd 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -2589,7 +2589,8 @@ static int ps_probe(struct hid_device *hdev, const =
struct hid_device_id *id)
>                 goto err_stop;
>         }
>
> -       if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS4_CONTROLLER ||
> +       if (hdev->product =3D=3D USB_DEVICE_ID_BIGBEN_PC_COMPACT_CONTROLL=
ER ||
> +               hdev->product =3D=3D USB_DEVICE_ID_SONY_PS4_CONTROLLER ||
>                 hdev->product =3D=3D USB_DEVICE_ID_SONY_PS4_CONTROLLER_2 =
||
>                 hdev->product =3D=3D USB_DEVICE_ID_SONY_PS4_CONTROLLER_DO=
NGLE) {
>                 dev =3D dualshock4_create(hdev);
> @@ -2632,6 +2633,8 @@ static void ps_remove(struct hid_device *hdev)
>  }
>
>  static const struct hid_device_id ps_devices[] =3D {
> +       /* NACON / BigBen Interact Wired PC Compact controller */
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_BIGBEN, USB_DEVICE_ID_BIGBEN=
_PC_COMPACT_CONTROLLER) },
>         /* Sony DualShock 4 controllers for PS4 */
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4=
_CONTROLLER) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTR=
OLLER) },
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 0e9702c7f7d6..fa9503257621 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -639,6 +639,7 @@ static const struct hid_device_id hid_have_special_dr=
iver[] =3D {
>         { HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP_LTD, USB_DEVICE_ID_SUPER=
_JOY_BOX_5_PRO) },
>  #endif
>  #if IS_ENABLED(CONFIG_HID_SONY)
> +       { HID_USB_DEVICE(USB_VENDOR_ID_BIGBEN, USB_DEVICE_ID_BIGBEN_PC_CO=
MPACT_CONTROLLER) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGI=
TECH_HARMONY_PS3) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_PS3_B=
DREMOTE) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_NSG_M=
R5U_REMOTE) },
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index 13125997ab5e..4f5d5643dd19 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -3180,6 +3180,9 @@ static const struct hid_device_id sony_devices[] =
=3D {
>         /* SMK-Link PS3 BD Remote Control */
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SMK, USB_DEVICE_ID_SMK_PS3_B=
DREMOTE),
>                 .driver_data =3D PS3REMOTE },
> +       /* NACON / BigBen Interact Wired PC Compact controller */
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_BIGBEN, USB_DEVICE_ID_BIGBEN=
_PC_COMPACT_CONTROLLER),
> +               .driver_data =3D DUALSHOCK4_CONTROLLER_USB },
>         /* Sony Dualshock 4 controllers for PS4 */
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTR=
OLLER),
>                 .driver_data =3D DUALSHOCK4_CONTROLLER_USB },
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.=
c
> index 2959d80f7fdb..d3d3ce84bd6c 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -92,6 +92,7 @@
>  #define XTYPE_XBOX360W    2
>  #define XTYPE_XBOXONE     3
>  #define XTYPE_UNKNOWN     4
> +#define XTYPE_NOTXBOX     0xff
>
>  /* Send power-off packet to xpad360w after holding the mode button for t=
his many
>   * seconds
> @@ -281,6 +282,7 @@ static const struct xpad_device {
>         { 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPA=
D_TO_BUTTONS, XTYPE_XBOX },
>         { 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
>         { 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, XT=
YPE_XBOX360 },
> +       { 0x146b, 0x0603, "BigBen Interactive PC Compact Controller", 0, =
XTYPE_NOTXBOX },
>         { 0x146b, 0x0604, "Bigben Interactive DAIJA Arcade Stick", MAP_TR=
IGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>         { 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
>         { 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUT=
TONS, XTYPE_XBOXONE },
> @@ -1951,6 +1953,9 @@ static int xpad_probe(struct usb_interface *intf, c=
onst struct usb_device_id *id
>                         break;
>         }
>
> +       if (xpad_device[i].xtype =3D=3D XTYPE_NOTXBOX)
> +               return -ENODEV;
> +
>         xpad =3D kzalloc(sizeof(struct usb_xpad), GFP_KERNEL);
>         if (!xpad)
>                 return -ENOMEM;
> --
> 2.39.0
>
