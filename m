Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7DE24791
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 07:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfEUFhJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 01:37:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36475 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfEUFhJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 01:37:09 -0400
Received: by mail-pf1-f194.google.com with SMTP id v80so8450265pfa.3;
        Mon, 20 May 2019 22:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BZUFffhvoZ/3VV5Du2sO0r+/XHpzujtgwYRf59q1Hiw=;
        b=L5QsMohpY5jUu8A6YvYaTiZm+TCX58rPXL32paqhvK7XnxN0t+Ewr6vKXTtoOaPBjV
         byTNG8bGdahP89ZEwxlWek0z2kWfFar5NqPSBwWeP7zk4PYsgvBOSLMdhvTe5xNzON53
         hJlDfOnJdTlj653JJZ52clPD9Kb28QVtgHCwkw6WYHzFVphHDLt5MlJhoU1uDV+fYZrq
         MbcG9YaAuRa6+Z/Wr+UXvG4D3AO5zBvlMjvs2XhjaNAxFiL0a1rXAJBE5bbOS0LIsM41
         GJKn+DmrQ7j1vuxD3zWuJQB3wMdSaPVBCFzadC1YO1tRi2e9KKn+YYUIJ40PYNm8/ESN
         r1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=BZUFffhvoZ/3VV5Du2sO0r+/XHpzujtgwYRf59q1Hiw=;
        b=rtlKBKr0XnsLNlYALzsWjwxz4aeTD/A5TUZX0IqXSac0QpAuK+2/iavssb7eDl57hA
         0eEWA69GSrJU9wUBmoRsgdZ6TMnH9nEX6J6p96FrNuWJzThnIDxXJwyprLS4mkehpw2P
         0l+7uxcAA0ueq0d006CCXPdeOWUe4D6OZ2gn7OfEGLMuZ/R8STremRcMasbtEaz/sApw
         m1qQB0XnX6SGYruEjBPOUC/THAHeR7DT0f4MjGpax9rliYxFXxGIV508CGPRPUpKaCDP
         vDRn3s21xpTV1J/c31vL00I7OssbB6PGvYzFQd8ExpLWyhfN2GtxHeLB3TXKckriRgu+
         /0Vg==
X-Gm-Message-State: APjAAAV1aNFPsdOwsNKyt1fbwLfIsA+SxaA4YtR31/xBhgikMZpQeOKs
        C/UWV0AirJ3kkVZ4hAFuUkc=
X-Google-Smtp-Source: APXvYqw0bKYE74PZgt9Ba0AIyCqYptbQcv12MrPVNzS4PMJxIQQBQT2SlwqIPX7lL5dRwwoFaTXx7g==
X-Received: by 2002:a65:4806:: with SMTP id h6mr5663188pgs.299.1558417027972;
        Mon, 20 May 2019 22:37:07 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id l21sm27768199pff.40.2019.05.20.22.37.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 22:37:07 -0700 (PDT)
Date:   Mon, 20 May 2019 22:37:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [RFC PATCH v2 0/4] Input: mpr121-polled: Add polled driver for
 MPR121
Message-ID: <20190521053705.GI183429@dtor-ws>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Michal,

On Fri, May 17, 2019 at 03:12:49PM +0200, Michal Vokáč wrote:
> Hi,
> 
> I have to deal with a situation where we have a custom i.MX6 based
> platform in production that uses the MPR121 touchkey controller.
> Unfortunately the chip is connected using only the I2C interface.
> The interrupt line is not used. Back in 2015 (Linux v3.14), my
> colleague modded the existing mpr121_touchkey.c driver to use polling
> instead of interrupt.
> 
> For quite some time yet I am in a process of updating the product from
> the ancient Freescale v3.14 kernel to the latest mainline and pushing
> any needed changes upstream. The DT files for our imx6dl-yapp4 platform
> already made it into v5.1-rc.
> 
> I rebased and updated our mpr121 patch to the latest mainline.
> It is created as a separate driver, similarly to gpio_keys_polled.
> 
> The I2C device is quite susceptible to ESD. An ESD test quite often
> causes reset of the chip or some register randomly changes its value.
> The [PATCH 3/4] adds a write-through register cache. With the cache
> this state can be detected and the device can be re-initialied.
> 
> The main question is: Is there any chance that such a polled driver
> could be accepted? Is it correct to implement it as a separate driver
> or should it be done as an option in the existing driver? I can not
> really imagine how I would do that though..
> 
> There are also certain worries that the MPR121 chip may no longer be
> available in nonspecifically distant future. In case of EOL I will need
> to add a polled driver for an other touchkey chip. May it be already
> in mainline or a completely new one.

I think that my addition of input_polled_dev was ultimately a wrong
thing to do. I am looking into enabling polling mode for regular input
devices as we then can enable polling mode in existing drivers.

As far as gpio-keys vs gpio-key-polled, I feel that the capabilities of
polling driver is sufficiently different from interrupt-driven one, so
we will likely keep them separate.

Thanks.

-- 
Dmitry
