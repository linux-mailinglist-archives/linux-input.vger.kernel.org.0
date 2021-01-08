Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44A02EF654
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 18:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbhAHRP7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 12:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbhAHRP7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 12:15:59 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515E3C061380
        for <linux-input@vger.kernel.org>; Fri,  8 Jan 2021 09:15:19 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id cw27so11931742edb.5
        for <linux-input@vger.kernel.org>; Fri, 08 Jan 2021 09:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rz/17HymtfAXbILWEza9OX/xdqD+gbFCPwGAp9i9qPk=;
        b=WUGjaTdArYqJV1Kmqw2pMXovEvfvfzH2HKA/drpJuS8NA99OHHuh65nYFIgZbJxQ/L
         heBPanCLtK0Ln0CbEUBdadGS8JVB5yR8e558O/CczE/Qav+T2l06uGbcFoArbNB8kvhv
         5Vksf1c7UPOLkfpZBfG6UQ09rjf2pzvLXm4ca5BQ7uNsKwuygIf5X1qHn3H85b/20zvT
         3y9nupKuXAPdhxupz8zw0wlVyQUc1cMfChcLKS2QTXuXdnhf4mb+CeCV44b/2iKCcuNc
         pTW3rM2Cgs94AJrWHwHakTVf33nHl/FC0XSang6WZphRuCiAkLFUvj3tPsII/pmGHD+R
         dJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rz/17HymtfAXbILWEza9OX/xdqD+gbFCPwGAp9i9qPk=;
        b=IHvl1Z1fLo5HC66u1l15cr+/8gFrgmGA0YmPStrPuogh036Dg1vwxrO4oCmxNnkcsw
         Wv2BzimTbtCu+bNbhYdQUlJeAUDtvgORhiucbRy07kGsLsIMZhgFe9Ad53KYM2frb75T
         a6YW6odeJWmw6yMdDbyNhP5UXbYbxIDhHztaDaXyRV2YsG9cp8K35yxN9F3FyWXepAF7
         EGpa2UcPSLQRPwtcA2g6JP4xMOwtz4BkXoEJbfxMvTFl5MxjEytQeAHInjEMUjyehvqa
         8CuwAjRPEbLQH0JMvWgG/0DkLCaMIl52gCJOIg1zP7iNueX+6y53or4WqkG5UwesTvRA
         TZNg==
X-Gm-Message-State: AOAM530AJ4XhjXgM8yC9o5XEFLmChqBnHwgg6lFV0KVV0OeTuHHu8LMi
        MQ9PJ2dpyCysGpeg0SjE+1FEmvsCuhMqQL7beevmFg==
X-Google-Smtp-Source: ABdhPJwq47twENISg1Awq0hgekmoqhZxmsHk39IVSvP8fAipQ6Oj6GkaHzhDj5Rq7DnKIjDDFPIC1c/hxQU7qzo6iGw=
X-Received: by 2002:aa7:d1c2:: with SMTP id g2mr6165700edp.8.1610126117855;
 Fri, 08 Jan 2021 09:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-6-roderick@gaikai.com>
 <JtD5x8UNWvllStSHpZaryZUUarp8NZiy5G3HjT9xEIiUCxzfNmsaS7CSX52XSEObQ1TwkXlMPkNE0KG7JTl_WOgzOXDocF9jFecpqUkrBwg=@protonmail.com>
 <CANndSKk9Z=ivs_TiuLd77Kv9DMdhqTcdQnobNfnfVPTd2Bpzqg@mail.gmail.com> <oMAXtdv54Nx6A2ugm9PmU5jd430MrPZPoJ01iEcCtUXZ5dxzHQc3hqTxp_Mb-2oKdtBEAd-U3QsTD2JFROklqtvl4HV-BB7LGDfn1d3MnUg=@protonmail.com>
In-Reply-To: <oMAXtdv54Nx6A2ugm9PmU5jd430MrPZPoJ01iEcCtUXZ5dxzHQc3hqTxp_Mb-2oKdtBEAd-U3QsTD2JFROklqtvl4HV-BB7LGDfn1d3MnUg=@protonmail.com>
From:   Siarhei Vishniakou <svv@google.com>
Date:   Fri, 8 Jan 2021 07:15:06 -1000
Message-ID: <CAKF84v3v3rJ=VJVPDqH8EQieqjXyAuMJgQf-XUT4t0zthQ2FDA@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] HID: playstation: add DualSense accelerometer
 and gyroscope support.
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
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

Hi Roderick,

Is there any way to align the sensor timestamps with the real clock on
this new device? If so, there's input_set_timestamp api [0] that could
be used for setting the timestamps of the actual input_events rather
than having to send out parallel MSC_TIMESTAMP messages. It would make
it easier for user space to process these events.

[0] https://patchwork.kernel.org/project/linux-input/patch/20190718194133.6=
4034-1-atifniyaz@google.com/


On Fri, Jan 8, 2021 at 2:03 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.c=
om> wrote:
>
> Hi
>
>
> 2021. janu=C3=A1r 8., p=C3=A9ntek 7:06 keltez=C3=A9ssel, Roderick Colenbr=
ander =C3=ADrta:
>
> > [...]
> > > > +static int dualsense_get_calibration_data(struct dualsense *ds)
> > > > +{
> > > > +     short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
> > > > +     short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
> > > > +     short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
> > > > +     short gyro_speed_plus, gyro_speed_minus;
> > > > +     short acc_x_plus, acc_x_minus;
> > > > +     short acc_y_plus, acc_y_minus;
> > > > +     short acc_z_plus, acc_z_minus;
> > > > +     int speed_2x;
> > > > +     int range_2g;
> > > > +     int ret =3D 0;
> > > > +     uint8_t *buf;
> > > > +
> > > > +     buf =3D kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNE=
L);
> > > > +     if (!buf)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_C=
ALIBRATION, buf,
> > > > +                     DS_FEATURE_REPORT_CALIBRATION_SIZE, HID_FEATU=
RE_REPORT, HID_REQ_GET_REPORT);
> > >
> > > I think it would be better if lines were aligned. I have missed this =
in other patches,
> > > so if you decide to make this change, please do it everywhere.
> >
> > What do you mean with "if lines were aligned"? You mean aligning the
> > DS_FEATURE.. part with ds->base.hdev?
>
> Yes, exactly.
>
>
> >
> > I'm almost tempted in the future (as part of a future patch series) to
> > perhaps have a ps_device_get_feature_report or something like that as
> > there is the same code in multiple places. It can do some nicer
> > checking as well (including to see if the first byte is the report ID
> > number, which is guaranteed for DualSense). I think it is a bit much
> > to add now, but probably in the future also when I add DualShock 4 in
> > here.
>
> I think it's a good idea to add such a function sometime.
>
>
> >
> > >
> > > > +     if (ret < 0)
> > > > +             goto err_free;
> > > > +     else if (ret !=3D DS_FEATURE_REPORT_CALIBRATION_SIZE) {
> > >
> > > As per coding style[1], please either use {} for all branches, or jus=
t drop the
> > > `else` and maybe add a new line:
> > >
> > > ```
> > > if (ret < 0)
> > >   goto ...
> > >
> > > if (ret !=3D ...) {
> > >   ...
> > > }
> > > ```
> > >
> > >
> > > > +             hid_err(ds->base.hdev, "failed to retrieve DualSense =
calibration info\n");
> > >
> > > I think this message could be improved to better pinpoint the exact p=
roblem
> > > that triggered it.
> > >
> > >
> > > > +             ret =3D -EINVAL;
> > > > +             goto err_free;
> > > > +     }
> > [...]
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze
