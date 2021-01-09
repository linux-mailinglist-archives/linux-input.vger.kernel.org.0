Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADB42EFC07
	for <lists+linux-input@lfdr.de>; Sat,  9 Jan 2021 01:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbhAIAMH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 19:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbhAIAMG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 19:12:06 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4464AC061573
        for <linux-input@vger.kernel.org>; Fri,  8 Jan 2021 16:11:26 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id jx16so16759419ejb.10
        for <linux-input@vger.kernel.org>; Fri, 08 Jan 2021 16:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QCUuCaHTKbLL5Yo5vN8w99X4bO4PUo1xWpE2fQqnLYk=;
        b=TUYEGixF15hsGLVY4I+GrPippZtKUnLiAi9Z8IPbICvWBHGjqQ7Crca2o/DfhKOUNH
         eKiTBJ/voP8BJStQIALED/4/vL79x5nxi7RjmkKq5fADZhZx2cyW4rQp5Mni/94PiYH8
         8aK5NtHBfewFOTio26yPrQh/BLiJIKOuWiFGB9LkFrf7S9mBGli5XGX2zh2UuRoINmsA
         wpTvp+wbM9JQ/spAeno8a+55gXrfOB2mm4rsAef8pfPmQ2C5yfGVF2ZA2TJoh1Bp4EHv
         pxybyM0f9s/1/oNtiAGUrl87gX00uGbohRGGBbycpPQ+QtEGBLQAquvUxN5/VmETcaua
         kQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QCUuCaHTKbLL5Yo5vN8w99X4bO4PUo1xWpE2fQqnLYk=;
        b=FX4QOsWdiHuEvebSYwww8ue+zz3YRJaEh1/X6gi1w7w/sXXOrY4794YvyUYID5AVhT
         QSn/NfOZAHZDVkzGfEuc7n1vdSgh7HG6fUh6PP4zw+liMazs9flbD9VzHyPs0GL8N7lx
         k0B1J/vke32HTDst0rpE/ObThwRDmls/EWJgpx6VcgJ4bKLECGuEB6fKEXqdK8rWaimP
         9HoXBtcMZZjPa8DGkDEHOySYWOUq5NaKYAPs8j/AtVrYEPiro2pVpn2/kU8lOagGJWmx
         HZDQqPfM79HSxg9AaDRFV6jtghftZejgqzVkkxhrXPSoRFSDABn9TIXl4mlkzJ47O2Dy
         cX4Q==
X-Gm-Message-State: AOAM533QhEj2uN3v/S9uo26IwIMgSdZzJeSRs/OM15qIhf35DHIMrxZR
        ris929P8tehClQbacjamkwGOAj0I/jrvtVl1dPgvIQ==
X-Google-Smtp-Source: ABdhPJzHpJ/EkhjgxxslncIGqzcOO+Q6Ymek5XYBvnhuwZItNdInpEf2YrTPOTz5HP5d5VPTCQFzZC95zYuYEeRXBo4=
X-Received: by 2002:a17:906:d8dc:: with SMTP id re28mr4236969ejb.168.1610151084727;
 Fri, 08 Jan 2021 16:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-6-roderick@gaikai.com>
 <JtD5x8UNWvllStSHpZaryZUUarp8NZiy5G3HjT9xEIiUCxzfNmsaS7CSX52XSEObQ1TwkXlMPkNE0KG7JTl_WOgzOXDocF9jFecpqUkrBwg=@protonmail.com>
 <CANndSKk9Z=ivs_TiuLd77Kv9DMdhqTcdQnobNfnfVPTd2Bpzqg@mail.gmail.com>
 <oMAXtdv54Nx6A2ugm9PmU5jd430MrPZPoJ01iEcCtUXZ5dxzHQc3hqTxp_Mb-2oKdtBEAd-U3QsTD2JFROklqtvl4HV-BB7LGDfn1d3MnUg=@protonmail.com>
 <CAKF84v3v3rJ=VJVPDqH8EQieqjXyAuMJgQf-XUT4t0zthQ2FDA@mail.gmail.com> <CANndSKk3MYb9+jpnUmtuo9bO89qXbQ0rwMGURA538O23-zv+6g@mail.gmail.com>
In-Reply-To: <CANndSKk3MYb9+jpnUmtuo9bO89qXbQ0rwMGURA538O23-zv+6g@mail.gmail.com>
From:   Siarhei Vishniakou <svv@google.com>
Date:   Fri, 8 Jan 2021 14:11:13 -1000
Message-ID: <CAKF84v08ahXF6GSoJai-ot=Agmz8c1Z9_C3LKmyANQXw-QbBVg@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] HID: playstation: add DualSense accelerometer
 and gyroscope support.
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This api is used by some of our touch drivers to more accurately set
the timestamps of touch events. This allows us to better measure touch
latency. An example can be found in [0].

From what I remember, you call this api to apply a specific timestamp
to all of the subsequent input_events that are produced. When
input_sync happens, this timestamp is erased and you revert to the
default behaviour (acquiring a timestamp in evdev) until this api is
called again.
So if you choose to use this api, you would have to take care to only
apply it to the sensor events and not other events (unless you can
figure out the timestamps for all), as well as finding a way to align
the hardware timestamps with the wall clock.

For the touch driver case, it's easy because we are just taking the
current time at the interrupt. This still misses the portions where
the touch scanning and data preprocessing on the touch IC occurs, but
it gets us closer to the real number (for example, it helps account
for the i2c/spi data transfer time, which happens after the
interrupt).


[0] https://github.com/android-linux-stable/bluecross/blob/android-msm-blue=
cross-4.9/drivers/input/touchscreen/stm/fts.c#L3451

On Fri, Jan 8, 2021 at 9:54 AM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> Hi Siarhei,
>
> It might be an idea to indeed use that API. I wasn't aware of its
> existence. Though I don't fully understand how it works (and how you
> can guarantee alignment). Unfortunately I don't see any drivers in
> upstream Linux using it. Do you happen to know of drivers using it? I
> guess the might be some in Android kernel-common?
>
> Thanks,
> Roderick
>
> On Fri, Jan 8, 2021 at 9:15 AM Siarhei Vishniakou <svv@google.com> wrote:
> >
> > Hi Roderick,
> >
> > Is there any way to align the sensor timestamps with the real clock on
> > this new device? If so, there's input_set_timestamp api [0] that could
> > be used for setting the timestamps of the actual input_events rather
> > than having to send out parallel MSC_TIMESTAMP messages. It would make
> > it easier for user space to process these events.
> >
> > [0] https://patchwork.kernel.org/project/linux-input/patch/201907181941=
33.64034-1-atifniyaz@google.com/
> >
> >
> > On Fri, Jan 8, 2021 at 2:03 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonma=
il.com> wrote:
> > >
> > > Hi
> > >
> > >
> > > 2021. janu=C3=A1r 8., p=C3=A9ntek 7:06 keltez=C3=A9ssel, Roderick Col=
enbrander =C3=ADrta:
> > >
> > > > [...]
> > > > > > +static int dualsense_get_calibration_data(struct dualsense *ds=
)
> > > > > > +{
> > > > > > +     short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
> > > > > > +     short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
> > > > > > +     short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
> > > > > > +     short gyro_speed_plus, gyro_speed_minus;
> > > > > > +     short acc_x_plus, acc_x_minus;
> > > > > > +     short acc_y_plus, acc_y_minus;
> > > > > > +     short acc_z_plus, acc_z_minus;
> > > > > > +     int speed_2x;
> > > > > > +     int range_2g;
> > > > > > +     int ret =3D 0;
> > > > > > +     uint8_t *buf;
> > > > > > +
> > > > > > +     buf =3D kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_K=
ERNEL);
> > > > > > +     if (!buf)
> > > > > > +             return -ENOMEM;
> > > > > > +
> > > > > > +     ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPO=
RT_CALIBRATION, buf,
> > > > > > +                     DS_FEATURE_REPORT_CALIBRATION_SIZE, HID_F=
EATURE_REPORT, HID_REQ_GET_REPORT);
> > > > >
> > > > > I think it would be better if lines were aligned. I have missed t=
his in other patches,
> > > > > so if you decide to make this change, please do it everywhere.
> > > >
> > > > What do you mean with "if lines were aligned"? You mean aligning th=
e
> > > > DS_FEATURE.. part with ds->base.hdev?
> > >
> > > Yes, exactly.
> > >
> > >
> > > >
> > > > I'm almost tempted in the future (as part of a future patch series)=
 to
> > > > perhaps have a ps_device_get_feature_report or something like that =
as
> > > > there is the same code in multiple places. It can do some nicer
> > > > checking as well (including to see if the first byte is the report =
ID
> > > > number, which is guaranteed for DualSense). I think it is a bit muc=
h
> > > > to add now, but probably in the future also when I add DualShock 4 =
in
> > > > here.
> > >
> > > I think it's a good idea to add such a function sometime.
> > >
> > >
> > > >
> > > > >
> > > > > > +     if (ret < 0)
> > > > > > +             goto err_free;
> > > > > > +     else if (ret !=3D DS_FEATURE_REPORT_CALIBRATION_SIZE) {
> > > > >
> > > > > As per coding style[1], please either use {} for all branches, or=
 just drop the
> > > > > `else` and maybe add a new line:
> > > > >
> > > > > ```
> > > > > if (ret < 0)
> > > > >   goto ...
> > > > >
> > > > > if (ret !=3D ...) {
> > > > >   ...
> > > > > }
> > > > > ```
> > > > >
> > > > >
> > > > > > +             hid_err(ds->base.hdev, "failed to retrieve DualSe=
nse calibration info\n");
> > > > >
> > > > > I think this message could be improved to better pinpoint the exa=
ct problem
> > > > > that triggered it.
> > > > >
> > > > >
> > > > > > +             ret =3D -EINVAL;
> > > > > > +             goto err_free;
> > > > > > +     }
> > > > [...]
> > >
> > >
> > > Regards,
> > > Barnab=C3=A1s P=C5=91cze
>
>
>
> --
> Roderick Colenbrander
> Senior Manager of Hardware & Systems Engineering
> Sony Interactive Entertainment LLC
> roderick.colenbrander@sony.com
