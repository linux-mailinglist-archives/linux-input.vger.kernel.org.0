Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDF0294AD
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 11:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389787AbfEXJcs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 05:32:48 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38139 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389745AbfEXJcs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 05:32:48 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 4A99620CCC;
        Fri, 24 May 2019 05:32:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 24 May 2019 05:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=+
        qC77qEtJgFM4RgrXNXMD53fGuMNNIaoVho4NTHx+dU=; b=jA6zzoThxBZvegOCg
        xFvfA3JmsKK3QAkglWFGnCMhwy2U/xvxaJNGv5DmLsiTktuMhfqaVCeU6CmIOque
        5eC4kTsJyqui5Q7tiiADVl2/blgNGVUO5ZZmR5jKa/nc8bAj73tBtKr3Nr/G//67
        tCZEzvEPmgPe2Q2Ht2bBDYLhOMx/DmKkpMgw+edeKlvEWJGpWQ/Uhtt42jhtz8EE
        1QgeRLzOZtQR+QHrm0E0I8Y9sZDVP4IcPJ7YQqJalZ90qWwC9Q1X+uuMtq9kpQnB
        vfijorWvOH09hzBdohYv5oxtc3qtE1pusv3tJOQ9tuclLBawSh20ydHL4XWBtene
        FlvKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=+qC77qEtJgFM4RgrXNXMD53fGuMNNIaoVho4NTHx+
        dU=; b=leGHl+DOuL2p6MNiOS3ddAUmjgsmSoPSuWsnirg4T3s15XJF5cGRMiHOn
        CJ4Dl9RxjJ2tr1LrPZFTQmB6390OSFmJLmJEclFCyFk+bnjAEw68hzvrN7UrY21T
        QY+8TgHirH2x1aBY7nB+XUQxSJOF9Z5AeXt3mowEfN5SXRvrhTRoBbZyKWapVCnB
        Ipgg19a9l4IkmMu4VpD1MWLobTe02MGK1UK6QXEktw4QtjtYN25Hs0XvtLFlJqRf
        NXE/rFFoDI5Tfz3JHSQd8HlsUcdRmSK+b02nIDLB/oDKF9Pm0mfZLfYGArx4LUVR
        lz7okR3sY7OrKkHZ3OPd/vI0yKyBQ==
X-ME-Sender: <xms:PrrnXFU1uiN34_jx41jIe9Bc5ou_x47IDP8hGROc7KUQ6LQ8-O6-3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduiedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtreejnecuhfhrohhmpefrvght
    vghrucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnh
    gvtheqnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeduudej
    rddvtddrieelrddugedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuh
    htthgvrhgvrhesfihhohdqthdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:PrrnXIxjbGDaTzAoFXKhkEbUQGhT6DB8-IhKTSV1MlRsaXMNc-1i9A>
    <xmx:PrrnXNhGABiPvxo2rE5905Y1yEruZyYH0YEydqM_gOMOZY3MjdrulQ>
    <xmx:PrrnXCw-rJk9WAPmsEVe7-o3vuCKQTe0YZ0dm6KJVPINOIiQkawvCg>
    <xmx:P7rnXN_gw42eWu7O4AhJvd2o6fmqp4QMxoj8kF0LYyEV_Hv9fGjTcg>
Received: from jelly (117-20-69-142.751445.bne.nbn.aussiebb.net [117.20.69.142])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3DB3638008A;
        Fri, 24 May 2019 05:32:42 -0400 (EDT)
Date:   Fri, 24 May 2019 19:32:38 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     Hui Wang <hui.wang@canonical.com>,
        Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        dmitry.torokhov@gmail.com, XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?=
 =?utf-8?B?5aSNOiBbUEFUQ0hdIGlucHV0?= =?utf-8?Q?=3A?= alps-fix the issue the
 special alps trackpoint do not work.
Message-ID: <20190524093238.GA1119@jelly>
References: <20190521094622.syeub6tcqhbyc7sg@pali>
 <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522063546.kb74mxeprkauicul@pali>
 <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522074030.64sy7xt3wnomtxjb@pali>
 <20190523060154.GA10526@jelly>
 <38ec4a40-d51a-aeb1-a5e8-dbaed1142298@canonical.com>
 <20190524053648.GA16379@jelly>
 <d1fd207d-68e1-0b57-f0dc-c254bfc9352c@canonical.com>
 <20190524072648.6zqgz7rpwpcv22pb@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190524072648.6zqgz7rpwpcv22pb@pali>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 24, 2019 at 09:26:48AM +0200, Pali Rohár wrote:
> On Friday 24 May 2019 13:50:53 Hui Wang wrote:
> > On 2019/5/24 下午1:36, Peter Hutterer wrote:
> > > On Fri, May 24, 2019 at 01:25:52PM +0800, Hui Wang wrote:
> > > > On 2019/5/23 下午2:01, Peter Hutterer wrote:
> > > > > On Wed, May 22, 2019 at 09:40:30AM +0200, Pali Rohár wrote:
> > > > > > On Wednesday 22 May 2019 07:30:43 Xiaoxiao Liu wrote:
> > > > > > > Hi Pali,
> > > > > > > 
> > > > > > > Ok, and cannot you set ALPS_DUALPOINT flag based on that
> > > > > > > alps_check_is_trackpoint() result and then update
> > > > > > > alps_process_packet_ss4_v3() code to supports also
> > > > > > > V8 trackpoint packets?
> > > > > > > --> Yes, we can do like so, when we use the v8 method to process the trackpoint , the mouse speed is not ideal.
> > > > > > >         Then we choose the standard mouse driver.
> > > > > > Mouse speed is something which is configurable. Have you configured it
> > > > > > somehow? Also there is libinput project should handle these settings
> > > > > > more properly.
> > > > > > 
> > > > > > Adding Peter Hutterer, maintainer of libinput to loop. I think he could
> > > > > > help with this problem.
> > > > > libinput has a quirk for a magic multiplier on trackpoints. it was the only
> > > > > solution I found that came close to "working" given that every device seems
> > > > > to provide some other random magic data. Doc for it is here:
> > > > > https://wayland.freedesktop.org/libinput/doc/latest/trackpoint-configuration.html
> > > > Hello Peter Hutterer,
> > > > 
> > > > To adjust the trackpoint speed from userspace:
> > > > 
> > > > If the libinput version is lower than 1.9.0, we could set
> > > > POINTINGSTICK_CONST_ACCEL=0.25
> > > > 
> > > > If the libinput version is higher than 1.12.0, we could set
> > > > AttrTrackpointMultiplier=0.25
> > > > 
> > > > But if we use libinput-1.10.0,  how could we adjust the speed?
> > > The LIBINPUT_ATTR_TRACKPOINT_RANGE property, which didn't end up working
> > > well (hence why it got replaced again). See the docs here though:
> > > https://wayland.freedesktop.org/libinput/doc/1.10.0/trackpoints.html
> > > 
> > > Cheers,
> > >     Peter
> > 
> > OK, got it, Thanks.
> 
> Is not here some database where for input device name / id is specified
> that property? So users do not have to invent what is correct value for
> their hardware?

yeah, libinput ships with a quirks database that sets those, but it relies
on users to submit the quirks.
https://gitlab.freedesktop.org/libinput/libinput/tree/master/quirks
There's no "correct" value anyway, if you ask 3 users what the trackpoint
should do you'll get 5 answers :)

Cheers,
   Peter
