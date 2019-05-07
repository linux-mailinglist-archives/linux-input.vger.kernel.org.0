Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44257158B1
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2019 07:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfEGFBq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 May 2019 01:01:46 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45985 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725839AbfEGFBq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 May 2019 01:01:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 32E91245DF;
        Tue,  7 May 2019 01:01:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 07 May 2019 01:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=G
        +vYnHT7nmCfgpZAlx5TVKIeycTm7W54qGcKlHJ+2QI=; b=Bec6ozayPx559mzon
        VBjHwYNUNlHK39qv4c5QDm3QRPZXxsgWUuhkgiav2HTTsk30amU04mQnetr+nrDA
        CEoJmVfvzkp0URtZa6hL9acy+ySwlDm0bOLofAr/1D3615sIszPh2A4wPFlQeBw3
        IhpjYQaDDnrQQqYL/LPK+ICU/pcVmDzFmhxbFeydfNnoJyfiAI6XAP6ZhTtLNOnP
        +iHUkLv8KuHUO74/jB8PQq00WH111qgG8CYaneoPymRue7lD6xEMm0AQGXnPFomv
        mFF5bP3w1zh4MjHTZJGUIZk0e0OhepLr9ID0FC3HlNptAaOeE1l68CuMt8vjp1Lu
        vtuvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=G+vYnHT7nmCfgpZAlx5TVKIeycTm7W54qGcKlHJ+2
        QI=; b=4tzGX80oAgfx3xBh0gMbtufvRnbI/KjOsTvV1aLgdiBzB6AKB5X4Dm963
        2OE5TqbiQLDtwqqWDbfYwwBZGW8XWLfk4PFXKOgYcrw9AxpwbMZkoRsmKQSYOTp5
        z5BPU53O1lNFPU/obIMRd8FTvw/7tA7ekkki5FJBygIQ4Z8VvO3WL4eKIKWiYV2Y
        jWbr0V7m9XFfzuvSt1iYNyFEdjA6PzHfWTsiRLgTJfdLj28qTpTT4QNpAJ7pr58I
        Irch3RGiLBANfUX36PBgWHjSvxiqMhz9ze1szteqKOUx14YHDdKsoA7yHC9P9qBu
        AIrq8mPigfKJmEuvkjyLAqJdZzLQQ==
X-ME-Sender: <xms:OBHRXF8gRYMFG0rjW8y7aGe9adVvHTGaJ5Xiv2034wIn8swnNEtWSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeelgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjfgesthekredttderjeenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucfkphepuddujedrvddtrdeiledrudegvdenucfrrghrrghmpehmrghilhhfrhho
    mhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtnecuvehluhhsthgvrh
    fuihiivgeptd
X-ME-Proxy: <xmx:OBHRXLnQI8Ko9F4vHgC4pJE3h-l19AY7SSPTZ_iFEDhNVUlfVMxkHg>
    <xmx:OBHRXP2KCokFlR22eIIYOsD1yX0wiEHbb4-rwjKiZ8dtUmvf-UrPbQ>
    <xmx:OBHRXGgrv1uXOQI_MybLVq1LyC-i1KU3NMF7Tx9IEgCn5-Cg08Ohzw>
    <xmx:ORHRXKzv55GPkcBWii3G1B40Xq8FFaYf-DTZOePqSrs-R01R5aEycg>
Received: from jelly (117-20-69-142.751445.bne.nbn.aussiebb.net [117.20.69.142])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5D4ADE405F;
        Tue,  7 May 2019 01:01:40 -0400 (EDT)
Date:   Tue, 7 May 2019 15:01:51 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Igor Kushnir <igorkuo@gmail.com>,
        =?utf-8?B?QsWCYcW8ZWogU3pjenlnaWXFgg==?= <spaz16@wp.pl>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: fix A4Tech horizontal scrolling
Message-ID: <20190507050150.GA9838@jelly>
References: <20190502213639.7632-1-spaz16@wp.pl>
 <CAO-hwJLbFv3S9M5N+BKBuafj8H-vToy=2VQd=cvohmaTHLMC3A@mail.gmail.com>
 <1a40ea07-368a-93f6-8335-dec7ae50bbf4@gmail.com>
 <CAO-hwJKNH7WoJV-X+egK5cJNNtxamh0L0e1er5dkiTt6KvrmSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO-hwJKNH7WoJV-X+egK5cJNNtxamh0L0e1er5dkiTt6KvrmSQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 03, 2019 at 01:59:23PM +0200, Benjamin Tissoires wrote:
> Hi,
> 
> On Fri, May 3, 2019 at 11:43 AM Igor Kushnir <igorkuo@gmail.com> wrote:
> >
> > Hi Benjamin,
> >
> > On 5/3/19 10:36 AM, Benjamin Tissoires wrote:
> > > Hi,
> > >
> > > On Thu, May 2, 2019 at 11:37 PM Błażej Szczygieł <spaz16@wp.pl> wrote:
> > >>
> > >> Since recent high resolution scrolling changes the A4Tech driver must
> > >> check for the "REL_WHEEL_HI_RES" usage code.
> > >>
> > >> Fixes: 2dc702c991e3774af9d7ce410eef410ca9e2357e (HID: input: use the
> > >> Resolution Multiplier for high-resolution scrolling)
> > >>
> > >> Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>
> > >
> > > Thanks for the patch. I do not doubt this fixes the issues, but I
> > > still wonder if we should not export REL_HWHEEL_HI_RES instead of
> > > REL_HWHEEL events.
> >
> >
> > If you mean exporting REL_HWHEEL_HI_RES instead of REL_HWHEEL from
> > hid-a4tech.c, then it makes sense to me, though I do not know the code
> > well enough to be certain.
> 
> Yep, that's what I meant. I am worried that userspace doesn't know
> well how to deal with a device that mixes the new and old REL_WHEEL
> events.

sorry, I'm not sure what you mean here. The new events are always mixed with
the old ones anyway, and both should be treated as separate event streams.
The kernel interface to userspace is fairly easy to deal with, it's the rest
that's a bit of mess.

[..]

> >
> 
> OK, thanks both of you for your logs, this is helpful.
> So just in case I need to come back later, the horizontal wheel is
> "just" the normal wheel plus a modifier in the report.
> 
> Anyway, ideally, can we have a v2 of the patch with the 2 changes
> requested above in the commit message and the introduction of
> REL_HWHEEL_HI_RES events in addition to REL_HWHEEL?
> REL_HWHEEL_HI_RES should report `120*value` and we should also keep
> the reporting of REL_WHEEL as it is currently.
> 
> Peter, I grepped in the hid code, and it seems hid-cypress.c is having
> the exact same issue. Sigh.

yeah, I found that too when grepping through it. seems to be the only other
one though and we can use Błażej's patch as boilerplate once it's done.

Cheers,
   Peter
