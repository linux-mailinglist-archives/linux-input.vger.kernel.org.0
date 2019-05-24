Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE8B2967A
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 12:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390538AbfEXK6d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 06:58:33 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34773 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388934AbfEXK6c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 06:58:32 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id A503A21B03;
        Fri, 24 May 2019 06:58:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 24 May 2019 06:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=R
        dQJxArysy2ifqD/yDf4pvL4rmKT4KG3eq9suqHGwK8=; b=HO+nuh612O4J69Avg
        Pan4Uy8kM/cp68oXdYvZlQlIOBv7cuhed2ORsltfBopXuQg10gqBY8Wv7Ww0frng
        muiZgNbAOafeIynDoKAfu5QEAq8NRz/cb2oawqEVj89mHyU5YDELcZuLRa7cbcFG
        3Xsj0wZBFOs8can7pO3XQ0S7YBvXsmU14HAOmW9P1Mu7EciIF6//BK0E3f7S6wpf
        jS3Y4KkBExYT8dL0ZULw8dgwFB0nDEL3wIOBOja6hywlxUL6oVQc2M3BvgD7w0s/
        F9tgHSmU+Iogl6rAyfmi42h6EnIHdcFlBlJeYXIO7XP8UykvI35xFfaDGdnW4KH/
        KaRGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=RdQJxArysy2ifqD/yDf4pvL4rmKT4KG3eq9suqHGw
        K8=; b=tATH5MuG3dpC+hMeGR/Rq6UW3crHEe6kX7OL77UNORLcWwN3vw1ZUolDG
        N1unDVbgBVBlGIkk2Bi2xrTtjTNJwdHSoqnz5XIHErVv2c7L/30xbJ1u11K2z7W1
        +k7K1HML+zdnd7qlIeAfd+8unwOaa/d435jYIZXTEQnJCWUT1BuN4OXjSbihCFA3
        zhyb3dIQuRdzwPGf2izjEvpzwWLHm5jG3ehGMsqbMUp4PJwRkGYRAeHTeF9Oj9h3
        ZODdsb/bw7/HK3vKn6f/T44P1EfBYP5O1N8+gJuyLvaD2uSw4KeYbx/WwVVqOAO0
        KbdXMO+OQGqU/KBWvYv68Yr39TcJQ==
X-ME-Sender: <xms:Vs7nXDhs7LVnx8Js4LHE7OvUtCozmwpf0r3-k1iPJVJ0pZLUUE37YQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduiedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtreejnecuhfhrohhmpefrvght
    vghrucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnh
    gvtheqnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeduudej
    rddvtddrieelrddugedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuh
    htthgvrhgvrhesfihhohdqthdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Vs7nXCRoUjH-J-V979Ah3R9lgDdDuaQ-bmdtcipjbRxm8aLgzn6Hsw>
    <xmx:Vs7nXFWLGi58BTd2PU-3kyQJ1GhxbSWJRJm9I9Wm44HQD2Tbz3JQzQ>
    <xmx:Vs7nXGQfhzEgTHnesLeaaaT_HS4T5HWzuHmLusyCegOnpmEdd4jWdg>
    <xmx:V87nXNV0ZmX5cBOUICFNaS7owoULp40DCU5KJiV700lfoiavRwfGGg>
Received: from jelly (117-20-69-142.751445.bne.nbn.aussiebb.net [117.20.69.142])
        by mail.messagingengine.com (Postfix) with ESMTPA id A320780060;
        Fri, 24 May 2019 06:58:27 -0400 (EDT)
Date:   Fri, 24 May 2019 20:58:22 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        dmitry.torokhov@gmail.com, XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?=
 =?utf-8?B?5aSNOiBbUEFUQ0hdIGlucHV0?= =?utf-8?Q?=3A?= alps-fix the issue the
 special alps trackpoint do not work.
Message-ID: <20190524105822.GA3358@jelly>
References: <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522074030.64sy7xt3wnomtxjb@pali>
 <20190523060154.GA10526@jelly>
 <38ec4a40-d51a-aeb1-a5e8-dbaed1142298@canonical.com>
 <20190524053648.GA16379@jelly>
 <d1fd207d-68e1-0b57-f0dc-c254bfc9352c@canonical.com>
 <20190524072648.6zqgz7rpwpcv22pb@pali>
 <d0b659bf-e6ed-bbbb-a3ab-17daf525a577@canonical.com>
 <20190524093729.GB1119@jelly>
 <f0c2dff9-519e-d54d-4cd0-2be666656dc2@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0c2dff9-519e-d54d-4cd0-2be666656dc2@canonical.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 24, 2019 at 06:43:58PM +0800, Hui Wang wrote:
> 
> On 2019/5/24 下午5:37, Peter Hutterer wrote:
> > On Fri, May 24, 2019 at 03:37:57PM +0800, Hui Wang wrote:
> > > On 2019/5/24 下午3:26, Pali Rohár wrote:
> > > > On Friday 24 May 2019 13:50:53 Hui Wang wrote:
> > > > > On 2019/5/24 下午1:36, Peter Hutterer wrote:
> > > > > > On Fri, May 24, 2019 at 01:25:52PM +0800, Hui Wang wrote:
> > > > > > > On 2019/5/23 下午2:01, Peter Hutterer wrote:
> > > > > > > > On Wed, May 22, 2019 at 09:40:30AM +0200, Pali Rohár wrote:
> > > > > > > > > On Wednesday 22 May 2019 07:30:43 Xiaoxiao Liu wrote:
> > > > > > > > > > Hi Pali,
> > > > > > > > > > 
> > > > > > > > > > Ok, and cannot you set ALPS_DUALPOINT flag based on that
> > > > > > > > > > alps_check_is_trackpoint() result and then update
> > > > > > > > > > alps_process_packet_ss4_v3() code to supports also
> > > > > > > > > > V8 trackpoint packets?
> > > > > > > > > > --> Yes, we can do like so, when we use the v8 method to process the trackpoint , the mouse speed is not ideal.
> > > > > > > > > >           Then we choose the standard mouse driver.
> > > > > > > > > Mouse speed is something which is configurable. Have you configured it
> > > > > > > > > somehow? Also there is libinput project should handle these settings
> > > > > > > > > more properly.
> > > > > > > > > 
> > > > > > > > > Adding Peter Hutterer, maintainer of libinput to loop. I think he could
> > > > > > > > > help with this problem.
> > > > > > > > libinput has a quirk for a magic multiplier on trackpoints. it was the only
> > > > > > > > solution I found that came close to "working" given that every device seems
> > > > > > > > to provide some other random magic data. Doc for it is here:
> > > > > > > > https://wayland.freedesktop.org/libinput/doc/latest/trackpoint-configuration.html
> > > > > > > Hello Peter Hutterer,
> > > > > > > 
> > > > > > > To adjust the trackpoint speed from userspace:
> > > > > > > 
> > > > > > > If the libinput version is lower than 1.9.0, we could set
> > > > > > > POINTINGSTICK_CONST_ACCEL=0.25
> > > > > > > 
> > > > > > > If the libinput version is higher than 1.12.0, we could set
> > > > > > > AttrTrackpointMultiplier=0.25
> > > > > > > 
> > > > > > > But if we use libinput-1.10.0,  how could we adjust the speed?
> > > > > > The LIBINPUT_ATTR_TRACKPOINT_RANGE property, which didn't end up working
> > > > > > well (hence why it got replaced again). See the docs here though:
> > > > > > https://wayland.freedesktop.org/libinput/doc/1.10.0/trackpoints.html
> > > > > > 
> > > > > > Cheers,
> > > > > >       Peter
> > > > > OK, got it, Thanks.
> > > > Is not here some database where for input device name / id is specified
> > > > that property? So users do not have to invent what is correct value for
> > > > their hardware?
> > > Since the libinput version in the ubuntu 18.04 is 1.10,  I tried to set
> > > LIBINPUT_ATTR_TRACKPOINT_RANGE with different values (from 25, 20, 10, 5) in
> > > the udev hwdb database, I checked it with "udevadm info /dev/input/eventX"
> > > to confirm the value is set to LIBINPUT_ATTR_TRACKPOINT_RANGE successfully,
> > > but looks like the cursor speed doesn't change at all. So for ubuntu 18.04,
> > > looks like we have to adjust the speed in the kernel driver.
> > I don't think it's a good idea to make the kernel driver behaviour based on
> > an EOL libinput version just because one version of ubuntu ships with that.
> > 18.10 and 19.04 both ship with libinput 1.12.
> > 
> > It'd be better to make sure it works well with a *current* version and then
> > patch libinput on 18.04 where needed.
> 
> OK, that is sth we need to do.  But anyway it is a bit risky to backport
> that much code and the whole folder of quirks to libinput 1.10.4,  we need
> to do lots of test to make sure there is no regression on other machines.
> 
> Probably we only need to keep the quirks/30-vendor-alps.quirks to 1.10.4 and
> drop other quirks, that will be better for our testing effort.

might be worth looking at what is in 1.10.7, e.g.  a3b3e85c0e looks like it
may be of interest. That one suggests the range on some ALPS devices is over
100, so testing with 5-25 may really not have had any effect.

Cheers,
   Peter       
