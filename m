Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 447426AF14
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 20:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388388AbfGPSru (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 14:47:50 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39848 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbfGPSru (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 14:47:50 -0400
Received: by mail-wm1-f68.google.com with SMTP id u25so9319348wmc.4;
        Tue, 16 Jul 2019 11:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=la7tyf8ZPvrnrjwCqpENoZfGCM6j/pjcLrF4W1pZ+rY=;
        b=Rzasgh4koX7egHkPZapYQpqOqr5V0KdP9Amkfg9lgCJK7rw363mdbEp3iWx2c3xvir
         xdX43TR6TrHCZ50yHqFcTt5uDVyaArbRVVAu8AcH0H3ZhsWmu116mXxKkTzHhuN3kJna
         wZ+8QLY3SR0VV+w/eJGZkKUj//jh5o2e5qtKMpgvOVXfd3OeznGIjXLfi9VAPTsHDBDv
         wp2gh+xw6HDAb48gOIn7wNeTb90pv4ASdvju3i2LJXsnGtF9H4hSNRZ6QPOsq+tUD1G2
         G6pynhwrr9HN4O2Rb792Nrc0qz39g8hwNkW4ERLYxMEACZUKkFFyBYuflf+A0/M6Ojm0
         0NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=la7tyf8ZPvrnrjwCqpENoZfGCM6j/pjcLrF4W1pZ+rY=;
        b=F0m0wFz7g3qaN1GkEghzJV7BzoJbx9S2TcE3IwDIO/HZJnvPiI0xos6rCy8bNY8RKN
         NLDMMGzzSsNOtpUyHl8xL+EXeONDp8lmySSHsk1Th7yb1ctuFtbozmgOiatROYcUJFm+
         k/VtCIqpgdya1eaIJ/VMLpdhjCy0ZIL5ooKy45037svQ2WTCuyhYQ108xLpF8UzyxzVO
         56PZ0ddqVkHCF7e5u6thZCEoJyQZ5fQ2yQduFa0FTyEykj9QFDwqDbwffWEdDSy5KYaR
         fmyPFVhbTvepjvatoqvcS7xsAJoaPU8eJzUMeFF3fI6UqE22Mrqy5FIeNFNHM6exjAfn
         986Q==
X-Gm-Message-State: APjAAAUSozQlQfoilmPH5zrBMuiP7cw9w0QpOKhvVBQmWy6HHGRzYoh5
        VHALZ/JYXTzgMHb+ia8e3OgGfVbmPxs=
X-Google-Smtp-Source: APXvYqy2/SaHVfv0ZA468Q8Vk4qvCfbFHdaeCRTzyNzYAfwnhcqrN0fEKdlQGtE2FC32qHEJN15Jjw==
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr32313689wme.146.1563302867385;
        Tue, 16 Jul 2019 11:47:47 -0700 (PDT)
Received: from localhost (smb-adpcdg1-05.hotspot.hub-one.net. [213.174.99.133])
        by smtp.gmail.com with ESMTPSA id y16sm20774858wrw.33.2019.07.16.11.47.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 11:47:46 -0700 (PDT)
Date:   Tue, 16 Jul 2019 20:47:44 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Federico Lorenzi <federico@travelground.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] Input: add Apple SPI keyboard and trackpad driver.
Message-ID: <20190716184744.GC1140@penguin>
References: <20190419081926.13567-1-ronald@innovation.ch>
 <20190419081926.13567-3-ronald@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190419081926.13567-3-ronald@innovation.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ronald,

On Fri, Apr 19, 2019 at 01:19:26AM -0700, Ronald Tschalär wrote:
> The keyboard and trackpad on recent MacBook's (since 8,1) and
> MacBookPro's (13,* and 14,*) are attached to an SPI controller instead
> of USB, as previously. The higher level protocol is not publicly
> documented and hence has been reverse engineered. As a consequence there
> are still a number of unknown fields and commands. However, the known
> parts have been working well and received extensive testing and use.
> 
> In order for this driver to work, the proper SPI drivers need to be
> loaded too; for MB8,1 these are spi_pxa2xx_platform and spi_pxa2xx_pci;
> for all others they are spi_pxa2xx_platform and intel_lpss_pci. For this
> reason enabling this driver in the config implies enabling the above
> drivers.

I applied the patch (but changed __u8 to u8 as that's preferred form for
inside the kernel, and added error handling for input_mt_init_slots) but
we need to do some more work on the driver.

My main issue is with registering touchpad device asynchronously,
independent from the probe() function. This means (as far as I can tell)
that any error is not really appropriately handled (as by that time it
is too late to signal errors from probe()) and devm functions are not
going to be called, leaving remnants of the resources in memory on
driver unload. It also brings in issues with suspend/resume (what
happens if you suspend really quickly while device is not registered
yet?), etc, etc.

Can we switch to calling DEV_INFO command synchronously from probe()? If
we are concerned about it taking relatively long time we can always
annotate the driver as having probe_type = PROBE_PREFER_ASYNCHRONOUS so
that other devices can be probed simultaneously with applespi.

Thanks.

-- 
Dmitry
