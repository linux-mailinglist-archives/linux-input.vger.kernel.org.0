Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B51083D479
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 19:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405983AbfFKRpL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 13:45:11 -0400
Received: from mail-pl1-f174.google.com ([209.85.214.174]:38808 "EHLO
        mail-pl1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405488AbfFKRpL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 13:45:11 -0400
Received: by mail-pl1-f174.google.com with SMTP id f97so5426344plb.5;
        Tue, 11 Jun 2019 10:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UOVsPRLAcnpUv1+7kG2cLWfi6R+JpEtYqM1GcRMnUuk=;
        b=E796AeM4mrk/MSBxGtpMvy0jAewOt2VNTO2H4g8HmqyMDux7C9fCoNGP9YBUT1YBxw
         ggozz9KENqRwxiGI8rjR2UOcUH7bYKuNZHmLp4AbKDUlWFBeLRQOda1EnQebiTT49Rg+
         x9Rm2dPF82JgtGeV/h8Jlgb8NUX4CgCn5ZRj4hbeqxZagQSBQO+8J63qBDPO2z8NeA5b
         NCnK2GMFz2y/FRYvn1ucJ1y61C/gZvtis18HuwrLk3eDsBBw0BEFi9e6T5RYyPKNfGUi
         HOZA/ptPnAbua3/ANmOFwhr01WvcViJGEeqGRua4G8F5fFS6dxvLu3EX/qLRVRThzC0d
         9nBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UOVsPRLAcnpUv1+7kG2cLWfi6R+JpEtYqM1GcRMnUuk=;
        b=rmjL8WBPcWdlV+fi2HRwScSeZfAixI4QJmqx58Zpvkp3G/BPkERjR5Osrr+FVoOowS
         Y6XTNEYfpcg5vX60IYO6kJynu8i4hq9orgpfbMSu9xryoVJioOH6ouGhJnH2JLNxOanR
         IErcYPxjvxndBb0S56JhAeThJ8cPzWHfAFML8B0LOTFUHOf1SQNTmCm2bkQyZtRi0MFJ
         vMBJuTr/xPUCqeCrOwWH61YE4tj62hSqwi6hoAfmH1WQ/1zKqtuw/2N2JLOizNYGfnzA
         Bs6E2VQPWZ59ibLg4FwewxLtdqeetUmdVIQkoBEMro81GosmrEGwkaEz8EK7Rb75vprl
         drmw==
X-Gm-Message-State: APjAAAX418pcV+9gmNWq2PiC38kG4ssVVPABhfDtOmKYYx+SNAh+Wj8b
        K8+0ZqbYIeRWblYbHGxpC53pb6RN7zk=
X-Google-Smtp-Source: APXvYqx7oq6rzV/BZztfvDk9Bxl3R0qXF/jIuDbPR8j8NoxUy0yy7IMnVgh7qCHmllAxllyR672i1Q==
X-Received: by 2002:a17:902:fa2:: with SMTP id 31mr52633040plz.38.1560275110168;
        Tue, 11 Jun 2019 10:45:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d123sm28212058pfc.144.2019.06.11.10.45.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 10:45:09 -0700 (PDT)
Date:   Tue, 11 Jun 2019 10:45:07 -0700
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
Message-ID: <20190611174507.GF143729@dtor-ws>
References: <OSBPR01MB4855A2A30A4F5E6BDCFE715FDA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190610104310.qa5snt7jpcljodfv@pali>
 <OSBPR01MB485504868362073ED434F82FDAED0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <ed65f8af-fefb-3c40-e7b1-dde3605f30e3@canonical.com>
 <5587ddb9-fb5f-03db-ac11-a696c85c5f2f@canonical.com>
 <20190611072333.nd4va4q2m5epmukc@pali>
 <20190611170707.GA143729@dtor-ws>
 <20190611171707.tydk7rsmtzmjohky@pali>
 <20190611173228.GD143729@dtor-ws>
 <20190611173856.jjwoagud6doxvpy3@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190611173856.jjwoagud6doxvpy3@pali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 11, 2019 at 07:38:56PM +0200, Pali Rohár wrote:
> On Tuesday 11 June 2019 10:32:28 dmitry.torokhov@gmail.com wrote:
> > On Tue, Jun 11, 2019 at 07:17:07PM +0200, Pali Rohár wrote:
> > > On Tuesday 11 June 2019 10:07:07 dmitry.torokhov@gmail.com wrote:
> > > > On Tue, Jun 11, 2019 at 09:23:33AM +0200, Pali Rohár wrote:
> > > > > On Tuesday 11 June 2019 12:32:33 Hui Wang wrote:
> > > > > > On 2019/6/11 上午11:23, Hui Wang wrote:
> > > > > > > On 2019/6/11 上午11:05, Xiaoxiao Liu wrote:
> > > > > > > > Hi Pali,
> > > > > > > > 
> > > > > > > > I discussed with our FW team about this problem.
> > > > > > > > We think the V8 method means a touchpad feature  and does not fit
> > > > > > > > the CS19 trackpoint device.
> > > > > > > > CS19 TrackPoint needn't  use any Absolute (Raw) mode and is usually
> > > > > > > > use standard mouse data.
> > > > > > > > CS19 TrackPoint device is a completely different device with
> > > > > > > > DualPoint device of Dell/HP.
> > > > > > > > CS19 TrackPoint device is independent  of Touchpad. (Touchpad is
> > > > > > > > connecting by I2C, TrackPoint is directly connecting with PS2 port.)
> > > > > > > > And it has completely another FW.
> > > > > > > > 
> > > > > > > > So we think it is better to use the mouse mode for CS19 trackpoint.
> > > > > > > 
> > > > > > > Maybe here is some mis-understanding,  the mouse mode here doesn't mean
> > > > > > > we use psmouse-base.c for cs19 (bare ps/2 mouse), we plan to use
> > > > > > > trackpoint.c to drive this HW, so this trackpoint has all features a
> > > > > > > trackpoint should have.
> > > > > > > 
> > > > > > And I sent a patch one month ago to let the the trackpoint.c to drive this
> > > > > > HW: https://www.spinics.net/lists/linux-input/msg61341.html, maybe that
> > > > > > patch is reference.
> > > > > 
> > > > > So instead of creating blacklist, you should check for TP_VARIANT_ALPS
> > > > > in alps.c and disallow its usage.
> > > > > 
> > > > > Or maybe better, move trackpoint.c detect code before alsp.c detect code
> > > > > in psmouse-base. And no changes in alps.c are needed.
> > > > 
> > > > I'd be very cautions of moving around the protocol detection. It is very
> > > > fragile, so if we can detect trackpoint-only case in alps.c and skip on
> > > > to trackpoint I would prefer it.
> > > 
> > > The main problem is that proposed trackpoint-only check in alps.c is
> > > basically what trackpoint.c is doing for checking if device is
> > > trackpoint (via function trackpoint_start_protocol()).
> > > 
> > > So I'm not sure now what is the best solution...
> > 
> > Unfortunately currently trackpoint is being probed only after we tried
> > Elan, Genius, and Logitech PS2++ protocols, and I am not sure if moving
> > trackpoint around will disturb them or not.
> > 
> > I do not think there is much code duplication by pulling limited version
> > of trackpoint detection code into alps.c and then have it bail out when
> > it sees trackpoint-only device so trackpoint.c can handle it properly.
> 
> Ok. Seems that it is the best solution.
> 
> The last question is, should be use ALPS or Trackpoint protocol? Because
> it looks like that device can be configured to one or other.
> 
> What are pros and cons of these two protocols?

As far as I know the device implements trackpoint protocol, although not
complete version. Several manufacturers started making trackponts once
IBM/Lenovo patents on the original one expired (I think).

The data stream is regular relative PS/2, bit it allows controlling
device behavior a bit, such as press-to-select option and device
sensitivity. IBM/Lenovo version has many more parameters.

Thanks.

-- 
Dmitry
