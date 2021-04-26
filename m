Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A61936B6ED
	for <lists+linux-input@lfdr.de>; Mon, 26 Apr 2021 18:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234148AbhDZQhu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Apr 2021 12:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233934AbhDZQhu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Apr 2021 12:37:50 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B4BC061574;
        Mon, 26 Apr 2021 09:37:08 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id f29so3292020pgm.8;
        Mon, 26 Apr 2021 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+/iTa4OuZ1fhB1XiuuLXaVmaDURW/cQEPNzkVKGmiJA=;
        b=C0DdN7nb1qzQbwhWq5zM1TwIvG3ImbgowzRkbKmBoiN0/hHBxnSEl4gTgI4ZmwZO3n
         DAgGBU0BI1wVsaUfAx7Vfu5EJgqXdNYEuHdeVbqUmO0EvhcOcM3V0wzXils0r/ppewtz
         VIiSLVQgexKuCJVTXikSbfWExM9P2X3UGENHJLb6E0OcrZyLt3NyplfQ4WEocdH9msWA
         m744GtlRmCUz+lMdL794xx4WINpDCjyDlTgyOP5Ky9ce0/XACPyzlGZBnyp1xBEcOBZ1
         JnLczUoC+FaS+/ap5A+x8V9zM8V2I0g5nHgJTS/MFJMa6f4PI/3bp1Aec7YLuaa4VC/t
         6+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+/iTa4OuZ1fhB1XiuuLXaVmaDURW/cQEPNzkVKGmiJA=;
        b=jcU4U24ruu3UBRPOzh/yDOoA38OwDYmR5eua3MAD0rHczT4Y9CCLIy1ENO57TWNlVJ
         IXtmv1kZzyAKDnvITtGiZlX7vhpF1eQLFW/AQpRgVRwd45QypQj5X5mjTcrMSQvkO5oR
         JoNnW06t6g+xurreq3to96NCE7YQxGArkTqwZmaXdvHnY+xrk/CVDGghdlIvb5Fs7Qzk
         lj/WLHm4D+5FjeUxp1Fv8hiEoXbR2gOWaEJdNIlHUBcAtH3nYfAUxBKXhCH6DTJjkGpV
         s0RqN4DlNeWf2wXS6h3NQNqFj3YgdWqC8/dTKiuj10mvZ/54Nw5DvwpQvLzgVWFBspsi
         +OPQ==
X-Gm-Message-State: AOAM533i/jkvFWA+WUu58yXJH0jsgl/ZvsrnLkKzGSL0E58x0BNXxZlU
        vWNrT/gGRq6DkmjREWfouqZGpmS/GgtsGlP9C1Q=
X-Google-Smtp-Source: ABdhPJzGC+pT48WdGbwS7hgmLLK9XqjzTfFlfkQ3CyaGclckYi81ts7/6zdlw4+pnkAYZETSSkfj7mxmAFGGx+XjXoo=
X-Received: by 2002:a63:4a23:: with SMTP id x35mr17319569pga.270.1619455028028;
 Mon, 26 Apr 2021 09:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210411150623.8367-1-hcvcastro@gmail.com> <CAEc3jaAADGuPDwGLM6HskLq-OiecbV-76JbMe6yambVAT=h=bw@mail.gmail.com>
 <CAF44FUyskn-g+MUYONMXYZ8dUiGFd0GF1wkkPQwd34ikbet_Fg@mail.gmail.com>
In-Reply-To: <CAF44FUyskn-g+MUYONMXYZ8dUiGFd0GF1wkkPQwd34ikbet_Fg@mail.gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 26 Apr 2021 09:36:56 -0700
Message-ID: <CAEc3jaB+wNp1Fa-_P=XcYxRNL+L4z_M_wsW6iODyyHz90Xq-vw@mail.gmail.com>
Subject: Re: [PATCH] drivers/hid: avoid invalid denominator
To:     Henry Castro <hcvcastro@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hm, I'm a little confused then. The Shanwan gamepad is a Dualshock 3
clone (nickname 'sixaxis'), so should not go through the DualShock 4
paths. Can you double check what the vendor / device id for this
device are? Are you seeing specific errors or warnings from the driver
in the kernel logs?

I have been considering how to better handle some of these clones
devices, while also not polluting the code too much. If this device is
indeed a clone DualShock 4. I am more leaning towards finding out
sooner during device creation. Perhaps should not even create a motion
sensor device if the data will be none anyway... Hm, not sure what I
prefer yet.

Thanks,
Roderick

On Sun, Apr 25, 2021 at 9:39 AM Henry Castro <hcvcastro@gmail.com> wrote:
>
> Hi,
>
> I was trying to play some old games from Retroarch, and I plugged
> my "SHANWAN PS3 GamePad", but it begin to vibrate and I could
> not play the games, So I started to investigate and read the source
> code, and get the code to bypass the check, and suddenly I got
> a panic crash.  So I found the issue, and I added the patch, finally
> got working, and I played my favorite old games.
>
> So it happens in PS3 clone device I think, but I have to tweak the code
> probably is safe under the condition you mention in PS4 DualShock,
> but it is good as a prevention, if someone is testing and debugging
> the driver.
>
> Regards
> Henry
>
> El s=C3=A1b, 24 abr 2021 a las 17:11, Roderick Colenbrander (<thunderbird=
2k@gmail.com>) escribi=C3=B3:
>>
>> Hi Henry,
>>
>> Thanks for your patch. In what case has this been an issue? Or was it
>> more theoretical.
>>
>> During normal operation this condition should never be triggered for a
>> DualShock 4 when calibration succeeds. If it doesn't succeed the
>> device is not registered. We had an issue recently with the DS4 dongle
>> where the calibration data was 0, which was due to a race condition
>> with Steam, but that was resolved recently.
>>
>> Thanks,
>> Roderick
>>
>> On Sun, Apr 11, 2021 at 10:19 AM Henry Castro <hcvcastro@gmail.com> wrot=
e:
>> >
>> > Avoid a potential panic in case wrong denominator
>> > is given.
>> >
>> > Signed-off-by: Henry Castro <hcvcastro@gmail.com>
>> > ---
>> >  drivers/hid/hid-sony.c | 13 +++++++++----
>> >  1 file changed, 9 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
>> > index 8319b0ce385a..67b45d82cc3b 100644
>> > --- a/drivers/hid/hid-sony.c
>> > +++ b/drivers/hid/hid-sony.c
>> > @@ -1134,11 +1134,16 @@ static void dualshock4_parse_report(struct son=
y_sc *sc, u8 *rd, int size)
>> >                  * Note: we swap numerator 'x' and 'numer' in mult_fra=
c for
>> >                  *       precision reasons so we don't need 64-bit.
>> >                  */
>> > -               int calib_data =3D mult_frac(calib->sens_numer,
>> > -                                          raw_data - calib->bias,
>> > -                                          calib->sens_denom);
>> > +               if (calib->sens_denom !=3D 0) {
>> > +                       int calib_data =3D mult_frac(calib->sens_numer=
,
>> > +                                                  raw_data - calib->b=
ias,
>> > +                                                  calib->sens_denom);
>> > +
>> > +                       input_report_abs(sc->sensor_dev, calib->abs_co=
de, calib_data);
>> > +               } else {
>> > +                       hid_warn(sc->hdev, "DualShock 4 parse report, =
avoid invalid denominator");
>> > +               }
>> >
>> > -               input_report_abs(sc->sensor_dev, calib->abs_code, cali=
b_data);
>> >                 offset +=3D 2;
>> >         }
>> >         input_sync(sc->sensor_dev);
>> > --
>> > 2.20.1
>> >
