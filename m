Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2306317D077
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 23:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgCGWe2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 17:34:28 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41216 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgCGWe2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Mar 2020 17:34:28 -0500
Received: by mail-pl1-f193.google.com with SMTP id t14so2420628plr.8
        for <linux-input@vger.kernel.org>; Sat, 07 Mar 2020 14:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9Hxmd3F5iYuKjmsn5YWW7+/tglYNdFxYnjYUSKDWuoQ=;
        b=bHz1wqEe9g/hww71ZZ8yMeWhT0L3ZqrzW+nnX9lsE3KuHwwr6nBNhpF5Q0VAfWbK1d
         ctdY4+S8HnZ19SoZ6tMd/RlR6RDpqiQ7AYuUrPj36XfASbTm4wuhh9PeHlLB6+pFQ2lQ
         jxR4f/4DL73hALwLZEk8llufynK5pliLQqq79NK2Iq1xjiwg9E+N4Wqcjjzu2zgfZVbf
         WQlqBqBXI5R+ti6tNWw0W+BFsGriCEymVoeE8EBy+23AMfHgAX+GZP/LoZR7iTNARZc6
         TY0tve/TOPJT3Q9MRrw9S59999hbhRJDbksrjD1eyGzWj5Arp454tTCx428I7jUYOGJ1
         yMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9Hxmd3F5iYuKjmsn5YWW7+/tglYNdFxYnjYUSKDWuoQ=;
        b=jg+2NG+VR2sKqd0K8P/5IaDVJIRs5fLhCt39nDGgv85mMrx6R2SbZwktRqOsPQ72oF
         pUtymwUckXnDLnzx2Qy896FIva2LMQlHs8bgaX5H1XVpWnWr1FP9L3QpT1UPDZflouwy
         STy4KYLObz5bZ23uPWJ9Infx4ATfqXcVmgXo+ri3yKJ15Ac8rTpTgHcqlGHpywVZ0fX7
         qLDhS2SkR0Hki0pqrnohNTzfYozREt0UmxTETicK92TmwJuWaCbYn41yJM3qZKfikPuG
         sgfOqNwqa0xpeEaxiQjFGh1nFmFqu48lHRbEMDokL1+RKzxP1J+Uzyb4ASi7JqB0TMAU
         6R6g==
X-Gm-Message-State: ANhLgQ1Ap/YhVWUlKccvU/bjXD8/Wm1a7r9d0DwV3YUWGkbalJuWlN4S
        zJnglgie7A2aUtb0S3pLUjM=
X-Google-Smtp-Source: ADFU+vvXbkLYqa0XK1WPKvgkNipaRDqSeemXNJVwRe1BYgqA287NXexA8IndhBdgKhSLvqyNxWmqsw==
X-Received: by 2002:a17:902:7794:: with SMTP id o20mr9300732pll.312.1583620466693;
        Sat, 07 Mar 2020 14:34:26 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 191sm33378248pfa.142.2020.03.07.14.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2020 14:34:24 -0800 (PST)
Date:   Sat, 7 Mar 2020 14:34:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrew Duggan <aduggan@synaptics.com>
Cc:     Paul Hollinsky <phollinsky@holtechnik.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Subject: Re: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
Message-ID: <20200307223421.GS217608@dtor-ws>
References: <20200120111628.18376-1-l.stach@pengutronix.de>
 <20200127022448.GC184237@dtor-ws>
 <b2ca3006-281a-c991-4c6c-7ae7ce5cc3f7@synaptics.com>
 <23ecff7a48f801fcc18680fb6cb150e32fc3c858.camel@synaptics.com>
 <a46120cfd113a4d016f37270eb92c4fccd00a2ed.camel@pengutronix.de>
 <f7b19df4972a7293a701b738426fb63738a771a0.camel@synaptics.com>
 <0da4c22b-efb0-fccc-fd99-cdb398e1df8c@synaptics.com>
 <20200201013852.GG184237@dtor-ws>
 <1f6b0b96-d6fb-7e76-afdd-0ff405e3e84a@holtechnik.com>
 <2d54859d-ee5a-97ec-fe62-79fc1f9e3122@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d54859d-ee5a-97ec-fe62-79fc1f9e3122@synaptics.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 20, 2020 at 06:36:59PM -0800, Andrew Duggan wrote:
> 
> On 2/18/20 7:01 PM, Paul Hollinsky wrote:
> > 
> > Hi everyone,
> > 
> > I believe there may be an issue with the reduced reporting mode, at
> > least on my machine. I have a Lenovo ThinkPad X250 with the Synaptics
> > TM3075-002 trackpad.
> > 
> > With this patch, the trackpad becomes unusable. On a reboot, my control
> > register values are [38 00 19 19 00 10 90 06 ea 03 0f 01]. This
> > corresponds to a delta X/Y threshold of 25 and a palm rejection value of
> > 0. The protocol documentation mentions that the palm rejection value
> > becomes active when in reduced reporting mode, hence its inclusion here.
> > 
> Hmm, it looks like the firmware was configured with non-zero Delta X/Y
> Position thresholds. But, the firmware does not enable reduced reporting
> mode by default so those thresholds have no effect. However, this patch will
> now enable reduced reporting mode since it sees the non-zero threshold which
> were read from the firmware. I did not consider the case where the firmware
> would have thresholds set, but not enabled when I reviewed this patch
> initially. Based on this new info I would suggest we change the if statement
> to check sensor->axis_align.delta_x_threshold ||
> sensor->axis_align.delta_y_threshold. Then we would only change the
> reporting mode if the driver is explicitly setting the thresholds.

Any chance I could get a patch implementing this?

Thanks.

-- 
Dmitry
