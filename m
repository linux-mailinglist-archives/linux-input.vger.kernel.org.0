Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66FD82A031D
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 11:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbgJ3Kpm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 06:45:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbgJ3Kpl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 06:45:41 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 143B820720;
        Fri, 30 Oct 2020 10:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604054740;
        bh=pCZMS367mBBzkMxSGl3wcBU1XDLg7zL0+2tX4zU6st0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y0hgzA+zOSaiFzV2TBFrX44whdyEbMiJJdwuWz+AwbjR22K1vWTX5OMkQ0cIB1k1/
         pmjmruhHvMtqPs4Ihbu58/Vne5COBkEPojmna+l8GkOJmspC59Xs0xDlropinMjTdu
         jZvn7VlKTakmzlPxuaW9IXrO6LIfrhDgfc+MEwUE=
Date:   Fri, 30 Oct 2020 11:46:28 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     HyungJae Im <hj2.im@samsung.com>
Cc:     "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "rydberg@bitmath.org" <rydberg@bitmath.org>,
        Jungrae Kim <jryu.kim@samsung.com>
Subject: Re: (2) [PATCH v2] input: add 2 kind of switch
Message-ID: <20201030104628.GB2395528@kroah.com>
References: <20201029135715.GB3470996@kroah.com>
 <20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p8>
 <CGME20201029132747epcms1p8fae559dff47bf0eebdcc9f94efd9a1bf@epcms1p3>
 <20201030043916epcms1p3b289ca5cd902883a97e7d13ceb5c1efb@epcms1p3>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201030043916epcms1p3b289ca5cd902883a97e7d13ceb5c1efb@epcms1p3>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 30, 2020 at 01:39:16PM +0900, HyungJae Im wrote:
> Hello, This is Hyungjae Im from Samsung Electronics.
> Let me answer your questions inline.
> 
> >On Thu, Oct 29, 2020 at 10:27:47PM +0900, HyungJae Im wrote:
> >> From: "hj2.im" <hj2.im@samsung.com>
> >> Date: Thu, 29 Oct 2020 22:11:24 +0900
> >> Subject: [PATCH v2] input: add 2 kind of switch
> > 
> >Why is this in the body of that patch?
> 
> I read "how to send your first kernel patch", but still making so many mistakes.
> I will be cautious with this.
>  
> >> 
> >> We need support to various accessories on the device,
> >> some switch does not exist in switch list.
> >> So added switch for the following purpose.
> >> 
> >> SW_COVER_ATTACHED is for the checking the cover
> >> attached or not on the device. SW_EXT_PEN_ATTACHED is for the
> >> checking the external pen attached or not on the device
> > 
> >You didn't answer the previous question as to why the existing values do
> >not work for you instead of having to create new ones?
> 
>  I think I should clarify this part the most for this review.
>  As you know, new added events both has similar existing events,
>  but it has to operate separately.
> 
>  First, SW_COVER_ATTACHED is similar with SW_MACHINE_COVER.
>  We need two events for our cover interaction.
>  One is to detect if flip cover is open/closed(covers screen or not),
>  and one is for detecting if cover is attached(detect if device is put into cover).
>  With the second event, we send event for attachment and start authentication
>  distinguishing if it was Samsung made cover.
> 
>  Second, SW_EXT_PEN_ATTACHED detects if pen is attached externally on tablet models.
>  It is different with SW_PEN_INSERTED since this is detecting pens like our NOTE series.
>  SW_EXT_PEN_ATTACHED has an unique role to set wacom tuning table differently
>  while pen is attached/detached.

All of that needs to go in the changelog text for the individual patches
when you submit them.

But as Dmitry pointed out, it doesn't look like either of these drivers
are needed at all, just use the gpio-keys driver instead.

thanks,

greg k-h
