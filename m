Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43DE12698DE
	for <lists+linux-input@lfdr.de>; Tue, 15 Sep 2020 00:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgINWcp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 18:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgINWco (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 18:32:44 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9725DC06174A;
        Mon, 14 Sep 2020 15:32:42 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id c3so255750plz.5;
        Mon, 14 Sep 2020 15:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=r//p/musXc3E44T/FgdUApsZyFMshBSitW0+8TNcXbk=;
        b=ULWIxTGHbmtZ6Bfv4rRYq7a8z/MxMxLopZWyf7rl7tN5BryGlRaDz6lJJzX5Oti+t5
         eMTYHhRLPffavbQ5kQ4jtqLLlSl+4dcoJWcOlRFEZ4xpDN5Kta+Oaz+RrRpAG2tVO4R+
         4ke80npHkpQ8Uywqp21MH7gckwzTbgJNPxphQYXm1vuBPZW8fL5MXfrTyBe4oCKBMkJb
         gKty8foAj3oecz24WXabb8VW78QPwzYkyBU7mpH1q1RB1c0zfhfqN1l+aDFXSnA7va2f
         g7axvzA1jlehfGe7OxsKfXbcOM5fkHc7z9cX/56y5IWYG7stt6xdQLR1oHqf0s8dS31n
         IMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=r//p/musXc3E44T/FgdUApsZyFMshBSitW0+8TNcXbk=;
        b=J+pRJ42rxAMCpjZ/bQuRFlvlpB9ZcE0ZTZ1x1mQt2JKg9RrmQpT/Hm+2GYqA35e87I
         EyodvLGdnTAuxw7pVwJ3TsU/DYydPLowjfp0sVFdMGXnWncEcjzg7w9nSa/nBI2SqSTw
         DSE18lUhW25gr1iJGCFLzxqjO1WvDTL8Jl9ilkDQeiQ5UWfosgF8CsfmQEKW81p4EiBA
         YBp+pVbBXBJza+uSHHe77iveIVl0vjRkWHazgmZnJHcDdyDpnshepLSXejFv/Mbzs01y
         XYBzx7p/hHV64QUoFAvYZgJ3/2ZlutyJgXbvTEJCIGKQTmYlEFbui8Cr8JMh05ytoshW
         n2Bg==
X-Gm-Message-State: AOAM530XChoNLw6fPsStcBk5SYBYQDI9vOeaVq+mv+Y7idFMc8o88N8i
        zohsWV1z6KvX3lBHg9Ng9mU=
X-Google-Smtp-Source: ABdhPJyEnF3LW6RMiq4POQ83WkohABQfg9k25KGzXwnO7DRBjpCyFlxTf9NdpTcztxitpFRf/0NlnA==
X-Received: by 2002:a17:90a:9d82:: with SMTP id k2mr1354470pjp.197.1600122761412;
        Mon, 14 Sep 2020 15:32:41 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s24sm9276012pgv.55.2020.09.14.15.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 15:32:40 -0700 (PDT)
Date:   Mon, 14 Sep 2020 15:32:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>, Rob Herring <robh@kernel.org>
Cc:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        andy.shevchenko@gmail.com, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
Message-ID: <20200914223238.GD1681290@dtor-ws>
References: <20200912005521.26319-1-jiada_wang@mentor.com>
 <20200913165644.GF1665100@dtor-ws>
 <65d1b9f2-a8e3-6398-712d-41d8067d06a1@gmail.com>
 <20200914193340.GV1665100@dtor-ws>
 <20200914193603.GW1665100@dtor-ws>
 <e3dca702-7489-be94-9eee-46024f988372@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3dca702-7489-be94-9eee-46024f988372@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 15, 2020 at 12:33:18AM +0300, Dmitry Osipenko wrote:
> 14.09.2020 22:36, Dmitry Torokhov пишет:
> > On Mon, Sep 14, 2020 at 12:33:40PM -0700, Dmitry Torokhov wrote:
> >> On Mon, Sep 14, 2020 at 08:29:44PM +0300, Dmitry Osipenko wrote:
> >>> 13.09.2020 19:56, Dmitry Torokhov пишет:
> >>>> Hi Jiada,
> >>>>
> >>>> On Sat, Sep 12, 2020 at 09:55:21AM +0900, Jiada Wang wrote:
> >>>>> From: Nick Dyer <nick.dyer@itdev.co.uk>
> >>>>>
> >>>>> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
> >>>>> when they are in a sleep state. It must be retried after a delay for the
> >>>>> chip to wake up.
> >>>>
> >>>> Do we know when the chip is in sleep state? Can we do a quick I2C
> >>>> transaction in this case instead of adding retry logic to everything? Or
> >>>> there is another benefit for having such retry logic?
> >>>
> >>> Hello!
> >>>
> >>> Please take a look at page 29 of:
> >>>
> >>> https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datasheet_LX.pdf
> >>>
> >>> It says that the retry is needed after waking up from a deep-sleep mode.
> >>>
> >>> There are at least two examples when it's needed:
> >>>
> >>> 1. Driver probe. Controller could be in a deep-sleep mode at the probe
> >>> time, and then first __mxt_read_reg() returns I2C NACK on reading out TS
> >>> hardware info.
> >>>
> >>> 2. Touchscreen input device is opened. The touchscreen is in a
> >>> deep-sleep mode at the time when input device is opened, hence first
> >>> __mxt_write_reg() invoked from mxt_start() returns I2C NACK.
> >>>
> >>> I think placing the retries within __mxt_read() / write_reg() should be
> >>> the most universal option.
> >>>
> >>> Perhaps it should be possible to add mxt_wake() that will read out some
> >>> generic register
> >>
> >> I do not think we need to read a particular register, just doing a quick
> >> read:
> >>
> >> 	i2c_smbus_xfer(client->adapter, client->addr,
> >> 			0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &dummy)
> >>
> >> should suffice.
> >>
> >>> and then this helper should be invoked after HW
> >>> resetting (before mxt_read_info_block()) and from mxt_start() (before
> >>> mxt_set_t7_power_cfg()). But this approach feels a bit fragile to me.
> >>>
> >>
> >> Actually, reading the spec, it all depends on how the WAKE pin is wired
> >> up on a given board. In certain setups retrying transaction is the right
> >> approach, while in others explicit control is needed. So indeed, we need
> >> a "wake" helper that we should call in probe and resume paths.
> 
> The WAKE-GPIO was never supported and I'm not sure whether anyone
> actually needs it. I think we could ignore this case until anyone would
> really need and could test it.

Right, I am not advocating adding GPIO control right away, I was simply
arguing why I believe we should separate wakeup handling from normal
communication handling.

> 
> > By the way, I would like to avoid the unnecessary retries in probe paths
> > if possible. I.e. on Chrome OS we really keep an eye on boot times and
> > in case of multi-sourced touchscreens we may legitimately not have
> > device at given address.
> 
> We could add a new MXT1386 DT compatible and then do:
> 
> static void mxt_wake(struct mxt_data *data)
> {
> 	struct i2c_client *client = data->client;
> 	struct device *dev = &data->client->dev;
> 	union i2c_smbus_data dummy;
> 
> 	if (!of_device_is_compatible(dev, "atmel,mXT1386"))
> 		return;
> 
> 	/* TODO: add WAKE-GPIO support */
> 
> 	i2c_smbus_xfer(client->adapter, client->addr,
> 			0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE,
> 			&dummy);
> 
> 	msleep(MXT_WAKEUP_TIME);
> }
> 
> Jiada, will you be able to re-work this patch? Please note that the new
> "atmel,mXT1386" DT compatible needs to be added into the
> atmel,maxtouch.txt binding.

Another option is to have a device property "atmel,wakeup-type" or
something, in case there are more Atmel variants needing this.

Rob, any preferences here?

Thanks.

-- 
Dmitry
