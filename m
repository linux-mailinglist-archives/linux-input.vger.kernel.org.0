Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFAD34A139
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 06:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhCZF5G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 01:57:06 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60885 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229458AbhCZF4n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 01:56:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id B46865C00ED;
        Fri, 26 Mar 2021 01:56:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 26 Mar 2021 01:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=nJMOnVq87axFfQ1TVw0iuqBfhoO
        /GcThpJk4lfNMIXo=; b=gpJZ5wnwQp30eSA6Cai0bhe+O8AIKwe5UWtSD6ucmIx
        AiJ/0IeaXfLkZ26GfmrzkJRJ/ZyFcmiNQBovyL+gg0T1pxh3ur/C4xT2f+99RPlb
        MOCGm3niRpObXm4H8pk0rC0BgA6obkggtEOOH+iKe3GnpdeBYOk5XiQEg0td8cT8
        z/pTUYg01NeN94eT8y54WuxrDFIrB2M/QGU9YVQkCtFCv9kJsgVCDmIusp9SXJUp
        P9UBx37BFg2Kjd2hF4ufuiFF3LGsbDY1WHXH3GB0ABVBNGtpK/ybgabHPYMDiXD8
        K6/HEkQj3AvF8bU5en37oEwEyERDqEuQi+Ls01JqSSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nJMOnV
        q87axFfQ1TVw0iuqBfhoO/GcThpJk4lfNMIXo=; b=Pths6sqOL9CFa60m9h73r1
        Ed1ukzmUBdNXGk8e8WMYroP68EQntGYYfRAeqc7n7VvfjzkFkQg0BRQU09jMv9tw
        2yVceG9laLYMu96SGCXvBDOZ/mE8Mz/Y61dKQkHsyBVhEHFM3q66ukYqgwtOYAWs
        uzOqbhrtA+FyGolVWHpIbO/2TYcKr4XgVLe3pWkLJPNyvWG7PHtwXI2LPWM0F5h8
        mpElMMG+Hq0xSimuiRbQsqr16oRroMziyWrENHuB9Si6y1ifkVJ0ttZXeUyP95g0
        iW8hfbdNUiwQoshePiVONOvD57RQz/WyppTc9XP+UZy9YJ8IsEExa2s6i/IgKs3A
        ==
X-ME-Sender: <xms:mnddYKzvQizOLvvd28v7Ca8j2_GOUXyK-258hhsDG6J449Wtuh_R3w>
    <xme:mnddYGSwWl6yalfw7_4_5C6_aExwCrb_yLUucqyaZ78XRLeaJZUvQ2o4yPt2_fKn6
    txJo95oMzuwXOsNaWo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecuggftrfgrthhtvghrnhephefhheffgfehleegueduleehgfdvfeevkeduveejveej
    veevgfeggfduudefueevnecukfhppeduudejrddvtddrjedurddvvdeknecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthht
    vghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:mnddYMVKp_LMXEeeVFe4ZX_pPcdZGtiWjCFNYRpdj3Yaf6PHT_u82Q>
    <xmx:mnddYAhA56YgP0n1T0aotKRANA8WIpHA7Bww4FazsvBoomFqKlL_GA>
    <xmx:mnddYMA3oQfp7p6Kk3zuouAJrPpvtNwRBsOA2-rRFMvFC8efSy6Q4Q>
    <xmx:mnddYPOO8SpqXp5LUQn5qPbwAVSoB0InLat9tm5IvgJvr3pjnlgqOA>
Received: from koala (117-20-71-228.751447.bne.nbn.aussiebb.net [117.20.71.228])
        by mail.messagingengine.com (Postfix) with ESMTPA id 64F63240054;
        Fri, 26 Mar 2021 01:56:40 -0400 (EDT)
Date:   Fri, 26 Mar 2021 15:56:35 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Kenneth Albanowski <kenalba@google.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Jason Gerecke <Jason.Gerecke@wacom.com>
Subject: Re: Supporting 64-bit Digitizer Serial Numbers?
Message-ID: <YF13k5jywKnAuMs6@koala>
References: <CALvoSf7L2tkrdg_rF0ZqbUv-H2TXnEudjSDUrts+MUs=Lvhpeg@mail.gmail.com>
 <CAO-hwJ+6g9ADRpShG_HbQi5PGv6PLp-1wxJP7CSLT+1uJLB9OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJ+6g9ADRpShG_HbQi5PGv6PLp-1wxJP7CSLT+1uJLB9OA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 25, 2021 at 09:35:33AM +0100, Benjamin Tissoires wrote:
[...]
> > I'm appending a proof-of-concept which implements this; I describe the
> > details below. (This is based on 5.4, but it looks clean for 5.10 as
> > well as relatively straightforward to backport.)
> >
> > I'd appreciate any feedback on this approach.
> >
> > My thought is to perform minimal modifications to allow hid-core to
> > transfer reports up to 64-bits in size to hid-input, so that it can
> > process this field and emit it to the power_supply integration, as well
> > as through classic MSC_SERIAL (for the low 32 bits) and a new
> > MSC_SERIAL2 (the upper bits) for applications which want it inline with
> > stylus event data.
> 
> The wacom driver already has this problem and handles it in a creative
> way (as usual ;-P)
> If I am not mistaken, it splits the 64 bits serial on 2 events as
> well: MSC_SERIAL and ABS_MISC (Jason might correct me here).

ABS_MISC is the tool ID, MSC_SERIAL is the 32-bit serial. Quick check
suggests the upper bits of the 64-bit serial number are simply dropped.
So afaict this situation is still officially unprecedented :)
 
> I am not saying this is what needs to be done, but just what some
> userspace tools already expect.
> 
> >
> > hid_field.value is expanded to an s64 array from s32, and there are
> > a few knock-on effects to code that holds pointers to these fields.
> > No other interfaces, in-kernel, or user-space, are modified to support
> > HID reports/evdev events > 32 bits.
> 
> I also think both problems are orthogonal (which is why you haven't
> tried to change the evdev protocol).
> 
> I don't think we can do much on the evdev side to support 64 bits or
> bigger data.
> Dmitry and Peter might find a good way to work around that, but I'm OK
> with adding MSC_SERIAL_2 from my point of view.

As long as the driver behaves well (i.e. it'll send *both* MSC_SERIAL and
MSC_SERIAL2 in the same frame) it'll be easy to deal with in userspace.

There's some theoretical option to have a special evdev event that works to
combine the values of multiple events (similar to utf8) but I think that's
something to consider when the problem is more wide-spread than a serial
number, it's a bit overkill here.

Cheers,
   Peter
