Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542B52C5D85
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 22:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732943AbgKZVbb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 16:31:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgKZVba (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 16:31:30 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60349C0613D4;
        Thu, 26 Nov 2020 13:31:29 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id f5so1675975plj.13;
        Thu, 26 Nov 2020 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=a/Yr17tyVZOzPtpOMI6fU0OKHLM5WkCR0ljB5tvI8jA=;
        b=D8RjchmY2vqGT3P9AVhnqgY6EZOeq5cUgZpsHcPFeUzhReI1umerghInJIQ7fsZX7y
         jpcgvmy9kxP+ovXVLd6vlQcb7tBfZcmRSNhQcdDZyMFDsEvpOKhvDR/VVDMAMRFwKDgx
         Z/x5PB3DT65GTn10vW1G27KSi7ZjSQE9HQ5UqpZ78W7roIMluo5XD1smqy1kT72lEVih
         QoNP6BRnQVftg6p8tfQf+twOMTJWGBeVgjSDebHhMaAoZ85Wwt2MTOGQctjQOfcj3gS8
         jpLDxChoIVIZWoTQHdk/gzeeOeqjLlVmuVmtiZKhXN0VViCaBc754mBSpelZv9Bt35SG
         qyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=a/Yr17tyVZOzPtpOMI6fU0OKHLM5WkCR0ljB5tvI8jA=;
        b=XSrsG3KEwPacKmEpJWqNtpuRQ90l6rh0Drd0Z/rpFMWn82Xt9th7J5n+7h/EM3sPtL
         QGQWUlGEWxJqwssG28kwiwvXYGA/jQytVxoGj/o3kp5MqIrH49BpEG5MODOVUVGgW29e
         sjyCOhTBhdfEKBTIlmsBgy1T0sgRuPbQeQoT7ARhM5PL+5VMsr8uuGUHsiEYvzv5Cv78
         vBD2vYIHPJx0hJ1yFM81/SZbX3wkO6XwQqDVIJXDfXbwbKx+UFahgYYKoWVvh6M+UcdU
         RAcSan+yXH/UarhNtWjpwaIRBLkXMq9V3btk+1hgVsvhznLsVZc5Tr6rMtNfeJ9x+0lD
         P2fw==
X-Gm-Message-State: AOAM533snmFHP+6xEzLQVJgZ79L4C8KRqmpQN8iz2HA7JD2QdhaIDe0s
        oSTEZ6EeSsE0DMxk0KAYln8=
X-Google-Smtp-Source: ABdhPJwuTomeS7EFZhxZjn+m3VhPp+c1DdvHAF7qsX3/hB+phfqkRw3jbd2Tx7pvOzhRY+UkbU64mA==
X-Received: by 2002:a17:902:7606:b029:da:246c:5bd8 with SMTP id k6-20020a1709027606b02900da246c5bd8mr4236748pll.27.1606426288824;
        Thu, 26 Nov 2020 13:31:28 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id o133sm5409402pfg.97.2020.11.26.13.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:31:27 -0800 (PST)
Date:   Thu, 26 Nov 2020 13:31:25 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] ARM: locomo: make locomo bus's remove callback return
 void
Message-ID: <20201126213125.GG2034289@dtor-ws>
References: <20201126110140.2021758-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126110140.2021758-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 26, 2020 at 12:01:40PM +0100, Uwe Kleine-König wrote:
> The driver core ignores the return value of struct bus_type::remove
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct locomo_driver::remove return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea and ensures future
> users behave accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> if desired the change to arch/arm/mach-sa1100/collie.c can be split out
> of this patch. The change of prototype then doesn't affect this driver
> any more. There is one locomo-driver that is already now unaffected:
> drivers/leds/leds-locomo.c. This driver doesn't have a remove callback.
> 
> Best regards
> Uwe
> 
>  arch/arm/common/locomo.c               | 5 ++---
>  arch/arm/include/asm/hardware/locomo.h | 2 +-
>  arch/arm/mach-sa1100/collie.c          | 6 ------
>  drivers/input/keyboard/locomokbd.c     | 4 +---

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

>  drivers/video/backlight/locomolcd.c    | 3 +--
>  5 files changed, 5 insertions(+), 15 deletions(-)

Thanks.

-- 
Dmitry
