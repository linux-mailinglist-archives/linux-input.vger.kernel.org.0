Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD513C4FC
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 09:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404199AbfFKHXj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 03:23:39 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37529 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404113AbfFKHXi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 03:23:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id 22so1633332wmg.2;
        Tue, 11 Jun 2019 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8SXJkBChm4tyl3x86k5LU1rDYIAY8lVNxWSGhpiEXRo=;
        b=Rw6hfum1sKXPRFT9U92P0V9plNe7rUitbH17YswE0CIhwSIvvRU9n80XfNHUGQyZsl
         yEjaHD/quOOiegC3UPn3CFdqKza0pes8sYu2QNcEq25Ez/N9KSpw6LUmv8Wu/jwbS6Sz
         xV+BerwCt0efJFQJ28M1ABA2tpxvTruOz2WPG8vPjL+SrkVoHgEtDRJTiJMDhSrZ2o4p
         /XrbRe0iITXdmH8WECZcQUxhwWek755PabHnr0e1SPoxSxB17+pEfVwM791MqViYiADb
         rgZwjUDCwPgGufX8lVOHz27O5LD+eDxuDbPhtQ8UeOziTs599Ueiko4M7MuzlL6d3NaH
         LLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8SXJkBChm4tyl3x86k5LU1rDYIAY8lVNxWSGhpiEXRo=;
        b=ab7hFT+5OtUxYXWuzH4Qv/dGf/SErzMq6oNnncYOP/Cjyzav+zsqbZqgZp+bCkNZQS
         pESNDs2vC9BbuXXoDedJWTmkYh/g7AdrmCq4lUcSDXvHuzILxAn8R9XCUocgOy0IWvLM
         j3Vd58TKTnEt0rBq4IcB+WOJ6l0v+IOeOlMCUKD11Rej0HDMY/FGgrN8X1DrJHLo1m2I
         HUixsNcpL1XF2qkQNYYYx/yKPmnlK6lvqmBe849izBtxxA+iCARVTdW4h/uxASb5kF0w
         GXvd4C7+9Rky7zoze2lTKMYHAGUeiymHynuzlrbPUQwBJlRnuyuy9HZkHZECIfWtOnCg
         Iprg==
X-Gm-Message-State: APjAAAUc6ij3Xhy2RTmU6CfdnrbSFLBJYu1j9YEk500Q8QmasXuGA0kM
        WV2XBAMQajNKu8RZBijymwX1XVT5MJQ=
X-Google-Smtp-Source: APXvYqwxTxMc2ofRGlxkTnvt/Yn8XNjoTYXK/DmZQyPZeSoihP/oKeiY82l/LrSu8Cob4TksASmcfg==
X-Received: by 2002:a1c:2dd2:: with SMTP id t201mr15512930wmt.136.1560237815690;
        Tue, 11 Jun 2019 00:23:35 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id j3sm13616971wrt.73.2019.06.11.00.23.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 00:23:34 -0700 (PDT)
Date:   Tue, 11 Jun 2019 09:23:33 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
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
Message-ID: <20190611072333.nd4va4q2m5epmukc@pali>
References: <20190527100913.sgxrjrmphsjfmcdb@pali>
 <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190528071824.jimhixhtsynzwixe@pali>
 <OSBPR01MB48556FD88D7F7D5F91CB5579DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855707AC8ABB7CFBE5BBBD5DA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855A2A30A4F5E6BDCFE715FDA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190610104310.qa5snt7jpcljodfv@pali>
 <OSBPR01MB485504868362073ED434F82FDAED0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <ed65f8af-fefb-3c40-e7b1-dde3605f30e3@canonical.com>
 <5587ddb9-fb5f-03db-ac11-a696c85c5f2f@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5587ddb9-fb5f-03db-ac11-a696c85c5f2f@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tuesday 11 June 2019 12:32:33 Hui Wang wrote:
> On 2019/6/11 上午11:23, Hui Wang wrote:
> > On 2019/6/11 上午11:05, Xiaoxiao Liu wrote:
> > > Hi Pali,
> > > 
> > > I discussed with our FW team about this problem.
> > > We think the V8 method means a touchpad feature  and does not fit
> > > the CS19 trackpoint device.
> > > CS19 TrackPoint needn't  use any Absolute (Raw) mode and is usually
> > > use standard mouse data.
> > > CS19 TrackPoint device is a completely different device with
> > > DualPoint device of Dell/HP.
> > > CS19 TrackPoint device is independent  of Touchpad. (Touchpad is
> > > connecting by I2C, TrackPoint is directly connecting with PS2 port.)
> > > And it has completely another FW.
> > > 
> > > So we think it is better to use the mouse mode for CS19 trackpoint.
> > 
> > Maybe here is some mis-understanding,  the mouse mode here doesn't mean
> > we use psmouse-base.c for cs19 (bare ps/2 mouse), we plan to use
> > trackpoint.c to drive this HW, so this trackpoint has all features a
> > trackpoint should have.
> > 
> And I sent a patch one month ago to let the the trackpoint.c to drive this
> HW: https://www.spinics.net/lists/linux-input/msg61341.html, maybe that
> patch is reference.

So instead of creating blacklist, you should check for TP_VARIANT_ALPS
in alps.c and disallow its usage.

Or maybe better, move trackpoint.c detect code before alsp.c detect code
in psmouse-base. And no changes in alps.c are needed.

> > Regards,
> > 
> > Hui.
> > 
> > > 
> > > Best Regards
> > > Shona
> > > -----邮件原件-----
> > > 发件人: Pali Rohár <pali.rohar@gmail.com>
> > > 发送时间: Monday, June 10, 2019 6:43 PM
> > > 收件人: 劉 曉曉 Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
> > > 抄送: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>;
> > > dmitry.torokhov@gmail.com; peter.hutterer@who-t.net;
> > > hui.wang@canonical.com; linux-input@vger.kernel.org;
> > > linux-kernel@vger.kernel.org; 曹 曉建 Xiaojian Cao
> > > <xiaojian.cao@cn.alps.com>; zhangfp1@lenovo.com; 斉藤 直樹 Naoki
> > > Saito <naoki.saito@alpsalpine.com>; 川瀬 英夫 Hideo Kawase
> > > <hideo.kawase@alpsalpine.com>
> > > 主题: Re: 答复: 答复: [PATCH] input: alps-fix the issue alps cs19
> > > trackstick do not work.
> > > 
> > > On Monday 10 June 2019 10:03:51 Xiaoxiao Liu wrote:
> > > > Hi Pali,
> > > Hi!
> > > 
> > > > We register our CS19 device as ALPS_ONLY_TRACKSTICK device.
> > > > And let the V8 protocol function support the process of
> > > > ALPS_ONLY_TRACKSTICK device.
> > > > 
> > > > I want to confirm if this solution OK?
> > > Yes, it is fine. Just make sure that touchapad input device is not
> > > registered when this ALPS_ONLY_TRACKSTICK flag is set. So userspace
> > > would not see any fake/unavailable touchpad input device.
> > > 
> > > > Xiaoxiao.Liu
> > > -- 
> > > Pali Rohár
> > > pali.rohar@gmail.com

-- 
Pali Rohár
pali.rohar@gmail.com
