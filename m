Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F31020A923
	for <lists+linux-input@lfdr.de>; Fri, 26 Jun 2020 01:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgFYXd0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jun 2020 19:33:26 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43721 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725841AbgFYXd0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jun 2020 19:33:26 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 859375C00E9;
        Thu, 25 Jun 2020 19:33:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 25 Jun 2020 19:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=0CaXQ3nS2uxeiRmI+8j3ts5jdQD
        i1e2Mhjg2myQTNwM=; b=YTdD+GcBndPGwHRMbmNWq9He5iZIPQL5e12lqmTLsjL
        GM4MT6APEWpIMxJt0BNVJxNzGaBVRvjKINTT3ZO/RbF5vgJs0bSia4qVtXXlZQqw
        PBFcLuKhDO6Gio9cfPoo5F6FFv1+47JRWhuy2HtNlIVjgdz6N+R24nqIDt89go4U
        sS/cD1mKT74fNSa6jYf506JtTXn0KsM1LqczNZ4DovJwzLaagGRX+UgyQbBu6dVn
        3kaSAG4Txknim/9Y5Z7gv68lLW98lmIoYNLfEtAj0n9VykLv17hkYs5odVgeka3Q
        4rBRkT89howdsGdGoWElo2H2xwUI/pFm3QnKz+QaZlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0CaXQ3
        nS2uxeiRmI+8j3ts5jdQDi1e2Mhjg2myQTNwM=; b=bSMun0ngQD+ES0PBFjsWfR
        F5MtN+0bJ/QjGxku2LqlOtXlTntXGMK6xia1EzXjPBcAO629aIX+8vDHj7Eo/Vhf
        UR2dMV4hx5AMQmTZlc9iEpPUf2xPoBU6ptKjFZitgZX82wi9kf+8J8rX0s91Q72e
        BVxAo1DNMsHXZPQmS2XH9KM3E9p1s/gC2xdcO0HgV9/hvErOFtKJsqk8g9SIoG+n
        eYvemsy7+89/+wWXn7RViDVRGVzjFn4D2v60/kOL0XNf1YQLnNtbyvq+BKHt8IUw
        s/qqiVmZzcIHEq+/Qhw6BDnwAbcsYnPOcV1HbkyMzPM6gOgMG389jYvlIHTd9+Aw
        ==
X-ME-Sender: <xms:RDT1XiKtMq9urELJ_d9_41clcVza8r3qVg1AhAQa3QnN-475Ss-Usw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeltddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhepuedvleehgeduvdduffekteekieehfeefffehhedutdeu
    udeiudeiudelkeehvedtnecuffhomhgrihhnpehhuhhiohhnrdgtohhmpdhushgsrdhorh
    hgnecukfhppeduudejrddvtddrieekrddufedvnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqd
    htrdhnvght
X-ME-Proxy: <xmx:RDT1XqJfbn9Jpm2TVlfin7Qt1rmXfq2eRagt-AKkOfaDKQxvQJwYxw>
    <xmx:RDT1XiucoggB6ly0GumYcZVj5O6KfeNey0G6f0JrHRLH3mU3ogFGvQ>
    <xmx:RDT1XnaMEkxpd-HXLsWQTxSqe1pIUZWrviwbWY6hWXA0kZ73QIkN7A>
    <xmx:RDT1XomglkRuKW1-R6_LiIbJq27rIAP4PWYVynnG4Nz8kFtDxQXt1g>
Received: from jelly (117-20-68-132.751444.bne.nbn.aussiebb.net [117.20.68.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 21668328005A;
        Thu, 25 Jun 2020 19:33:21 -0400 (EDT)
Date:   Fri, 26 Jun 2020 09:33:18 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Michael Spang <spang@chromium.org>
Cc:     Nikolai Kondrashov <spbnick@gmail.com>,
        Harry Cutts <hcutts@chromium.org>,
        linux-input <linux-input@vger.kernel.org>,
        Kenneth Albanowski <kenalba@google.com>,
        Jacques Pienaar <jpienaar@google.com>
Subject: Re: Graphics tablets getting INPUT_PROP_DIRECT incorrectly
Message-ID: <20200625233318.GA13173@jelly>
References: <CA+jURctks30toWAipy-ozvwrh1CsQzZHgAuNRPHdrDY2woufMA@mail.gmail.com>
 <20200624070626.GA18108@koala>
 <f39ce5d5-bd5b-bd3f-3ea2-9b2a89ba1eb1@gmail.com>
 <CAC5F_1my6AMFa=azyfy5ZWoss0XdA_2Nfw4fMUZLD8yMzv+O_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC5F_1my6AMFa=azyfy5ZWoss0XdA_2Nfw4fMUZLD8yMzv+O_Q@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 24, 2020 at 01:45:27PM -0400, Michael Spang wrote:
> On Wed, Jun 24, 2020 at 7:27 AM Nikolai Kondrashov <spbnick@gmail.com> wrote:
> >
> > Hi Peter, everyone,
> >
> > On 6/24/20 10:06 AM, Peter Hutterer wrote:
> >  > On Wed, Jun 17, 2020 at 02:39:47PM -0700, Harry Cutts wrote:
> >  >> Hi Kernel input people,
> >  >>
> >  >> On Chrome OS, we've observed a couple of graphics tablets getting
> >  >> INPUT_PROP_DIRECT set despite them being traditional digitizers
> >  >> without screens. The two tablets we've seen this for are the Huion
> >  >> H610PRO (VID:PID 256c:006d) and the UGTABLET 10 inch PenTablet
> >  >> (28bd:0905). Reverting "HID: input: Set INPUT_PROP_-property for
> >  >> HID_UP_DIGITIZERS" (8473a93d1ba5385f63a128a285702ccc1d3ae2cc) fixes
> >  >> the Huinon, at least. (We didn't get a chance to test it with the
> >  >> UGTABLET.) Do we know if this is a shortcoming of that patch, are
> >  >> those tablets just describing themselves incorrectly in their HID
> >  >> descriptors? (in which case I guess we'd just have to add quirks for
> >  >> them)
> >  >
> >  > fwiw, both huion and ugtablet are ones i know are regularly giving me
> >  > troubles in libinput because what they say they do and what they do isn't in
> >  > sync. HUION also re-uses usbids. 006d is a relatively new one I think, we
> >  > have at least 7 different devices with 0256c:006e in libwacom and need to
> >  > match on the name there, but with the Huion HS610 even that breaks - it uses
> >  > the same vid/pid *and* name of other devices despite having different
> >  > properties [1]. HS610, HS64 and your H610PRO all seem to use 000d, so...
> >  > yay?
> >  >
> >  > I've CC'd Nikolai, he has much more kernel-level experience with these
> >  > devices than I do.
> >
> > These days, you can't rely on pretty much anything to identify an exact
> > non-Wacom graphics tablet model. With Huion's I sometimes rely on the special
> > string descriptor containing tablet parameters in binary, retrieving which has
> > side effects (switching proprietary mode on).
> >
> > The only reliable way to deal with them is to only consider their reported
> > parameters, and not try to derive anything else from any
> > supposedly-identifying properties.
> >
> > Regarding the original topic of this thread, it's not clear from the source
> > code what INPUT_PROP_DIRECT exactly means, but I see that it is synonymous
> > with the "Pen" (0x02) application collection usage, about which HUT 1.12 [1]
> > 16.1 Digitizer Devices says:
> >
> >      A digitizer with an integrated display that allows use of a stylus. The
> >      system must ensure that the sensed stylus position and the display
> >      representations of that position are the same.
> 
> It means there is a display integrated with the input devices and
> applies to both touchscreens and LCD drawing tablets.

also, the google term here is "direct vs indirect input devices" which will
provide you with more academic papers than you want to read :)

Cheers,
   Peter

> > I also see that all replacement graphics tablet report descriptors I
> > contributed to the kernel use it, and that is incorrect. Shame on me.
> >
> > The proper fix thus would be to replace the 0x02 usage with 0x01 in
> > replacement report descriptors, before application collection item, for all
> > (non-display) graphics tablets. 0x01, according to HUT 1.12 would mean:
> >
> >      A device that measures absolute spatial position, typically in two or more
> >      dimensions. This is a generic usage; several specialized types of
> >      digitizers are distinguished by their attributes.
> >
> > That would get INPUT_PROP_POINTER assigned to them instead.
> >
> > However, this might get a bit tricky as it's not always easy to find out which
> > exact models are display models, and then there's Huion display models, e.g.:
> >
> >      https://www.huion.com/pen_display/KamvasPro/kamvas-pro-24.html
> >
> > which likely have the aforementioned identification issues too.
> >
> > Finally, of course, we have models which don't have replacement report
> > descriptors we control, but which have 0x02 usage instead of 0x01 in their
> > firmware (I must have copied that from somewhere after all). OTOH, those
> > usually don't work (well) out-of-box, so probably not a big deal.
> >
> > What's the practical implication of having INPUT_PROP_POINTER instead of
> > INPUT_PROP_DIRECT for a display-equipped graphics tablet?
> 
> This case is basically usable. It has the following problems:
> 
> (1) The mouse cursor will be drawn under the stylus which is
> unnecessary and obscures content.
> (2) Rotating the display will throw off the coordinate system and make
> the device unusable.
> (3) Multiple pen inputs will interfere with each other (e.g for an
> interactive whiteboard). This isn't a fundamental problem but stems
> from pointer devices just reusing existing mouse APIs which have a
> single, global pointer.
> 
> Note that POINTER is the default behavior for stylus devices that
> report neither DIRECT nor POINTER, so the above problems are status
> quo for devices with integrated displays unless they add the DIRECT
> property specifically.
> 
> 
> >
> > Nick
> >
> > [1]: Universal Serial Bus HID Usage Tables (HUT) 1.12
> >       https://www.usb.org/sites/default/files/hut1_12.pdf
