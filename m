Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23E5B14BCC6
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2020 16:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgA1PZs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jan 2020 10:25:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55928 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726291AbgA1PZs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jan 2020 10:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580225146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4u1eecLUmt9wBhg+/Wu6HCzpTCvXarAFVysnsNaCuCA=;
        b=daANP32jCVGQEGzUL6sHQKX8rZybWMD5G5YHOib6fBRqKI6ukHMX5yGt3SeQJxOj3wl6/1
        Hb1tIn7MX8js4/qCix7dfsjOH70pSsw+J0GV+Fmr2FQCvzn/rnSM4DdV/HJBqvId+XJH1w
        eocxJg3q2yIHx1+Sj9rtUvnwa4HiWtI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-FtsQ4eriMpWrjVUBXdd7Lw-1; Tue, 28 Jan 2020 10:25:45 -0500
X-MC-Unique: FtsQ4eriMpWrjVUBXdd7Lw-1
Received: by mail-qv1-f71.google.com with SMTP id p3so8919284qvt.9
        for <linux-input@vger.kernel.org>; Tue, 28 Jan 2020 07:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4u1eecLUmt9wBhg+/Wu6HCzpTCvXarAFVysnsNaCuCA=;
        b=AOmRG7qYf8GsRc5MJtrlMu9FkTlJswfxDGQ00yHyxeywRuDT2bltzRUJmAgH+izoXn
         bXJqk+ZSnBPkm1Rz9JdfeW6j9ZL2PR+310wOhP1shEE7IflQGHHHvT5O6Ju/6RtEWbuU
         hWKhmK5A2zr0REvhDXgdCMHWBMTc5Ue4US4zxmucEkQPHgduAgvw5DhBfvsgOfKO7Cb3
         TtIgsrN/JLeXih/3jS5cS7Z578KcSKBOdRnq3gQzliZnbvtgDWBN7wUhv1Qhi3d9mEl5
         6pCXtg9ANTeYGS2cbcDKQdqqDvQyS9F0JstDEml7lxjiWSs18RnT50ijiKVzjCcdfiSM
         j7ig==
X-Gm-Message-State: APjAAAUPsnQ/fNAtRLaV5dad+k9pKAtwmTBn+iVYPNG1bQUwgxROkM7h
        MnUUfcGa85C1OIdkxOhm2J6As2u1pAK8vyW0I27cMeenes5LRQGswYZZMPIq4OZhtP+Z2b8BTy4
        STwRqVMSFViw/UInCJAlfaAN9k+HuwTC7NlI1sUw=
X-Received: by 2002:ae9:ef4b:: with SMTP id d72mr22040722qkg.27.1580225144374;
        Tue, 28 Jan 2020 07:25:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwa0r9/LJBQh84MY0bPX7/2+z98kqzE1ApQo3V/9ZMyGSk2kMAPZn6udWvO3iCtpJlQ3zhVkr+15X6sFqoFhBE=
X-Received: by 2002:ae9:ef4b:: with SMTP id d72mr22040694qkg.27.1580225144075;
 Tue, 28 Jan 2020 07:25:44 -0800 (PST)
MIME-Version: 1.0
References: <20200111192419.2503922-1-lains@archlinux.org> <aaca852e-cb31-2690-7f90-819ed673bacb@pedrovanzella.com>
 <CAO-hwJJwqXbJSTY2iEBTv3=N1_NaoHii6JvpA7_1oJUWQHZHag@mail.gmail.com>
In-Reply-To: <CAO-hwJJwqXbJSTY2iEBTv3=N1_NaoHii6JvpA7_1oJUWQHZHag@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 28 Jan 2020 16:25:33 +0100
Message-ID: <CAO-hwJLXQSjq0J-emUMCu9Z69FmzzQO3Am0E3Xiw6aWBfiEjnA@mail.gmail.com>
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

On Mon, Jan 27, 2020 at 10:12 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi,
>
> On Mon, Jan 20, 2020 at 2:43 PM Pedro Vanzella <pedro@pedrovanzella.com> =
wrote:
> >
> > On 1/11/20 4:24 PM, Filipe La=C3=ADns wrote:
> > > In the HID++ 2.0 function getBatteryInfo() from the BatteryVoltage
> > > (0x1001) feature, chargeStatus is only valid if extPower is active.
> > >
> > > Previously we were ignoring extPower, which resulted in wrong values.
> >
> > Nice catch. Sorry for missing that the first time around.
> >
> > >
> > > Example:
> > >      With an unplugged mouse
> > >
> > >      $ cat /sys/class/power_supply/hidpp_battery_0/status
> > >      Charging
> >
> > Tested and it works as expected now.
>
> Thanks for the patch and the tests.
>
> Unfortunately, the merge window is already opened, and I'd rather not
> sneak this one right now. This patch doesn't seem very critical so I
> rather not annoy the other maintainers.
> I'll make sure it gets in the 5.6 final by pushing it into a rc when
> things are calmer for everybody.
>
> So the plan would be:
> - wait for the 'normal' 5.6 HID pull request to be sent
> - apply this one in for-5.6/upstream-fixes
> - sent this branch for either 5.6-rc1 or 5.6-rc2
>
> Cheers,
> Benjamin
>
> >
> > >
> > > This patch makes fixes that, it also renames charge_sts to flags as

Fixed the typo: 's/makes //' and pushed to for-5.6/upstream-fixes

Cheers,
Benjamin

> > > charge_sts can be confused with chargeStatus from the spec.
> > >
> > > Spec:
> > > +--------+-----------------------------------------------------------=
--------------+
> > > |  byte  |                                    2                      =
              |
> > > +--------+--------------+------------+------------+----------+-------=
---+----------+
> > > |   bit  |     0..2     |      3     |      4     |     5    |     6 =
   |     7    |
> > > +--------+--------------+------------+------------+----------+-------=
---+----------+
> > > | buffer | chargeStatus | fastCharge | slowCharge | critical | (unuse=
d) | extPower |
> > > +--------+--------------+------------+------------+----------+-------=
---+----------+
> > > Table 1 - battery voltage (0x1001), getBatteryInfo() (ASE 0), 3rd byt=
e
> > >
> > > +-------+--------------------------------------+
> > > | value |                meaning               |
> > > +-------+--------------------------------------+
> > > |   0   | Charging                             |
> > > +-------+--------------------------------------+
> > > |   1   | End of charge (100% charged)         |
> > > +-------+--------------------------------------+
> > > |   2   | Charge stopped (any "normal" reason) |
> > > +-------+--------------------------------------+
> > > |   7   | Hardware error                       |
> > > +-------+--------------------------------------+
> > > Table 2 - chargeStatus value
> > >
> > > Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> > > ---
> > >   drivers/hid/hid-logitech-hidpp.c | 43 ++++++++++++++++-------------=
---
> > >   1 file changed, 21 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logit=
ech-hidpp.c
> > > index bb063e7d48df..39a5ee0aaab0 100644
> > > --- a/drivers/hid/hid-logitech-hidpp.c
> > > +++ b/drivers/hid/hid-logitech-hidpp.c
> > > @@ -1256,36 +1256,35 @@ static int hidpp20_battery_map_status_voltage=
(u8 data[3], int *voltage,
> > >   {
> > >       int status;
> > >
> > > -     long charge_sts =3D (long)data[2];
> > > +     long flags =3D (long) data[2];
> > >
> > > -     *level =3D POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
> > > -     switch (data[2] & 0xe0) {
> > > -     case 0x00:
> > > -             status =3D POWER_SUPPLY_STATUS_CHARGING;
> > > -             break;
> > > -     case 0x20:
> > > -             status =3D POWER_SUPPLY_STATUS_FULL;
> > > -             *level =3D POWER_SUPPLY_CAPACITY_LEVEL_FULL;
> > > -             break;
> > > -     case 0x40:
> > > +     if (flags & 0x80)
> > > +             switch (flags & 0x07) {
> > > +             case 0:
> > > +                     status =3D POWER_SUPPLY_STATUS_CHARGING;
> > > +                     break;
> > > +             case 1:
> > > +                     status =3D POWER_SUPPLY_STATUS_FULL;
> > > +                     *level =3D POWER_SUPPLY_CAPACITY_LEVEL_FULL;
> > > +                     break;
> > > +             case 2:
> > > +                     status =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> > > +                     break;
> > > +             default:
> > > +                     status =3D POWER_SUPPLY_STATUS_UNKNOWN;
> > > +                     break;
> > > +             }
> > > +     else
> > >               status =3D POWER_SUPPLY_STATUS_DISCHARGING;
> > > -             break;
> > > -     case 0xe0:
> > > -             status =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> > > -             break;
> > > -     default:
> > > -             status =3D POWER_SUPPLY_STATUS_UNKNOWN;
> > > -     }
> > >
> > >       *charge_type =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> > > -     if (test_bit(3, &charge_sts)) {
> > > +     if (test_bit(3, &flags)) {
> > >               *charge_type =3D POWER_SUPPLY_CHARGE_TYPE_FAST;
> > >       }
> > > -     if (test_bit(4, &charge_sts)) {
> > > +     if (test_bit(4, &flags)) {
> > >               *charge_type =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
> > >       }
> > > -
> > > -     if (test_bit(5, &charge_sts)) {
> > > +     if (test_bit(5, &flags)) {
> > >               *level =3D POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
> > >       }
> > >
> > >
> >
> > Tested-by: Pedro Vanzella <pedro@pedrovanzella.com>
> > Reviewed-by: Pedro Vanzella <pedro@pedrovanzella.com>
> >

