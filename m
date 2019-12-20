Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05F3D127F85
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2019 16:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbfLTPkY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Dec 2019 10:40:24 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:33027 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfLTPkX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Dec 2019 10:40:23 -0500
Received: by mail-vk1-f194.google.com with SMTP id i78so2713101vke.0
        for <linux-input@vger.kernel.org>; Fri, 20 Dec 2019 07:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lJoWfkTRKl6p2yAH7oyeVNh71qbZhkn97ZrZ+HkuqpE=;
        b=bZ0Mfj9hvMchZ9hPCodgzwQ7BiKbxV9Zec+5gvbEUlCOwsMosbyYTg30Mw5HrRM9mC
         zcYystMIAYbW0Ui7RXcPiZum7yTv0xVQQVE2PRN7AVHS1H0ysOgPZY6nFkRcgIX2pEY/
         hR330rl2sd4+fo9WC1V5yOXSt/1VmjiYcJr9vM6M2LA14nXSGko6NFdGmzzKA0dXcoUa
         ycVAKzhJd4NIQPaMp0J4nFnLJzmYyowNepvIkYvvMAN6FkCsPCXl42f3s8+nLEeC1a+R
         Jfd2j1VKRuYhTM5DQE0L6qsFQezRwod3OMIFZafxGt0N6+pMH8VIeeJMS17NZpzOiGKj
         m3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lJoWfkTRKl6p2yAH7oyeVNh71qbZhkn97ZrZ+HkuqpE=;
        b=BkOdEFR0dZ5qCQNJL/NGZ43TP+P2wALiGNTB2nKkcDi3hgtTI2PzRroEWo4eqYV5C3
         is6L5MRlpIKF3QrQNil2pGrw4KPLsC21bpbg0q7TS9BeB2MXUBWHyva5LJnkZjcLNjSl
         Apeu0uPhCe1kcqmqmGit5MleXyT1qR2FNW4WoODkxdB37G8+y3wYCkIJ00jGRV9ViUQt
         09V/JWjRx+2dw5WN9nlT6OwRwJjuFZGDzXo2UdPuWDkD3Isyng37GkKOegrpHRO44WwB
         Yiwy3B5nnP6TtVw+CvnLn95JRrVtdFeuMOX7qmxJgwFWmV46x74fcTSObcMR9Ymp8tCU
         eotA==
X-Gm-Message-State: APjAAAU1aCjAVH+StCqyVelk3gTIANuurNyG1c/GjQqqvAdQ8ggrxsv3
        XijUe0Rrs/fQoaYCOtXGRp5B8/bD9aEeHjASPBViHWGOI28=
X-Google-Smtp-Source: APXvYqz99qh9izQnt2RQBktLgT2fnKYrUQUWUYuOnnILmAjsBYYadWoy0thaL/CHs9ZaZ3Cumn/FP51HjfhFHzav8h0=
X-Received: by 2002:ac5:cd39:: with SMTP id a25mr4449502vkm.50.1576856422275;
 Fri, 20 Dec 2019 07:40:22 -0800 (PST)
MIME-Version: 1.0
References: <CALieaefYFFBaFAo4E7hsESrxhN7N_tbWbeG_C6WHzwDpFiLqeQ@mail.gmail.com>
 <20191212192009.GB101194@dtor-ws> <e2876e96-ba7d-47ff-44e0-6478b48c6fe3@redhat.com>
 <CALieaecDVVO0GMySV8ge4ecsyPziRxKpCo=RTdWX266vzdNyBw@mail.gmail.com>
 <bceaca05-bec1-4fcf-9f52-3a9a2a3318c7@redhat.com> <CALieaefc7qea10HrFrhiq_dnwfZ127a61Jwk6+r39_sKzyt6MQ@mail.gmail.com>
 <540d7e12-1c29-63ec-307a-6db352f67e9c@redhat.com> <CALieaecwpcimMDos5QWz-MP1ZW+16HPcTc0rnX4GCYnRqoxR4g@mail.gmail.com>
 <b4b7689d-5d96-8654-71d0-590476984813@redhat.com>
In-Reply-To: <b4b7689d-5d96-8654-71d0-590476984813@redhat.com>
From:   Dmitry Mastykin <mastichi@gmail.com>
Date:   Fri, 20 Dec 2019 18:40:11 +0300
Message-ID: <CALieaeen5zujxbLGnQryHYdWT_9K318H38dUmkAV3YMBHFXN5A@mail.gmail.com>
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

Thank you Hans!

Your explanations were extremely useful!
Manufacturer answered, he had an error in pin numbers.

I've changed table to:
--------------------
Name (RBUF, ResourceTemplate ()
{
I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
AddressingMode7Bit, "\\_SB.PCI0.I2C3",
0x00, ResourceConsumer, , Exclusive,
)
GpioInt (Edge, ActiveHigh, Shared, PullDefault, 0x0000,
"\\_SB.GPO0", 0x00, ResourceConsumer, ,
)
{ // Pin list
0x0015
}
GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
"\\_SB.GPO0", 0x00, ResourceConsumer, ,
)
{ // Pin list
0x0019
}
})
Now the I2C address is stably detected. But interrupt doesn't work:
Goodix-TS i2c-GDIX1002:00: request IRQ failed: -1
--------------------

If I use:
--------------------
I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
AddressingMode7Bit, "\\_SB.PCI0.I2C3",
0x00, ResourceConsumer, , Exclusive,
)
GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
"\\_SB.GPO0", 0x00, ResourceConsumer, ,
)
{ // Pin list
0x0015
}
GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
"\\_SB.GPO0", 0x00, ResourceConsumer, ,
)
{ // Pin list
0x0019
}
Interrupt (ResourceConsumer, Edge, ActiveHigh, Shared, ,, )
{
0x00000032,
}
})
--------------------
there is no error, but no interrupt is generated.

I understand that the problem is far from the driver but may be you
could suggest where the problem is.
Thank you!

Dmitry

On Fri, Dec 20, 2019 at 1:45 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 19-12-2019 10:10, Dmitry Mastykin wrote:
> > Hi,
> >>> I discovered what was with my device.
> >>> After suspend/resume I2C address often changes to 0x5d (and ACPI tabl=
e
> >>> has 0x14).
> >>>
> >> Often but not always?
> >>
> > Yes, I think this is because INT from chipset side is tri-stated.
> >
> > I'm attaching the acpidump.
>
> Thanks, hmm, so looking at the acpidump, your device is using an Apollo
> Lake and thus definitely is NOT the fieldbook-k122 as that is using
> a Cherry Trail SoC and not an Apollo Lake SoC.
>
> It is also using a GPIO pin configured in direct-irq mode pin for the IRQ=
 line:
>
>         Name (RBUF, ResourceTemplate ()
>         {
>             I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
>                 AddressingMode7Bit, "\\_SB.PCI0.I2C3",
>                 0x00, ResourceConsumer, , Exclusive,
>                 )
>             Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, =
)
>             {
>                 0x00000032,
>             }
>             GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOut=
putOnly,
>                 "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>                 )
>                 {   // Pin list
>                     0x0019
>                 }
>             GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOut=
putOnly,
>                 "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>                 )
>                 {   // Pin list
>                     0x0005
>                 }
>         })
>
> And both GPIOs are listed as output-only which certainly does not match t=
he
> IRQ pin. So this setup is a bit foobar and the plan I have to allow the t=
ouchscreen
> to properly power-down on suspend on Cherry Trail devices, will not work =
here :|
>
> For reference here are the ACPI resources for a GDIX touchscreen on Cherr=
y Trail:
>
>      Name (WBUF, ResourceTemplate ()
>      {
>          I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
>              AddressingMode7Bit, "\\_SB.PCI0.I2C6",
>              0x00, ResourceConsumer, , Exclusive,
>              )
>          GpioInt (Edge, ActiveLow, Shared, PullDefault, 0x0000,
>              "\\_SB.GPO3", 0x00, ResourceConsumer, ,
>              )
>              {   // Pin list
>                  0x004D
>              }
>          GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionOutput=
Only,
>              "\\_SB.GPO1", 0x00, ResourceConsumer, ,
>              )
>              {   // Pin list
>                  0x0014
>              }
>      })
>
> Notice how the Interrupt is specified as a GpioInt so we should be able
> to use it as a GPIO during suspend so that we can wakeup the touchscreen =
on
> resume...
>
> I'm afraid I do not have any easy ideas / fixes for how to fix the issue
> you are seeing on your device.
>
> Regards,
>
> Hans
>
>
>
>
> > On Wed, Dec 18, 2019 at 6:07 PM Hans de Goede <hdegoede@redhat.com> wro=
te:
> >>
> >> Hi,
> >>
> >> On 18-12-2019 15:50, Dmitry Mastykin wrote:
> >>> Hi,
> >>>
> >>> I discovered what was with my device.
> >>> After suspend/resume I2C address often changes to 0x5d (and ACPI tabl=
e
> >>> has 0x14).
> >>
> >> Often but not always?
> >>
> >>> ACPI tables doesn't contain _DSD section, and GPIOs are not mapped to
> >>> ts->gpiod_int/rst. They are NULL. So reset sequence is not called.
> >>> That's why rmmod/insmod doesn't help.
> >>>
> >>> (As temporary solution i changed client->addr, and will wait for
> >>> better ACPI tables.
> >>> I tried also to map gpios by index and seems that RESET works but INT
> >>> doesn't. I can't change I2C address by reset sequence.
> >>> I've sent a question to tablet's manufacturer about that.)
> >>
> >> Interesting, can you provide an acpidump of the device:
> >>
> >> sudo acpidump -o acpidump
> >>
> >> And then attach the generated acpidump file to your next email ?
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>>
> >>>> On most newer devices (such as the GPD) the IRQ pin is actually decl=
ared
> >>>> as a GpioInt in the ACPI tables, so we should be able to use it as a=
 GPIO
> >>>> with some extra work.
> >>>>
> >>> I will be glad to test this when it's ready provided I have new ACPI =
tables.
> >>>
> >>> Thank you!
> >>> Kind regards,
> >>> Dmitry Mastykin
> >>>
> >>> On Wed, Dec 18, 2019 at 9:16 AM Hans de Goede <hdegoede@redhat.com> w=
rote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 13-12-2019 09:17, Dmitry Mastykin wrote:
> >>>>> Hi guys!
> >>>>> Thank you very much for your answers, it's always surprising how fa=
st
> >>>>> the community reacts!
> >>>>>
> >>>>>> We have reports of the touchscreen no longer working after suspend=
/resume
> >>>>>> on some GPD pocket devices, but not combined with these errors.
> >>>>>>
> >>>>> I copied my error messages precisely from gpd support site, because=
 I
> >>>>> have the same:
> >>>>> https://gpdsupport.com/t/touchscreen-issue-resolved/132/84
> >>>>> But seems that rmmod/insmod helps in their case.
> >>>>> I noticed that the problem is not repeatable. But happens very ofte=
n.
> >>>>
> >>>> Interesting I did not realize the same errors are showing on the GPD=
 pocket.
> >>>>
> >>>> I have the feeling this might have something todo with us not puttin=
g the
> >>>> touchscreen controller to sleep on ACPI devices because we cannot us=
e
> >>>> the IRQ pin as GPIO which is necessary for wakeup.
> >>>>
> >>>> On most newer devices (such as the GPD) the IRQ pin is actually decl=
ared
> >>>> as a GpioInt in the ACPI tables, so we should be able to use it as a=
 GPIO
> >>>> with some extra work.
> >>>>
> >>>> I plan to write a patch to make us do this sometime in the near futu=
re
> >>>> (no idea when I will get around to this though). I will put you
> >>>> (Dmitry Mastykin) in the Cc of the patch when I get around to writin=
g it.
> >>>>
> >>>> Note I do not know if this patch will actually help.
> >>>>
> >>>> Regards,
> >>>>
> >>>> Hans
> >>>>
> >>>>
> >>>>>
> >>>>>
> >>>>>> When this happens, are these messages appear constantly, or only i=
n
> >>>>>> response to actual touch? Can you still interact with the device?
> >>>>>>
> >>>>> Constantly with 25Hz frequency.
> >>>>>
> >>>>>> The fact that you can talk to the controller like that is interest=
ing.
> >>>>>> Just to confirm, does it return sane data, or garbage?
> >>>>>>
> >>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e 0x00 i
> >>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e i
> >>>>> root@or212:/home/u# i2cget -y 6 0x5d
> >>>>> 0x83
> >>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e 0x00 i
> >>>>> root@or212:/home/u# i2cset -y 6 0x5d 0x81 0x4e i
> >>>>> root@or212:/home/u# i2cget -y 6 0x5d
> >>>>> 0x81
> >>>>> First I touch with 3 fingers, then with one.
> >>>>>
> >>>>>> What is the model of the tablet?
> >>>>>>
> >>>>> Not sure about model, seems that it's this one:
> >>>>> http://logic-instrument.com/en/fieldbook-k122.php
> >>>>>
> >>>>> Dmesg is attached
> >>>>>
> >>>>> Thank you!
> >>>>> Kind regards,
> >>>>> Dmitry Mastykin
> >>>>>
> >>>>> On Thu, Dec 12, 2019 at 11:51 PM Hans de Goede <hdegoede@redhat.com=
> wrote:
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 12-12-2019 20:20, Dmitry Torokhov wrote:
> >>>>>>> Hi Dmitry,
> >>>>>>>
> >>>>>>> On Thu, Dec 12, 2019 at 06:34:46PM +0300, Dmitry Mastykin wrote:
> >>>>>>>> =D0=97=D0=B4=D1=80=D0=B0=D0=B2=D1=81=D1=82=D0=B2=D1=83=D0=B9=D1=
=82=D0=B5, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9.
> >>>>>>>> =D0=9F=D1=80=D0=BE=D1=81=D1=82=D0=B8=D1=82=D0=B5, =D1=87=D1=82=
=D0=BE =D0=BE=D1=82=D0=B2=D0=BB=D0=B5=D0=BA=D0=B0=D1=8E, =D0=B5=D1=81=D0=BB=
=D0=B8 =D1=87=D1=82=D0=BE - =D0=BD=D0=B5 =D0=BE=D1=82=D0=B2=D0=B5=D1=87=D0=
=B0=D0=B9=D1=82=D0=B5 =D0=B8 =D0=B2 =D0=BB=D1=83=D1=87=D1=88=D0=B5=D0=BC =
=D1=81=D0=BB=D1=83=D1=87=D0=B0=D0=B5
> >>>>>>>> =D0=BF=D0=BE=D1=88=D0=BB=D0=B8=D1=82=D0=B5 =D0=B2 mail-list)
> >>>>>>>> =D0=A3 =D0=BC=D0=B5=D0=BD=D1=8F =D0=B5=D1=81=D1=82=D1=8C =D0=BF=
=D0=BB=D0=B0=D0=BD=D1=88=D0=B5=D1=82 =D1=81 x86, =D0=B2=D0=B0=D1=80=D0=B8=
=D0=B0=D0=BD=D1=82=D0=BE=D0=BC Debian =D1=81 =D1=8F=D0=B4=D1=80=D0=BE=D0=BC=
 4.15 =D0=B8
> >>>>>>>> =D0=BA=D0=BE=D0=BD=D1=82=D1=80=D0=BE=D0=BB=D0=BB=D0=B5=D1=80=D0=
=BE=D0=BC =D1=82=D0=B0=D1=87-=D1=81=D0=BA=D1=80=D0=B8=D0=BD=D0=B0 gt928.
> >>>>>>>
> >>>>>>> What is the model of the tablet?
> >>>>>>>
> >>>>>>>> =D0=9F=D0=BE=D1=81=D0=BB=D0=B5 suspend/resume =D0=BD=D0=B5 =D0=
=B2=D1=81=D0=B5=D0=B3=D0=B4=D0=B0, =D0=BD=D0=BE =D0=BE=D1=87=D0=B5=D0=BD=D1=
=8C =D1=87=D0=B0=D1=81=D1=82=D0=BE =D1=82=D0=B0=D1=87=D1=81=D0=BA=D1=80=D0=
=B8=D0=BD =D0=BF=D0=B5=D1=80=D0=B5=D1=81=D1=82=D0=B0=D0=B5=D1=82
> >>>>>>>> =D1=80=D0=B0=D0=B1=D0=BE=D1=82=D0=B0=D1=82=D1=8C =D0=B8 =D0=BF=
=D0=BE=D1=81=D1=82=D0=BE=D1=8F=D0=BD=D0=BD=D0=BE =D0=B2=D1=8B=D0=B2=D0=BE=
=D0=B4=D0=B8=D1=82:
> >>>>>>>> [ 3276.729412] Goodix-TS i2c-GDIX1002:00: I2C write end_cmd erro=
r
> >>>>>>>> [ 3276.770153] Goodix-TS i2c-GDIX1002:00: I2C transfer error: -1=
21
> >>>>>>>
> >>>>>>> When this happens, are these messages appear constantly, or only =
in
> >>>>>>> response to actual touch? Can you still interact with the device?
> >>>>>>>
> >>>>>>> Could you please send the full dmesg so we know more about the de=
vice.
> >>>>>>>
> >>>>>>> Hans, Bastien, have you seen such issues with Goodix occasionally
> >>>>>>> misbehaving on resume?
> >>>>>>
> >>>>>> We have reports of the touchscreen no longer working after suspend=
/resume
> >>>>>> on some GPD pocket devices, but not combined with these errors.
> >>>>>>
> >>>>>> Regards,
> >>>>>>
> >>>>>> Hans
> >>>>>>
> >>>>>>
> >>>>>>>
> >>>>>>>> =D0=9F=D0=BE i2cget/i2cset =D0=BA=D0=BE=D0=BD=D1=82=D1=80=D0=BE=
=D0=BB=D0=BB=D0=B5=D1=80 =D1=83=D1=81=D0=BF=D0=B5=D1=88=D0=BD=D0=BE =D0=BE=
=D1=82=D0=B2=D0=B5=D1=87=D0=B0=D0=B5=D1=82.
> >>>>>>>
> >>>>>>> The fact that you can talk to the controller like that is interes=
ting.
> >>>>>>> Just to confirm, does it return sane data, or garbage?
> >>>>>>>
> >>>>>>> Thanks.
> >>>>>>>
> >>>>>>
> >>>>
> >>>
> >>
>
