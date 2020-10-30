Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01EA22A0479
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 12:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgJ3Lk5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 07:40:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:34854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbgJ3Lk5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 07:40:57 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 743272076E;
        Fri, 30 Oct 2020 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604058055;
        bh=YZrUBUfMarWr8j0KQTwAWZXmWzeATPtAQyUx1eaTIBE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KukZA87HTU7s96Q6Nu7fMVupE/czr4mB60RgiL0euD5H4mTsQ48Ut57dtqb8k6Wmk
         hssT0Imqbo+tut7Kn9sY9L6ty+6wwCuFO5hjzA7ZfZ7jDJxV2Dt0HEdD5oVxsMmzq/
         UfG/pv931Q8zSpAGmbG5s0fzF2SovD3qTUdggVrI=
Date:   Fri, 30 Oct 2020 12:41:42 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Jungrae Kim <jryu.kim@samsung.com>
Cc:     HyungJae Im <hj2.im@samsung.com>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>
Subject: Re: (3) [PATCH v2] input: add 2 kind of switch
Message-ID: <20201030114142.GA2409436@kroah.com>
References: <20201030104628.GB2395528@kroah.com>
 <20201029135715.GB3470996@kroah.com>
 <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
 <20201030043916epcms1p3b289ca5cd902883a97e7d13ceb5c1efb@epcms1p3>
 <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p7>
 <20201030112812epcms1p7d031bb4949b319135e48dfac9409743b@epcms1p7>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201030112812epcms1p7d031bb4949b319135e48dfac9409743b@epcms1p7>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 30, 2020 at 08:28:12PM +0900, Jungrae Kim wrote:
> > On Fri, Oct 30, 2020 at 01:39:16PM +0900, HyungJae Im wrote:
> > > Hello, This is Hyungjae Im from Samsung Electronics.
> > > Let me answer your questions inline.
> > > 
> > > >On Thu, Oct 29, 2020 at 10:27:47PM +0900, HyungJae Im wrote:
> > > >> From: "hj2.im" <hj2.im@samsung.com>
> > > >> Date: Thu, 29 Oct 2020 22:11:24 +0900
> > > >> Subject: [PATCH v2] input: add 2 kind of switch
> > > > 
> > > >Why is this in the body of that patch?
> > > 
> > > I read "how to send your first kernel patch", but still making so many mistakes.
> > > I will be cautious with this.
> > >  
> > > >> 
> > > >> We need support to various accessories on the device,
> > > >> some switch does not exist in switch list.
> > > >> So added switch for the following purpose.
> > > >> 
> > > >> SW_COVER_ATTACHED is for the checking the cover
> > > >> attached or not on the device. SW_EXT_PEN_ATTACHED is for the
> > > >> checking the external pen attached or not on the device
> > > > 
> > > >You didn't answer the previous question as to why the existing values do
> > > >not work for you instead of having to create new ones?
> > > 
> > >  I think I should clarify this part the most for this review.
> > >  As you know, new added events both has similar existing events,
> > >  but it has to operate separately.
> > > 
> > >  First, SW_COVER_ATTACHED is similar with SW_MACHINE_COVER.
> > >  We need two events for our cover interaction.
> > >  One is to detect if flip cover is open/closed(covers screen or not),
> > >  and one is for detecting if cover is attached(detect if device is put into cover).
> > >  With the second event, we send event for attachment and start authentication
> > >  distinguishing if it was Samsung made cover.
> > > 
> > >  Second, SW_EXT_PEN_ATTACHED detects if pen is attached externally on tablet models.
> > >  It is different with SW_PEN_INSERTED since this is detecting pens like our NOTE series.
> > >  SW_EXT_PEN_ATTACHED has an unique role to set wacom tuning table differently
> > >  while pen is attached/detached.
> >  
> > All of that needs to go in the changelog text for the individual patches
> > when you submit them.
> >  
> > But as Dmitry pointed out, it doesn't look like either of these drivers
> > are needed at all, just use the gpio-keys driver instead.
> >  
> > thanks,
> >  
> > greg k-h
>  
> Can you accept V1 patch? or need to add a change of device tree?

What is "v1" patch?  Do you have a pointer to it on lore.kernel.org?

> Please let me know what do I do now. 

What is wrong with just using a device tree entry for the gpio-keys
driver instead?

thanks,

greg k-h
