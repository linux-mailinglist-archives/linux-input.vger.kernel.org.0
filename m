Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429FA2E2F56
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 00:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgLZXIm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Dec 2020 18:08:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgLZXIl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Dec 2020 18:08:41 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D085C061757
        for <linux-input@vger.kernel.org>; Sat, 26 Dec 2020 15:08:01 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id f26so6305838qka.0
        for <linux-input@vger.kernel.org>; Sat, 26 Dec 2020 15:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZaHsowHUCtVINT6ow6oKB1guSGT4fj01lEM6nshB4NM=;
        b=QhqB4yM6HBp/Sxnps7YeY2eDNY9+3LVeS3iOWbQrDTbtuPjFWRJu86nqzWBQ7+ZOFS
         1iSUAbDNsCTv2T7t19iZiFrlIcJRuSpmw684IP4G0EarXTJ04RRTh/ntfdGuiSrvc9x0
         JithaQCTziCR50JRq80OM4jVWHNraekJbawKNN4OSK64Uuy1gUGGarLL0tyQghW9T01s
         AAx79GBE/zcO4rPX5r9xSGgdB5rOI6d16xIsMezl+0yae4tJFPhHCn4SSLkO08NQaDcf
         nftKJDZLmUq0AysrCiygGfvlSN4JTWI6r8A2FlV5hfbTAM0+yxBw5HDtNcjU+ziqtelo
         YtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZaHsowHUCtVINT6ow6oKB1guSGT4fj01lEM6nshB4NM=;
        b=cM3y+xFvr5DQ3d8Z0tAAJtr+AC7NcykBu9Csy58EvtdvVdViYlf8uTfRRU4htqcCHg
         kOogcwpsDNnw5IyDqcWLLV+F2uU1ayykbiqihIHWXhjAGXbPdnoi/AOyJ/SV+M2+R54X
         79t65ZH3/IcTMaUQ2KVx3C2/toubss7P31R6vLtz4AcMvQvN84RRWq2NZF3NhcLlijLS
         I4nPv9tNZ5oQcCrYXXAHI2CPHX0d8RVzi4h8JMUpLKXRL/uu63WvBVkEGlhkWXLhM+i1
         hSeoSK6ZVp2aH2ASWoPk9ap6cqlzz/lzoayBYjpnToP3Ih+/A26WhK3KfYIc5NmbZISY
         m88w==
X-Gm-Message-State: AOAM531UgDEkdB6GL3eEH2yYTEMdRB47Rvgd15UHLvO1PjKb3cbrPwev
        6wbZhJJdMwyB+xHOea0LRA2nxex0WqGRf5k1o8TbJssnGsvKew==
X-Google-Smtp-Source: ABdhPJxVdRjTzmcwUfPZolrFOsZkEzsNVf00sJqbbZQlN54c0pKCBwRg/S7pQwTahnghz8KurgcQVaJ5Ty+XpPSt6DY=
X-Received: by 2002:a05:620a:13a6:: with SMTP id m6mr38631446qki.319.1609024080632;
 Sat, 26 Dec 2020 15:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-12-roderick@gaikai.com>
 <20201226192712.ky56nhdbh6n43bp6@fastboi.localdomain>
In-Reply-To: <20201226192712.ky56nhdbh6n43bp6@fastboi.localdomain>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Sat, 26 Dec 2020 15:07:50 -0800
Message-ID: <CANndSK=8GobuCcVa8yWqQXaFuAL6vra=vd625aBUK6YiqkVS1A@mail.gmail.com>
Subject: Re: [PATCH 11/13] HID: playstation: add DualSense player LEDs support.
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

Thanks for your review!

On Sat, Dec 26, 2020 at 11:27 AM Samuel =C4=8Cavoj <samuel@cavoj.net> wrote=
:
>
> Hi,
>
> I noticed that the `value` argument is not at all used in the
> player_led_set_brightness function.
>
> On 18.12.2020 22:23, Roderick Colenbrander wrote:
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
>
> Is it guaranteed at this point, that the led->brightness is set to the
> new value? I'm unfamiliar with the led subsystem, but skimming other
> drivers I found that they update the device based on the value of the
> `value` argument.

See comments below. Normally yes the brightness is already updated,
but as mentioned below it might still be best to change the code.

>
> > +
> > +     spin_lock_irqsave(&ds->base.lock, flags);
> > +     ds->player_leds_state =3D player_leds_state;
> > +     ds->update_player_leds =3D true;
> > +     spin_unlock_irqrestore(&ds->base.lock, flags);
> > +
> > +     schedule_work(&ds->output_worker);
> > +}
>
> Reading led-core.c, I found that led_set_brightness_{nosleep,sync} do
> set the brightness attribute, but the _nopm one does not and it is
> exported, although it is not used anywhere other than led-core.c and
> led-class.c.
>
> However, I find the usage in led_classdev_suspend and _resume
> interesting. In suspend, set_brightness_nopm is called with a value of
> 0, which should turn off the LED while retaining the value of the
> brightness attribute, which is later recalled in _resume. I assume the
> intended behaviour is the LED to turn off when suspending and return to
> its original state on resume, without overwriting the attribute.
>
> Assuming that, the "value" argument passed to dualsense_player_led_set_br=
ightness
> can be different from led->brightness *on purpose* and should be used
> instead.
>
> I would write something along these lines:
>
> for (i =3D 0; i < ARRAY_SIZE(ds->player_leds); i++) {
>         if (&ds->player_leds[i] =3D=3D led) {
>                 if (value =3D=3D LED_OFF)
>                         player_leds_state &=3D ~(1 << i);
>                 else
>                         player_leds_state |=3D (1 << i);
>                 break;
>         }
> }
>
> This is just me hypothesizing though, could anyone clear this up for
> me? Thank you very much.

Thanks for your deep analysis. While writing the code I already found
it strange there were 2 layers of bookkeeping. As you point out this
is likely due to the power management logic.

The LEDs are created by 'ps_led_register' and it is setting:
    led->flags =3D LED_CORE_SUSPENDRESUME;

So those code paths would indeed be triggered provided
'CONFIG_PM_SLEEP' is set. So it is probably safest for me to change
that for-loop anyway. I had hoped to skip the 'find the LED logic' (it
just feels ugly somehow, but not a big deal). Let me make this quick
change. I will just wait a few more days on potential other feedback
from the list before submitting a 'v2'. So far nothing major, but just
these few small things :)


>
> Regards,
> Samuel

Thanks,
Roderick


--=20
Roderick Colenbrander
Senior Manager of Hardware & Systems Engineering
Sony Interactive Entertainment LLC
roderick.colenbrander@sony.com
