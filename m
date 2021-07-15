Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210943CA898
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243245AbhGOTBu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 15:01:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:38802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241698AbhGOTBK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 15:01:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CCD9601FE;
        Thu, 15 Jul 2021 18:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626375468;
        bh=n4MF6jOHP2VdTsWK9s1BcSjD+lLbgvgytoGh4+vxdbY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=T2O0bKwTVtoL/1jwGvtWtjH/wpowPLcZP2nLojPLSvFSmV1WT6qR001lXhrDXxyUV
         xn7vKjwmdb94cNokWwmlxffXgJg2NBKReapvPpwOB4pYpMjldWxyCaZXNPmr5L9xOR
         lPScqjApl1Ger8Z2VhARNBfcVQ5znjm50MKDJ71fc/eeZ+XkezcmtPoCJJpTrkpirN
         RhOJgm4CJakm4v8LRhkaCSmx17mkgWJ7Y9E+kpf3hjs8q/LtSrx19MaP3XAfD+DCzM
         1W+j+l9ib8uO6TESHbjgPkm0eozMZ5cqAdg0Z3R4EpNGCMhz6sg2VXuxxm8aGVtWQ8
         w+STLMoD5wOiQ==
Date:   Thu, 15 Jul 2021 20:57:44 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Maxim Mikityanskiy <maxtram95@gmail.com>,
        linux-leds@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] HID: hid-input: Add offhook and ring LEDs for
 headsets
In-Reply-To: <CAO-hwJJxJqgW6CGPmvL41teh6vgWfSg55qoXWL3TjQx+mvsbHg@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2107152057230.8253@cbobk.fhfr.pm>
References: <20210703220202.5637-1-maxtram95@gmail.com> <20210703220202.5637-2-maxtram95@gmail.com> <CAO-hwJJxJqgW6CGPmvL41teh6vgWfSg55qoXWL3TjQx+mvsbHg@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 6 Jul 2021, Benjamin Tissoires wrote:

> > A lot of USBHID headsets available on the market have LEDs that indicate
> > ringing and off-hook states when used with VoIP applications. This
> > commit exposes these LEDs via the standard sysfs interface.
> >
> > Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> > ---
> >  drivers/hid/hid-input.c                | 2 ++
> >  drivers/input/input-leds.c             | 2 ++
> >  include/uapi/linux/input-event-codes.h | 2 ++
> >  3 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index 4286a51f7f16..44b8243f9924 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -798,6 +798,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
> >                 case 0x4b:  map_led (LED_MISC);     break;    /*   "Generic Indicator"        */
> >                 case 0x19:  map_led (LED_MAIL);     break;    /*   "Message Waiting"          */
> >                 case 0x4d:  map_led (LED_CHARGING); break;    /*   "External Power Connected" */
> > +               case 0x17:  map_led (LED_OFFHOOK);  break;    /*   "Off-Hook"                 */
> > +               case 0x18:  map_led (LED_RING);     break;    /*   "Ring"                     */
> >
> >                 default: goto ignore;
> >                 }
> > diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
> > index 0b11990ade46..bc6e25b9af25 100644
> > --- a/drivers/input/input-leds.c
> > +++ b/drivers/input/input-leds.c
> > @@ -33,6 +33,8 @@ static const struct {
> >         [LED_MISC]      = { "misc" },
> >         [LED_MAIL]      = { "mail" },
> >         [LED_CHARGING]  = { "charging" },
> > +       [LED_OFFHOOK]   = { "offhook" },
> 
> I am pretty sure this also needs to be reviewed by the led folks.
> Adding them in Cc.

Can we please get Ack from the LED maintainers? Thanks.

> 
> Cheers,
> Benjamin
> 
> > +       [LED_RING]      = { "ring" },
> >  };
> >
> >  struct input_led {
> > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> > index 225ec87d4f22..dd785a5b5076 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -925,6 +925,8 @@
> >  #define LED_MISC               0x08
> >  #define LED_MAIL               0x09
> >  #define LED_CHARGING           0x0a
> > +#define LED_OFFHOOK            0x0b
> > +#define LED_RING               0x0c
> >  #define LED_MAX                        0x0f
> >  #define LED_CNT                        (LED_MAX+1)
> >
> > --
> > 2.32.0
> >
> 

-- 
Jiri Kosina
SUSE Labs

