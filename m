Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA5F14A07F
	for <lists+linux-input@lfdr.de>; Mon, 27 Jan 2020 10:12:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgA0JMX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jan 2020 04:12:23 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26191 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728262AbgA0JMW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jan 2020 04:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580116340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M9hxx9ozEZkaPTM1+VPDc3TWQ0gfjD9WZsQqXUI/VqM=;
        b=I4eDJQ1xLo5vlABA+N764oOu+z5cbhhMoLOkK4Gm7gsKM+OmX8y5pS+LEFiGf1/O4NTwi7
        R0EfWr2l0+0Z27mwT43OKEuflqbFV1QkSn3ETjBRQT6XRH8l35aCyT0Kx2O+96/cnsvU6P
        I2wV4LodZs+PtS/XcslO2j3DFTQ3QBM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-cm7Ya9UGOdSlFY_Q46XM7A-1; Mon, 27 Jan 2020 04:12:18 -0500
X-MC-Unique: cm7Ya9UGOdSlFY_Q46XM7A-1
Received: by mail-qv1-f71.google.com with SMTP id g15so6041172qvq.20
        for <linux-input@vger.kernel.org>; Mon, 27 Jan 2020 01:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M9hxx9ozEZkaPTM1+VPDc3TWQ0gfjD9WZsQqXUI/VqM=;
        b=Y0QIxFHUoijvu5ksx2TDJ1H1kfI4VpMt+vYPTjD+cXU0YAgjFpa8McGnCEXwD6wQfx
         lwcKOq9W24XwPCLA1KtujQSV3SxmQplB0FIYK+bGPaN9uQ3KbJGUEHHSlmk2beJt0o6U
         h8WtMZQXhad7IOUeKyah2EbHeklw05c7vFB9jQhKEqi5TIqSoGuOIiER7pp3UqyB3ATN
         1c/mSn4B9YJnRJ8VWqF0pwTbirbfHbe1VWoplE4CHC0SdVetDFPPcqf/2sXbLwXrDfrH
         DxOUrypsO2wk/1bGkc4sPoxEQI7gZvVctX9TSp35ti5EwS9htHr/qHwPKUfsSoUwtZWJ
         76PA==
X-Gm-Message-State: APjAAAWBY8otvvRaBOGNi6ukvThDPXV8uFuRHDZYUDy5/SofwHYLSvv8
        DrYOz6xyERDjLrgqyyCB0wHAFT0UDVyugPa941kB+ua3+i2pejYQ/4taAQpnINEqJK7Wiv+9ZXe
        jZ8Uxzcqt2c5+kEYY6ksIomWj3e4Sc449wsjXbAI=
X-Received: by 2002:ac8:365c:: with SMTP id n28mr7847299qtb.260.1580116337681;
        Mon, 27 Jan 2020 01:12:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqzr6xug3BnUa3I0Ylf4L+XjMwNQRytDMt23oIEXtx/gEFXcaRoK7dGGiqQEcSKnoWu1R6ivcG4RuChkPRN+7W4=
X-Received: by 2002:ac8:365c:: with SMTP id n28mr7847278qtb.260.1580116337395;
 Mon, 27 Jan 2020 01:12:17 -0800 (PST)
MIME-Version: 1.0
References: <20200111192419.2503922-1-lains@archlinux.org> <aaca852e-cb31-2690-7f90-819ed673bacb@pedrovanzella.com>
In-Reply-To: <aaca852e-cb31-2690-7f90-819ed673bacb@pedrovanzella.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 27 Jan 2020 10:12:06 +0100
Message-ID: <CAO-hwJJwqXbJSTY2iEBTv3=N1_NaoHii6JvpA7_1oJUWQHZHag@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: BatteryVoltage: only read
 chargeStatus if extPower is active
To:     Pedro Vanzella <pedro@pedrovanzella.com>
Cc:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Jan 20, 2020 at 2:43 PM Pedro Vanzella <pedro@pedrovanzella.com> wr=
ote:
>
> On 1/11/20 4:24 PM, Filipe La=C3=ADns wrote:
> > In the HID++ 2.0 function getBatteryInfo() from the BatteryVoltage
> > (0x1001) feature, chargeStatus is only valid if extPower is active.
> >
> > Previously we were ignoring extPower, which resulted in wrong values.
>
> Nice catch. Sorry for missing that the first time around.
>
> >
> > Example:
> >      With an unplugged mouse
> >
> >      $ cat /sys/class/power_supply/hidpp_battery_0/status
> >      Charging
>
> Tested and it works as expected now.

Thanks for the patch and the tests.

Unfortunately, the merge window is already opened, and I'd rather not
sneak this one right now. This patch doesn't seem very critical so I
rather not annoy the other maintainers.
I'll make sure it gets in the 5.6 final by pushing it into a rc when
things are calmer for everybody.

So the plan would be:
- wait for the 'normal' 5.6 HID pull request to be sent
- apply this one in for-5.6/upstream-fixes
- sent this branch for either 5.6-rc1 or 5.6-rc2

Cheers,
Benjamin

>
> >
> > This patch makes fixes that, it also renames charge_sts to flags as
> > charge_sts can be confused with chargeStatus from the spec.
> >
> > Spec:
> > +--------+-------------------------------------------------------------=
------------+
> > |  byte  |                                    2                        =
            |
> > +--------+--------------+------------+------------+----------+---------=
-+----------+
> > |   bit  |     0..2     |      3     |      4     |     5    |     6   =
 |     7    |
> > +--------+--------------+------------+------------+----------+---------=
-+----------+
> > | buffer | chargeStatus | fastCharge | slowCharge | critical | (unused)=
 | extPower |
> > +--------+--------------+------------+------------+----------+---------=
-+----------+
> > Table 1 - battery voltage (0x1001), getBatteryInfo() (ASE 0), 3rd byte
> >
> > +-------+--------------------------------------+
> > | value |                meaning               |
> > +-------+--------------------------------------+
> > |   0   | Charging                             |
> > +-------+--------------------------------------+
> > |   1   | End of charge (100% charged)         |
> > +-------+--------------------------------------+
> > |   2   | Charge stopped (any "normal" reason) |
> > +-------+--------------------------------------+
> > |   7   | Hardware error                       |
> > +-------+--------------------------------------+
> > Table 2 - chargeStatus value
> >
> > Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> > ---
> >   drivers/hid/hid-logitech-hidpp.c | 43 ++++++++++++++++---------------=
-
> >   1 file changed, 21 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitec=
h-hidpp.c
> > index bb063e7d48df..39a5ee0aaab0 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -1256,36 +1256,35 @@ static int hidpp20_battery_map_status_voltage(u=
8 data[3], int *voltage,
> >   {
> >       int status;
> >
> > -     long charge_sts =3D (long)data[2];
> > +     long flags =3D (long) data[2];
> >
> > -     *level =3D POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
> > -     switch (data[2] & 0xe0) {
> > -     case 0x00:
> > -             status =3D POWER_SUPPLY_STATUS_CHARGING;
> > -             break;
> > -     case 0x20:
> > -             status =3D POWER_SUPPLY_STATUS_FULL;
> > -             *level =3D POWER_SUPPLY_CAPACITY_LEVEL_FULL;
> > -             break;
> > -     case 0x40:
> > +     if (flags & 0x80)
> > +             switch (flags & 0x07) {
> > +             case 0:
> > +                     status =3D POWER_SUPPLY_STATUS_CHARGING;
> > +                     break;
> > +             case 1:
> > +                     status =3D POWER_SUPPLY_STATUS_FULL;
> > +                     *level =3D POWER_SUPPLY_CAPACITY_LEVEL_FULL;
> > +                     break;
> > +             case 2:
> > +                     status =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> > +                     break;
> > +             default:
> > +                     status =3D POWER_SUPPLY_STATUS_UNKNOWN;
> > +                     break;
> > +             }
> > +     else
> >               status =3D POWER_SUPPLY_STATUS_DISCHARGING;
> > -             break;
> > -     case 0xe0:
> > -             status =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> > -             break;
> > -     default:
> > -             status =3D POWER_SUPPLY_STATUS_UNKNOWN;
> > -     }
> >
> >       *charge_type =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> > -     if (test_bit(3, &charge_sts)) {
> > +     if (test_bit(3, &flags)) {
> >               *charge_type =3D POWER_SUPPLY_CHARGE_TYPE_FAST;
> >       }
> > -     if (test_bit(4, &charge_sts)) {
> > +     if (test_bit(4, &flags)) {
> >               *charge_type =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
> >       }
> > -
> > -     if (test_bit(5, &charge_sts)) {
> > +     if (test_bit(5, &flags)) {
> >               *level =3D POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
> >       }
> >
> >
>
> Tested-by: Pedro Vanzella <pedro@pedrovanzella.com>
> Reviewed-by: Pedro Vanzella <pedro@pedrovanzella.com>
>

