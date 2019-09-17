Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17C02B45FC
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 05:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390486AbfIQD2r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 23:28:47 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42785 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390444AbfIQD2r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 23:28:47 -0400
Received: by mail-pf1-f195.google.com with SMTP id q12so1256768pff.9
        for <linux-input@vger.kernel.org>; Mon, 16 Sep 2019 20:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R0FxMr/nhbWk2zxGiJedEH+KI7zeX1gfAGKKaBuappA=;
        b=NVFuGHpd+N6/lI3QagPC1deHpdDxjaxHIsSt3hFyiEhgxYtdOjBVL1S2SwZv0Tdz6I
         snfp71eShBZ55HKyCTrdR4dh9NVzEVl1OhZbTVzqc8Ja7XgPXDMXjkDpWeS/UrMMzLv5
         5HWHg3oyWHSVYU2tPPaQhKSj6boPCbzDKBYOdRG4vP+gfctmvQordyIhYhj99UWz+do4
         +1/UMOmBH4wtb8Dykvf3G32MA+e0iT/OTgNgAFCIdckp+DT4I+EC5JruYrbp7ZKU3kUZ
         FbNOM0YHKg0wfxQAnU6pHL8fWj2efcsOTek/eKQWAHW9Mf3xRsvTyz1hgu0WhJs926n3
         Q7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R0FxMr/nhbWk2zxGiJedEH+KI7zeX1gfAGKKaBuappA=;
        b=HvAKNQh28eOLGWSeKU76Ys3DQIDAseIo4d07t3SBi3/ICMm6BZ1ciOSbg/hQRXIeRh
         UNReqKXXwsu8OtXtuAYiBzDYClDSmMoIMUirdTh9oCEeD3wSnByM2vGDySLJqTfvk/YB
         NQpnL+s5gVQDhFoPyURm4wHPSr8p8RxPvvRVVGBySq/WqX+hNWwqn/ZoCaVm9zozepaT
         Ro5O1WonLUlzrNEU1JNWhwOq1uPaFdJliWZusAK659x0dIheHb3RLbiGSiTWX3Kw3j4+
         OxFvzBmM/Zk1K83cU4IOxN+3QaTTPqJfw/0XPtv2b9mEz0JS+CFVHn9icHR7eYEz6E9o
         eKfg==
X-Gm-Message-State: APjAAAXU6SM1XfJvQroH2q27UJHu3PL3Hrloww52etRpoQeSu5sYm7yW
        x7d6L72yQR6n3D3K1ZC1bxs=
X-Google-Smtp-Source: APXvYqxfp1MPZ6ivR8zfOkxeGeAtyQ4iq195h+W6zdvtSTAUkruysLhWjyDVncERp5wxS55x9f3wnQ==
X-Received: by 2002:a63:4b02:: with SMTP id y2mr1324347pga.135.1568690926134;
        Mon, 16 Sep 2019 20:28:46 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c21sm570428pfr.151.2019.09.16.20.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 20:28:44 -0700 (PDT)
Date:   Mon, 16 Sep 2019 20:28:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Olivier Sobrie <olivier@sobrie.be>,
        Philipp Puschmann <pp@emlix.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20190917032842.GL237523@dtor-ws>
References: <20190302141704.32547-1-marex@denx.de>
 <20190302141704.32547-2-marex@denx.de>
 <20190810164137.GQ178933@dtor-ws>
 <27428362-1bfc-de9a-da19-c47a9d483e9e@denx.de>
 <20190810174447.GR178933@dtor-ws>
 <4c284f45-fd6f-4bc1-bf58-ea9ae8c601bf@denx.de>
 <20190810190513.GS178933@dtor-ws>
 <4a1bdf7a-2d6b-0753-a5b9-f4d94f1c26a7@denx.de>
 <20190811164257.GT178933@dtor-ws>
 <7d31563e-e789-fd84-a24b-7741b75f4638@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d31563e-e789-fd84-a24b-7741b75f4638@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 23, 2019 at 12:34:29PM +0200, Marek Vasut wrote:
> On 8/11/19 6:42 PM, Dmitry Torokhov wrote:
> > On Sat, Aug 10, 2019 at 11:30:29PM +0200, Marek Vasut wrote:
> >> On 8/10/19 9:05 PM, Dmitry Torokhov wrote:
> >>> On Sat, Aug 10, 2019 at 08:00:14PM +0200, Marek Vasut wrote:
> >>>> On 8/10/19 7:44 PM, Dmitry Torokhov wrote:
> >>>>> On Sat, Aug 10, 2019 at 06:50:08PM +0200, Marek Vasut wrote:
> >>>>>> On 8/10/19 6:41 PM, Dmitry Torokhov wrote:
> >>>>>>> Hi Marek,
> >>>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>>> On Sat, Mar 02, 2019 at 03:17:04PM +0100, Marek Vasut wrote:
> >>>>>>>> Add support for ILI2117 touch controller. This controller is similar
> >>>>>>>> to the ILI210x and ILI251x, except for the following differences:
> >>>>>>>> - Reading out of touch data must happen at most 300 mS after the
> >>>>>>>>   interrupt line was asserted. No command must be sent, the data
> >>>>>>>>   are returned upon pure I2C read of 43 bytes long.
> >>>>>>>> - Supports 10 simultaneous touch inputs.
> >>>>>>>> - Touch data format is slightly different.
> >>>>>>>
> >>>>>>> So with this and also I see there is another ili2117a submission, I do
> >>>>>>> believe that we need to switch to using function pointers instead of
> >>>>>>> if/else if/else style cheking of the model.
> >>>>>>
> >>>>>> How about we add tested functionality in first and only then do bigger
> >>>>>> untested changes ? I think that would work better for everyone.
> >>>>>
> >>>>> Sorry, I would really prefer to do what is right and build additional
> >>>>> functionality on top of the good foundation. I asked to switch to the
> >>>>> function pointers before, but you did not want to citing performance
> >>>>> (even though we are using function pointers everywhere in the kernel),
> >>>>> now I gave a draft implementation, I hope you can use it.
> >>>>
> >>>> So why can't we add tested code in first and then add new huge untested
> >>>> patch on top and start testing it ? I think doing it in reverse is
> >>>> actually not helpful, if there is a problem in this massive new patch,
> >>>> it could be reverted without losing functionality.
> >>>
> >>> We still have 4 weeks till merge window + stabilization time past it.
> >>
> >> Sure, but this patch was posted 5 months ago and was in real world
> >> deployment since, so it has 5 months of practical testing. I don't want
> >> to throw that away.
> >>
> >> The patch you want me to test can easily be rebased on the ILI2117
> >> support and then we retain those months of testing, which I think is
> >> much better.
> > 
> > OK, fine, I rebased the patch[es] on top of this one and uploaded to:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git iili2xxx-touchscreen
> > 
> > Please give it a try and if it works I'll merge into next.
> 
> Sorry for the delay.
> 
> I had to revert
> Input: ili210x - define and use chip operations structure
> as with ^ I get no events.

Any more details? Does the driver bind to the device? Is there data
coming form the wire and it is being consumed but not parsed properly?
Something else?

Thanks.

-- 
Dmitry
