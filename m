Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61BE7EE76F
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 19:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfKDShA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 13:37:00 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41917 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727998AbfKDShA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 13:37:00 -0500
Received: by mail-pf1-f194.google.com with SMTP id p26so12908897pfq.8;
        Mon, 04 Nov 2019 10:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4DGXiFc0mTxxd06ApgMoYC7hB9T1+6YQjN6fhz/5oOU=;
        b=FvwURMrXMWX7zY8r8RV+tUsOCBqlhkD9OEcxIykbO9k9TKKV2ORueionJzRJBqlP1r
         S/aCDe9juYmfDkdZvh/X6Ay6kDUXAs8W6T08sk35w3sDWRvnhY3k38wRWr+8pkFxsBPz
         M+oXjzFRsqqjnbbsKAL8sjTGvz1MMaDTtW4myoE6OAuenC+MKA+/LhfNVAnRmemd8lvd
         dD1IbjQK4TBl16DQ+tQTjcpjbAL/rcmxLerKS/DSGA2cRzufL72tuMYq4CU8tolWcKFt
         aWuPpq9DHercuITE8WG8CIiKHR0JA3H+oaOoKtpTJB71EYXPDZByPBJzCVDer8TrXZdW
         0SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4DGXiFc0mTxxd06ApgMoYC7hB9T1+6YQjN6fhz/5oOU=;
        b=JqEA64IYOTD6O/+yZJlzKtYpvOF8sHxq6GTSu31tA2HffYY+/p1QPWhi9kqLJ5ZLZQ
         ZkFb5fgX8Kla2utAOp2lPyrPCqRrmruC+MBZmbNHHOzssxX7kJ7sP377dDDoR0mbchSS
         pP1DvLACBkS0Npb6Y7azmM9hxksVv2eD9ZdasyhjMJmW2sQZSv34hIpBm7kJbzUzbml6
         eQEA/Vw9ZDjX5SpeMvobNupPKY7a31HnPBEQA1jqpCLcmhPUEbfFxMWBwW8bMYai9IT1
         BLuhOL86eGi9U1GZa1qPSG4cWsomoKrgK5DbozuOilNTBsmIEIGtc6Tft9w34iwUrtLK
         4JNw==
X-Gm-Message-State: APjAAAWxX1KOwDkhKlZ6rXQXGVOk1soR+/QNLg2td1oYy8QC0duaaL+7
        Ku/sNaWISzPJ5JDHEIx0sN4=
X-Google-Smtp-Source: APXvYqzIwLlIwg0n80PTXmAmW6EwZ1r5h+4jA1h1R/W2oT06CsWKGK58rcCbplqxzutGiFg5n0MPYA==
X-Received: by 2002:a17:90a:fd88:: with SMTP id cx8mr732897pjb.88.1572892619435;
        Mon, 04 Nov 2019 10:36:59 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e17sm14362675pgg.5.2019.11.04.10.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 10:36:58 -0800 (PST)
Date:   Mon, 4 Nov 2019 10:36:56 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20191104183656.GO57214@dtor-ws>
References: <20190302141704.32547-1-marex@denx.de>
 <20191101204801.16328-1-TheSven73@gmail.com>
 <20191104070116.GM57214@dtor-ws>
 <CAGngYiV_eP0M48Ei8K+uNWb_yW1Yi7C_E5M6O9HpJmrnxkmvyw@mail.gmail.com>
 <CAHCN7xJmJH1gqnE1TBi7hEYnhg0aV8TOW8==QxXV3CEOOk560g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJmJH1gqnE1TBi7hEYnhg0aV8TOW8==QxXV3CEOOk560g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 04, 2019 at 08:19:28AM -0600, Adam Ford wrote:
> On Mon, Nov 4, 2019 at 7:49 AM Sven Van Asbroeck <thesven73@gmail.com> wrote:
> >
> > On Mon, Nov 4, 2019 at 2:01 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Can you please tell me what device you have? Do the patches work for
> > > you?
> >
> > I have an ILI2117A/ILI2118A.
> >
> > I'll try out the patches today. I'm stuck with a 4.1 vendor kernel, so
> > I'll need to backport the (patched) mainline driver to 4.1 before
> > I'm able to test.
> >
> > I wil try Marek's patch, and Dmitry's rebased patch from
> > https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=ili2xxx-touchscreen
> > and let you know the results.
> 
> For what it's worth, I tried the 3-patch series from that branch on
> 5.4-RC5, but the ts_calibrate and ts_test_mt do not appear to receive
> touch info.  They execute when I 'export
> TSLIB_TSDEVICE=/dev/input/event0' but I don't get touch data.
> 
> If I do a hex-dump of /dev/event0 and it dumps data if and only if I
> hold my finger on the touch screen for a while.
> 
> I'll try just doing the 1st patch to see if it it's any better.

OK, I see where I messed up ili211x_read_touch_data(), it should use
i2c_master_recv() and not ili210x_read_reg(). I'll make a fix up patch
later today.

-- 
Dmitry
