Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA65294EC
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 11:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390142AbfEXJhj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 05:37:39 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42269 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390141AbfEXJhj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 05:37:39 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 0B51121E97;
        Fri, 24 May 2019 05:37:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 24 May 2019 05:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=Q
        HiQtg8kXM6ybT69wfC5hiOwIjIvUvNkrypOFCXnC8M=; b=g0uFmXg8SOFsMddFt
        hSd4Q81+zOEiYGm1alvNKV21mFHwB7p+ONtV5oHySPdkv7pi4W2b9Wc6DCH9vY6V
        WGAycJTxOXcMTLNED2VZJI2IwDPSoL1FZLYUQkNpUhqVpxg0CHvXuf0thfbfb01C
        jQEDXfnL5NNZc6Bdtt0p6JH08H6u8kHHccvnU0hc5wZvXcgmiThrEMPnrNDIBzaH
        MvNBMr1RuoFLTAUwpk9LQYVd7FL3D7fABomNA+jaLzx5rxpX9CFMONLOnVT6ZD02
        7BBlmDnnPZErqVAmyXA7LyJqiOb1RM+iA6DHtYB9A7VH9k5uRCcbxBMdfJ5+y0Ij
        mnEQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=QHiQtg8kXM6ybT69wfC5hiOwIjIvUvNkrypOFCXnC
        8M=; b=BAMFOW+5BHIJ6YwvLetn8NBNe7NWxYL0RUetcHwdgShIYhbaYehvqBC/j
        rhk3SNmbcjAAwNMy+lcQNi4OUSrJUU3HhHSaYY/Ld6iyWmV1lloqbMllvxqX7w2a
        qXh54x7HehpAxR+mG2FK+AJzKhMAeTb/XhZnGnnQixFQ5GOJNQusockehGM+pWPw
        AjFBp9+F4g+2EkTUm8PWzFdilpKK8KBec1ARJf5S7NydKXLJrrrRhA9q7iOiZOvf
        nghMeLNYhmZ+oI6KPq3KPtsen2FPYyn/OEgFPKtPwjIb98Yh6AcWLdmHHXAx+FNU
        iFXFnH4Ign5pRYDk3IWqdlm6pYhmA==
X-ME-Sender: <xms:YbvnXPVwuVcCcRBG4MzaLpNimaywlDt1xb20GhYgh8LrIQGbK4m52Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduiedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtreejnecuhfhrohhmpefrvght
    vghrucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnh
    gvtheqnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeduudej
    rddvtddrieelrddugedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuh
    htthgvrhgvrhesfihhohdqthdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:YbvnXL4h5Sr-fYY2inL_r9RHxOWCErdqJSI5DmkngOw6DmPVjJMKNg>
    <xmx:YbvnXKjEnNrCdckYQY9SB43tMNun0Qb_d_t6bcuBBP7wA9vtJFXKpg>
    <xmx:YbvnXCejIJpjmTsrGmh5mB6l6YC50DzChTTgGHqTfSHd9enEi_LPbw>
    <xmx:YbvnXLW9AM9EnbqxTtj1uUkIDRvxBW8C6oxb4fvDW4LqkQURrmnWtA>
Received: from jelly (117-20-69-142.751445.bne.nbn.aussiebb.net [117.20.69.142])
        by mail.messagingengine.com (Postfix) with ESMTPA id EEA3C80059;
        Fri, 24 May 2019 05:37:33 -0400 (EDT)
Date:   Fri, 24 May 2019 19:37:29 +1000
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
Message-ID: <20190524093729.GB1119@jelly>
References: <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522063546.kb74mxeprkauicul@pali>
 <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522074030.64sy7xt3wnomtxjb@pali>
 <20190523060154.GA10526@jelly>
 <38ec4a40-d51a-aeb1-a5e8-dbaed1142298@canonical.com>
 <20190524053648.GA16379@jelly>
 <d1fd207d-68e1-0b57-f0dc-c254bfc9352c@canonical.com>
 <20190524072648.6zqgz7rpwpcv22pb@pali>
 <d0b659bf-e6ed-bbbb-a3ab-17daf525a577@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0b659bf-e6ed-bbbb-a3ab-17daf525a577@canonical.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 24, 2019 at 03:37:57PM +0800, Hui Wang wrote:
> 
> On 2019/5/24 下午3:26, Pali Rohár wrote:
> > On Friday 24 May 2019 13:50:53 Hui Wang wrote:
> > > On 2019/5/24 下午1:36, Peter Hutterer wrote:
> > > > On Fri, May 24, 2019 at 01:25:52PM +0800, Hui Wang wrote:
> > > > > On 2019/5/23 下午2:01, Peter Hutterer wrote:
> > > > > > On Wed, May 22, 2019 at 09:40:30AM +0200, Pali Rohár wrote:
> > > > > > > On Wednesday 22 May 2019 07:30:43 Xiaoxiao Liu wrote:
> > > > > > > > Hi Pali,
> > > > > > > > 
> > > > > > > > Ok, and cannot you set ALPS_DUALPOINT flag based on that
> > > > > > > > alps_check_is_trackpoint() result and then update
> > > > > > > > alps_process_packet_ss4_v3() code to supports also
> > > > > > > > V8 trackpoint packets?
> > > > > > > > --> Yes, we can do like so, when we use the v8 method to process the trackpoint , the mouse speed is not ideal.
> > > > > > > >          Then we choose the standard mouse driver.
> > > > > > > Mouse speed is something which is configurable. Have you configured it
> > > > > > > somehow? Also there is libinput project should handle these settings
> > > > > > > more properly.
> > > > > > > 
> > > > > > > Adding Peter Hutterer, maintainer of libinput to loop. I think he could
> > > > > > > help with this problem.
> > > > > > libinput has a quirk for a magic multiplier on trackpoints. it was the only
> > > > > > solution I found that came close to "working" given that every device seems
> > > > > > to provide some other random magic data. Doc for it is here:
> > > > > > https://wayland.freedesktop.org/libinput/doc/latest/trackpoint-configuration.html
> > > > > Hello Peter Hutterer,
> > > > > 
> > > > > To adjust the trackpoint speed from userspace:
> > > > > 
> > > > > If the libinput version is lower than 1.9.0, we could set
> > > > > POINTINGSTICK_CONST_ACCEL=0.25
> > > > > 
> > > > > If the libinput version is higher than 1.12.0, we could set
> > > > > AttrTrackpointMultiplier=0.25
> > > > > 
> > > > > But if we use libinput-1.10.0,  how could we adjust the speed?
> > > > The LIBINPUT_ATTR_TRACKPOINT_RANGE property, which didn't end up working
> > > > well (hence why it got replaced again). See the docs here though:
> > > > https://wayland.freedesktop.org/libinput/doc/1.10.0/trackpoints.html
> > > > 
> > > > Cheers,
> > > >      Peter
> > > OK, got it, Thanks.
> > Is not here some database where for input device name / id is specified
> > that property? So users do not have to invent what is correct value for
> > their hardware?
> 
> Since the libinput version in the ubuntu 18.04 is 1.10,  I tried to set
> LIBINPUT_ATTR_TRACKPOINT_RANGE with different values (from 25, 20, 10, 5) in
> the udev hwdb database, I checked it with "udevadm info /dev/input/eventX"
> to confirm the value is set to LIBINPUT_ATTR_TRACKPOINT_RANGE successfully,
> but looks like the cursor speed doesn't change at all. So for ubuntu 18.04, 
> looks like we have to adjust the speed in the kernel driver.

I don't think it's a good idea to make the kernel driver behaviour based on
an EOL libinput version just because one version of ubuntu ships with that.
18.10 and 19.04 both ship with libinput 1.12.

It'd be better to make sure it works well with a *current* version and then
patch libinput on 18.04 where needed.

Cheers,
   Peter
