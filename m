Return-Path: <linux-input+bounces-5097-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027F93797B
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 17:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 934731C20899
	for <lists+linux-input@lfdr.de>; Fri, 19 Jul 2024 15:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9804412FB31;
	Fri, 19 Jul 2024 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRa15t3y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC400143745
	for <linux-input@vger.kernel.org>; Fri, 19 Jul 2024 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721401371; cv=none; b=FdOcFXnvr+I3mvgsSPp9HFQHUUAb0FigRInUuauDhd4ZaNvvRU5FEUykTRIJsVK/Ojc5feCIB4kPhZs5AkmBpOLCZiOTSDrSiFW65NQpyrcTTlnlpLQWytxP18JBfLtEXqH95WZkEGijdcxaBb10VcMMcxamCcCn8Wv6bxvGLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721401371; c=relaxed/simple;
	bh=ZLBKaVSEyke8IOcKyoVFaEl0jogxVOo26xbP7GAXIns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DjtdjN7odCDp6MGxPYU/QUifHQcZw7QE1p0cMna4O6AxYzf/QROYjjTDgyGaxLKfW8lG/JXZsH0xXWucm5fjTAif7EY/ck7KOYDA8Qxxhm74SB/M6OtvpkXR3izxV/lkH669Qr9w5Det0ngYhta86F8op4RwkFUpGsy0HUAQKS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRa15t3y; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cb57e25387so1150071a91.3
        for <linux-input@vger.kernel.org>; Fri, 19 Jul 2024 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721401369; x=1722006169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfSWHx01AxX04nVgL00lQ020050SyONTcJFWg1fxVYM=;
        b=NRa15t3yVF6lF+WLQkyWiDCKiWPSmwc2vsr/wu6aciKqMc04fPe6y/9SNBxCIAZlY3
         Cry2WgmojZ8k4nLvFM11nbDiMcm4Zl2fl/7LPtGfiUTN5jjFqzpzKMQvCfoUDKf7DB0o
         MqgW5Jk1Sr/D/GJbUmR8ryycfrpSJOMHZtGuH50WJycV9FgP58CouMBOsTyMx6LTKsKh
         /39ZEZy8XQ36/32RzOE3xbay/ppgvg+l6nhc6IVWj5oxhNimLVYIfzh0uR841IBC4mcE
         M2nb6i2SCuccbxFd7DB43GRjIN7v5t1DTvt0eeGLlR1AVWxLgXx01SNSDw8iOYQtsYN1
         3jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721401369; x=1722006169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfSWHx01AxX04nVgL00lQ020050SyONTcJFWg1fxVYM=;
        b=Eu7F4l71s7EHNdZwLDEhH0eQDQY2DdvlcGVuLZ1I2YSOJ3F2whBnkblEoAWgU0YA1G
         CFBWc3ie+actYd4hWXnai1aRLDqt8zsAlo6XDqMXQiEirlJazvbgVUugKANUWzbEs1VJ
         dUirL+YKviGns07/HHJpeXNepixjLYVEasMoJiD8PgXa9M0IICOMO66zI0e4OAzYaQNL
         wF+3AcJAMKfY3pRdnX1lh2/6o3okvY3kibkmSZvwwTu8Nf7UaPDIMABZ3DeHsc0MEaSg
         QN/hN5wnOoFHR2TVMxKd3FkQRmNq5z4/ToKuUwr1ckqgISKQtQz/ZB1jsGhtrFRrORJZ
         PuFQ==
X-Gm-Message-State: AOJu0YytmlV1QGN7T3eg94AoqGTAVKgKSHZHsQdat1G94J9Ig6H0q2jk
	3WbEiB//W9bgXWUQn6eWAQIceKPXSCinVudsbd1MyXo/HWSxVjmxnx7OXUv12VIuUbQ9kEU1zvh
	P7goNipU8k6zn9YCd65h/0Ca6Sgi6tXqSS94=
X-Google-Smtp-Source: AGHT+IEPMchNKS5dWismG7Ai0/Pn+WOXLqcd64VaR8icdNYzuoWWZ3MYiyvvZktGFbNnUxTAb96aMM1PYrVDNyiGXzI=
X-Received: by 2002:a17:90a:fd04:b0:2cb:4f14:2a70 with SMTP id
 98e67ed59e1d1-2cb529327f7mr7036049a91.30.1721401368724; Fri, 19 Jul 2024
 08:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240719141109.2279-1-daniel.cm.nguyen@gmail.com>
In-Reply-To: <20240719141109.2279-1-daniel.cm.nguyen@gmail.com>
From: Daniel Nguyen <daniel.cm.nguyen@gmail.com>
Date: Fri, 19 Jul 2024 11:02:29 -0400
Message-ID: <CAEJV-FFkJCq9K+3_BsSXpciAUnH6Wj-EgVk4xenUWifO4n=p0A@mail.gmail.com>
Subject: Re: [PATCH] Input: xpad - add support for GHL Xbox One controller
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, pascal.giard@gmail.com, 
	Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>, Pascal Giard <pascal.giard@etsmtl.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dmitry,

On Fri, Jul 19, 2024 at 10:11=E2=80=AFAM Daniel Nguyen
<daniel.cm.nguyen@gmail.com> wrote:
>
> From: Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
>
> This commit adds support for the Guitar Hero Live (GHL) Xbox One dongles.
>
> These dongles require a "magic" USB interrupt message to be sent every 8
> seconds, otherwise the dongle will not report events where the strumbar
> is hit while a fret is being held.
>
> Therefore, ghl_poke_timer and ghl_urb are added to struct usb_xpad.
> ghl_poke_timer ensures periodicity and ghl_urb contains the "magic"
> data.
>
> The mapping of buttons and axes was chosen to be coherent with GHL
> dongles of other consoles. Refer to drivers/hid/hid-sony.c.
>
> Co-developed-by: Pascal Giard <pascal.giard@etsmtl.ca>
> Signed-off-by: Pascal Giard <pascal.giard@etsmtl.ca>
> Signed-off-by: Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
> ---
>  drivers/input/joystick/xpad.c | 182 +++++++++++++++++++++++++++++++++-
>  1 file changed, 179 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.=
c
> index 40a4ddee0b14..13c82c0d6461 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -11,6 +11,8 @@
>   *               2006 Adam Buchbinder <adam.buchbinder@gmail.com>
>   *               2007 Jan Kratochvil <honza@jikos.cz>
>   *               2010 Christoph Fritz <chf.fritz@googlemail.com>
> + *               2024 Pascal Giard <pascal.giard@etsmtl.ca>
> + *               2024 Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
>   *
>   * This driver is based on:
>   *  - information from     http://euc.jp/periphs/xbox-controller.ja.html
> @@ -70,9 +72,16 @@
>  #include <linux/module.h>
>  #include <linux/usb/input.h>
>  #include <linux/usb/quirks.h>
> +#include <linux/timer.h>
>
>  #define XPAD_PKT_LEN 64
>
> +/*
> + * The Guitar Hero Live (GHL) Xbox One dongles require a poke
> + * every 8 seconds.
> + */
> +#define GHL_GUITAR_POKE_INTERVAL 8 /* in seconds */
> +
>  /*
>   * xbox d-pads should map to buttons, as is required for DDR pads
>   * but we map them to axes when possible to simplify things
> @@ -104,6 +113,8 @@
>  #define PKT_XBE2_FW_5_EARLY 3
>  #define PKT_XBE2_FW_5_11    4
>
> +#define QUIRK_GHL_XBOXONE      BIT(0)
> +
>  static bool dpad_to_buttons;
>  module_param(dpad_to_buttons, bool, S_IRUGO);
>  MODULE_PARM_DESC(dpad_to_buttons, "Map D-PAD to buttons rather than axes=
 for unknown pads");
> @@ -126,6 +137,7 @@ static const struct xpad_device {
>         char *name;
>         u8 mapping;
>         u8 xtype;
> +       u8 quirks;
>  } xpad_device[] =3D {
>         /* Please keep this list sorted by vendor and product ID. */
>         { 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 =
},
> @@ -209,6 +221,7 @@ static const struct xpad_device {
>         { 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 =
},
>         { 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
>         { 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
> +       { 0x0b05, 0x1abb, "ASUS ROG RAIKIRI PRO", 0, XTYPE_XBOXONE },
>         { 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
>         { 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
>         { 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },

We just noticed that this addition is part of the patch by mistake.
It will be removed in v2.

> @@ -286,6 +299,7 @@ static const struct xpad_device {
>         { 0x12ab, 0x0301, "PDP AFTERGLOW AX.1", 0, XTYPE_XBOX360 },
>         { 0x12ab, 0x0303, "Mortal Kombat Klassic FightStick", MAP_TRIGGER=
S_TO_BUTTONS, XTYPE_XBOX360 },
>         { 0x12ab, 0x8809, "Xbox DDR dancepad", MAP_DPAD_TO_BUTTONS, XTYPE=
_XBOX },
> +       { 0x1430, 0x079B, "RedOctane GHL Controller", 0, XTYPE_XBOXONE, Q=
UIRK_GHL_XBOXONE},
>         { 0x1430, 0x4748, "RedOctane Guitar Hero X-plorer", 0, XTYPE_XBOX=
360 },
>         { 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPA=
D_TO_BUTTONS, XTYPE_XBOX },
>         { 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
> @@ -443,6 +457,12 @@ static const signed short xpad_btn_paddles[] =3D {
>         -1                                              /* terminating en=
try */
>  };
>
> +/* used for the dmap mapping of the GHL Xbox One dongle */
> +static const struct {int x; int y; } xpad_dpad_ghl[] =3D {
> +       {0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, =
-1},
> +       {0, 0}
> +};
> +
>  /*
>   * Xbox 360 has a vendor-specific class, so we cannot match it with only
>   * USB_INTERFACE_INFO (also specifically refused by USB subsystem), so w=
e
> @@ -502,6 +522,7 @@ static const struct usb_device_id xpad_table[] =3D {
>         XPAD_XBOX360_VENDOR(0x1209),            /* Ardwiino Controllers *=
/
>         XPAD_XBOX360_VENDOR(0x12ab),            /* Xbox 360 dance pads */
>         XPAD_XBOX360_VENDOR(0x1430),            /* RedOctane Xbox 360 con=
trollers */
> +       XPAD_XBOXONE_VENDOR(0x1430),            /* RedOctane Xbox One con=
trollers */
>         XPAD_XBOX360_VENDOR(0x146b),            /* Bigben Interactive con=
trollers */
>         XPAD_XBOX360_VENDOR(0x1532),            /* Razer Sabertooth */
>         XPAD_XBOXONE_VENDOR(0x1532),            /* Razer Wildcat */
> @@ -666,6 +687,14 @@ static const u8 xboxone_rumbleend_init[] =3D {
>         0x00, GIP_MOTOR_ALL, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
>  };
>
> +/*
> + * Magic data for the GHL Xbox One dongles sniffed with a USB
> + * protocol analyzer.
> + */
> +static const char ghl_xboxone_magic_data[] =3D {
> +       0x22, 0x00, 0x00, 0x08, 0x02, 0x08, 0x0A, 0x00, 0x00, 0x00, 0x00,=
 0x00
> +};
> +
>  /*
>   * This specifies the selection of init packets that a gamepad
>   * will be sent on init *and* the order in which they will be
> @@ -675,12 +704,15 @@ static const u8 xboxone_rumbleend_init[] =3D {
>  static const struct xboxone_init_packet xboxone_init_packets[] =3D {
>         XBOXONE_INIT_PKT(0x0e6f, 0x0165, xboxone_hori_ack_id),
>         XBOXONE_INIT_PKT(0x0f0d, 0x0067, xboxone_hori_ack_id),
> +       XBOXONE_INIT_PKT(0x1430, 0x079b, xboxone_hori_ack_id),
>         XBOXONE_INIT_PKT(0x0000, 0x0000, xboxone_power_on),
>         XBOXONE_INIT_PKT(0x045e, 0x02ea, xboxone_s_init),
>         XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
>         XBOXONE_INIT_PKT(0x045e, 0x0b00, extra_input_packet_init),
>         XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_led_on),
> +       XBOXONE_INIT_PKT(0x1430, 0x079b, xboxone_pdp_led_on),
>         XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_auth),
> +       XBOXONE_INIT_PKT(0x1430, 0x079b, xboxone_pdp_auth),
>         XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
>         XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
>         XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
> @@ -740,6 +772,10 @@ struct usb_xpad {
>         const char *name;               /* name of the device */
>         struct work_struct work;        /* init/remove device from callba=
ck */
>         time64_t mode_btn_down_ts;
> +       int quirks;
> +       struct urb *ghl_urb;            /* URB for GHL Xbox One dongle ma=
gic data */
> +       /* timer for periodic poke of Xbox One dongle with magic data */
> +       struct timer_list ghl_poke_timer;
>  };
>
>  static int xpad_init_input(struct usb_xpad *xpad);
> @@ -747,6 +783,63 @@ static void xpad_deinit_input(struct usb_xpad *xpad)=
;
>  static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num);
>  static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
>
> +/*
> + *     ghl_magic_poke_cb
> + *
> + *     Callback function that resets the timer for the next magic data p=
oke
> + *     as required by the GHL Xbox One dongle.
> + */
> +static void ghl_magic_poke_cb(struct urb *urb)
> +{
> +       struct usb_xpad *xpad =3D urb->context;
> +
> +       if (urb->status < 0)
> +               pr_warn("URB transfer failed.\n");
> +
> +       mod_timer(&xpad->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERV=
AL * HZ);
> +}
> +
> +/*
> + *     ghl_magic_poke
> + *
> + *     Submits the magic_data URB as required by the GHL Xbox One dongle=
.
> + */
> +static void ghl_magic_poke(struct timer_list *t)
> +{
> +       int ret;
> +       struct usb_xpad *xpad =3D from_timer(xpad, t, ghl_poke_timer);
> +
> +       ret =3D usb_submit_urb(xpad->ghl_urb, GFP_ATOMIC);
> +       if (ret < 0)
> +               pr_warn("URB transfer failed.\n");
> +}
> +
> +/*
> + *     ghl_init_urb
> + *
> + *     Prepares the interrupt URB for magic_data as required by the GHL =
Xbox One dongle.
> + */
> +static int ghl_init_urb(struct usb_xpad *xpad, struct usb_device *usbdev=
,
> +                       const char ghl_magic_data[], u16 poke_size,
> +                       struct usb_endpoint_descriptor *ep_irq_out)
> +{
> +       u8 *databuf;
> +       unsigned int pipe;
> +
> +       pipe =3D usb_sndintpipe(usbdev, ep_irq_out->bEndpointAddress);
> +
> +       databuf =3D devm_kzalloc(&xpad->udev->dev, poke_size, GFP_ATOMIC)=
;
> +       if (!databuf)
> +               return -ENOMEM;
> +
> +       memcpy(databuf, ghl_magic_data, poke_size);
> +
> +       usb_fill_int_urb(xpad->ghl_urb, usbdev, pipe, databuf, poke_size,
> +                        ghl_magic_poke_cb, xpad, ep_irq_out->bInterval);
> +
> +       return 0;
> +}
> +
>  /*
>   *     xpad_process_packet
>   *
> @@ -995,6 +1088,7 @@ static void xpadone_process_packet(struct usb_xpad *=
xpad, u16 cmd, unsigned char
>  {
>         struct input_dev *dev =3D xpad->dev;
>         bool do_sync =3D false;
> +       int dpad_value;
>
>         /* the xbox button has its own special report */
>         if (data[0] =3D=3D GIP_CMD_VIRTUAL_KEY) {
> @@ -1141,6 +1235,50 @@ static void xpadone_process_packet(struct usb_xpad=
 *xpad, u16 cmd, unsigned char
>                         }
>                 }
>
> +               do_sync =3D true;
> +       } else if (data[0] =3D=3D 0X21) { /* The main valid packet type f=
or GHL inputs */
> +               /* Mapping chosen to be coherent with GHL dongles of othe=
r consoles:
> +                * PS2, WiiU & PS4.
> +                *
> +                * Refer to drivers/hid/hid-sony.c.
> +                */
> +               /* The 6 fret buttons */
> +               input_report_key(dev, BTN_A, data[4] & BIT(0));
> +               input_report_key(dev, BTN_B, data[4] & BIT(1));
> +               input_report_key(dev, BTN_X, data[4] & BIT(2));
> +               input_report_key(dev, BTN_Y, data[4] & BIT(3));
> +               input_report_key(dev, BTN_TL, data[4] & BIT(4));
> +               input_report_key(dev, BTN_TR, data[4] & BIT(5));
> +
> +               /* D-pad */
> +               dpad_value =3D data[6] & 0xF;
> +               if (dpad_value > 7)
> +                       dpad_value =3D 8;
> +
> +               input_report_abs(dev, ABS_HAT0X, xpad_dpad_ghl[dpad_value=
].x);
> +               input_report_abs(dev, ABS_HAT0Y, xpad_dpad_ghl[dpad_value=
].y);
> +
> +               /* Strum bar */
> +               input_report_abs(dev, ABS_Y, ((data[8] - 0x80) << 9));
> +
> +               /* Tilt sensor */
> +               input_report_abs(dev, ABS_Z, ((data[9] - 0x80) << 9));
> +
> +               /* Whammy bar */
> +               input_report_abs(dev, ABS_RZ, ((data[10] - 0x80) << 9));
> +
> +               /* Power button */
> +               input_report_key(dev, BTN_THUMBR, data[5] & BIT(4));
> +
> +               /* GHTV button */
> +               input_report_key(dev, BTN_START, data[5] & BIT(2));
> +
> +               /* Hero Power button */
> +               input_report_key(dev, BTN_MODE, data[5] & BIT(0));
> +
> +               /* Pause button */
> +               input_report_key(dev, BTN_THUMBL, data[5] & BIT(1));
> +
>                 do_sync =3D true;
>         }
>
> @@ -1862,16 +2000,29 @@ static void xpad_set_up_abs(struct input_dev *inp=
ut_dev, signed short abs)
>         switch (abs) {
>         case ABS_X:
>         case ABS_Y:
> +               /* GHL Strum bar */
> +               if (xpad->xtype =3D=3D XTYPE_XBOXONE && xpad->quirks & QU=
IRK_GHL_XBOXONE)
> +                       input_set_abs_params(input_dev, abs, -32768, 3276=
7, 0, 0);
> +               break;
>         case ABS_RX:
>         case ABS_RY:    /* the two sticks */
>                 input_set_abs_params(input_dev, abs, -32768, 32767, 16, 1=
28);
>                 break;
>         case ABS_Z:
> +               /* GHL Tilt sensor */
> +               if (xpad->xtype =3D=3D XTYPE_XBOXONE && xpad->quirks & QU=
IRK_GHL_XBOXONE)
> +                       input_set_abs_params(input_dev, abs, -32768, 3276=
7, 0, 0);
> +               break;
>         case ABS_RZ:    /* the triggers (if mapped to axes) */
> -               if (xpad->xtype =3D=3D XTYPE_XBOXONE)
> -                       input_set_abs_params(input_dev, abs, 0, 1023, 0, =
0);
> -               else
> +               if (xpad->xtype =3D=3D XTYPE_XBOXONE) {
> +                       /* GHL Whammy bar */
> +                       if (xpad->quirks & QUIRK_GHL_XBOXONE)
> +                               input_set_abs_params(input_dev, abs, -327=
68, 32767, 0, 0);
> +                       else
> +                               input_set_abs_params(input_dev, abs, 0, 1=
023, 0, 0);
> +               } else {
>                         input_set_abs_params(input_dev, abs, 0, 255, 0, 0=
);
> +               }
>                 break;
>         case ABS_HAT0X:
>         case ABS_HAT0Y: /* the d-pad (only if dpad is mapped to axes */
> @@ -2047,6 +2198,7 @@ static int xpad_probe(struct usb_interface *intf, c=
onst struct usb_device_id *id
>         xpad->mapping =3D xpad_device[i].mapping;
>         xpad->xtype =3D xpad_device[i].xtype;
>         xpad->name =3D xpad_device[i].name;
> +       xpad->quirks =3D xpad_device[i].quirks;
>         xpad->packet_type =3D PKT_XB;
>         INIT_WORK(&xpad->work, xpad_presence_work);
>
> @@ -2169,8 +2321,26 @@ static int xpad_probe(struct usb_interface *intf, =
const struct usb_device_id *id
>                 if (error)
>                         goto err_deinit_output;
>         }
> +
> +       if (xpad->quirks & QUIRK_GHL_XBOXONE) {
> +               xpad->ghl_urb =3D usb_alloc_urb(0, GFP_ATOMIC);
> +               if (!xpad->ghl_urb) {
> +                       error =3D -ENOMEM;
> +                       goto err_deinit_output;
> +               }
> +
> +               error =3D ghl_init_urb(xpad, udev, ghl_xboxone_magic_data=
,
> +                                    ARRAY_SIZE(ghl_xboxone_magic_data), =
ep_irq_out);
> +               if (error)
> +                       goto err_free_ghl_urb;
> +
> +               timer_setup(&xpad->ghl_poke_timer, ghl_magic_poke, 0);
> +               mod_timer(&xpad->ghl_poke_timer, jiffies + GHL_GUITAR_POK=
E_INTERVAL * HZ);
> +       }
>         return 0;
>
> +err_free_ghl_urb:
> +       usb_free_urb(xpad->ghl_urb);
>  err_deinit_output:
>         xpad_deinit_output(xpad);
>  err_free_in_urb:
> @@ -2200,6 +2370,12 @@ static void xpad_disconnect(struct usb_interface *=
intf)
>         xpad_deinit_output(xpad);
>
>         usb_free_urb(xpad->irq_in);
> +
> +       if (xpad->quirks & QUIRK_GHL_XBOXONE) {
> +               usb_free_urb(xpad->ghl_urb);
> +               del_timer_sync(&xpad->ghl_poke_timer);
> +       }
> +
>         usb_free_coherent(xpad->udev, XPAD_PKT_LEN,
>                         xpad->idata, xpad->idata_dma);
>
> --
> 2.34.1
>

I apologize for that line of code regarding ASUS ROG RAIKIRI PRO that
does not belong in this patch.
I'll await your feedback before submitting a v2.
Thank you for your time!
Daniel

