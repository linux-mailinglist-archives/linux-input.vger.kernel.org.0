Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FF5269AE9
	for <lists+linux-input@lfdr.de>; Tue, 15 Sep 2020 03:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgIOBNP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 21:13:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:49116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726019AbgIOBNN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 21:13:13 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0169621D43;
        Tue, 15 Sep 2020 01:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600132393;
        bh=8grDI2dqH5ai9HwDR+m7h3ip9HyWpt5FbYdHVHIOA9Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VJeJV0u3vj6eN5+JQC9ACqUfUQtk7V3PKxtFoFVwXyyT/7A4JsqToya3zU/Xg2P2l
         yslb3wkhKmX9D5kKPox38sPgLJAOmCDPuB5luBmCHrgA7lHwI79yYw041NiGEhpE5q
         zKfDYYtKPyEV1U12c0R+r2jtGPtfL50PggZOWkkY=
Received: by mail-ot1-f54.google.com with SMTP id g96so1621413otb.12;
        Mon, 14 Sep 2020 18:13:12 -0700 (PDT)
X-Gm-Message-State: AOAM530+lG99AoiKv7eOBIHCy2b2GzxskDppbwyLRuhyPmDzRjBYOzJm
        UCPqum6uWfFbYXFDCYOD1if8hqV3WJHrtxlCbg==
X-Google-Smtp-Source: ABdhPJy7HwhDafBB2e+zInB0ToB1dyKmEg0GUCtgIdxEjKFVSeVPMU6I23Zccu7BvCyrwUR/gWxZ1J1UnM2Thr/O79c=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr11266817otp.129.1600132392242;
 Mon, 14 Sep 2020 18:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200912005521.26319-1-jiada_wang@mentor.com> <20200913165644.GF1665100@dtor-ws>
 <65d1b9f2-a8e3-6398-712d-41d8067d06a1@gmail.com> <20200914193340.GV1665100@dtor-ws>
 <20200914193603.GW1665100@dtor-ws> <e3dca702-7489-be94-9eee-46024f988372@gmail.com>
 <20200914223238.GD1681290@dtor-ws>
In-Reply-To: <20200914223238.GD1681290@dtor-ws>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 14 Sep 2020 19:13:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLNunrunERGThJ_CVrP0yxrw2dtm539CMH8aoonVq8pTA@mail.gmail.com>
Message-ID: <CAL_JsqLNunrunERGThJ_CVrP0yxrw2dtm539CMH8aoonVq8pTA@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Nick Dyer <nick@shmanahar.org>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew_Gabbasov@mentor.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 14, 2020 at 4:32 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Sep 15, 2020 at 12:33:18AM +0300, Dmitry Osipenko wrote:
> > 14.09.2020 22:36, Dmitry Torokhov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Mon, Sep 14, 2020 at 12:33:40PM -0700, Dmitry Torokhov wrote:
> > >> On Mon, Sep 14, 2020 at 08:29:44PM +0300, Dmitry Osipenko wrote:
> > >>> 13.09.2020 19:56, Dmitry Torokhov =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > >>>> Hi Jiada,
> > >>>>
> > >>>> On Sat, Sep 12, 2020 at 09:55:21AM +0900, Jiada Wang wrote:
> > >>>>> From: Nick Dyer <nick.dyer@itdev.co.uk>
> > >>>>>
> > >>>>> Some maXTouch chips (eg mXT1386) will not respond on the first I2=
C request
> > >>>>> when they are in a sleep state. It must be retried after a delay =
for the
> > >>>>> chip to wake up.
> > >>>>
> > >>>> Do we know when the chip is in sleep state? Can we do a quick I2C
> > >>>> transaction in this case instead of adding retry logic to everythi=
ng? Or
> > >>>> there is another benefit for having such retry logic?
> > >>>
> > >>> Hello!
> > >>>
> > >>> Please take a look at page 29 of:
> > >>>
> > >>> https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datash=
eet_LX.pdf
> > >>>
> > >>> It says that the retry is needed after waking up from a deep-sleep =
mode.
> > >>>
> > >>> There are at least two examples when it's needed:
> > >>>
> > >>> 1. Driver probe. Controller could be in a deep-sleep mode at the pr=
obe
> > >>> time, and then first __mxt_read_reg() returns I2C NACK on reading o=
ut TS
> > >>> hardware info.
> > >>>
> > >>> 2. Touchscreen input device is opened. The touchscreen is in a
> > >>> deep-sleep mode at the time when input device is opened, hence firs=
t
> > >>> __mxt_write_reg() invoked from mxt_start() returns I2C NACK.
> > >>>
> > >>> I think placing the retries within __mxt_read() / write_reg() shoul=
d be
> > >>> the most universal option.
> > >>>
> > >>> Perhaps it should be possible to add mxt_wake() that will read out =
some
> > >>> generic register
> > >>
> > >> I do not think we need to read a particular register, just doing a q=
uick
> > >> read:
> > >>
> > >>    i2c_smbus_xfer(client->adapter, client->addr,
> > >>                    0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &dummy)
> > >>
> > >> should suffice.
> > >>
> > >>> and then this helper should be invoked after HW
> > >>> resetting (before mxt_read_info_block()) and from mxt_start() (befo=
re
> > >>> mxt_set_t7_power_cfg()). But this approach feels a bit fragile to m=
e.
> > >>>
> > >>
> > >> Actually, reading the spec, it all depends on how the WAKE pin is wi=
red
> > >> up on a given board. In certain setups retrying transaction is the r=
ight
> > >> approach, while in others explicit control is needed. So indeed, we =
need
> > >> a "wake" helper that we should call in probe and resume paths.
> >
> > The WAKE-GPIO was never supported and I'm not sure whether anyone
> > actually needs it. I think we could ignore this case until anyone would
> > really need and could test it.
>
> Right, I am not advocating adding GPIO control right away, I was simply
> arguing why I believe we should separate wakeup handling from normal
> communication handling.
>
> >
> > > By the way, I would like to avoid the unnecessary retries in probe pa=
ths
> > > if possible. I.e. on Chrome OS we really keep an eye on boot times an=
d
> > > in case of multi-sourced touchscreens we may legitimately not have
> > > device at given address.
> >
> > We could add a new MXT1386 DT compatible and then do:
> >
> > static void mxt_wake(struct mxt_data *data)
> > {
> >       struct i2c_client *client =3D data->client;
> >       struct device *dev =3D &data->client->dev;
> >       union i2c_smbus_data dummy;
> >
> >       if (!of_device_is_compatible(dev, "atmel,mXT1386"))
> >               return;
> >
> >       /* TODO: add WAKE-GPIO support */
> >
> >       i2c_smbus_xfer(client->adapter, client->addr,
> >                       0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE,
> >                       &dummy);
> >
> >       msleep(MXT_WAKEUP_TIME);
> > }
> >
> > Jiada, will you be able to re-work this patch? Please note that the new
> > "atmel,mXT1386" DT compatible needs to be added into the
> > atmel,maxtouch.txt binding.
>
> Another option is to have a device property "atmel,wakeup-type" or
> something, in case there are more Atmel variants needing this.
>
> Rob, any preferences here?

If device specific, then I prefer to be implied by the compatible. If
board specific, then a property is appropriate. Seems like this is the
former case.

Rob
