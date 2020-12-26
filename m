Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121382E2F46
	for <lists+linux-input@lfdr.de>; Sat, 26 Dec 2020 23:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgLZW1x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Dec 2020 17:27:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgLZW1x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Dec 2020 17:27:53 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19A42C061757
        for <linux-input@vger.kernel.org>; Sat, 26 Dec 2020 14:27:13 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id 186so6236351qkj.3
        for <linux-input@vger.kernel.org>; Sat, 26 Dec 2020 14:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sVCIp29IfubQaEXF6jdunifupKhW1Zcp7OvTUlaJX2E=;
        b=EMl+1lmVTcrfHr+Ii/xS/YbFOdhW4P15kSs6wpfq/6RicW9L9XGgK/s2D8I6AQCUen
         MltaUa1UOLZhNYRBw7RYFmqGV5c4icAAxIQG6aQhu+GoCUBuDW7HzyHAIqKPQQqD/iIN
         6FDJ2YrzFBUCHagN8PRgrb4y1knyJMK3govwCK/0AobLWAeO9LFo2jX2Y75MHjaIziFX
         12f0pyDmK93dslb0bCf0a9voWLp7QeMeRF0o6mJuLoaMHhql5jnpOTGuH+l7hsq9v4FR
         9sBNhp99m0epsOp1Cmys/SEbjbmb482jofiw4l9h+Lr3j9BmtGV30o24+uXqqKHYwcrD
         0//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sVCIp29IfubQaEXF6jdunifupKhW1Zcp7OvTUlaJX2E=;
        b=fB6DWzf28nBvIyXq5NeJrwyb9n0yex86tBwhBPVN7zcvo/J7mJtKlFEUIriWc4v55C
         BYae174I7PQXVjeXAXaYd+dx9cxlYsdgbHn7cXtskSZRYNzrNsOoFeTZxBD/+dHC5sLJ
         dl41fbKU+63VDrGPXvgRV7UgFw4/hPFMNlHkMgTFqC+7GkEnmkLPF7lhfhrO8K/EYEAx
         Xn2LoIbQ6HVta87KBK9C6CLNi7joyWiw8A9T1G5kSB2JFgfE9qpg8jYhsdVPKqcXEygK
         8C1Trq9x/wrZytjTba23wCWeGyOy5e5ZsGdqpO9qdRyCHjDhAl6ovkEZ2WsMYEehYkKi
         xLgw==
X-Gm-Message-State: AOAM532Qex9adoUrGOMbUE63aHxp5ZPIgICk3In6jvtJsguPW6Pw6hzh
        o0V+Yc2nOEnjYalXcbtfheXakmhuILz4EGEv0ZXEhA==
X-Google-Smtp-Source: ABdhPJzU8w8WqZRtMsYV4NpiK0pbGWzCnkSlZSB58iKgTCvJXG7zA4ilW9JZ8QjYnlyw/c1q+1CzGF1pkEIMjGgfC/4=
X-Received: by 2002:a37:a413:: with SMTP id n19mr39902982qke.15.1609021631436;
 Sat, 26 Dec 2020 14:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-5-roderick@gaikai.com>
 <20201226021456.gmnqkycoeqvdhk34@fastboi.localdomain>
In-Reply-To: <20201226021456.gmnqkycoeqvdhk34@fastboi.localdomain>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Sat, 26 Dec 2020 14:27:00 -0800
Message-ID: <CANndSKkqfok=4_eF3tGCRksT5farjoWmNEZDc7ZWkT0BooQSnQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] HID: playstation: add DualSense touchpad support.
To:     =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Samuel,

Thanks for your review.


On Fri, Dec 25, 2020 at 6:14 PM Samuel =C4=8Cavoj <samuel@cavoj.net> wrote:
>
> Hello,
>
> thank you for this driver. It makes me really happy to see an official
> one. Just a small thing I noticed while reading through it:
>
>
> On 18.12.2020 22:23, Roderick Colenbrander wrote:
> > @@ -311,6 +345,25 @@ static int dualsense_parse_report(struct ps_device=
 *ps_dev, struct hid_report *r
> >       input_report_key(ds->gamepad, BTN_MODE, ds_report->buttons[2] & D=
S_BUTTONS2_PS_HOME);
> >       input_sync(ds->gamepad);
> >
> > +     input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & =
DS_BUTTONS2_TOUCHPAD);
>
> The above line is duplicated right before the input_sync (marked). Is
> there any reason for this or is it accidental?

Good catch. It was purely accidental as the code went through many
rebases and code shuffling. So a little artifact..

>
> > +     for (i =3D 0; i < 2; i++) {
> > +             bool active =3D (ds_report->points[i].contact & 0x80) ? f=
alse : true;
> > +
> > +             input_mt_slot(ds->touchpad, i);
> > +             input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, =
active);
> > +
> > +             if (active) {
> > +                     int x =3D (ds_report->points[i].x_hi << 8) | ds_r=
eport->points[i].x_lo;
> > +                     int y =3D (ds_report->points[i].y_hi << 4) | ds_r=
eport->points[i].y_lo;
> > +
> > +                     input_report_abs(ds->touchpad, ABS_MT_POSITION_X,=
 x);
> > +                     input_report_abs(ds->touchpad, ABS_MT_POSITION_Y,=
 y);
> > +             }
> > +     }
> > +     input_mt_sync_frame(ds->touchpad);
> > +     input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & =
DS_BUTTONS2_TOUCHPAD);
>
> Right here.

I will probably keep this one and take the other one out as this is
next to the other touchpad code.

>
> > +     input_sync(ds->touchpad);
> > +
>
> Regards,
> Samuel

Thanks,
Roderick
