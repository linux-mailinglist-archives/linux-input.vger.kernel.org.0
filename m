Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72E012B7318
	for <lists+linux-input@lfdr.de>; Wed, 18 Nov 2020 01:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgKRAbF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Nov 2020 19:31:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgKRAbF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Nov 2020 19:31:05 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D89C0613CF;
        Tue, 17 Nov 2020 16:31:04 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id q10so306440pfn.0;
        Tue, 17 Nov 2020 16:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kUdQDsFuXxGWfUMm8DBKihFVcWGXfNC/uH4yococqkU=;
        b=r6+AYzDGpLy6GOZYuzz3Qgm67Djxd+34pRQw/EUEyGoSITIiqyig0z5a0d9JrIDqRg
         Al88HmoHlZ6FFaMrNOdyW8ZOxzstmp2KwpJbaiKkM7fNHy5QiZ6Hd/Jz667Z2zAh4wIP
         hqB0kPbnMjGMXykeHHVNVab3fIhRLJ3l/RPvf1uLOJVcyDcyTMhkLFmr4D1liaYQfnYt
         xheTtgQckEc3ZnmUNKM4wfE/VK1XvI5fG6uQL+BFBC9v+BK9/JjM+V16nWTfnCKFm7oT
         2ZcBKQzIiHW1gxELZzCVlhC1PE7kPPXfXrmB8HvAGSTes11YKZj+CmUeseRbpHLwf+9e
         RzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kUdQDsFuXxGWfUMm8DBKihFVcWGXfNC/uH4yococqkU=;
        b=jSdO2ejROVilo1d2fqUUpBbnPRPsfwzlOzog2Le4GBbTgyBFS/xQDa8qJ68nOeQycg
         4slA4FlbENsUiKbrAjQIExCNaEBf0QxDZTM9T3L3OhpYepqrMVF51+XKriT92nh9aV+w
         9yHbpI426UwDm6XUt1Dx5dLqnQyQD4VVamhlj0b6+677I6IbUMDsm4giNzgk+CFFj2xK
         neUzlwBC1ByaN7IRfOzfv5hPGaIHwzQnMuOSo7y6HFMfBAFuTsb6LaPNsTHi3eFMfdud
         iKyD8Nmd33vbSgllvmXyOzKhuAZRYKzI+68vBxMHDmOT1zGX9UeKrg4J0IMqpN7xasM9
         rVZw==
X-Gm-Message-State: AOAM531AVycgIZt9jnb1P/Ro+mVAHsJ6Yy2GV3f1ZmutsDNnUflJie53
        Fqem3PcJaZSCFc5+Bqj5Q+Q=
X-Google-Smtp-Source: ABdhPJwWoA+9WfM9TY5q3oyIHU2vtM1lIoqBVrdZPAljeo3yRt3Zvkbt8ICCFDQ0v0g7UsGw4kHKxw==
X-Received: by 2002:a65:4946:: with SMTP id q6mr5913749pgs.216.1605659464185;
        Tue, 17 Nov 2020 16:31:04 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id j184sm24255902pfg.207.2020.11.17.16.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 16:31:02 -0800 (PST)
Date:   Tue, 17 Nov 2020 16:31:00 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        David Jander <david@protonic.nl>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: touchscreen: ads7846.c: Fix race that causes
 missing releases
Message-ID: <20201118003100.GB2009714@dtor-ws>
References: <20201027105416.18773-1-o.rempel@pengutronix.de>
 <20201111190740.GY1003057@dtor-ws>
 <20201112114851.mlhhxxjonhx5n4sz@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112114851.mlhhxxjonhx5n4sz@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 12:48:51PM +0100, Oleksij Rempel wrote:
> On Wed, Nov 11, 2020 at 11:07:40AM -0800, Dmitry Torokhov wrote:
> > Hi Oleksij,
> > 
> > On Tue, Oct 27, 2020 at 11:54:16AM +0100, Oleksij Rempel wrote:
> > > From: David Jander <david@protonic.nl>
> > > 
> > > If touchscreen is released while busy reading HWMON device, the release
> > > can be missed. The IRQ thread is not started because no touch is active
> > > and BTN_TOUCH release event is never sent.
> > > 
> > > Fixes: f5a28a7d4858f94a ("Input: ads7846 - avoid pen up/down when reading hwmon")
> > > Co-Developed-by: David Jander <david@protonic.nl>
> > 
> > Since the patch is nominally attributed to David (via the From: tag)
> > I'll be changing Co-developed-by tag to your name, OK?
> 
> OK.

Applied, thank you.

-- 
Dmitry
