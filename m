Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C6E2E6B79
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 00:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730880AbgL1Wz4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Dec 2020 17:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729601AbgL1WDg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Dec 2020 17:03:36 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A05DC0613D6
        for <linux-input@vger.kernel.org>; Mon, 28 Dec 2020 14:02:56 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id f26so10085429qka.0
        for <linux-input@vger.kernel.org>; Mon, 28 Dec 2020 14:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9y9jx5wo0A27Ckg9sWJdmgkDseqY3hAQxCY2tGwfCL0=;
        b=YkomCscUffi/dL80lJb3C/AiF+bmKnWbBwkmV5f80tfbXP9nLt6h20E/oWNs/5fSDh
         tA5EklS68k28KSEzg8+Q+7pi8OtzVhzipZnR6kTgXZSniCJ5yRjOGuLW4tAEtBbEiV8b
         iQKjf3pigsDQ3sgERhdInb19ZSjUceUz/3+vpToRYBV0j6l3IB79UJOpomNxF5hB5QeN
         OcG/XEKqPkoYRJPGF6AFBT+s0BkPt1Ks39Hv7F1BU+DfF5uoVFEvVvcdvIXAT/RxPJMP
         qmd8PVHk+t/pLu9nftXvEoVmh0ozuj22ClqXwGOnomE2TmHyIfWD7weQV0LXQuUEVfdX
         fVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9y9jx5wo0A27Ckg9sWJdmgkDseqY3hAQxCY2tGwfCL0=;
        b=kh5OOijsc8AE+5Y+VB0/z9kqv9TX++n5VWw25+29Y/jrh7UaTa3xpJTK/YLi3a15Jc
         6ZrgNWDkdTTe30pvik8CjBbglkB4wtxBhC0aNx71aGXmiEyEWr9pyJ0Jv2UAX+sdtWj/
         FGZMCnnbPxf9SObELdpwl5jAcBfwpEtJPOrgBp2uXzRSWoRzO4YM1q2/6qSuwTcFFlnq
         uKYq5ZAOTCIOjuKaehhEZBZ7w/PEW/Q37mTCAY462B6kfifPlTleM+GwShCs86Nl6ps1
         54jYXrtpS7orfEfPlCJG3Q5C/M82tU2KcgdfRvWuz9ysP6P0cu781NoO+QrGD3xhmF90
         DV4g==
X-Gm-Message-State: AOAM532x6DDMaX0ijUN7HQjE9FsfAmRFrv/rmymupbdqiMLABsTK+baU
        fXJd3YHtty8a4tppz9eg0LG/fRIy1WVPLIr8IHKSDg==
X-Google-Smtp-Source: ABdhPJzfVZ+YHlqEoIuVj6mEA9ktwhcJ+cL2iiNeQ/RSqOk0+7TnH56AZeyy7h38dYUc2DyDPz5fZqKdOzSQQtZkEss=
X-Received: by 2002:a37:a413:: with SMTP id n19mr47262516qke.15.1609192975562;
 Mon, 28 Dec 2020 14:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-12-roderick@gaikai.com>
 <8ROOgrBVvXav7SOnZgBVtvZ4QKubyktYJ2WsauoAH22lewKj2-Rp9a-uEZyxhItvF3Q7pp8hKZ4etl0jgiD-G3XkbL1aM9z8cRNsHHmGN9A=@protonmail.com>
In-Reply-To: <8ROOgrBVvXav7SOnZgBVtvZ4QKubyktYJ2WsauoAH22lewKj2-Rp9a-uEZyxhItvF3Q7pp8hKZ4etl0jgiD-G3XkbL1aM9z8cRNsHHmGN9A=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Mon, 28 Dec 2020 14:02:44 -0800
Message-ID: <CANndSKkjhEDU0eB=J_F0CCZn2F=Jy3UMzBKOgJaNvecqRtAfnQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] HID: playstation: add DualSense player LEDs support.
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

On Sun, Dec 27, 2020 at 6:27 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Hi
>
>
> 2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:
>
> > [...]
> > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstatio=
n.c
> > index ad8eedd3d2bf..384449e3095d 100644
> > [...]
> > +static enum led_brightness dualsense_player_led_get_brightness(struct =
led_classdev *led)
> > +{
> > +     struct hid_device *hdev =3D to_hid_device(led->dev->parent);
> > +     struct dualsense *ds =3D hid_get_drvdata(hdev);
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(ds->player_leds); i++) {
> > +             if (&ds->player_leds[i] =3D=3D led)
> > +                     return !!(ds->player_leds_state & BIT(i));
> > +     }
>
> Is there any reason why
>
> ```
>   !!(ds->player_leds_state & BIT( led - ds->player_leds ))
> ```
>
> or something similar is not used? Or am I missing something that prevents=
 this
> from working?

I think this pointer math would work and need to give it a try. Hadn't
considered it

> Furthermore, I don't quite see the purpose of this function. The LED core
> can handle if no brightness_get() callback is provided. And since this
> function returns just a cached value, I fail to see how it is different f=
rom
> the default behaviour of the LED core, which is returning the last bright=
ness
> value. Am I missing something?

Not all values may get set through sysfs. For example in the next
patch (12/13) the driver sets a default player LED mask value directly
and may set e.g. 0x1f or so. This could use the LED APIs, but the LED
framework doesn't have any group LED support (besides the new
multicolor class) and as such would get scheduled across multiple
output reports.

>
> > +
> > +     return LED_OFF;
> > +}
> > +
> > +static void dualsense_player_led_set_brightness(struct led_classdev *l=
ed, enum led_brightness value)
> > +{
> > +     struct hid_device *hdev =3D to_hid_device(led->dev->parent);
> > +     struct dualsense *ds =3D hid_get_drvdata(hdev);
> > +     uint8_t player_leds_state =3D 0;
> > +     unsigned long flags;
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(ds->player_leds); i++)
> > +             player_leds_state |=3D (ds->player_leds[i].brightness << =
i);
> > +
>
> I believe this could be simplified as well using the fact that
> `led - ds->player_leds` gives the index of the LED.

I will give this a try as well, thanks.

>
> > +     spin_lock_irqsave(&ds->base.lock, flags);
> > +     ds->player_leds_state =3D player_leds_state;
> > +     ds->update_player_leds =3D true;
> > +     spin_unlock_irqrestore(&ds->base.lock, flags);
> > +
> > +     schedule_work(&ds->output_worker);
> > +}
> > [...]
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze

Thanks,
Roderick
