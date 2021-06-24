Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EAF3B270E
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 07:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhFXGAU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 02:00:20 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36497 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230257AbhFXGAT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 02:00:19 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id CA08A5C01EB;
        Thu, 24 Jun 2021 01:58:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 24 Jun 2021 01:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=kI5PKTYnwD2iOxUiX9eRlJl9ibr
        RaexayB1p1GJB46A=; b=GgErM1dpWNbTmCUZdkpSeUOdK1CvxfOSQBCvkWJdMAh
        3vJm/EyvqhgCue5Sa5VN6DiIW8GZPUmrIAEGtq76eowKzzIsHZoxzRsGt+VpxEyw
        FXqOaijsrC33GmUxNBtDOr+cHt1K2KW+Mw+8N79NL0Nodb8Z8T+30K9XsslL8Di4
        G+bBbncFenmpC2NT9S6/FQlCm+KTOCe+6HiG41/vNbS710bGjNPaXVpomhAKdQm1
        vnXVAiTzW6qu89bnHLRXSiWlsQj13iBxhumkvK4JiRY8Xtd8hepxksA98wolPEZ+
        vWlXCyxD2c7c/iGya47wPtg157HLTlhBgYBaHCMl3OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kI5PKT
        YnwD2iOxUiX9eRlJl9ibrRaexayB1p1GJB46A=; b=uawkHXH7nTxpIt8bJwG++0
        +GMbJ8jwULwF75ilm3scS7O7Qzsyc5ozS3oEMo/g3LlrLY4GOGcIEwCjRkPfM4dn
        ke0hhsHgrm6N2vTkPrrD7MWCJZFe/51bdMpYW5Le05/mePzPG4z5ctl5kkxNXfUV
        pOckh8SMVxxcA7oopSO6yJeowGEQKhO9W+/FFafkEIfJGg3Q6jEk09e20wWw92iR
        okXU+9Ek7mvLyg3qY7Zr5+2AdKbnHMAXf6rxb3/u46MBwBuxWHIZLw91fGLTsZFh
        TB8UNKjHH7XKM0WVlFVGzXALYYAr6evhOPFepAy4X+m11ZDjgpLXdk+leKDOCUTw
        ==
X-ME-Sender: <xms:6B7UYJ6jlDjIcIld1IDVzwUClZTt4NyquEUfkzkDK9ykpwRHZd75aA>
    <xme:6B7UYG6658PsJBgklz2QDOIsZvMLiZBIVNEKieidUObvV7T4Ee6Jg0SYhFGkiZaZD
    oXIlm3OAjFZlm7sVk8>
X-ME-Received: <xmr:6B7UYAeN8dNBIXrmcDJv5dnBdORwfU5k2T7OuMPEbyvzTiezOWJ_NOYOzNpx5d0SCRVj4BmB_5818SA797NqQCjRptfYJAsd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeggedgleegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhephefhheffgfehleegueduleehgfdvfeevkeduveejveej
    veevgfeggfduudefueevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:6B7UYCLC5Jvhc9sM6ATJLJPGe_BGVketlV-auMt1y3fCPO7q_QdiNg>
    <xmx:6B7UYNL4bJZoaQuHBqY-l_HpeoFxPxGjZwhdMsWUWJIuYcWDlIU2rA>
    <xmx:6B7UYLw5cfKb2hy6NQwK29AHFnRLP4WzBSFzFx91Q4VyuREjzUzhHA>
    <xmx:6B7UYEWOuzPLqIx76WYVxjPD8EfJqEVoXQnK0PEoaxZQZUfemfavwg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Jun 2021 01:57:58 -0400 (EDT)
Date:   Thu, 24 Jun 2021 15:57:54 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Loic Poulain <loic.poulain@linaro.org>, nick@shmanahar.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: atmel_mxt_ts: atmel_mxt_ts: Fix event loss
Message-ID: <YNQe4uEDyNDcPAkY@koala>
References: <1624456597-9486-1-git-send-email-loic.poulain@linaro.org>
 <1624456597-9486-2-git-send-email-loic.poulain@linaro.org>
 <YNPWcXkG4gCBmmeT@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNPWcXkG4gCBmmeT@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 23, 2021 at 05:48:49PM -0700, Dmitry Torokhov wrote:
> On Wed, Jun 23, 2021 at 03:56:37PM +0200, Loic Poulain wrote:
> > If both touch events and release are part of the same report,
> > userspace will not consider it as a touch-down & touch-up but as
> > a non-action. That can happen on resume when 'buffered' events are
> > dequeued in a row.
> > 
> > Make sure that release always causes previous events to be synced
> > before being reported.
> > 
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/input/touchscreen/atmel_mxt_ts.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> > index 807f449..e05ec30 100644
> > --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> > +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> > @@ -990,6 +990,13 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
> >  		input_report_abs(input_dev, ABS_MT_DISTANCE, distance);
> >  		input_report_abs(input_dev, ABS_MT_ORIENTATION, orientation);
> >  	} else {
> > +		/*
> > +		 * Always sync input before reporting release, to be sure
> > +		 * previous event(s) are taking into account by user side.
> > +		 */
> > +		if (data->update_input)
> > +			mxt_input_sync(data);
> 
> That means we sync for every contact release, whereas I think ideal
> would be to only sync when we observe touch-down and touch-up in the
> same slot.
> 
> Let's also add Peter to the conversation...

Thanks for the CC.

FTR, this is expected userspace behaviour, the device state is only looked
at during SYN_REPORT. Where you send event E=1 and E=0 in the same frame,
the state at SYN_REPORT time is 0, the 1 never happened.

The only device we (as in: libinput) make an exception for here are
keyboards because too many drivers get it wrong and it's too hard to fix all
of them. But especially for touch devices (and tablets!) we don't really
have any choice but to look at the state of the device at the end of the
frame.

So, yes, this patch is needed but I agree with Dmitry that you should only
send this for the special case that requires it.

Cheers,
   Peter
