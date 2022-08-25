Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29BA5A1A8A
	for <lists+linux-input@lfdr.de>; Thu, 25 Aug 2022 22:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbiHYUr5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Aug 2022 16:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiHYUr5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 16:47:57 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA36AE210
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 13:47:55 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id n202so11461259iod.6
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 13:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=4F8cSWmh+8BwSkES38dyl9Egk88x1QpdTtiScQIAc5w=;
        b=T1+pgJZQGMLCey2y5tTb5KfMKerCh9OBkLeAZFG7mJyaHzVq1FRGr68CyU4yJT6IsV
         DkEt2Ck0TsnqtGqGHAS7U2UwB9MA9ZCc2UlXa5TS/ZdMTQ6bmIo0rP3iAm7MEb23Cm2i
         041eOLDkn4i9CMjNHoxDiq6EsnD6ho9828JU84H0d5lIBZ3AQm+fn1C6wgGf6Kk97xaW
         rmgEqp/+a27hB15nPl6jgTcU2Y/Axzq7GBW8KKFbE1jYDNvUA9AMxTbHgDtsFQkpdiVD
         WA/0s7XRoPJQKkv0/tjPhe9lXq4smYAN8iteU/Q9K6+dSSCoOjkuOLFoG+e9bBXorzdr
         xh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=4F8cSWmh+8BwSkES38dyl9Egk88x1QpdTtiScQIAc5w=;
        b=PhxnDhL2KWLUksfAk5c4weTY2U/AoKV0nXexEXxF2ibsm8V150qcFlJvlpv9evk47Z
         J+QPqgToMt3FKzdZlPgR3/M1/XMEA38F3PjS5+EQSmKcTk0Xx48PGCox8cBWDvHdEQSg
         piYbb4JcxSfOTF4+d5ZNr8zNWcJId7VFRNZ/dcb+lWdIv2mN5WVi0XBQdKKGfKPEL75e
         Bj4ayjJkM4FM4JTlZAeov0bHQu5CFFgkT1jGBbz9B580qpvZ6u4zAwWFw2nkVqYXDoUG
         mKxKuineXvfnbP6qYCDz6ukqNwgpYGkhlt/VtzDZBPgoVnZTMRkHrnLOm3fxM/a7gnSY
         LJ3w==
X-Gm-Message-State: ACgBeo39fJNXgyHIPhf83mLb9qdrEdVpVEYRWIUkcqKs42YeuN8P0L3U
        Rhh2gBeAXeUEwzsBtyaU8Uue5I74QDM=
X-Google-Smtp-Source: AA6agR6hO6gw27+HmjONBqgBI1zBgKeK6sijONEj08TOETJyIq8dv8V4oflGGerRIslYa3bqC2n4fw==
X-Received: by 2002:a6b:b78e:0:b0:688:e1a0:cb27 with SMTP id h136-20020a6bb78e000000b00688e1a0cb27mr2409494iof.198.1661460474512;
        Thu, 25 Aug 2022 13:47:54 -0700 (PDT)
Received: from [192.168.0.27] ([204.237.50.72])
        by smtp.gmail.com with ESMTPSA id u8-20020a02b1c8000000b00349e20c3460sm128749jah.158.2022.08.25.13.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 13:47:53 -0700 (PDT)
Message-ID: <f285873c4cf0a0747db996bbca7e7d9234ce77fb.camel@gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Enable HID++ for all the Logitech
 Bluetooth devices
From:   "Peter F. Patel-Schneider" <pfpschneider@gmail.com>
To:     Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Date:   Thu, 25 Aug 2022 16:47:51 -0400
In-Reply-To: <CAE7qMrrj+rBzoAFf2FezqexgWNo+iSAd6b5NZwKFQ1C1zD_Qaw@mail.gmail.com>
References: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
         <CAE7qMrrj+rBzoAFf2FezqexgWNo+iSAd6b5NZwKFQ1C1zD_Qaw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch will cause more use of a part of the driver that constructs
messages that do not conform to the HID++ 2.0 specification.  This
makes now a good time to fix the parts of the driver that construct
non-conforming messages.  More information follows.


The Logitech HID++2.0 Draft Specification at
https://lekensteyn.nl/files/logitech/logitech_hidpp_2.0_specification_draft=
_2012-06-04.pdf
specifies (on pages 2 and 3) that the low-order nibble of the function
(command) byte is non-zero.

The HID++ driver at
https://github.com/torvalds/linux/blob/master/drivers/hid/hid-logitech-hidp=
p.c
has 1 in that nibble for some commands,=20

#define CMD_ROOT_GET_FEATURE				0x01
#define CMD_ROOT_GET_PROTOCOL_VERSION			0x11

#define CMD_GET_DEVICE_NAME_TYPE_GET_COUNT		0x01
#define CMD_GET_DEVICE_NAME_TYPE_GET_DEVICE_NAME	0x11
#define CMD_GET_DEVICE_NAME_TYPE_GET_TYPE		0x21

But other commands have zero in that nibble, namely

#define CMD_BATTERY_LEVEL_STATUS_GET_BATTERY_LEVEL_STATUS	0x00
#define CMD_BATTERY_LEVEL_STATUS_GET_BATTERY_CAPABILITY		0x10

#define CMD_BATTERY_VOLTAGE_GET_BATTERY_VOLTAGE 0x00

#define CMD_UNIFIED_BATTERY_GET_CAPABILITIES			0x00
#define CMD_UNIFIED_BATTERY_GET_STATUS				0x10

#define CMD_HI_RESOLUTION_SCROLLING_SET_HIGHRES_SCROLLING_MODE	0x10

#define CMD_HIRES_WHEEL_GET_WHEEL_CAPABILITY	0x00
#define CMD_HIRES_WHEEL_SET_WHEEL_MODE		0x20

#define CMD_SOLAR_SET_LIGHT_MEASURE			0x00

#define CMD_TOUCHPAD_FW_ITEMS_SET			0x10

This results in non-conforming messages being sent to devices.  As
devices are obligated to return this nibble intact they produce non-
conforming responses as well.  (Their other option would be to reject
the messages.) This confuses other software that correctly uses this
nibble to distinguish between device response messages and device event
messages.

In particular, the response to the unified battery command to get the
capabilities comes back with a 0x00 function byte which is
indistinguishable from a spontaneous notification message from the
device for a battery status event.  Other software trying to
communicate with the device (e.g., Solaar) sees a unified battery
status notification and will generally end up with incorrect
information about the device.  I suspect that this is actually
happening and is the cause of the Solaar bug report
https://github.com/pwr-Solaar/Solaar/issues/1718

There is also the possibility that the driver confuses a notification
from the device as the response to a command that it sent.  When this
happens it would be likely that the actual response would be treated as
a notification.


The fix is to modify all the CMD definitions in the code to have 1 in
their low-order nibble.


peter

PS: There is another HID++ 2.0 feature that reports battery
information, 0x1F20 ADC Measurement, but that is not in the driver
code.



On Thu, 2022-08-25 at 17:59 +0200, Nestor Lopez Casado wrote:
> Adding Peter, as he maintains Solaar, one popular application that
> supports Logitech bluetooth devices.
> @Peter F. Patel-Schneider
> -nestor
>=20
> On Thu, Aug 25, 2022 at 2:29 PM Bastien Nocera <hadess@hadess.net>
> wrote:
> >=20
> > Probe for HID++ support over Bluetooth for all the Logitech
> > Bluetooth
> > devices. As Logitech doesn't have a list of Bluetooth devices that
> > support HID++ over Bluetooth, probe every device. The HID++ driver
> > will fall back to plain HID if the device does not support HID++.
> >=20
> > Note that this change might cause upower to export 2 batteries for
> > certain Bluetooth LE devices which export their battery information
> > through the Bluetooth BATT profile. This particular bug is tracked
> > at:
> > https://gitlab.freedesktop.org/upower/upower/-/issues/166
> >=20
> > Tested with a Logitech Signature M650 mouse, over Bluetooth
> >=20
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >=20
> > Note that I could not test whether the Harmony PS3 (handled in hid-
> > sony.c)
> > or DiNovo Edge keyboard (handled in hid-input.c) devices would
> > correctly fallback
> > to those drivers in that case.
> >=20
> > Ways to test this would be appreciated (or merge this, and wait for
> > feedback...)
> >=20
> > =C2=A0drivers/hid/hid-logitech-hidpp.c | 3 +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> > logitech-hidpp.c
> > index 81de88ab2ecc..86e7a38d8a9a 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -4347,6 +4347,9 @@ static const struct hid_device_id
> > hidpp_devices[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { /* MX Master 3 mouse over =
Bluetooth */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HID_BLUETOOTH_DE=
VICE(USB_VENDOR_ID_LOGITECH, 0xb023),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_data =3D=
 HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { /* And try to enable HID++ for =
all the Logitech Bluetooth
> > devices */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HID_DEVICE(BUS_BLUETO=
OTH, HID_GROUP_ANY,
> > USB_VENDOR_ID_LOGITECH, HID_ANY_ID) },
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {}
> > =C2=A0};
> >=20
> > --
> > 2.37.2
> >=20

