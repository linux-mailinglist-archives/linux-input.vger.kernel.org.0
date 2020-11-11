Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F40AD2AF8AB
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 20:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgKKTHp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 14:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgKKTHp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 14:07:45 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05996C0613D1;
        Wed, 11 Nov 2020 11:07:43 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id h6so2007543pgk.4;
        Wed, 11 Nov 2020 11:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IY7N9iGWYBPna6KqtMU+4Rp0xK0puoTYkTmvj2+4IAA=;
        b=Yu2vAQry9EtgtWKGx3ayH616HV05qvTTScaVWd4IHkZTBwOUDpEBKfbBXFE8KCm9Se
         iTUI3AETJJaVvVNdAE3cTxdUpxgLQqlZ+xuoxw9tZVY1MvM0G7zXrhNTdX9A2g5oowkC
         +ZFNl1t7Es9/HUqg7t3yXBsiwEzAyjoN1aL3f7RrWz+Xo2+E/mQWfD0NbDC8KIrMy95J
         zPx1NSBUWpDhIOjhxkzrNWB066Hjjme96Axm8xJcoBlzLHCTA7KuxezZsKDhk6t8Z1x/
         1nCtzl1dffl6Ol0pRAOoC11F9AAlQKRoyrTtD7OnbYFfy9W1WEapXFj41eJy3Uu0VepV
         eZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IY7N9iGWYBPna6KqtMU+4Rp0xK0puoTYkTmvj2+4IAA=;
        b=tdbaxuMmoD4+HMPORgiTCo+LcVXlMlNu88ByuJNM+z3oUnxhk6YIW5u9UsO6Poqu/2
         2/abNaF2muSAaFGHsjYPQgilLOISudnbi8g0pA8kkZnYge7iktWJ/9ACPBk/i4dvocBC
         YQuN3cWXoaFLjfaPqMkpLASa2NiAs00vmoDWMQIHVOn/pbu/gdVAqbHMtuqortQ1AcSz
         rixH9qWx4AzP3hexqGvfF/GCmR3EYaBaA1L1FUJyfKUIg305PNodkna0FwxlaAyM1u8j
         mD8shd2g32dutAP7Jnn5jlYqiQeiZd6Welv4brqVHi94MpBJjCIuLX5xpvaQDNjQ8LSV
         QQhQ==
X-Gm-Message-State: AOAM5326xK2SgFd+d6kPnsmPsTWWtcajq7T1mGOYxBH+fmlGDtMHoWWW
        jTTMvwxWS6qIDN8BsizXNEw=
X-Google-Smtp-Source: ABdhPJxyMP9fLg3isJqD/J28Qy8W7osiODmLq1cwex5/cCncdRQLz+l/O1V2loHZYxuqcNsKDLrcbA==
X-Received: by 2002:a63:f74c:: with SMTP id f12mr22538253pgk.434.1605121663425;
        Wed, 11 Nov 2020 11:07:43 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v23sm3108284pjh.46.2020.11.11.11.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 11:07:42 -0800 (PST)
Date:   Wed, 11 Nov 2020 11:07:40 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        David Jander <david@protonic.nl>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: touchscreen: ads7846.c: Fix race that causes
 missing releases
Message-ID: <20201111190740.GY1003057@dtor-ws>
References: <20201027105416.18773-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027105416.18773-1-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oleksij,

On Tue, Oct 27, 2020 at 11:54:16AM +0100, Oleksij Rempel wrote:
> From: David Jander <david@protonic.nl>
> 
> If touchscreen is released while busy reading HWMON device, the release
> can be missed. The IRQ thread is not started because no touch is active
> and BTN_TOUCH release event is never sent.
> 
> Fixes: f5a28a7d4858f94a ("Input: ads7846 - avoid pen up/down when reading hwmon")
> Co-Developed-by: David Jander <david@protonic.nl>

Since the patch is nominally attributed to David (via the From: tag)
I'll be changing Co-developed-by tag to your name, OK?

> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thanks.

-- 
Dmitry
