Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F522EF86C
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 20:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbhAHTyy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 14:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbhAHTyy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 14:54:54 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8236C061380
        for <linux-input@vger.kernel.org>; Fri,  8 Jan 2021 11:54:13 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id j18so4869927qvu.3
        for <linux-input@vger.kernel.org>; Fri, 08 Jan 2021 11:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ilac5N16wRLRjMqd0XjLQuhlzYF1MfbZV7+T6OkX0m0=;
        b=QAhgliP45V8J08a5N9hJTbx94qgvcgIFHLzdlnVMw+IAmRsQR8GQLXgNk6j7R9Uu5+
         PEsj80h2/9dV+r8qdKSaTzBZGzCYMn8cG1IhLDzWbCQESBzUe2UgSjzWv4kosLMV8AKj
         HRCYmXLr1xcWDgZmAavaQ76yM89oS4b78eHqXUa6JoiCSFbbBhPagKGQFU7i87g3UmmS
         VGs0aVHCbMkSGySp0xnB0Ax1+UxaGy2YSmRA8w+OBVleHOkXI8mg+B50cs2LNEQk1TnX
         aREQrocswSln7SH43cnDAHb+HoZwqASZpdKgcOOjpQsG/1XJRrpPk6QthDqELfTJTuol
         Do6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ilac5N16wRLRjMqd0XjLQuhlzYF1MfbZV7+T6OkX0m0=;
        b=LXCQ0NBcnVIgsXK7GYqApUR1iHMOUfHoFZPNekudScGx7eWftdcujRLKrvENaRYA65
         tA+/MUW3NgDeZa6RumlrzpGV2XaSKZFmf+R1sXmMQObgH6MHI6oODpoPWVJoriskrXHm
         Ng7D788rdt2/u90LR9zYjR/A+oh5YhZEb24HyxLqG4W2T5Y6CF9LHSK1Cz/dCMmC/Tj5
         SEiyrQpFxbFIJmmuGfhxdvuwpD8psyjSHR3yJaVayJ1bODDQKWNUBLnEs5hBOlr/OdyV
         zXMIMLy+jbm5zK4f51HB7R7OkZC3h768gNcLdz9oBpB4yUDhL+LA+iEpuKGBod8NSwch
         b2pg==
X-Gm-Message-State: AOAM530ER+SOF139+JTK8AU2jMGpYcoh9nvlumu1bA0QNv0r3b62xwqj
        6DUgY841sDO1b5QAbin09iiC4IZm3rgZ7/uyPmjv9w==
X-Google-Smtp-Source: ABdhPJyxoD0HUn+/Gp4TYvns4bDwSNYqlmrr1rZ4FZIiJBPN+cV6ynhdRb5LvcXtKgBk5ajlSWrfF8xqdyXj+RjD1kM=
X-Received: by 2002:ad4:5188:: with SMTP id b8mr8359542qvp.55.1610135653044;
 Fri, 08 Jan 2021 11:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-6-roderick@gaikai.com>
 <JtD5x8UNWvllStSHpZaryZUUarp8NZiy5G3HjT9xEIiUCxzfNmsaS7CSX52XSEObQ1TwkXlMPkNE0KG7JTl_WOgzOXDocF9jFecpqUkrBwg=@protonmail.com>
 <CANndSKk9Z=ivs_TiuLd77Kv9DMdhqTcdQnobNfnfVPTd2Bpzqg@mail.gmail.com>
 <oMAXtdv54Nx6A2ugm9PmU5jd430MrPZPoJ01iEcCtUXZ5dxzHQc3hqTxp_Mb-2oKdtBEAd-U3QsTD2JFROklqtvl4HV-BB7LGDfn1d3MnUg=@protonmail.com>
 <CAKF84v3v3rJ=VJVPDqH8EQieqjXyAuMJgQf-XUT4t0zthQ2FDA@mail.gmail.com>
In-Reply-To: <CAKF84v3v3rJ=VJVPDqH8EQieqjXyAuMJgQf-XUT4t0zthQ2FDA@mail.gmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Fri, 8 Jan 2021 11:54:02 -0800
Message-ID: <CANndSKk3MYb9+jpnUmtuo9bO89qXbQ0rwMGURA538O23-zv+6g@mail.gmail.com>
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

It might be an idea to indeed use that API. I wasn't aware of its
existence. Though I don't fully understand how it works (and how you
can guarantee alignment). Unfortunately I don't see any drivers in
upstream Linux using it. Do you happen to know of drivers using it? I
guess the might be some in Android kernel-common?

Thanks,
Roderick

On Fri, Jan 8, 2021 at 9:15 AM Siarhei Vishniakou <svv@google.com> wrote:
>
> Hi Roderick,
>
> Is there any way to align the sensor timestamps with the real clock on
> this new device? If so, there's input_set_timestamp api [0] that could
> be used for setting the timestamps of the actual input_events rather
> than having to send out parallel MSC_TIMESTAMP messages. It would make
> it easier for user space to process these events.
>
> [0] https://patchwork.kernel.org/project/linux-input/patch/20190718194133=
.64034-1-atifniyaz@google.com/
>
>
> On Fri, Jan 8, 2021 at 2:03 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail=
.com> wrote:
> >
> > Hi
> >
> >
> > 2021. janu=C3=A1r 8., p=C3=A9ntek 7:06 keltez=C3=A9ssel, Roderick Colen=
brander =C3=ADrta:
> >
> > > [...]
> > > > > +static int dualsense_get_calibration_data(struct dualsense *ds)
> > > > > +{
> > > > > +     short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
> > > > > +     short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
> > > > > +     short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
> > > > > +     short gyro_speed_plus, gyro_speed_minus;
> > > > > +     short acc_x_plus, acc_x_minus;
> > > > > +     short acc_y_plus, acc_y_minus;
> > > > > +     short acc_z_plus, acc_z_minus;
> > > > > +     int speed_2x;
> > > > > +     int range_2g;
> > > > > +     int ret =3D 0;
> > > > > +     uint8_t *buf;
> > > > > +
> > > > > +     buf =3D kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KER=
NEL);
> > > > > +     if (!buf)
> > > > > +             return -ENOMEM;
> > > > > +
> > > > > +     ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT=
_CALIBRATION, buf,
> > > > > +                     DS_FEATURE_REPORT_CALIBRATION_SIZE, HID_FEA=
TURE_REPORT, HID_REQ_GET_REPORT);
> > > >
> > > > I think it would be better if lines were aligned. I have missed thi=
s in other patches,
> > > > so if you decide to make this change, please do it everywhere.
> > >
> > > What do you mean with "if lines were aligned"? You mean aligning the
> > > DS_FEATURE.. part with ds->base.hdev?
> >
> > Yes, exactly.
> >
> >
> > >
> > > I'm almost tempted in the future (as part of a future patch series) t=
o
> > > perhaps have a ps_device_get_feature_report or something like that as
> > > there is the same code in multiple places. It can do some nicer
> > > checking as well (including to see if the first byte is the report ID
> > > number, which is guaranteed for DualSense). I think it is a bit much
> > > to add now, but probably in the future also when I add DualShock 4 in
> > > here.
> >
> > I think it's a good idea to add such a function sometime.
> >
> >
> > >
> > > >
> > > > > +     if (ret < 0)
> > > > > +             goto err_free;
> > > > > +     else if (ret !=3D DS_FEATURE_REPORT_CALIBRATION_SIZE) {
> > > >
> > > > As per coding style[1], please either use {} for all branches, or j=
ust drop the
> > > > `else` and maybe add a new line:
> > > >
> > > > ```
> > > > if (ret < 0)
> > > >   goto ...
> > > >
> > > > if (ret !=3D ...) {
> > > >   ...
> > > > }
> > > > ```
> > > >
> > > >
> > > > > +             hid_err(ds->base.hdev, "failed to retrieve DualSens=
e calibration info\n");
> > > >
> > > > I think this message could be improved to better pinpoint the exact=
 problem
> > > > that triggered it.
> > > >
> > > >
> > > > > +             ret =3D -EINVAL;
> > > > > +             goto err_free;
> > > > > +     }
> > > [...]
> >
> >
> > Regards,
> > Barnab=C3=A1s P=C5=91cze



--=20
Roderick Colenbrander
Senior Manager of Hardware & Systems Engineering
Sony Interactive Entertainment LLC
roderick.colenbrander@sony.com
