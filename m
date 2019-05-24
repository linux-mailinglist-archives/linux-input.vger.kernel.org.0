Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA462906E
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 07:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731684AbfEXFhA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 01:37:00 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54887 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726601AbfEXFg7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 01:36:59 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 6417E21EA0;
        Fri, 24 May 2019 01:36:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 24 May 2019 01:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=l
        Kg4XQeq5jOC7ztvZYWg3fg6/ebfKedqKp+BMmCvMz4=; b=baXxfCBU5iplvdNS+
        6T/zo3PdxcVAcp2ZVjR/RM03J2d0Hhx5U/foQmfV4tbI2tNQEKN4fpExpZk9DkNS
        VNoM8u6TBCFEEoN8ene9HgcHj5eM6Y4EG1y0nEAtIy4H5hS3FTUaBQpuES9PX49X
        Kv1qG3OA05tEiWLz8v5A6fLbpxnrZQMQj/0/RiStGyB9Yo/I3GfqjtExBnZ2L6OZ
        cjt4zcptQ6A/aV5W+CqhIp5KYY0YoXANMic+Tq2YEsG40wm7Zk1zakos+T7Z2vuR
        EgNNM/MguQl23WKyla46am3aKfioxEdWVZBgeKhTIts7XDStWKmzbU2cUNxIQSGl
        da3cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=lKg4XQeq5jOC7ztvZYWg3fg6/ebfKedqKp+BMmCvM
        z4=; b=rIcjGurc51yGDA0o6P+2ZgymkWxnwCHXtZ2hJugPAl5Yml0KhEQs7QdRe
        qCrj4dW8ijKHPhjH/+gvGqWMZ5AdHTgxqMqXErGOaC17evTYeOtep74eEGuA0B1l
        T2ZvGW/yIXu9FICDVoy3B0Xh68PKrqsr+YwrB2EkDZhFUTG7uxpcwE8qjmKuGL7D
        tAgbmZLo4TQxTJ9n6NlQ+JAfg6EakiLrzEFC7+NcnqZtU5j/PbsLDwmfNaOwJI73
        IN+ByfD41D28RHvjfdT51RTvIc8X+Ec4XhLWFrKDstnQBqjBeLx4yaYYE9sevQ8H
        DY0tUJlXdsDZxqyN/tX0eLZ4bgCqw==
X-ME-Sender: <xms:94LnXKpNTtE4DClk3cE7nkVN0I6OEY8haE37KKWu4risAbqZIzfbTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduhedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjggfsehtkeertddtreejnecuhfhrohhmpefrvght
    vghrucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnh
    gvtheqnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeduudej
    rddvtddrieelrddugedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuh
    htthgvrhgvrhesfihhohdqthdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:94LnXLDzR2BTPIBbGl7IsypQq-fedVl47QPAEJgAc_xgMlH31RJFDg>
    <xmx:94LnXIfjZeNUf0RQYuLQyeh2SN8dcOoA0bIQBSe9fUOMfD1WRKdSow>
    <xmx:94LnXNDVAbuhLCoaWJ-1pvkuP2t5dLuI5K7wJpy_GUVkCD32L-ajVg>
    <xmx:-ILnXHLVBKbZKiRFOaNK-tO5LRDcqWykS-q8Ic1YqJV4w7nYl1aphw>
Received: from jelly (117-20-69-142.751445.bne.nbn.aussiebb.net [117.20.69.142])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4438680060;
        Fri, 24 May 2019 01:36:52 -0400 (EDT)
Date:   Fri, 24 May 2019 15:36:48 +1000
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
Message-ID: <20190524053648.GA16379@jelly>
References: <20190520110149.27107-1-sliuuxiaonxiao@gmail.com>
 <OSBPR01MB485510A2A32CD9D2CE5EF7A1DA070@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <345b62e1-407e-7a03-9b03-486bbf5a0a8e@canonical.com>
 <20190521094622.syeub6tcqhbyc7sg@pali>
 <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522063546.kb74mxeprkauicul@pali>
 <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522074030.64sy7xt3wnomtxjb@pali>
 <20190523060154.GA10526@jelly>
 <38ec4a40-d51a-aeb1-a5e8-dbaed1142298@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38ec4a40-d51a-aeb1-a5e8-dbaed1142298@canonical.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 24, 2019 at 01:25:52PM +0800, Hui Wang wrote:
> 
> On 2019/5/23 下午2:01, Peter Hutterer wrote:
> > On Wed, May 22, 2019 at 09:40:30AM +0200, Pali Rohár wrote:
> > > On Wednesday 22 May 2019 07:30:43 Xiaoxiao Liu wrote:
> > > > Hi Pali,
> > > > 
> > > > Ok, and cannot you set ALPS_DUALPOINT flag based on that
> > > > alps_check_is_trackpoint() result and then update
> > > > alps_process_packet_ss4_v3() code to supports also
> > > > V8 trackpoint packets?
> > > > --> Yes, we can do like so, when we use the v8 method to process the trackpoint , the mouse speed is not ideal.
> > > >        Then we choose the standard mouse driver.
> > > Mouse speed is something which is configurable. Have you configured it
> > > somehow? Also there is libinput project should handle these settings
> > > more properly.
> > > 
> > > Adding Peter Hutterer, maintainer of libinput to loop. I think he could
> > > help with this problem.
> > libinput has a quirk for a magic multiplier on trackpoints. it was the only
> > solution I found that came close to "working" given that every device seems
> > to provide some other random magic data. Doc for it is here:
> > https://wayland.freedesktop.org/libinput/doc/latest/trackpoint-configuration.html
> 
> Hello Peter Hutterer,
> 
> To adjust the trackpoint speed from userspace:
> 
> If the libinput version is lower than 1.9.0, we could set
> POINTINGSTICK_CONST_ACCEL=0.25
> 
> If the libinput version is higher than 1.12.0, we could set
> AttrTrackpointMultiplier=0.25
> 
> But if we use libinput-1.10.0,  how could we adjust the speed?

The LIBINPUT_ATTR_TRACKPOINT_RANGE property, which didn't end up working
well (hence why it got replaced again). See the docs here though:
https://wayland.freedesktop.org/libinput/doc/1.10.0/trackpoints.html

Cheers,
   Peter

> > 
> > There are also different speeds depending on which xorg driver you'd use (or
> > libinput/Wayland), so a "mouse speed is not ideal" is almost a guarantee,
> > given a large enough variety of setups :) That's why we have the speed
> > toggle, but I'm happy to hear any suggestions on how to make the trackpoint
> > more useful (in libinput anyway).
> > 
> > > I do not think it is a good idea to force back to generic PS/2 mouse
> > > driver for touchpads and trackpoints. Native drivers for touchpads and
> > > trackpoints supports multitouch, absolute reporting and lot of other
> > > things... Also calculation of mouse speed from absolute positions on
> > > touchpads can be more easily fixed as from emulated relative movements.
> > Yeah, agree. Using PS/2 mouse drivers means you lose *all* the extra
> > features touchpads have like palm detection, tapping, scrolling, gestures,
> > etc.
> > 
> > Cheers,
> >     Peter
> > 
> > > Dmitry, what is your opinion about this problem? What should psmouse.ko
> > > do in this situation? Disallow usage of absolute mode and force bare
> > > PS/2 relative mode?
> > 
