Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1581F10FB
	for <lists+linux-input@lfdr.de>; Mon,  8 Jun 2020 03:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgFHBG0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Jun 2020 21:06:26 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:48919 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727999AbgFHBGZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Jun 2020 21:06:25 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 2684D5C00BE;
        Sun,  7 Jun 2020 21:06:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 07 Jun 2020 21:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=gohUca9ZcTiOY5R3L2pWXlJFZMd
        WnRkUga5db+Mz1oo=; b=M1EL5Guubpn1p9RSFcXqE1NG5P/kx1tzFeZlvQs4MdM
        mdt06JYn3Gnb8opqKSPapXORtbFj32vOHfrhh8YNBRACIz+09viG6BxZ4/VAVMCe
        jntjSWR+zuhPkY5kH6kjSzWxN317Ex1EIyI8a1Q+bYZQcmx+sReuxdP3pSY83KzY
        7BFe3F6sJF9Uc93hinB6fueoVsx/SRbOvMkYgGZUfi228tuvUyrDDYLh43JPHUD7
        iQ7qvS51mXXxG+9Nv2Lv+4rd4Es+Ky04tZizU5tsd+VVQsN6wc3zSLYcxu8laRYQ
        8IAsf6DcPwmPWDYKPU1a6RWNGddrT2eUG4tuI/Jlonw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gohUca
        9ZcTiOY5R3L2pWXlJFZMdWnRkUga5db+Mz1oo=; b=RaOAnRzBn78/obH3n285oV
        gVP8W+4K+IVdWHKJ21B3BsNkdgFyj0sitdjAF/nxeg4lPSJ6f6Q2wa6JeHHtMvhI
        smkZwFiPtuxI7/g1WA27VEzFJIQ7NhVRdjKNWaP8QKrM0b9L9vgq1zxLyexpsUxi
        KhiVT3VMA7FbYQLMEVnmp/oPCX4dHxivFnL8e8xFCyNLd/bYa2kFQWFVA6JbomCx
        +djyMwMKI1OP45X6wkssE3+JfwuYQLyMChX6+BNmWYmcMCOl9wJOIk5AGJSP4k0h
        nNDue+ZSHB12cbU8/znsUYVeP+1mgvW+5lLTuqIXsLu6kMO85zOluZJzThh2N3qQ
        ==
X-ME-Sender: <xms:Do_dXvH-p2CroZ6GqYyvgmNSd8YFS_kuvub_7sjctRyvnZdh-X-ECw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehtddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhephefhheffgfehleegueduleehgfdvfeevkeduveejveej
    veevgfeggfduudefueevnecukfhppeduudejrddvtddrieekrddufedvnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthht
    vghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:Do_dXsUutmJLFKc-e9WT5LVqs8IWiCrBsJPYAXnYIgR-9ErF593SyQ>
    <xmx:Do_dXhJAk6BaX3iZ9Nz5F_MF0pCUWaDjtVGV6H6FjlVEhjjwe7ObIg>
    <xmx:Do_dXtHfvZvBrdCYdD6PTq5xrLpuwiWHLFb2-PN9OYET4BSH2lvGkw>
    <xmx:EI_dXoSPWzS1OdoBuwwVnRBkTXsBTIeKQNzHp6zijPMpem3Z2zNRRg>
Received: from koala (117-20-68-132.751444.bne.nbn.aussiebb.net [117.20.68.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 478C530614FA;
        Sun,  7 Jun 2020 21:06:20 -0400 (EDT)
Date:   Mon, 8 Jun 2020 11:06:15 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Andi Shyti <andi@etezian.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org, Javi Ferrer <javi.f.o@gmail.com>
Subject: Re: [PATCH] Input: mms114: don't report 0 pressure while still
 tracking contact(s)
Message-ID: <20200608010615.GA58259@koala>
References: <20200606035017.7271-1-GNUtoo@cyberdimension.org>
 <20200606181806.GR89269@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200606181806.GR89269@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jun 06, 2020 at 11:18:06AM -0700, Dmitry Torokhov wrote:
> Hi Denis,
> 
> On Sat, Jun 06, 2020 at 05:50:17AM +0200, Denis 'GNUtoo' Carikli wrote:
> > In the middle of a sliding gesture, we manage to have events
> > that look like that:
> >     Event: time 1571859641.595517, -------------- SYN_REPORT ------------
> >     Event: time 1571859641.606593, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 1193
> >     Event: time 1571859641.606593, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR), value 21
> >     Event: time 1571859641.606593, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), value 0
> >     Event: time 1571859641.606593, type 3 (EV_ABS), code 1 (ABS_Y), value 1193
> >     Event: time 1571859641.606593, type 3 (EV_ABS), code 24 (ABS_PRESSURE), value 0
> >     Event: time 1571859641.606593, -------------- SYN_REPORT ------------
> > 
> > In such cases, we still have a valid ABS_MT_TRACKING_ID along
> > with an ABS_MT_TOUCH_MAJOR that is > 0, which both indicates
> > that the sliding is still in progress.
> > 
> > However in Documentation/input/multi-touch-protocol.rst, we
> > have:
> >     ABS_MT_PRESSURE
> >         The pressure, in arbitrary units, on the contact
> >         area. May be used instead of TOUCH and WIDTH for
> >         pressure-based devices or any device with a spatial
> >         signal intensity distribution.
> > 
> > Because of that userspace may consider an ABS_MT_PRESSURE
> > of 0 as an indication that the sliding stopped. This has
> > side effects such as making it difficult to unlock the
> > screen under Android.
> > 
> > This fix was tested on the following devices:
> > - GT-I9300 with a glass screen protection
> > - GT-I9300 without any screen protection
> > - GT-N7105 with a glass screen protection
> > 
> > Reported-by: Javi Ferrer <javi.f.o@gmail.com>
> > Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
> > ---
> >  drivers/input/touchscreen/mms114.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
> > index 2ef1adaed9af..adc18cd9a437 100644
> > --- a/drivers/input/touchscreen/mms114.c
> > +++ b/drivers/input/touchscreen/mms114.c
> > @@ -183,7 +183,10 @@ static void mms114_process_mt(struct mms114_data *data, struct mms114_touch *tou
> >  	if (touch->pressed) {
> >  		touchscreen_report_pos(input_dev, &data->props, x, y, true);
> >  		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, touch->width);
> > -		input_report_abs(input_dev, ABS_MT_PRESSURE, touch->strength);
> > +		if (touch->strength) {
> > +			input_report_abs(input_dev, ABS_MT_PRESSURE,
> > +					 touch->strength);
> 
> So this will result in userspace believing that pressure is unchanged
> from the previous packet. I wonder if we should report
> 
> 		input_report_abs(input_dev, ABS_MT_PRESSURE,
> 				 max(touch->strength, 1));
> 
> instead.

fwiw, this could still be interpreted as a lifted touch, especially if the
pressure values are comparatively high (say you go from 100 to 1).
we have to use thresholds for what is a touch up because a number of devices
give us nonzero pressure for ever-so-slight touches (or even hovers).
so a nonzero pressure isn't a guarantee for touch down.

not on this device, but from my POV I'd rather have the device pretend the
pressure is the same as the last known touch than just forcing it to 1, a
value that may be completely out of place.

Cheers,
   Peter
