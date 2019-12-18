Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF479124A30
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 15:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfLROuW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 09:50:22 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:43951 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbfLROuV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 09:50:21 -0500
Received: by mail-ua1-f66.google.com with SMTP id o42so712302uad.10
        for <linux-input@vger.kernel.org>; Wed, 18 Dec 2019 06:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m1KiUVnj5f4UcVMOXiY9pQgfkrZw9Bx2Er4Xqm3NsS8=;
        b=jIObTznNoyOddBZO9rM8CwpHdYeqkBdLPONlCZpVajzkNGi+H8RdkfV1sh7OIwoB5N
         p5etDyLRt1zGDr1NNiI1p2NELVIa4y67P6pPNOFaMI3H8EVNb1CnnEob8F6k7Y+W26sC
         wwQXPm/0/3RyQzlyK+LbxrEkku6xY5BlIvFHleOJi0VrOQ2HTfRsj4t6OkTiW+xUltNn
         gAvL0rrZo2KW8XvBKJXN/JKeYy94loCn9zNIDfihjH0IaZvSGgFUNjrfMcXl+DhdKH0/
         4RJhbbkqN7nIsU89kKRlnCyiNeVDIu5yxzZrI6rWbqOX+ngpqq4Q4NwkyfsPhmM049hR
         RVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m1KiUVnj5f4UcVMOXiY9pQgfkrZw9Bx2Er4Xqm3NsS8=;
        b=NAUGYMt3/7AhVhkh/RhBopLbsRLhGydMbVC94wHByimBHefNppiSE45ufLazYIwvo/
         WqCjqrl9teNwTCSoEB4HsEI4xahEi5jzS6fpO4gNxnjBotC4VBS1gFcpFIRRXpm3r6Zy
         Y0wZRS47MmAYTTWd1Pa6ylKUeDLH/MzGira8VhNsoZHTUr9grsAaQp62ELAc+fUmKvrZ
         isTnz54LahC8ufxpoy2upt2Av5y9iIMeB9egoa42yFJCj6sRc93WUDG3rtm174Oxsl7L
         dF+527Ybc4tONNrIOnPAQa/u3GHOO3YBP4zxL4I1d8A+yn5gjj+9wJZNYZ6cr76JNSHv
         TG+w==
X-Gm-Message-State: APjAAAVAs8E0AyN9XeSJx3cOan5AdvrYJ8SZAPgQeFfhooL+x1Fnn5NY
        jhHlmyvDAG9+qK4fs/+LHjmegXV4B5y7BAW3aWk=
X-Google-Smtp-Source: APXvYqzu9AJ6gHlcgqlDtFxRrMAC18u+ljNiXuBLNZHocXuJMb+lOQjNdjaHBgaV7MAqM2W/YYf8+/+EVIad6a4Avls=
X-Received: by 2002:a9f:2e03:: with SMTP id t3mr1586926uaj.119.1576680620694;
 Wed, 18 Dec 2019 06:50:20 -0800 (PST)
MIME-Version: 1.0
References: <CALieaefYFFBaFAo4E7hsESrxhN7N_tbWbeG_C6WHzwDpFiLqeQ@mail.gmail.com>
 <20191212192009.GB101194@dtor-ws> <e2876e96-ba7d-47ff-44e0-6478b48c6fe3@redhat.com>
 <CALieaecDVVO0GMySV8ge4ecsyPziRxKpCo=RTdWX266vzdNyBw@mail.gmail.com> <bceaca05-bec1-4fcf-9f52-3a9a2a3318c7@redhat.com>
In-Reply-To: <bceaca05-bec1-4fcf-9f52-3a9a2a3318c7@redhat.com>
From:   Dmitry Mastykin <mastichi@gmail.com>
Date:   Wed, 18 Dec 2019 17:50:09 +0300
Message-ID: <CALieaefc7qea10HrFrhiq_dnwfZ127a61Jwk6+r39_sKzyt6MQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6INCy0L7Qv9GA0L7RgSDQv9C+IHN1c3BlbmQvcmVzdW1lINCyIGdvb2RpeA==?=
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I discovered what was with my device.
After suspend/resume I2C address often changes to 0x5d (and ACPI table
has 0x14).
ACPI tables doesn't contain _DSD section, and GPIOs are not mapped to
ts->gpiod_int/rst. They are NULL. So reset sequence is not called.
That's why rmmod/insmod doesn't help.

(As temporary solution i changed client->addr, and will wait for
better ACPI tables.
I tried also to map gpios by index and seems that RESET works but INT
doesn't. I can't change I2C address by reset sequence.
I've sent a question to tablet's manufacturer about that.)

> On most newer devices (such as the GPD) the IRQ pin is actually declared
> as a GpioInt in the ACPI tables, so we should be able to use it as a GPIO
> with some extra work.
>
I will be glad to test this when it's ready provided I have new ACPI tables=
.

Thank you!
Kind regards,
Dmitry Mastykin

On Wed, Dec 18, 2019 at 9:16 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 13-12-2019 09:17, Dmitry Mastykin wrote:
> > Hi guys!
> > Thank you very much for your answers, it's always surprising how fast
> > the community reacts!
> >
> >> We have reports of the touchscreen no longer working after suspend/res=
ume
> >> on some GPD pocket devices, but not combined with these errors.
> >>
> > I copied my error messages precisely from gpd support site, because I
> > have the same:
> > https://gpdsupport.com/t/touchscreen-issue-resolved/132/84
> > But seems that rmmod/insmod helps in their case.
> > I noticed that the problem is not repeatable. But happens very often.
>
> Interesting I did not realize the same errors are showing on the GPD pock=
et.
>
> I have the feeling this might have something todo with us not putting the
> touchscreen controller to sleep on ACPI devices because we cannot use
> the IRQ pin as GPIO which is necessary for wakeup.
>
> On most newer devices (such as the GPD) the IRQ pin is actually declared
> as a GpioInt in the ACPI tables, so we should be able to use it as a GPIO
> with some extra work.
>
> I plan to write a patch to make us do this sometime in the near future
> (no idea when I will get around to this though). I will put you
> (Dmitry Mastykin) in the Cc of the patch when I get around to writing it.
>
> Note I do not know if this patch will actually help.
>
> Regards,
>
> Hans
>
>
> >
> >
> >> When this happens, are these messages appear constantly, or only in
> >> response to actual touch? Can you still interact with the device?
> >>
> > Constantly with 25Hz frequency.
> >
> >> The fact that you can talk to the controller like that is interesting.
> >> Just to confirm, does it return sane data, or garbage?
> >>
> > root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e 0x00 i
> > root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e i
> > root@or212:/home/u# i2cget -y 6 0x5d
> > 0x83
> > root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e 0x00 i
> > root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e i
> > root@or212:/home/u# i2cget -y 6 0x5d
> > 0x81
> > First I touch with 3 fingers, then with one.
> >
> >> What is the model of the tablet?
> >>
> > Not sure about model, seems that it's this one:
> > http://logic-instrument.com/en/fieldbook-k122.php
> >
> > Dmesg is attached
> >
> > Thank you!
> > Kind regards,
> > Dmitry Mastykin
> >
> > On Thu, Dec 12, 2019 at 11:51 PM Hans de Goede <hdegoede@redhat.com> wr=
ote:
> >>
> >> Hi,
> >>
> >> On 12-12-2019 20:20, Dmitry Torokhov wrote:
> >>> Hi Dmitry,
> >>>
> >>> On Thu, Dec 12, 2019 at 06:34:46PM +0300, Dmitry Mastykin wrote:
> >>>> =D0=97=D0=B4=D1=80=D0=B0=D0=B2=D1=81=D1=82=D0=B2=D1=83=D0=B9=D1=82=
=D0=B5, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9.
> >>>> =D0=9F=D1=80=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5, =D1=87=D1=82=D0=BE=
 =D0=BE=D1=82=D0=B2=D0=BB=D0=B5=D0=BA=D0=B0=D1=8E, =D0=B5=D1=81=D0=BB=D0=B8=
 =D1=87=D1=82=D0=BE - =D0=BD=D0=B5 =D0=BE=D1=82=D0=B2=D0=B5=D1=87=D0=B0=D0=
=B9=D1=82=D0=B5 =D0=B8 =D0=B2 =D0=BB=D1=83=D1=87=D1=88=D0=B5=D0=BC =D1=81=
=D0=BB=D1=83=D1=87=D0=B0=D0=B5
> >>>> =D0=BF=D0=BE=D1=88=D0=BB=D0=B8=D1=82=D0=B5 =D0=B2 mail-list)
> >>>> =D0=A3 =D0=BC=D0=B5=D0=BD=D1=8F =D0=B5=D1=81=D1=82=D1=8C =D0=BF=D0=
=BB=D0=B0=D0=BD=D1=88=D0=B5=D1=82 =D1=81 x86, =D0=B2=D0=B0=D1=80=D0=B8=D0=
=B0=D0=BD=D1=82=D0=BE=D0=BC Debian =D1=81 =D1=8F=D0=B4=D1=80=D0=BE=D0=BC 4.=
15 =D0=B8
> >>>> =D0=BA=D0=BE=D0=BD=D1=82=D1=80=D0=BE=D0=BB=D0=BB=D0=B5=D1=80=D0=BE=
=D0=BC =D1=82=D0=B0=D1=87-=D1=81=D0=BA=D1=80=D0=B8=D0=BD=D0=B0 gt928.
> >>>
> >>> What is the model of the tablet?
> >>>
> >>>> =D0=9F=D0=BE=D1=81=D0=BB=D0=B5 suspend/resume =D0=BD=D0=B5 =D0=B2=D1=
=81=D0=B5=D0=B3=D0=B4=D0=B0, =D0=BD=D0=BE =D0=BE=D1=87=D0=B5=D0=BD=D1=8C =
=D1=87=D0=B0=D1=81=D1=82=D0=BE =D1=82=D0=B0=D1=87=D1=81=D0=BA=D1=80=D0=B8=
=D0=BD =D0=BF=D0=B5=D1=80=D0=B5=D1=81=D1=82=D0=B0=D0=B5=D1=82
> >>>> =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=B0=D1=82=D1=8C =D0=B8 =D0=BF=D0=BE=
=D1=81=D1=82=D0=BE=D1=8F=D0=BD=D0=BD=D0=BE =D0=B2=D1=8B=D0=B2=D0=BE=D0=B4=
=D0=B8=D1=82:
> >>>> [ 3276.729412] Goodix-TS i2c-GDIX1002:00: I2C write end_cmd error
> >>>> [ 3276.770153] Goodix-TS i2c-GDIX1002:00: I2C transfer error: -121
> >>>
> >>> When this happens, are these messages appear constantly, or only in
> >>> response to actual touch? Can you still interact with the device?
> >>>
> >>> Could you please send the full dmesg so we know more about the device=
.
> >>>
> >>> Hans, Bastien, have you seen such issues with Goodix occasionally
> >>> misbehaving on resume?
> >>
> >> We have reports of the touchscreen no longer working after suspend/res=
ume
> >> on some GPD pocket devices, but not combined with these errors.
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>>
> >>>> =D0=9F=D0=BE i2cget/i2cset =D0=BA=D0=BE=D0=BD=D1=82=D1=80=D0=BE=D0=
=BB=D0=BB=D0=B5=D1=80 =D1=83=D1=81=D0=BF=D0=B5=D1=88=D0=BD=D0=BE =D0=BE=D1=
=82=D0=B2=D0=B5=D1=87=D0=B0=D0=B5=D1=82.
> >>>
> >>> The fact that you can talk to the controller like that is interesting=
.
> >>> Just to confirm, does it return sane data, or garbage?
> >>>
> >>> Thanks.
> >>>
> >>
>
