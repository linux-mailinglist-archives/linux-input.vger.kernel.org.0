Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04A3A291AE
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 09:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388982AbfEXH0x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 03:26:53 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44375 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388910AbfEXH0w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 03:26:52 -0400
Received: by mail-wr1-f68.google.com with SMTP id w13so470688wru.11;
        Fri, 24 May 2019 00:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=odZn/rVgUc6nEnCQZnIPB2uax1UUalzDS6/8777bxPA=;
        b=sq1/4DDbIyEMDgCcitz7ZnUOr53Eb+wH7MB9e0qyqEmrEyjI5A6B32hvzWhC+q/1co
         8B5Za7tQBMQeWSUKDhaFuvYUFS7OFQC+iF+JcIXtb9HYgqy0EGLZSg4iVT4nFr5tb6TS
         eN2/bXm5pvIhCeVWdkkcasFAvkdhbjqW2jnxzDiMquRObm8Pd5jBP6UFOGCSxeQzDl7b
         agqwfTg5h254uie3FWd4Wnjefj2t+8U8hGpgixS/icL4IsWs3O6TBo9T55nsPJZxXKFX
         rruu7mAxDLnvTc0toL5YDo5oW2ALBvYuBPoxHSLE3Xmxgc5fPFqPKXGbA5QACkb+I6iA
         t9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=odZn/rVgUc6nEnCQZnIPB2uax1UUalzDS6/8777bxPA=;
        b=nTOLjwdTPkyUKxNEcM0bmjjClpvmmKVBhr7L38NcyAJRE9lVYs7BPlHmNb/B7e2wGx
         nyNNONlwqFJQAIhehB0nuEG71NU6Y3y1Y6Cg9Rz2qQ867v1CZKrupr6HhITP+wa9cVXJ
         tVMo9ZId0trSha2FS1Jj8223NAnWBYCJmJppLUqkoWCjS0REEGbGyuxjwpn+2ADGzdk3
         4ABfno0h6DzlZZP1T37twR6dxcWZBrrhecbuD7FRpzWJy3PUYD3W2y6qJu3zNwNJbmWe
         B1lNHrb0X5Zm/hn/EAKJuPIpKEnQDn6ZTM3/M8ZO0mFZLOMUpcxpQ+jzO75ZPpJWMDpI
         ozVQ==
X-Gm-Message-State: APjAAAWBa+FRqmCEqyqm0LVErJjljpVQVfH+ODuOeC7MqC2nW6JgcesY
        RKl44/qcy8WuxLRDMYZ2m78=
X-Google-Smtp-Source: APXvYqy2bkUJ8OSsPYVF5ABKzrDKsi86pqUY3OpIUdSIHSafUhelTNg2SZA3thO/K+vLfn2L/Zv6gw==
X-Received: by 2002:adf:f30b:: with SMTP id i11mr11395866wro.276.1558682810705;
        Fri, 24 May 2019 00:26:50 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id 197sm2384448wma.36.2019.05.24.00.26.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 00:26:49 -0700 (PDT)
Date:   Fri, 24 May 2019 09:26:48 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     Peter Hutterer <peter.hutterer@who-t.net>,
        Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        dmitry.torokhov@gmail.com, XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?=
 =?utf-8?B?5aSNOiBbUEFUQ0hdIGlucHV0?= =?utf-8?Q?=3A?= alps-fix the issue the
 special alps trackpoint do not work.
Message-ID: <20190524072648.6zqgz7rpwpcv22pb@pali>
References: <345b62e1-407e-7a03-9b03-486bbf5a0a8e@canonical.com>
 <20190521094622.syeub6tcqhbyc7sg@pali>
 <OSBPR01MB4855D744473149D037612506DA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522063546.kb74mxeprkauicul@pali>
 <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522074030.64sy7xt3wnomtxjb@pali>
 <20190523060154.GA10526@jelly>
 <38ec4a40-d51a-aeb1-a5e8-dbaed1142298@canonical.com>
 <20190524053648.GA16379@jelly>
 <d1fd207d-68e1-0b57-f0dc-c254bfc9352c@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1fd207d-68e1-0b57-f0dc-c254bfc9352c@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Friday 24 May 2019 13:50:53 Hui Wang wrote:
> On 2019/5/24 下午1:36, Peter Hutterer wrote:
> > On Fri, May 24, 2019 at 01:25:52PM +0800, Hui Wang wrote:
> > > On 2019/5/23 下午2:01, Peter Hutterer wrote:
> > > > On Wed, May 22, 2019 at 09:40:30AM +0200, Pali Rohár wrote:
> > > > > On Wednesday 22 May 2019 07:30:43 Xiaoxiao Liu wrote:
> > > > > > Hi Pali,
> > > > > > 
> > > > > > Ok, and cannot you set ALPS_DUALPOINT flag based on that
> > > > > > alps_check_is_trackpoint() result and then update
> > > > > > alps_process_packet_ss4_v3() code to supports also
> > > > > > V8 trackpoint packets?
> > > > > > --> Yes, we can do like so, when we use the v8 method to process the trackpoint , the mouse speed is not ideal.
> > > > > >         Then we choose the standard mouse driver.
> > > > > Mouse speed is something which is configurable. Have you configured it
> > > > > somehow? Also there is libinput project should handle these settings
> > > > > more properly.
> > > > > 
> > > > > Adding Peter Hutterer, maintainer of libinput to loop. I think he could
> > > > > help with this problem.
> > > > libinput has a quirk for a magic multiplier on trackpoints. it was the only
> > > > solution I found that came close to "working" given that every device seems
> > > > to provide some other random magic data. Doc for it is here:
> > > > https://wayland.freedesktop.org/libinput/doc/latest/trackpoint-configuration.html
> > > Hello Peter Hutterer,
> > > 
> > > To adjust the trackpoint speed from userspace:
> > > 
> > > If the libinput version is lower than 1.9.0, we could set
> > > POINTINGSTICK_CONST_ACCEL=0.25
> > > 
> > > If the libinput version is higher than 1.12.0, we could set
> > > AttrTrackpointMultiplier=0.25
> > > 
> > > But if we use libinput-1.10.0,  how could we adjust the speed?
> > The LIBINPUT_ATTR_TRACKPOINT_RANGE property, which didn't end up working
> > well (hence why it got replaced again). See the docs here though:
> > https://wayland.freedesktop.org/libinput/doc/1.10.0/trackpoints.html
> > 
> > Cheers,
> >     Peter
> 
> OK, got it, Thanks.

Is not here some database where for input device name / id is specified
that property? So users do not have to invent what is correct value for
their hardware?

-- 
Pali Rohár
pali.rohar@gmail.com
