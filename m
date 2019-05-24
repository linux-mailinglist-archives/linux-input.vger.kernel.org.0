Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E55B29521
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 11:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389716AbfEXJwQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 05:52:16 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39280 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389582AbfEXJwP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 05:52:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id e2so558050wrv.6;
        Fri, 24 May 2019 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=SZlgdWghXcOx29IJ3YpRkLUJGC5gsx+9Sxo+2Gik714=;
        b=jrjdlO2AntaltwpcLnkrsJX6gM9QxY/Jw39kNl8hmQUOhViJK+GnF6ntE9xZniEIcD
         pzwc6ZiagUdIBg4kWq2fPr/EnQEs+e5XXKvtfrnT9sVeyfakLbpbFuwbUH9ZJs/lmZEb
         IxGNn4eftCWeUw2WX3QhIMMPOTotMNac/27itGdTAT/O13URcopN3LyvMMjFKXD1eBQ6
         PpmS1RP7JCpzmGsr5ELvor32yVG0ozlUFxipWCoXVU7i4NkP61Jr0vlYYmJ7WNSVcnUg
         Mp1IXEuBnH/4iBP4uqhqRNpe5qj96PWzO48js1YylZM3ih47gb5GMlTX4OSO4DCziiK8
         BRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=SZlgdWghXcOx29IJ3YpRkLUJGC5gsx+9Sxo+2Gik714=;
        b=rkL0io0NPRUtOMBYwaYRn9ZUnSkfCrLJRCSkaIIrgi3Vbb2YF3ZzswoQtJsoc1SIJ0
         r5N4/3/hBhvuE+balTKR4YW+ejdK47MQVM6/RkshDa/1kteTJ6oIiQA5Ug3NAdtVBYLa
         e7fjA7Bqog22ZBU1xtvGdL40xOra3myiw8azwL673l6WhnLGBsrlNiLKrqru+p+QBohM
         m434LtbQVr1i80/8IflLqx3avudXD25ggFCkf3axsdynh6NKj+hiZPfwM1xMK1RGxqj1
         5xHvTW8IBSHNdtb+91/McygEf66+DVhkLMjKHlV0VfeJqs/tQF7nrFrTSmYOPiqIz/yC
         h+1w==
X-Gm-Message-State: APjAAAWRhGIsBsDGLV2I6s6oXbLxBtWrXK3m/dnXxSoIeElh/b/KsOHM
        kB+gdUeBd/eDeov/7mpv+2k=
X-Google-Smtp-Source: APXvYqxPjtYlHBthTHveuzTO3uZdtAaeckc2jmNSuYLALzSHS1CHfyQHt6ggKigbBuqoxx5HqjOKtw==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr6961359wrt.150.1558691533362;
        Fri, 24 May 2019 02:52:13 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id y130sm1767931wmc.44.2019.05.24.02.52.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 02:52:12 -0700 (PDT)
Date:   Fri, 24 May 2019 11:52:11 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Peter Hutterer <peter.hutterer@who-t.net>
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
Message-ID: <20190524095211.wfvqxt3ihu2ft7lw@pali>
References: <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522063546.kb74mxeprkauicul@pali>
 <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522074030.64sy7xt3wnomtxjb@pali>
 <20190523060154.GA10526@jelly>
 <38ec4a40-d51a-aeb1-a5e8-dbaed1142298@canonical.com>
 <20190524053648.GA16379@jelly>
 <d1fd207d-68e1-0b57-f0dc-c254bfc9352c@canonical.com>
 <20190524072648.6zqgz7rpwpcv22pb@pali>
 <20190524093238.GA1119@jelly>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190524093238.GA1119@jelly>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Friday 24 May 2019 19:32:38 Peter Hutterer wrote:
> On Fri, May 24, 2019 at 09:26:48AM +0200, Pali Rohár wrote:
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
> > > > > > > >         Then we choose the standard mouse driver.
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
> > > >     Peter
> > > 
> > > OK, got it, Thanks.
> > 
> > Is not here some database where for input device name / id is specified
> > that property? So users do not have to invent what is correct value for
> > their hardware?
> 
> yeah, libinput ships with a quirks database that sets those, but it relies
> on users to submit the quirks.
> https://gitlab.freedesktop.org/libinput/libinput/tree/master/quirks

That is enough!

> There's no "correct" value anyway, if you ask 3 users what the trackpoint
> should do you'll get 5 answers :)

I know :) but reason for such database is to provide some sane defaults.
Which seems it is already there.

-- 
Pali Rohár
pali.rohar@gmail.com
