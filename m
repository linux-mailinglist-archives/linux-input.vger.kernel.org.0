Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241CA2E74EF
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 22:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgL2Vps (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 16:45:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgL2Vps (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 16:45:48 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61486C061574
        for <linux-input@vger.kernel.org>; Tue, 29 Dec 2020 13:45:08 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id z20so9859032qtq.3
        for <linux-input@vger.kernel.org>; Tue, 29 Dec 2020 13:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3bBs0M8kImkF0FyCDQLgfx0gXp5pCQDaAlE/FukjzQY=;
        b=Xfwt/1XKlKjuQMc5XStz+26hx9Miv9DedlrbeQ2RHWZH1qmsw8MtFv/uPafn9MaTaU
         28dntWIvbJK2Yw/oEPkPzJtvVGsOCN8mzXctNuFYMPoyAkCF2rSbW28wPQ8pGrNt11q3
         eWRCdpAI9+xalA6lVTJHrHs6CYCdWi0FghT8sjCyXpOG80GW1FxJOde09pOYoDq8A7MF
         9Ar8dsVR9hGRPiYwIh85xHwPy+dUN2y1nQHmP4xNQzNq3DqcJOrVNYCrR8W/PLZaD3k8
         BLwyFvr/fJ9ArQZqd7iwlDUomVheP8BRqyYG4+IQay8lkeREeJ8WdQMG/3qIeW8Fxb4O
         8aTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3bBs0M8kImkF0FyCDQLgfx0gXp5pCQDaAlE/FukjzQY=;
        b=h38Fpsa4X0cCRTnMj42SoCj9Yyiq+K15YCSGGb9kK5cUDz9N+FOXmdDCpGPDUBQaZs
         U1AM3aHBxSJAC0l+E7V0dpgfPVMHdbTztDyNucUMH3C81i8LIesE3acV0JWcZRL+CKo9
         iW4p3Z6TCzsEyKYwvi+60ywbUOD2ycLwKjl9hoXQZ88G+/Ftumm5XZ+e/H8vGff4G4gz
         ygeaEw/PomODdCHtWiBYiIihpHncC0CcywFSMt0sWVlcQqjTQMv9+3aY/y2mlkGTvTYL
         eJaGgRsHO7ZY4oPBuPLb9Yv5YKMAvDSZ7/i6xo5wLkCxlrrjyNcsL8RcGtPzWRBRx4Mp
         qILw==
X-Gm-Message-State: AOAM533dDCyf+79xc2ka5Wfxcmo1j3Cf/Gdaoh+6AdveJVbLWdHHVq7W
        X+FdgQsv68CR7gjwiM7UJD2YuCwFPrR6z8PiaUvDXA==
X-Google-Smtp-Source: ABdhPJyiZbKN9RFRaHdMTUkPAbIGuo6XXR6soR2jq5TvLtVEsoq+N3H2N5A89ZUX9ozscHFHSzeuSBZmpGYU7rQVlq8=
X-Received: by 2002:ac8:220a:: with SMTP id o10mr45155231qto.280.1609278307578;
 Tue, 29 Dec 2020 13:45:07 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-5-roderick@gaikai.com>
 <0bb0xOVgrcExPVWhI6l8FLVpv0mSssrc2XCHGPzzf_dkg0500rAw4SUNaLBGrWUk68HMOiNhFk39v4I3_euvIJrpqzEIS6S_b4raTEsBd4k=@protonmail.com>
In-Reply-To: <0bb0xOVgrcExPVWhI6l8FLVpv0mSssrc2XCHGPzzf_dkg0500rAw4SUNaLBGrWUk68HMOiNhFk39v4I3_euvIJrpqzEIS6S_b4raTEsBd4k=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Tue, 29 Dec 2020 13:44:56 -0800
Message-ID: <CANndSKnabBJ9ZmNwr=e+mU47ZKPjds=F5SAC5OE0CoyrR_rPGw@mail.gmail.com>
Subject: Re: [PATCH 04/13] HID: playstation: add DualSense touchpad support.
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Barnab=C3=A1s,

On Tue, Dec 29, 2020 at 11:49 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail=
.com> wrote:
>
> Hi
>
>
> 2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:
>
> > [...]
> > +static struct input_dev *ps_touchpad_create(struct hid_device *hdev, i=
nt width, int height,
> > +             int num_contacts)
>
> Very minor thing, but `input_mt_init_slots()` takes an `unsigned int`, so
> wouldn't it be better if `num_contacts` was an `unsigned int`?

Agreed.

>
> > +{
> > +     struct input_dev *touchpad;
> > +     int ret;
> > +
> > +     touchpad =3D ps_allocate_input_dev(hdev, "Touchpad");
> > +     if (IS_ERR(touchpad))
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     /* Map button underneath touchpad to BTN_LEFT. */
> > +     input_set_capability(touchpad, EV_KEY, BTN_LEFT);
> > +     __set_bit(INPUT_PROP_BUTTONPAD, touchpad->propbit);
> > +
> > +     input_set_abs_params(touchpad, ABS_MT_POSITION_X, 0, width, 0, 0)=
;
> > +     input_set_abs_params(touchpad, ABS_MT_POSITION_Y, 0, height, 0, 0=
);
>
> Shouldn't it be `width - 1` and `height - 1`? Or what am I missing?

I suspect that's what it should be. The docs aren't very clear on that
and after glancing around other drivers (in particular
input/touchscreen) many seem to be off by 1 as well. I think it should
indeed be 'width - 1' as also related axes are created through
input_mt_init_slots like ABS_X and ABS_Y, which inherit the same
dimensions and which would also be off by 1. So yeah, good catch.

> > +
> > +     ret =3D input_mt_init_slots(touchpad, num_contacts, INPUT_MT_POIN=
TER);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     ret =3D input_register_device(touchpad);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return touchpad;
> > +}
> > +
> >  static int dualsense_get_mac_address(struct dualsense *ds)
> >  {
> >       uint8_t *buf;
> > @@ -271,6 +304,7 @@ static int dualsense_parse_report(struct ps_device =
*ps_dev, struct hid_report *r
> >       uint8_t battery_data, battery_capacity, charging_status, value;
> >       int battery_status;
> >       unsigned long flags;
> > +     int i;
> >
> >       /* DualSense in USB uses the full HID report for reportID 1, but
> >        * Bluetooth uses a minimal HID report for reportID 1 and reports
> > @@ -311,6 +345,25 @@ static int dualsense_parse_report(struct ps_device=
 *ps_dev, struct hid_report *r
> >       input_report_key(ds->gamepad, BTN_MODE, ds_report->buttons[2] & D=
S_BUTTONS2_PS_HOME);
> >       input_sync(ds->gamepad);
> >
> > +     input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & =
DS_BUTTONS2_TOUCHPAD);
> > +     for (i =3D 0; i < 2; i++) {
> > +             bool active =3D (ds_report->points[i].contact & 0x80) ? f=
alse : true;
> > [...]
>
> I believe it'd be preferable to give a name to that 0x80.

Will do.

>
> Regards,
> Barnab=C3=A1s P=C5=91cze

Regards,
Roderick
