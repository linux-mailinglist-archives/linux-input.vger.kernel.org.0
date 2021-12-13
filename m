Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3D5472B51
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 12:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231512AbhLML1W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Dec 2021 06:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhLML1V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Dec 2021 06:27:21 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE5CC061574
        for <linux-input@vger.kernel.org>; Mon, 13 Dec 2021 03:27:21 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id m17so14047870qvx.8
        for <linux-input@vger.kernel.org>; Mon, 13 Dec 2021 03:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I1ZAuLx8I80pMQaUrC8Y4DeMnmBoIz4StJRLHGV/Wyw=;
        b=L4LPsWigT9OiVBlsfSg3hReTSIlGQDDx0uHiDOhIqwgrnG9BaD0ir/XXql17+ezTfD
         IlZoBIBtQHCS0w9loUPYENudSErNf7XQvcer1R5Eu9a8fxE/Iq0XUboum9oCdvSNxbOc
         g0aJWL7p9Dm+ltHJR3IwjktQQoHwpTqOUYKem7ULuZbSA+JQP9wGLD8HN7FQomNcTVHZ
         OEt8nY69xxqvEPL+PTOjz3g01Sm4NWJlay9ZBOPAq0qgEhjc9WZPZ5ZNr0ts/MPwza/Z
         tDmSiYW5CAXUi7WzNvHcVpCWwb0mTPCp2NVCWQWmqrknOy7OITA3WF+x/zgVsSYK2+oH
         wQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I1ZAuLx8I80pMQaUrC8Y4DeMnmBoIz4StJRLHGV/Wyw=;
        b=zlQS4TZBGeMMgNnG6I0f9uTeiw5CxdZ+M403NA38u+fl4LCJqVFCGF5fKT88G2BxgD
         HK/6/Nm7r6TaxEnRbc49JOAXPD+Lox9ID9u2ibFTcJNBpurEu0HDRDft5i1mAtujen08
         1UXah/mUu55jstjcquNdwj07J+leAe7//lpMm+rOeUSF6VuBpqL8uRIlY1Gq54GhEEBD
         CzFzRTQwvqw08sSEOdWKYsOvdrVEx0UDfn57Hvg/IU5WMbGsCulxQJIcRWKaLHsYLYY7
         J7S8Np12r01jAMf7XwEf0zMNtopVPPaQx0g361Ev7BYDBbakeA03oEEm6muEEvJ0xEoC
         jgTQ==
X-Gm-Message-State: AOAM530dk6pyKnGrwK1GtdiMsKwnsEqE5bGd+JYOwZCiGcB3TVJU4CHT
        by85NVc4tcsMmWELc+sIDixAajasgsaKnU7p0DySoA==
X-Google-Smtp-Source: ABdhPJx3p3AU8sVc0C/DeMjb4FWPYiGkcfZcqgZA7dRXxy40gWIH35pzen/G8vBhRylKIPWC/+Zz06jC/N1x3jCRX/w=
X-Received: by 2002:a05:6214:238c:: with SMTP id fw12mr41713397qvb.103.1639394840414;
 Mon, 13 Dec 2021 03:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20211129143845.1472453-1-glider@google.com> <YbQTA9NWoDAknJKB@google.com>
In-Reply-To: <YbQTA9NWoDAknJKB@google.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Mon, 13 Dec 2021 12:26:43 +0100
Message-ID: <CAG_fn=V=vykKUHxa2dTxehgdifP4-8R2LKcOXrEmRbfO1DRnng@mail.gmail.com>
Subject: Re: [PATCH] Input: psmouse: check the result of PSMOUSE_CMD_GET* commands
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     dvyukov@google.com, elver@google.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 11, 2021 at 3:55 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Alexander,
>
> On Mon, Nov 29, 2021 at 03:38:45PM +0100, Alexander Potapenko wrote:
> > Execution of a PSMOUSE_CMD_GET* command may fail, leaving the output
> > buffer uninitialized. Make sure to check the return value of
> > ps2_command() and bail out before checking the buffer contents.
> >
> > The use of uninitialized data in genius_detect() was detected by KMSAN,
> > other places were fixed for the sake of uniformity.
> >
> > Signed-off-by: Alexander Potapenko <glider@google.com>
> > ---
> >  drivers/input/mouse/psmouse-base.c | 21 ++++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/p=
smouse-base.c
> > index 0b4a3039f312f..a3305653ce891 100644
> > --- a/drivers/input/mouse/psmouse-base.c
> > +++ b/drivers/input/mouse/psmouse-base.c
> > @@ -546,13 +546,16 @@ static int genius_detect(struct psmouse *psmouse,=
 bool set_properties)
> >  {
> >       struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> >       u8 param[4];
> > +     int error;
> >
> >       param[0] =3D 3;
> >       ps2_command(ps2dev, param, PSMOUSE_CMD_SETRES);
> >       ps2_command(ps2dev,  NULL, PSMOUSE_CMD_SETSCALE11);
> >       ps2_command(ps2dev,  NULL, PSMOUSE_CMD_SETSCALE11);
> >       ps2_command(ps2dev,  NULL, PSMOUSE_CMD_SETSCALE11);
> > -     ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
> > +     error =3D ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
> > +     if (error)
> > +             return error;
>
> If we care about this I think we should care about errors from the rest
> of ps2_command()s. Otherwise we might have buffer initialized, but we
> are still checking potential garbage in it.

Ok, I am going to add error checking to ps2_command()s that occur in
the device detection code, because it's a sane assumption that every
command in the device handshake should succeed.
The only exception I see is the IntelliMouse 4.0 support code in
im_explorer_detect
(https://elixir.bootlin.com/linux/latest/source/drivers/input/mouse/psmouse=
-base.c#L628),
where it is unclear whether these functions must succeed or not.
I also won't be touching calls to ps2_command() in void functions
which do not return errors anyway, and PSMOUSE_CMD_RESET_DIS commands,
for which it is also unclear what to return.


I think it makes sense to bail out if one of the ps2_command()
preceding PSMOUSE_CMD_GET* returned an error, but am not sure

The bugs caused by incorrect uses of PSMOUSE_CMD_GET are blocking
KMSAN builds on syzbot, so we can immediately test the effect of the
proposed change.

If there were


> Thanks.
>
> --
> Dmitry



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
