Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5C9A2695AD
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 21:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgINTdp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 15:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgINTdo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 15:33:44 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB3FC06174A;
        Mon, 14 Sep 2020 12:33:43 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t14so614033pgl.10;
        Mon, 14 Sep 2020 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KkqW6KbGxh/KSzD5Wn3+KsznoNndYdFD3MoHDu0yS4o=;
        b=HfYCcZI99+eKdPn+gu+0tW1l9EDS6ETq2rWjaKfMje5mzce1L5EtvJ5iBfwX3DyrkZ
         z4WOxdPJNDR/MPnkHostr5TaHikU5kDP/tZxpn0McXQJOb/VmdYYBJvvNrfKToknN5MA
         EkunW0nK5eLh3doETfKpGaco1W+8jQWnXHQL8nNLdF6ElipJIn7BeQOcj0jzUDTQKkas
         mQmQ023eo8lEkg20TmX0dEyj10LZbv8MalsiT+3pBcJTNFg35OEAGcV+Oaxc5Qtc2oVl
         NnsmTbV3nVO6Yx1eghtKDnIEPWSjt870ra9wlkD8X7W4Gps5XmUgIgHR/az3mdyEgr8f
         SnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KkqW6KbGxh/KSzD5Wn3+KsznoNndYdFD3MoHDu0yS4o=;
        b=IRn5JQA2O+jNk0X5gxcoWNJG7UfkQWx2IoSAVGs2G9Ez4MMv85M1Lgv8C6NAZfq7od
         dbzV/IfD1P7QlJxf2RYsKVx9YbjXZ9tP+RSKCMPVjHlhFtxTPBP74g3Ii8yseBnwCYxx
         SBZ6z6tLJcvKSOUQStINDL6L9ilp1i342Xyx/q2CdTnKxuhGIoSt59BkeX8cy4mmFGNQ
         HRBZjzClFTwwCpJ+t7ec+17icuEdCoS3qz3yH5zIWmbtBtKqV8Dqd3Jatx1NYzpT9VaU
         JcIm5bVsd68Znra3W97j+y17Pvbikqgsq9lkAMjmWjvkJCcHr/WISxcGlJ92GRrAD41k
         KDIQ==
X-Gm-Message-State: AOAM532AOrs+fWpM49WwOqmhL03x38zMA39QXJfv7vlIwvvb/sJRbHOO
        ptzWJtJS15sGWo7qVx0NE+w=
X-Google-Smtp-Source: ABdhPJyZp3Qip8dp9EXEb3DBw2NbThgWauPBUnNuJ9bhig+2ViBSnYR9uE0t11+Mk7kGE9cJ/LB9NA==
X-Received: by 2002:a63:7f50:: with SMTP id p16mr11972543pgn.451.1600112023115;
        Mon, 14 Sep 2020 12:33:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a2sm10835024pfr.104.2020.09.14.12.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 12:33:42 -0700 (PDT)
Date:   Mon, 14 Sep 2020 12:33:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
Message-ID: <20200914193340.GV1665100@dtor-ws>
References: <20200912005521.26319-1-jiada_wang@mentor.com>
 <20200913165644.GF1665100@dtor-ws>
 <65d1b9f2-a8e3-6398-712d-41d8067d06a1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65d1b9f2-a8e3-6398-712d-41d8067d06a1@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 14, 2020 at 08:29:44PM +0300, Dmitry Osipenko wrote:
> 13.09.2020 19:56, Dmitry Torokhov пишет:
> > Hi Jiada,
> > 
> > On Sat, Sep 12, 2020 at 09:55:21AM +0900, Jiada Wang wrote:
> >> From: Nick Dyer <nick.dyer@itdev.co.uk>
> >>
> >> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
> >> when they are in a sleep state. It must be retried after a delay for the
> >> chip to wake up.
> > 
> > Do we know when the chip is in sleep state? Can we do a quick I2C
> > transaction in this case instead of adding retry logic to everything? Or
> > there is another benefit for having such retry logic?
> 
> Hello!
> 
> Please take a look at page 29 of:
> 
> https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datasheet_LX.pdf
> 
> It says that the retry is needed after waking up from a deep-sleep mode.
> 
> There are at least two examples when it's needed:
> 
> 1. Driver probe. Controller could be in a deep-sleep mode at the probe
> time, and then first __mxt_read_reg() returns I2C NACK on reading out TS
> hardware info.
> 
> 2. Touchscreen input device is opened. The touchscreen is in a
> deep-sleep mode at the time when input device is opened, hence first
> __mxt_write_reg() invoked from mxt_start() returns I2C NACK.
> 
> I think placing the retries within __mxt_read() / write_reg() should be
> the most universal option.
> 
> Perhaps it should be possible to add mxt_wake() that will read out some
> generic register

I do not think we need to read a particular register, just doing a quick
read:

	i2c_smbus_xfer(client->adapter, client->addr,
			0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &dummy)

should suffice.

> and then this helper should be invoked after HW
> resetting (before mxt_read_info_block()) and from mxt_start() (before
> mxt_set_t7_power_cfg()). But this approach feels a bit fragile to me.
>

Actually, reading the spec, it all depends on how the WAKE pin is wired
up on a given board. In certain setups retrying transaction is the right
approach, while in others explicit control is needed. So indeed, we need
a "wake" helper that we should call in probe and resume paths.

Thanks.

-- 
Dmitry
