Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 675533D37B
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 19:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405753AbfFKRHM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 13:07:12 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:40926 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405356AbfFKRHL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 13:07:11 -0400
Received: by mail-pf1-f181.google.com with SMTP id p184so4524503pfp.7;
        Tue, 11 Jun 2019 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7aH25v3Hx1NMUvytzU1QVg/6VVIQIlEQHF1pCamcBQ4=;
        b=fskelMiufq6DZGC/0bzKmWAptQbp84iH3H4HUD90gku5UFv2OXuClzXAubyulmk3OK
         zpBUsRzGZJ4tVK2S6Zql/amqp/jPm/5fKlH7isLRQtPlzTFsn2EYexvgcK4qabMwRMAv
         BpeEuZowx1MGgmfW5vN4VfQw5rcWyhdC5A7UTL/VkrML8sw5N0c3X41Y8qdCuhBjWtqL
         zBjcI0nGSCgOtk7GoIisdh1fAqG206JRwtIsbL0vvAGg8+yJSJnRZfxCb6C1vCpBI4Cw
         xz4C7gSRhyHWpmOQgwEpCO3YQmG3f8nEheKxIOZOlSJmxIdscCabcHRwyj1HbsmBYbtG
         gQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7aH25v3Hx1NMUvytzU1QVg/6VVIQIlEQHF1pCamcBQ4=;
        b=r/tQGVvMLVsdeIbib5VYUhLEQ7TIPw2YV7CC+UcbFr0UyTwpx0dTq6RZrqi++diH95
         jpoo3hw+aL5IyBK6uanNiPapkda9qVG6hTyTADhSZiiPCXv7W3lPUlwZPCM4Oh6jhUCs
         ZZA9dq6GwSJQGQ82gwrwmzD8N6MLe2ce77pJQ+UGteWup88lfxVRJ8u/GAz3vd3uOzU/
         79sit1iov6TkMO/NY0rO9VjqOJf5jSAzX0kf4DxPQomnQEiRYOs64E0SzxeCHH+MYOpi
         EnoKc0iIPwhARubeRh6ghECOi9fS3gc6oNe65YVuWtn26dcPiXCrytDmHkYJo3XwRkww
         xt5w==
X-Gm-Message-State: APjAAAU4ztIx9nvLra6QQuwybqWk2sxaz+vdF71rFBwwNse2qT1VEv+k
        MAmA2Vk4DDEwi2dh0rt1RnE=
X-Google-Smtp-Source: APXvYqy3IZi/0Vi/+Hd0kW/KCxwTD6uwyywKfxJdkYbA4xRHvlC8p306bmDTO+3NDrKeTCh8nKFIpQ==
X-Received: by 2002:a63:2a06:: with SMTP id q6mr21027443pgq.290.1560272830202;
        Tue, 11 Jun 2019 10:07:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id t26sm2787341pgu.43.2019.06.11.10.07.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 10:07:09 -0700 (PDT)
Date:   Tue, 11 Jun 2019 10:07:07 -0700
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     Hui Wang <hui.wang@canonical.com>,
        Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "peter.hutterer@who-t.net" <peter.hutterer@who-t.net>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>,
        Hideo Kawase <hideo.kawase@alpsalpine.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?=
 =?utf-8?B?5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= input: alps-fix the issue alps
 cs19 trackstick do not work.
Message-ID: <20190611170707.GA143729@dtor-ws>
References: <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190528071824.jimhixhtsynzwixe@pali>
 <OSBPR01MB48556FD88D7F7D5F91CB5579DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855707AC8ABB7CFBE5BBBD5DA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855A2A30A4F5E6BDCFE715FDA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190610104310.qa5snt7jpcljodfv@pali>
 <OSBPR01MB485504868362073ED434F82FDAED0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <ed65f8af-fefb-3c40-e7b1-dde3605f30e3@canonical.com>
 <5587ddb9-fb5f-03db-ac11-a696c85c5f2f@canonical.com>
 <20190611072333.nd4va4q2m5epmukc@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190611072333.nd4va4q2m5epmukc@pali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 11, 2019 at 09:23:33AM +0200, Pali Rohár wrote:
> On Tuesday 11 June 2019 12:32:33 Hui Wang wrote:
> > On 2019/6/11 上午11:23, Hui Wang wrote:
> > > On 2019/6/11 上午11:05, Xiaoxiao Liu wrote:
> > > > Hi Pali,
> > > > 
> > > > I discussed with our FW team about this problem.
> > > > We think the V8 method means a touchpad feature  and does not fit
> > > > the CS19 trackpoint device.
> > > > CS19 TrackPoint needn't  use any Absolute (Raw) mode and is usually
> > > > use standard mouse data.
> > > > CS19 TrackPoint device is a completely different device with
> > > > DualPoint device of Dell/HP.
> > > > CS19 TrackPoint device is independent  of Touchpad. (Touchpad is
> > > > connecting by I2C, TrackPoint is directly connecting with PS2 port.)
> > > > And it has completely another FW.
> > > > 
> > > > So we think it is better to use the mouse mode for CS19 trackpoint.
> > > 
> > > Maybe here is some mis-understanding,  the mouse mode here doesn't mean
> > > we use psmouse-base.c for cs19 (bare ps/2 mouse), we plan to use
> > > trackpoint.c to drive this HW, so this trackpoint has all features a
> > > trackpoint should have.
> > > 
> > And I sent a patch one month ago to let the the trackpoint.c to drive this
> > HW: https://www.spinics.net/lists/linux-input/msg61341.html, maybe that
> > patch is reference.
> 
> So instead of creating blacklist, you should check for TP_VARIANT_ALPS
> in alps.c and disallow its usage.
> 
> Or maybe better, move trackpoint.c detect code before alsp.c detect code
> in psmouse-base. And no changes in alps.c are needed.

I'd be very cautions of moving around the protocol detection. It is very
fragile, so if we can detect trackpoint-only case in alps.c and skip on
to trackpoint I would prefer it.

Thanks.

-- 
Dmitry
