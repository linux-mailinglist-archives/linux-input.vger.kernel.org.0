Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039DF2FE36C
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 08:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbhAUHGs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 02:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbhAUHEA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 02:04:00 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8061BC061757;
        Wed, 20 Jan 2021 23:03:20 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id g15so758445pgu.9;
        Wed, 20 Jan 2021 23:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bt1RhgQCBL8vSlSAI92FVm4jXQBzK6402/hgUyySzzI=;
        b=S1UT77sY5PQZPgwNzRXSNVMqPbi9PNxML4cbqY2loTRkVguZg5XQ0hgs6lkwbHjRj8
         Cu2Cr08+SZ9q8ubMEJkylmxeG42L/e+n/I+Yf0GqYYE+MrgbrTM/6US0vs9Sdn9V3a2g
         27VOmbPFaFamjxOP/DjYbywSyLf/YV4i3ied3nXThxOqYpLPj1u6v/JVzqKXTY1rWXPN
         3kEEAdiLbN6KGGWKfT3QEVwgOFTTnfY91ePrzr8KyHft5DZBz8DtmVfNsmaIsRMFd5s4
         MUT3IHAGy/1YmhShG0N8dG80rDzPrUU3UujXFAacseFRRx8iRYEcRCK2Ht71f1FdlmpL
         Ad+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bt1RhgQCBL8vSlSAI92FVm4jXQBzK6402/hgUyySzzI=;
        b=BZRqjO70KlEbWZGubG7Hrnjt1oFKET3dzQmSVY5u1e9Fd3a6SINePMPweeALzdpobp
         WVLfaNU8chEnRd9VPRPJM2YMsbB4oFuAm40RoXyuqZdK75Tx2BVkCxIJlASsTchvfOAo
         Atg6exxIo/SPIkxwP5iTdtE6mRpZ7nksfOf+1XkvB6rqUwQId0WeHlp9xbsKfAYBO0bK
         3vUsN9YOfSfuNNBjJFGTYwTmQZzV0WLg5UD6zaXObZHftUMaVRgUPAzcsD/UAa4e4zFM
         r2sFbhS09FNQANeisvE+oUyRmJvBno8XrhA4hUiwAXLk9hRsnWv6LH5/Uo6WEmzANHKh
         bryg==
X-Gm-Message-State: AOAM533KXTjxo3PfekXsdcGDpfN1ZRxN2rZfBHOpp6My9AF4UW3+6buG
        NcFqHtE+rL1aVdeLBWP22YYudSj75Us=
X-Google-Smtp-Source: ABdhPJymAS0KIMjXSx54qH9XTceoFYqEpwBvGHJ8N970hw1/PJmGIWYQum/VGl0FcsJjTY9tg3jYig==
X-Received: by 2002:aa7:8b51:0:b029:1ae:687f:d39b with SMTP id i17-20020aa78b510000b02901ae687fd39bmr12664320pfd.50.1611212599905;
        Wed, 20 Jan 2021 23:03:19 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id j9sm4363753pgb.47.2021.01.20.23.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 23:03:18 -0800 (PST)
Date:   Wed, 20 Jan 2021 23:03:16 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/2] Input: add MStar msg26xx touchscreen driver
Message-ID: <YAknNNgx66HDtrgQ@google.com>
References: <20210120180119.849588-1-vincent.knecht@mailoo.org>
 <20210120180119.849588-2-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120180119.849588-2-vincent.knecht@mailoo.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vincent,

On Wed, Jan 20, 2021 at 07:01:08PM +0100, Vincent Knecht wrote:
> +struct packet {
> +	u8	y_high : 4;
> +	u8	x_high : 4;

This will not work on big endian devices as order of bitfields changes.
I'd recommended treating contact packet as sequence of bytes and parse,
i.e.

	x = ((buf[0] & 0x0f) << 8) | buf[1];
	x = ((buf[0] & 0xf0) << 4) | buf[2];
	...

> +	u8	x_low;
> +	u8	y_low;
> +	u8	pressure;
> +};
> +
> +
> +static void mstar_power_on(struct msg26xx_ts_data *msg26xx)
> +{
> +	gpiod_set_value(msg26xx->reset_gpiod, 0);
> +	mdelay(10);
> +	gpiod_set_value(msg26xx->reset_gpiod, 1);
> +	mdelay(FIRMWARE_ON_DELAY);

I am pretty sure this is incorrect. You are saying that you release the
reset line, wait a bit, and then assert it. gpiod is a logical API, with
0 being inactive and 1 being active, and here you want to activate the
reset line, wait appropriate time, release it, and wait for the device
to initialize. What does the datasheet say about reset GPIO polarity?

Thanks.

-- 
Dmitry
