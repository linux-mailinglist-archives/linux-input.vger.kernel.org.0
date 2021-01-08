Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEE02EF1BB
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 13:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbhAHMCd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 07:02:33 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:24382 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbhAHMCd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 07:02:33 -0500
Date:   Fri, 08 Jan 2021 12:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610107309;
        bh=zpTfmAFmzzyF12fSZ+3SgpCbVFEAuo4rlSl1vkrvXaA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=mLIaQG0a0PQehMZP5SeWiE7S9xE1MjgcPGyeBGstN3f6eazeDQtjREUBRKS0PB2xl
         AlzB8OYSZlmz0ufXHbcINBavaNiY7d6Bb5DImVhLsGTpqIQfIMnBh2Ybj6MuZ+uzwC
         7PVi0GQHjeRP3EHImvALt+7yQEGOTh4QHxUTrXE4=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 05/13] HID: playstation: add DualSense accelerometer and gyroscope support.
Message-ID: <oMAXtdv54Nx6A2ugm9PmU5jd430MrPZPoJ01iEcCtUXZ5dxzHQc3hqTxp_Mb-2oKdtBEAd-U3QsTD2JFROklqtvl4HV-BB7LGDfn1d3MnUg=@protonmail.com>
In-Reply-To: <CANndSKk9Z=ivs_TiuLd77Kv9DMdhqTcdQnobNfnfVPTd2Bpzqg@mail.gmail.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-6-roderick@gaikai.com> <JtD5x8UNWvllStSHpZaryZUUarp8NZiy5G3HjT9xEIiUCxzfNmsaS7CSX52XSEObQ1TwkXlMPkNE0KG7JTl_WOgzOXDocF9jFecpqUkrBwg=@protonmail.com> <CANndSKk9Z=ivs_TiuLd77Kv9DMdhqTcdQnobNfnfVPTd2Bpzqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi


2021. janu=C3=A1r 8., p=C3=A9ntek 7:06 keltez=C3=A9ssel, Roderick Colenbran=
der =C3=ADrta:

> [...]
> > > +static int dualsense_get_calibration_data(struct dualsense *ds)
> > > +{
> > > +     short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
> > > +     short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
> > > +     short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
> > > +     short gyro_speed_plus, gyro_speed_minus;
> > > +     short acc_x_plus, acc_x_minus;
> > > +     short acc_y_plus, acc_y_minus;
> > > +     short acc_z_plus, acc_z_minus;
> > > +     int speed_2x;
> > > +     int range_2g;
> > > +     int ret =3D 0;
> > > +     uint8_t *buf;
> > > +
> > > +     buf =3D kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL)=
;
> > > +     if (!buf)
> > > +             return -ENOMEM;
> > > +
> > > +     ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_CAL=
IBRATION, buf,
> > > +                     DS_FEATURE_REPORT_CALIBRATION_SIZE, HID_FEATURE=
_REPORT, HID_REQ_GET_REPORT);
> >
> > I think it would be better if lines were aligned. I have missed this in=
 other patches,
> > so if you decide to make this change, please do it everywhere.
>
> What do you mean with "if lines were aligned"? You mean aligning the
> DS_FEATURE.. part with ds->base.hdev?

Yes, exactly.


>
> I'm almost tempted in the future (as part of a future patch series) to
> perhaps have a ps_device_get_feature_report or something like that as
> there is the same code in multiple places. It can do some nicer
> checking as well (including to see if the first byte is the report ID
> number, which is guaranteed for DualSense). I think it is a bit much
> to add now, but probably in the future also when I add DualShock 4 in
> here.

I think it's a good idea to add such a function sometime.


>
> >
> > > +     if (ret < 0)
> > > +             goto err_free;
> > > +     else if (ret !=3D DS_FEATURE_REPORT_CALIBRATION_SIZE) {
> >
> > As per coding style[1], please either use {} for all branches, or just =
drop the
> > `else` and maybe add a new line:
> >
> > ```
> > if (ret < 0)
> >   goto ...
> >
> > if (ret !=3D ...) {
> >   ...
> > }
> > ```
> >
> >
> > > +             hid_err(ds->base.hdev, "failed to retrieve DualSense ca=
libration info\n");
> >
> > I think this message could be improved to better pinpoint the exact pro=
blem
> > that triggered it.
> >
> >
> > > +             ret =3D -EINVAL;
> > > +             goto err_free;
> > > +     }
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
