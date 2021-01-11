Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1F42F0A8C
	for <lists+linux-input@lfdr.de>; Mon, 11 Jan 2021 01:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbhAKAHB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Jan 2021 19:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbhAKAHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Jan 2021 19:07:01 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B35C061786
        for <linux-input@vger.kernel.org>; Sun, 10 Jan 2021 16:06:20 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id l14so6792141qvh.2
        for <linux-input@vger.kernel.org>; Sun, 10 Jan 2021 16:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LW2C0hJb58Oo0HcHgi/PU7CqHOn9HOzQwQwJqRYDr1c=;
        b=FRTHn5gSLNuSXGACEttpxqynhzDQUwH9OOACALtewto3ina2XyNTSv++UipqvNwUZO
         7Wfoe+4huYc9ij72Ho0LoQIMHNy5vjTif1enjRN0dIOgAYsKddIEx0RDkyDTlYr16UeH
         G9ze5yH+y1DxupHGER/j/VD1KSG79T2lXNLe/CpFg7KXp80uDXP7eBNGTu7fK3X0oMin
         0onNpYbVCVlAhxM+eGo5dwxeeHizmm9rBwsGtWKnw5Urtdpl8eFFsduGl2AWO/5mUFHS
         PEWqHaObVlqRITKC1ZjoOSGGjaidDy0jjFN38ISrWTh/GkygRcgWPIp7TavAgUCrO2ii
         3TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LW2C0hJb58Oo0HcHgi/PU7CqHOn9HOzQwQwJqRYDr1c=;
        b=eXhmTS2iI+Zh/B1dQcN4r604vGwsdsZ8iZkhUXLpR16EYq4ul51PEFytAxLPnm2P5j
         T8x34xdg/NlyOIDBmzYIcVee8tQpxEm9TxeXkWnkbBg8o6SpEb62TELQgQXs8VgBfVkd
         mYfB55HqvguCPd0px/Ka6axgx9t2qit8vrv3By/eicUhitpE1yYggQvAPb9uPFypoF+6
         4d+JT4BTBNhrbopD5HyXHIqjKeuLTVMChTH26a7cpDqUXkCn/lDsB60bj6GuA57JG74a
         Gt40vjKW3Xb6j86xl7rFJQtdY/Nv54Ft768+WA8bHnBwSwbC0d8Cyo9/eCGrcJfb4tjU
         j+fA==
X-Gm-Message-State: AOAM5333WSjifIz1GM4xgVWZHOR/Ci8M6nIb+aDujWJH7M43gwF8oi5Y
        nDuhnrwEF154aRGJKD5/Ipxe/UF4dDHGYjbuVdbs2g==
X-Google-Smtp-Source: ABdhPJyQJKM7cxefRLOCiwwRBhmYgnpQ3rbHPvyN09V7mfTjSTuY9YDsShnSMQ08/hnjFAu/30y8cenuJwlxrcvMaDQ=
X-Received: by 2002:ad4:46a1:: with SMTP id br1mr16613932qvb.28.1610323579863;
 Sun, 10 Jan 2021 16:06:19 -0800 (PST)
MIME-Version: 1.0
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-6-roderick@gaikai.com>
 <JtD5x8UNWvllStSHpZaryZUUarp8NZiy5G3HjT9xEIiUCxzfNmsaS7CSX52XSEObQ1TwkXlMPkNE0KG7JTl_WOgzOXDocF9jFecpqUkrBwg=@protonmail.com>
 <CANndSKk9Z=ivs_TiuLd77Kv9DMdhqTcdQnobNfnfVPTd2Bpzqg@mail.gmail.com>
 <oMAXtdv54Nx6A2ugm9PmU5jd430MrPZPoJ01iEcCtUXZ5dxzHQc3hqTxp_Mb-2oKdtBEAd-U3QsTD2JFROklqtvl4HV-BB7LGDfn1d3MnUg=@protonmail.com>
 <CAKF84v3v3rJ=VJVPDqH8EQieqjXyAuMJgQf-XUT4t0zthQ2FDA@mail.gmail.com>
 <CANndSKk3MYb9+jpnUmtuo9bO89qXbQ0rwMGURA538O23-zv+6g@mail.gmail.com> <CAKF84v08ahXF6GSoJai-ot=Agmz8c1Z9_C3LKmyANQXw-QbBVg@mail.gmail.com>
In-Reply-To: <CAKF84v08ahXF6GSoJai-ot=Agmz8c1Z9_C3LKmyANQXw-QbBVg@mail.gmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Sun, 10 Jan 2021 16:06:09 -0800
Message-ID: <CANndSKkF_bE709eZitVPRTX53XWNxkLTav32ghF-r7HqqHnsbg@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] HID: playstation: add DualSense accelerometer
 and gyroscope support.
To:     Siarhei Vishniakou <svv@google.com>
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

Hi Siarhei,

Thanks for sharing the example. I see now how the API could be used.

In case of DualSense, the 'dualsense_parse_report' call is effectively
the ISR and the timestamp is derived there by the input framework. We
would like to use the hardware timestamp (as in timestamp at which the
device created the event), so we can do accurate motion tracking. In
particular in case of Bluetooth there is variation in timestamps.

We could do our own time tracking by taking an initial CLOCK_MONOTONIC
and then adding our own hardware timestamps to it. Something like:
if (!sensor_timestamp_initialized) {
    timestamp =3D ktime_get();
    hw_time0 =3D get sensor timestamp();
}

hw_delta =3D get_sensor_timestamp() - hw_time0;
ktime_add_ns(timestamp, hw_delta);
input_set_timestamp(sensor_dev, timestamp);

I just don't know what others would think about such an approach vs
MSC_TIMESTAMP (or we can do both).

Thanks,
Roderick

On Fri, Jan 8, 2021 at 4:11 PM Siarhei Vishniakou <svv@google.com> wrote:
>
> This api is used by some of our touch drivers to more accurately set
> the timestamps of touch events. This allows us to better measure touch
> latency. An example can be found in [0].
>
> From what I remember, you call this api to apply a specific timestamp
> to all of the subsequent input_events that are produced. When
> input_sync happens, this timestamp is erased and you revert to the
> default behaviour (acquiring a timestamp in evdev) until this api is
> called again.
> So if you choose to use this api, you would have to take care to only
> apply it to the sensor events and not other events (unless you can
> figure out the timestamps for all), as well as finding a way to align
> the hardware timestamps with the wall clock.
>
> For the touch driver case, it's easy because we are just taking the
> current time at the interrupt. This still misses the portions where
> the touch scanning and data preprocessing on the touch IC occurs, but
> it gets us closer to the real number (for example, it helps account
> for the i2c/spi data transfer time, which happens after the
> interrupt).
>
>
> [0] https://github.com/android-linux-stable/bluecross/blob/android-msm-bl=
uecross-4.9/drivers/input/touchscreen/stm/fts.c#L3451
>
> On Fri, Jan 8, 2021 at 9:54 AM Roderick Colenbrander
> <roderick@gaikai.com> wrote:
> >
> > Hi Siarhei,
> >
> > It might be an idea to indeed use that API. I wasn't aware of its
> > existence. Though I don't fully understand how it works (and how you
> > can guarantee alignment). Unfortunately I don't see any drivers in
> > upstream Linux using it. Do you happen to know of drivers using it? I
> > guess the might be some in Android kernel-common?
> >
> > Thanks,
> > Roderick
> >
> > On Fri, Jan 8, 2021 at 9:15 AM Siarhei Vishniakou <svv@google.com> wrot=
e:
> > >
> > > Hi Roderick,
> > >
> > > Is there any way to align the sensor timestamps with the real clock o=
n
> > > this new device? If so, there's input_set_timestamp api [0] that coul=
d
> > > be used for setting the timestamps of the actual input_events rather
> > > than having to send out parallel MSC_TIMESTAMP messages. It would mak=
e
> > > it easier for user space to process these events.
> > >
> > > [0] https://patchwork.kernel.org/project/linux-input/patch/2019071819=
4133.64034-1-atifniyaz@google.com/
> > >
> > >
> > > On Fri, Jan 8, 2021 at 2:03 AM Barnab=C3=A1s P=C5=91cze <pobrn@proton=
mail.com> wrote:
> > > >
> > > > Hi
> > > >
> > > >
> > > > 2021. janu=C3=A1r 8., p=C3=A9ntek 7:06 keltez=C3=A9ssel, Roderick C=
olenbrander =C3=ADrta:
> > > >
> > > > > [...]
> > > > > > > +static int dualsense_get_calibration_data(struct dualsense *=
ds)
> > > > > > > +{
> > > > > > > +     short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minu=
s;
> > > > > > > +     short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
> > > > > > > +     short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
> > > > > > > +     short gyro_speed_plus, gyro_speed_minus;
> > > > > > > +     short acc_x_plus, acc_x_minus;
> > > > > > > +     short acc_y_plus, acc_y_minus;
> > > > > > > +     short acc_z_plus, acc_z_minus;
> > > > > > > +     int speed_2x;
> > > > > > > +     int range_2g;
> > > > > > > +     int ret =3D 0;
> > > > > > > +     uint8_t *buf;
> > > > > > > +
> > > > > > > +     buf =3D kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP=
_KERNEL);
> > > > > > > +     if (!buf)
> > > > > > > +             return -ENOMEM;
> > > > > > > +
> > > > > > > +     ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_RE=
PORT_CALIBRATION, buf,
> > > > > > > +                     DS_FEATURE_REPORT_CALIBRATION_SIZE, HID=
_FEATURE_REPORT, HID_REQ_GET_REPORT);
> > > > > >
> > > > > > I think it would be better if lines were aligned. I have missed=
 this in other patches,
> > > > > > so if you decide to make this change, please do it everywhere.
> > > > >
> > > > > What do you mean with "if lines were aligned"? You mean aligning =
the
> > > > > DS_FEATURE.. part with ds->base.hdev?
> > > >
> > > > Yes, exactly.
> > > >
> > > >
> > > > >
> > > > > I'm almost tempted in the future (as part of a future patch serie=
s) to
> > > > > perhaps have a ps_device_get_feature_report or something like tha=
t as
> > > > > there is the same code in multiple places. It can do some nicer
> > > > > checking as well (including to see if the first byte is the repor=
t ID
> > > > > number, which is guaranteed for DualSense). I think it is a bit m=
uch
> > > > > to add now, but probably in the future also when I add DualShock =
4 in
> > > > > here.
> > > >
> > > > I think it's a good idea to add such a function sometime.
> > > >
> > > >
> > > > >
> > > > > >
> > > > > > > +     if (ret < 0)
> > > > > > > +             goto err_free;
> > > > > > > +     else if (ret !=3D DS_FEATURE_REPORT_CALIBRATION_SIZE) {
> > > > > >
> > > > > > As per coding style[1], please either use {} for all branches, =
or just drop the
> > > > > > `else` and maybe add a new line:
> > > > > >
> > > > > > ```
> > > > > > if (ret < 0)
> > > > > >   goto ...
> > > > > >
> > > > > > if (ret !=3D ...) {
> > > > > >   ...
> > > > > > }
> > > > > > ```
> > > > > >
> > > > > >
> > > > > > > +             hid_err(ds->base.hdev, "failed to retrieve Dual=
Sense calibration info\n");
> > > > > >
> > > > > > I think this message could be improved to better pinpoint the e=
xact problem
> > > > > > that triggered it.
> > > > > >
> > > > > >
> > > > > > > +             ret =3D -EINVAL;
> > > > > > > +             goto err_free;
> > > > > > > +     }
> > > > > [...]
> > > >
> > > >
> > > > Regards,
> > > > Barnab=C3=A1s P=C5=91cze
> >
> >
> >
> > --
> > Roderick Colenbrander
> > Senior Manager of Hardware & Systems Engineering
> > Sony Interactive Entertainment LLC
> > roderick.colenbrander@sony.com
