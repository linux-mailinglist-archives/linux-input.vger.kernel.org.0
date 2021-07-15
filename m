Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B3C3CAE0A
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 22:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237083AbhGOUmY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 16:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236255AbhGOUmY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 16:42:24 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80614C06175F;
        Thu, 15 Jul 2021 13:39:30 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y4so6632816pfi.9;
        Thu, 15 Jul 2021 13:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AlufaE/uhtXpJS+X/Cv/4V7lXF/7VmTD9+u29xK53j4=;
        b=WMkOTGATLrOKWgNXjdLG5Bd02p15Mv9Rt65nn2iAH5WKiK/nK3v1POvrH8bj1d5U5k
         eiN06yyVW6UmSAVlvVogGbmqKhiP8EgFYiNnSGJiO57Zckwlbj7mwz/l6XkL44XozFLu
         FuD2P3hWdepZc6s+nMxUAEF+4ave0lpkK3rRAzsH0BweeD78buL/8g0oAC1w/Y+/TMeY
         OyRnG/9g2yPoOCsqptvAHL2w7ZLXbi7xXK5XyGAAX8QQKId2ssiXjjRNAvAFCP+p2jjJ
         pcNdVwZXOeVp3V8ccMT2TCnRO07XFukbnjVglhT+GCiSMSIDLVwavehDhBCbqbgHCNCJ
         cboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AlufaE/uhtXpJS+X/Cv/4V7lXF/7VmTD9+u29xK53j4=;
        b=lT17t0rHQ7ziJxXJ8/3KFX9PKGRjd72pFy5cyUy4sW0DneAEzvJ2Rdqx5Ql5hVN5n5
         lpEHIral3qI1dslzELtbDbdJGeMJXnSb522kb9dTv3P0X4WeIXkzd92UhTCM/8aZg2RC
         vrK3yx4OIAMWx1x9an8FWA6jGjii4+LZWDplAjpbA25j6CUT9mVM1gs0M71cugqL//uO
         IFkLeCkXJzdAj7d8F+ISlwqanwdkZPKFTuGZ0XtEFRp0Dpmf54yU+KHh0nhENNi3we/3
         K7s1RNPQmZ9doAc1d9vvyTrn/2dg1niKNiv+W8zUm2dViOK3bGxiBbO/pZ9lMpwgTKSW
         G9Dw==
X-Gm-Message-State: AOAM5301ElUaKVZxU00+n7TGdd7NXPR8Kyi9TEeaCPG+AxC0XgbwGDgl
        tyPBgC6zIvFD+KWZTY+OW1A=
X-Google-Smtp-Source: ABdhPJyBxF680f6wW7jw2RGmcltUb3M8jWjlKmoX0ibfr7N5zAVVXNLcEMVdMH7PUcEtwX5M3uNrQA==
X-Received: by 2002:a63:6644:: with SMTP id a65mr6296216pgc.431.1626381569951;
        Thu, 15 Jul 2021 13:39:29 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5ddb:aee3:1e4b:38])
        by smtp.gmail.com with ESMTPSA id d13sm7353266pfn.136.2021.07.15.13.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 13:39:28 -0700 (PDT)
Date:   Thu, 15 Jul 2021 13:39:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        linux-leds@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] HID: hid-input: Add offhook and ring LEDs for
 headsets
Message-ID: <YPCc/k89XNTmeKVo@google.com>
References: <20210703220202.5637-1-maxtram95@gmail.com>
 <20210703220202.5637-2-maxtram95@gmail.com>
 <CAO-hwJJxJqgW6CGPmvL41teh6vgWfSg55qoXWL3TjQx+mvsbHg@mail.gmail.com>
 <nycvar.YFH.7.76.2107152057230.8253@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2107152057230.8253@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 15, 2021 at 08:57:44PM +0200, Jiri Kosina wrote:
> On Tue, 6 Jul 2021, Benjamin Tissoires wrote:
> 
> > > A lot of USBHID headsets available on the market have LEDs that indicate
> > > ringing and off-hook states when used with VoIP applications. This
> > > commit exposes these LEDs via the standard sysfs interface.
> > >
> > > Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> > > ---
> > >  drivers/hid/hid-input.c                | 2 ++
> > >  drivers/input/input-leds.c             | 2 ++
> > >  include/uapi/linux/input-event-codes.h | 2 ++
> > >  3 files changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > > index 4286a51f7f16..44b8243f9924 100644
> > > --- a/drivers/hid/hid-input.c
> > > +++ b/drivers/hid/hid-input.c
> > > @@ -798,6 +798,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
> > >                 case 0x4b:  map_led (LED_MISC);     break;    /*   "Generic Indicator"        */
> > >                 case 0x19:  map_led (LED_MAIL);     break;    /*   "Message Waiting"          */
> > >                 case 0x4d:  map_led (LED_CHARGING); break;    /*   "External Power Connected" */
> > > +               case 0x17:  map_led (LED_OFFHOOK);  break;    /*   "Off-Hook"                 */
> > > +               case 0x18:  map_led (LED_RING);     break;    /*   "Ring"                     */
> > >
> > >                 default: goto ignore;
> > >                 }
> > > diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
> > > index 0b11990ade46..bc6e25b9af25 100644
> > > --- a/drivers/input/input-leds.c
> > > +++ b/drivers/input/input-leds.c
> > > @@ -33,6 +33,8 @@ static const struct {
> > >         [LED_MISC]      = { "misc" },
> > >         [LED_MAIL]      = { "mail" },
> > >         [LED_CHARGING]  = { "charging" },
> > > +       [LED_OFFHOOK]   = { "offhook" },
> > 
> > I am pretty sure this also needs to be reviewed by the led folks.
> > Adding them in Cc.
> 
> Can we please get Ack from the LED maintainers? Thanks.

I do not think we should be adding more LED bits to the input
subsystem/events; this functionality should be routed purely though LED
subsystem. input-leds is a bridge for legacy input functionality
reflecting it onto the newer LED subsystem.

Thanks.

-- 
Dmitry
