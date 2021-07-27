Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00603D8235
	for <lists+linux-input@lfdr.de>; Tue, 27 Jul 2021 23:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbhG0V7O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Jul 2021 17:59:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhG0V7N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Jul 2021 17:59:13 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58181C061757;
        Tue, 27 Jul 2021 14:59:12 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y34so34463lfa.8;
        Tue, 27 Jul 2021 14:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3ONlbHhhpshJCn+krWea9xQrc29MKyXpo9aZe1ImZpQ=;
        b=H/CoZ0bzc5GewqGDFZjMhy9WKx2MxHpyXH5FpRaEBIqjsVj9FQFRDm3Hnn4PljO0YX
         br38Ddo6EeFeqnaG2ZGs70XaQUC+umduS1e+4NZUyxCvZzH0QJLQLYaaTMYviXcPfFnl
         spqlyuWwPAQaUsarNlMQboFNhDeEZMk43omV+PLCFEMM7AjekDJj1lAnt/uBlJfleQKR
         YBC2+HFJr/KNGd0lliscdV1xC8+AsRbUX4t+BIDqVV5s0n3YBHK8uWetAhodTnxZoeNe
         1tY+rkWwvsemQGBWX12pqAh1hoIk44+3DMwFgjx47z89CiAc1fmKTbJ9ushihPZbrI05
         a0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3ONlbHhhpshJCn+krWea9xQrc29MKyXpo9aZe1ImZpQ=;
        b=V2enJ50fPqXfTzwj62Cyt7ff+vR1fh17py1RQUIY78+VSyS8Fu1vLhvLNuVLICMgIW
         kOeHjTHBjbUK2nkCeiI0aq0vjZDoAywxCHNbr++qRWN/btwOM+gKEUdBTfoBDmImiA4h
         K6qfctm2Ifjl0NY7KsGlQg5eE+8Kzkq0+tDvXXll3aK9CNkBNRXbr4aIh/u6PaOXsRFT
         F3oWjGhoXygEMYZNkIyrHASiDvJxNaJs33agMc9Q/kVdHaIF3tAEsUBydBW0T9/pYEoY
         q7YKeFRd89sArzJV0bGCHf+gJJ0D5OjGKKUlZzOItenBc/I+yzgTCg/7fKWw0FaeG68j
         /7NQ==
X-Gm-Message-State: AOAM5308e+btwdUMxBlmSVUa+pWltDFFFCejrPG3GTuiTFX3vxqLXLuj
        vnzzRIP8jIdQY3JPbiAGEJjoVg9TAfGikLk8pJw=
X-Google-Smtp-Source: ABdhPJxThpMeIaELkDJgTxazTW4WJ7uwxFtq9AO2LLbVT2WQ7b0dR54r7Mxyx2xVr8sIzaW1564kDLxf+VUcI6+7NLA=
X-Received: by 2002:a05:6512:321c:: with SMTP id d28mr17892862lfe.203.1627423150674;
 Tue, 27 Jul 2021 14:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210708141935.bx33mv2jxtm752z3@julianexternal> <20210714075723.17294-1-jose.exposito89@gmail.com>
In-Reply-To: <20210714075723.17294-1-jose.exposito89@gmail.com>
From:   Alex Henrie <alexhenrie24@gmail.com>
Date:   Tue, 27 Jul 2021 15:58:59 -0600
Message-ID: <CAMMLpeTKcd+WijyEAnH9vkHjuF+_K9-_EvTXThCDOhoeucNyHg@mail.gmail.com>
Subject: Re: BUG: cannot enable iso_layout with apple keyboard
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     juw@posteo.de, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 14, 2021 at 1:57 AM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gm=
ail.com> wrote:
>
> > Hi,
> >
> > I have an apple keyboard model A1644 EMC 2815 with Finnish/Swedish ISO =
layout. When I connect it via
> > cable it works fine. But when I connect it via bluetooth, then the butt=
ons >/< and =C2=A7/=C2=B0 are swapped.
> > It seems to make no difference if I set iso_layout to 0 or to 1. I chec=
ked and it turns out that
> > hid->country below equals 0, and removing the check
> >
> > diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > index 6b8f0d004d34..8a764ce4e518 100644
> > --- a/drivers/hid/hid-apple.c
> > +++ b/drivers/hid/hid-apple.c
> > @@ -267,13 +267,11 @@ static int hidinput_apple_event(struct hid_device=
 *hid, struct input_dev *input,
> >         }
> >
> >         if (iso_layout) {
> > -               if (hid->country =3D=3D HID_COUNTRY_INTERNATIONAL_ISO) =
{
> >                         trans =3D apple_find_translation(apple_iso_keyb=
oard, usage->code);
> >                         if (trans) {
> >                                 input_event(input, usage->type, trans->=
to, value);
> >                                 return 1;
> >                         }
> > -               }
> >         }
> >
> >         if (swap_opt_cmd) {
> >
> > makes the buttons act correctly. Please let me know how I can help fixi=
ng this.
> >
> > Best regards,
> > Julian Weigt
>
> Hi Julian,
>
> I can confirm I can reproduce the issue with a Spanish/Spain keyboard.
>
> The problem seems to be that the field "bCountryCode" is not present when=
 the keyboard is connected over bluetooth.
>
> CCing Alex Henrie, hopefully he can add useful information about the issu=
e.
>
> Best wishes,
> Jose

Thanks Julian and Jos=C3=A9 for bringing this to my attention. I also found
an Ubuntu bug report [1] which suggests that some of Apple's USB ISO
keyboards do not set the country code either. I have ordered a variety
of Apple keyboards from eBay for testing and I will send a fix as soon
as I am able.

-Alex

[1] https://bugs.launchpad.net/ubuntu/+source/xkeyboard-config/+bug/1886215
