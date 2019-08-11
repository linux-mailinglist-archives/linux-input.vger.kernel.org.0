Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72DD9892A8
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2019 18:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfHKQnC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Aug 2019 12:43:02 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38451 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbfHKQnB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Aug 2019 12:43:01 -0400
Received: by mail-pf1-f196.google.com with SMTP id o70so3211194pfg.5
        for <linux-input@vger.kernel.org>; Sun, 11 Aug 2019 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/+HySoTxRpaNxG7IGRN7Ajcscv6iZ/OSFEr4WwnvdjE=;
        b=aqaNx8wBCDyZioluCiUTDYZwY20iVQmJAMWJQbaqItSJ1OmQI5w6sd/8OcoWyCw8bb
         IjZUZses21B8QDpAe/PXeoBC9PEkARf97B6k4CCQuH8O5KjRonGey5zaNXL1T+FPWhQv
         rnKHNgsneeuHBS6mob3s/Sz0WXIAh1nU47TcZTblrZ0I1Opne2xWBCbDWgCgPz/783QM
         ipWfAnlzL4TvMC8pW8uRY2304xiLyVciTTP2FmBcfvtLZ5q6+jCqHv3nxm3238Fd9qXj
         r4s2kENsBMwKqLPWJqROJMyk1+PhJ2WNDO8IxX4FumdkslhMovW2YKHLtFD4fW6dNLkl
         leiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/+HySoTxRpaNxG7IGRN7Ajcscv6iZ/OSFEr4WwnvdjE=;
        b=FmJk2nPpCxWgSu0F4kdsY9Z3IAXejvDdKWyJjFO4SVXc93GF9qBbINBQ+29Z6HmRu4
         KSMAaFOjOlWCTS/LZDrNkU9fQNMK6n5VrrkjO6auxB3GmVwfAHmaUtXRuuW35oDbXlXw
         fbpayUAu9w+HE2VvYbz9l4i9/ULmREKDbpXGP1U9VIUrxWCAFTdmDe5VKgsdzi29LC67
         ocdL5nRKE8LMN/anTsa9QLAZW/uRFhabI1vy4vewzEDT915VdxUxiD//wlVvLm2U1bmN
         RyOvCpwfrxurpBZ+ZOeGXsH465Cz99jDXE+WFHFYUPYC8HqcX/GnHzZjEffPcz3LKE+1
         6/Mw==
X-Gm-Message-State: APjAAAWRkcJo3InpycEtDMgnanW4/pobtdburzgMIbmq7qyWm0QN5S15
        4oH7DalXsmKjNLStGn2b6Yc=
X-Google-Smtp-Source: APXvYqzwuR28Q99d27m5kLuZIqlB+E6Ppps2nA1ZrMLeq6yVrdFUXD6MUlUBKGgKyeO+QTT/NS3L+A==
X-Received: by 2002:a63:b904:: with SMTP id z4mr8353790pge.388.1565541780764;
        Sun, 11 Aug 2019 09:43:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id n5sm110998785pfn.38.2019.08.11.09.42.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 09:42:59 -0700 (PDT)
Date:   Sun, 11 Aug 2019 09:42:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Olivier Sobrie <olivier@sobrie.be>,
        Philipp Puschmann <pp@emlix.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20190811164257.GT178933@dtor-ws>
References: <20190302141704.32547-1-marex@denx.de>
 <20190302141704.32547-2-marex@denx.de>
 <20190810164137.GQ178933@dtor-ws>
 <27428362-1bfc-de9a-da19-c47a9d483e9e@denx.de>
 <20190810174447.GR178933@dtor-ws>
 <4c284f45-fd6f-4bc1-bf58-ea9ae8c601bf@denx.de>
 <20190810190513.GS178933@dtor-ws>
 <4a1bdf7a-2d6b-0753-a5b9-f4d94f1c26a7@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a1bdf7a-2d6b-0753-a5b9-f4d94f1c26a7@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 10, 2019 at 11:30:29PM +0200, Marek Vasut wrote:
> On 8/10/19 9:05 PM, Dmitry Torokhov wrote:
> > On Sat, Aug 10, 2019 at 08:00:14PM +0200, Marek Vasut wrote:
> >> On 8/10/19 7:44 PM, Dmitry Torokhov wrote:
> >>> On Sat, Aug 10, 2019 at 06:50:08PM +0200, Marek Vasut wrote:
> >>>> On 8/10/19 6:41 PM, Dmitry Torokhov wrote:
> >>>>> Hi Marek,
> >>>>
> >>>> Hi,
> >>>>
> >>>>> On Sat, Mar 02, 2019 at 03:17:04PM +0100, Marek Vasut wrote:
> >>>>>> Add support for ILI2117 touch controller. This controller is similar
> >>>>>> to the ILI210x and ILI251x, except for the following differences:
> >>>>>> - Reading out of touch data must happen at most 300 mS after the
> >>>>>>   interrupt line was asserted. No command must be sent, the data
> >>>>>>   are returned upon pure I2C read of 43 bytes long.
> >>>>>> - Supports 10 simultaneous touch inputs.
> >>>>>> - Touch data format is slightly different.
> >>>>>
> >>>>> So with this and also I see there is another ili2117a submission, I do
> >>>>> believe that we need to switch to using function pointers instead of
> >>>>> if/else if/else style cheking of the model.
> >>>>
> >>>> How about we add tested functionality in first and only then do bigger
> >>>> untested changes ? I think that would work better for everyone.
> >>>
> >>> Sorry, I would really prefer to do what is right and build additional
> >>> functionality on top of the good foundation. I asked to switch to the
> >>> function pointers before, but you did not want to citing performance
> >>> (even though we are using function pointers everywhere in the kernel),
> >>> now I gave a draft implementation, I hope you can use it.
> >>
> >> So why can't we add tested code in first and then add new huge untested
> >> patch on top and start testing it ? I think doing it in reverse is
> >> actually not helpful, if there is a problem in this massive new patch,
> >> it could be reverted without losing functionality.
> > 
> > We still have 4 weeks till merge window + stabilization time past it.
> 
> Sure, but this patch was posted 5 months ago and was in real world
> deployment since, so it has 5 months of practical testing. I don't want
> to throw that away.
> 
> The patch you want me to test can easily be rebased on the ILI2117
> support and then we retain those months of testing, which I think is
> much better.

OK, fine, I rebased the patch[es] on top of this one and uploaded to:

git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git iili2xxx-touchscreen

Please give it a try and if it works I'll merge into next.

Thanks.

-- 
Dmitry
