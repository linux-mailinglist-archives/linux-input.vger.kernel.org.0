Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4EE2695B5
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 21:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725979AbgINTgH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 15:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgINTgH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 15:36:07 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1A5C06174A;
        Mon, 14 Sep 2020 12:36:06 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id d13so638024pgl.6;
        Mon, 14 Sep 2020 12:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qVnJKH3CPIkJPym1H8GxbjdS84vOKq9LnBGIKyldV0E=;
        b=hHSo9D+upUu6BJPwbulUJjURy4nenkwIljeO1SZ0elW7zCWkEDVhjmv0vd8gq5/OMU
         XuKiTnXUtIP7guor9eeTTg1imTV3WzAUnOgtkhFDgLyYj+dZPRJUGfwG7FfpVm7dRB5i
         nS3WQZXzAvVt+v6vP0qVYUnD5w614rVxdQ7XFv2/ue0JAopkC4qWXqeIJB1ACDGav0vd
         fcXW58if8yP7imbvXf6UPGnzdaH2+bv7I7uwKG2wAzhboKKwXUvorjE49UNlHQuT1j90
         NNGv3aGoyiH1XP1EqxvzancMSN/3n8+t+KGwf6/aBiV7oJ0fYMlISwrysTLDl7Erp/BD
         +I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qVnJKH3CPIkJPym1H8GxbjdS84vOKq9LnBGIKyldV0E=;
        b=UWRu83vIOXd/z0h2ByCAOXqSXE2qZamsujSGGpwch7tNoZTbvQ6UWJ2OhgkcfwvK8u
         5jP2FUa0yhBU8Sc261+OwiDpu6KoGqxg81HmgIfl/GbYNhmOz5V8bw+X57xxPH1672oR
         I9LyS9qM+lvCTPrvXgcCrY1M2knxYHBlUqrdJulO9wDfc5c0mREtLQG+cLhdlM3Z15Fp
         1MxV7hK8CSGPuj7at0j91qOI7dQGstjrFZsU5lrVx5LIKGN12fHrSgckcGEDCc+CNrKg
         ir/DApIPjDqpmWizHctuVFY5L5G3+GzL+KeYQRH196GDhzZnyqABsS2DOERvxC3K7LZm
         NDSA==
X-Gm-Message-State: AOAM531whCLRW/0s+QikRCiHCrgtswwfT9TnjYqyINq1JAMPZL9n3HBm
        2qE8TOjpYNenPnuPsEFD2Lw=
X-Google-Smtp-Source: ABdhPJyVeGdl8jb8rdq+ykbubQcK9hcytSIlltn/hbUIo/8phDmGco1eh46ez/znPdQjI5ZRM3Dq6Q==
X-Received: by 2002:a63:4902:: with SMTP id w2mr12153812pga.311.1600112166309;
        Mon, 14 Sep 2020 12:36:06 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id d17sm11173299pfq.157.2020.09.14.12.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 12:36:05 -0700 (PDT)
Date:   Mon, 14 Sep 2020 12:36:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
Message-ID: <20200914193603.GW1665100@dtor-ws>
References: <20200912005521.26319-1-jiada_wang@mentor.com>
 <20200913165644.GF1665100@dtor-ws>
 <65d1b9f2-a8e3-6398-712d-41d8067d06a1@gmail.com>
 <20200914193340.GV1665100@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914193340.GV1665100@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 14, 2020 at 12:33:40PM -0700, Dmitry Torokhov wrote:
> On Mon, Sep 14, 2020 at 08:29:44PM +0300, Dmitry Osipenko wrote:
> > 13.09.2020 19:56, Dmitry Torokhov пишет:
> > > Hi Jiada,
> > > 
> > > On Sat, Sep 12, 2020 at 09:55:21AM +0900, Jiada Wang wrote:
> > >> From: Nick Dyer <nick.dyer@itdev.co.uk>
> > >>
> > >> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
> > >> when they are in a sleep state. It must be retried after a delay for the
> > >> chip to wake up.
> > > 
> > > Do we know when the chip is in sleep state? Can we do a quick I2C
> > > transaction in this case instead of adding retry logic to everything? Or
> > > there is another benefit for having such retry logic?
> > 
> > Hello!
> > 
> > Please take a look at page 29 of:
> > 
> > https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datasheet_LX.pdf
> > 
> > It says that the retry is needed after waking up from a deep-sleep mode.
> > 
> > There are at least two examples when it's needed:
> > 
> > 1. Driver probe. Controller could be in a deep-sleep mode at the probe
> > time, and then first __mxt_read_reg() returns I2C NACK on reading out TS
> > hardware info.
> > 
> > 2. Touchscreen input device is opened. The touchscreen is in a
> > deep-sleep mode at the time when input device is opened, hence first
> > __mxt_write_reg() invoked from mxt_start() returns I2C NACK.
> > 
> > I think placing the retries within __mxt_read() / write_reg() should be
> > the most universal option.
> > 
> > Perhaps it should be possible to add mxt_wake() that will read out some
> > generic register
> 
> I do not think we need to read a particular register, just doing a quick
> read:
> 
> 	i2c_smbus_xfer(client->adapter, client->addr,
> 			0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &dummy)
> 
> should suffice.
> 
> > and then this helper should be invoked after HW
> > resetting (before mxt_read_info_block()) and from mxt_start() (before
> > mxt_set_t7_power_cfg()). But this approach feels a bit fragile to me.
> >
> 
> Actually, reading the spec, it all depends on how the WAKE pin is wired
> up on a given board. In certain setups retrying transaction is the right
> approach, while in others explicit control is needed. So indeed, we need
> a "wake" helper that we should call in probe and resume paths.

By the way, I would like to avoid the unnecessary retries in probe paths
if possible. I.e. on Chrome OS we really keep an eye on boot times and
in case of multi-sourced touchscreens we may legitimately not have
device at given address.

Thanks.

-- 
Dmitry
