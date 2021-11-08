Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8566F447E61
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 12:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238952AbhKHLDU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 06:03:20 -0500
Received: from mail-vk1-f177.google.com ([209.85.221.177]:38887 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238920AbhKHLDR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Nov 2021 06:03:17 -0500
Received: by mail-vk1-f177.google.com with SMTP id f78so5857699vka.5;
        Mon, 08 Nov 2021 03:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9riECQpuYH0dYnA5WhuBe/v6vglRep8H9hHVGEsLQlg=;
        b=WptO10ZxEVaQLv7YHJYuJ5ZA7kfmfrPENa3F5/xv2P78fs/YkrV5Yexzsyzm7f64tH
         +PG5DgCGocV7CRAm6BWQ3Lj/hAEof9pm4csg8waqafLFKfKMuoeSh0rQsMOBLj8TjRIX
         0ppQH1p2xUD2G7Tdg/GJJibgZMYk54WKTr+QxOooOE18oJVRdh+50z+DIoYQPqfxrJCW
         Eh5dbTtI5/h9cRcJw7vEbmL5JQgDt4IQF77BRevxsBkd3jEuQKBclvrICpq35FWZNFid
         ZzZkkXIhW9XdEtnDpi3GWupLVrWgcz0xwHSvFe25XE2W2rHqSk9sQqyIwdTO4VcHQDj3
         3hBg==
X-Gm-Message-State: AOAM531yOdaWLvNMELaeBt9GZ3X+VTjY2cibFP5Jy+ShlZv9LgT+nyR6
        Bt+xX/CONXS1Ch34Svxe8nV+RO2zKuJGgnav
X-Google-Smtp-Source: ABdhPJwJCImFDi140aXlzdRCYdYvU10iLnd+gHaLtbmO+2Ea66AhDFpARuD8ioJMpLIATeH/Z4kc8A==
X-Received: by 2002:a05:6122:134f:: with SMTP id f15mr676740vkp.14.1636369232116;
        Mon, 08 Nov 2021 03:00:32 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id v13sm3360607vsi.0.2021.11.08.03.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 03:00:31 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id d130so7986636vke.0;
        Mon, 08 Nov 2021 03:00:31 -0800 (PST)
X-Received: by 2002:a05:6122:1350:: with SMTP id f16mr19548870vkp.26.1636369231385;
 Mon, 08 Nov 2021 03:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20211105103508.4153491-1-kieran.bingham+renesas@ideasonboard.com>
 <20211105170037.GA65511@nixie71> <YYW4d/YK1MkIfGT/@google.com>
 <163619359511.3601475.3667763097540792609@Monstersaurus> <20211107061719.GA204396@nixie71>
In-Reply-To: <20211107061719.GA204396@nixie71>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 12:00:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUUbzTGWSybSpEgaN1oCzV9o+tdKJHEsdVvPD--52RbQg@mail.gmail.com>
Message-ID: <CAMuHMdUUbzTGWSybSpEgaN1oCzV9o+tdKJHEsdVvPD--52RbQg@mail.gmail.com>
Subject: Re: [PATCH v2] Input: add 'safe' user switch codes
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wu Hao <hao.wu@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Ertman <david.m.ertman@intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Xu Yilun <yilun.xu@intel.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

On Sun, Nov 7, 2021 at 7:17 AM Jeff LaBundy <jeff@labundy.com> wrote:
> On Sat, Nov 06, 2021 at 10:13:15AM +0000, Kieran Bingham wrote:
> > Quoting Dmitry Torokhov (2021-11-05 23:04:23)
> > > On Fri, Nov 05, 2021 at 12:00:37PM -0500, Jeff LaBundy wrote:
> > > > On Fri, Nov 05, 2021 at 10:35:07AM +0000, Kieran Bingham wrote:
> > > > > All existing SW input codes define an action which can be interpreted by
> > > > > a user environment to adapt to the condition of the switch.
> > > > >
> > > > > For example, switches to define the audio mute, will prevent audio
> > > > > playback, and switches to indicate lid and covers being closed may
> > > > > disable displays.
> > > > >
> > > > > Many evaluation platforms provide switches which can be connected to the
> > > > > input system but associating these to an action incorrectly could
> > > > > provide inconsistent end user experiences due to unmarked switch
> > > > > positions.
> > > > >
> > > > > Define two custom user defined switches allowing hardware descriptions
> > > > > to be created whereby the position of the switch is not interpreted as
> > > > > any standard condition that will affect a user experience.
> > > > >
> > > > > This allows wiring up custom generic switches in a way that will allow
> > > > > them to be read and processed, without incurring undesired or otherwise
> > > > > undocumented (by the hardware) 'default' behaviours.
> > > > >
> > > > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > > ---
> > > > >
> > > > > Sigh, a compile test might have at least saved the buildbots the trouble
> > > > > of notifying me I also need to update the INPUT_DEVICE_ID_SW_MAX. But
> > > > > even so - I'm really looking for a discussion on the best ways to
> > > > > describe a non-defined switch in device tree.
> > > > >
> > > > > Here's a compiling v2 ;-) But the real questions are :
> > > > >
> > > > >  - Should an existing feature switch be used for generic switches?
> > > > >  - Should we even have a 'user' defined switch?
> > > > >  - If we add user switches, how many?
> > > > >
> > > >
> > > > This is merely my opinion, but if a hardware switch does not have a defined
> > > > purpose, it does not seem necessary to represent it with an input device.
> > >
> > > Yes, exactly. For input core we are trying to avoid generic events with
> > > no defined meaning.
> >
> > That's understandable, particularly as I could then ponder - how do we
> > even define generic switches, and how many ;-) I wanted to discuss it
> > because otherwise these switches will be defined in DT as buttons. And
> > they are not buttons...
> >
> > > What are these switches? GPIOs? Maybe it would be better to use GPIO
> > > layer to test the state for them?
> >
> > They are physical slide switches on the board. But they have no defined
> > purpose by the hardware designer. The purpose would be defined by the
> > end user, as otherwise they are generic test switches.
> >
> > These have been previously handled as gpio-key buttons, for instance
> > key-1 to key-4 at [0] are actually four slides switches.
> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e3414b8c45afa5cdfb1ffd10f5334da3458c4aa5
> >
> > What I'm trying to determine/promote is that they are not push buttons,
> > and shouldn't be described as such. I have posted [1] to add support for
> > these switches, but I am limited to chosing 'functions' which will have
> > an impact on the system...
> >
> > [1] https://lore.kernel.org/all/20211025130457.935122-1-kieran.bingham+renesas@ideasonboard.com/
> >
> > Presently in [1] I have chosen SW_LID and SW_DOCK as very arbitrary
> > functions for the switches. But my concern is that in doing so, the
> > SW_LID position could for instance suggest to a window environment or
> > power management system that the lid is closed, and the system should
> > be suspended (of course depending upon configurations). That would mean
> > that the board would now be potentially always heading into a suspend
> > after power up which would not be at all clear from the switch.
> >
> > I believe a 'switch' is the correct way to define this hardware, so that
> > both positions can be determined, and read, and events generated on
> > state change - but that there shouldn't be any artificially imposed side
> > effects from the description.
> >
> > If the answer is "no we can't have generic switches" then so be it, but
> > it feels wrong to further propogate the definition of these test
> > switches as keys.
>
> I agree that a slide switch tied to a GPIO is indeed a switch in terms of
> input core. Note, however, that definitions from your first example (such
> as KEY_1) are not any less generic; those have specific meanings too.

But at least the KEY_* events are less likely to cause harmful side
effects than the SW_* events.  I have no idea which daemon in e.g. a
generic Ubuntu userspace would act on the SW_* events.

> If the concern is that toggling a switch effects undesired behavior, such
> as turning a display on or off, then the switch should not be represented
> with a gpio-keys node in the first place.
>
> Stated another way, the fact that the GPIO are connected to something does
> not necessarily mean they need to be supported. Only once they map to some
> function should they be defined, in my opinion.

Following the mantra "DT describes hardware, not software policy", I
think we should describe generic switches in DT, and perhaps have a way
to configure the actual event code from userspace (e.g. using sysfs?).
Without such configuration, perhaps they could emit a SW_* event with
the MSB set, so at least their state can be queried using e.g. evtest?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
