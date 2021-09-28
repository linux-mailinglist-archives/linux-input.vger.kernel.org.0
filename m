Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC4A41A5DF
	for <lists+linux-input@lfdr.de>; Tue, 28 Sep 2021 05:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238750AbhI1DNH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Sep 2021 23:13:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238781AbhI1DNG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Sep 2021 23:13:06 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD3EDC061765
        for <linux-input@vger.kernel.org>; Mon, 27 Sep 2021 20:11:27 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id b22so2407062pls.1
        for <linux-input@vger.kernel.org>; Mon, 27 Sep 2021 20:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wIScJCR5UI0XLNs5fmS1ob6fbS5AQoKdInbHYrIqr8A=;
        b=oAKkgwtdgOGg9zK++W7FG6eOZmcW/KjbGgIk6LKf3SfkYo5T0Gx0SVPKDM0cg66PpP
         vjYkkzXTFELT7IDvkcXvr6oNQ4cyssv/rblP/YifEAVJhCPyWhRc3lpGq2AoweYnZKN9
         VuReKzHUWrY2hnWCeTNe/X6bjv1kv8jNH7VJOcBPMI/AvHoxMBMjJOojFmxlvEoIohc6
         UwjUmke8ROAzCHiDjIIPHg25txnoIPjveCSUBySGRNHWqQt6LCUEJtQeNMsIMLTxpwzs
         XPSnWKRIsiyhaePXjdPLoApHCyHKsDN0EKy7l8sAglC4UEm+I5tWr5xKnHwF0RRgHGXk
         H7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wIScJCR5UI0XLNs5fmS1ob6fbS5AQoKdInbHYrIqr8A=;
        b=DwwJHVyL4Fqo0h2vGK9un4Zyk6+YeTZLj9RENZJEhA9u0GyBvtcwiwahHPBGYajWnV
         kyLzquhKIAIcKNjpq/h4+hzhlyo5/XsSQ0kYh4msZEqYnoWhuyJG43JVCSelJJm27tlK
         6xg9M0ilf0A3Q4eupMT93Xt7YelXIvGZcVk8ZQX7WLquU0C5f0HB+6D4clCzWDw8I1UY
         kEg8C+YoSq9+r4YnFbsomOJx1DqIqyKiUlc7WE3UkPVFZWMXi4gR0OIOsSLelnw6L+25
         2xomLi5uRb8w0BVJlH4QaMaJpmOxe4Pt99H3GQjaGqzKfALVfb5e5JhkPUpZz9O5hwVX
         uBpQ==
X-Gm-Message-State: AOAM531ABFCpa3GHraAMl8g7szxj0HgjQ/8T7SC3unBwaONx25oHHszO
        CVugqHvZBaaxh3TwDD8pmOs=
X-Google-Smtp-Source: ABdhPJx0z4Bp/gZiCDWRGXauMIPPSPAAqJEZ2n9vVarfT1I0tE7bi5IP/EmzlwMJgzq/TFeZ6stw8Q==
X-Received: by 2002:a17:90b:3797:: with SMTP id mz23mr2811666pjb.216.1632798687107;
        Mon, 27 Sep 2021 20:11:27 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:52c9:a6bb:3d14:5fea])
        by smtp.gmail.com with ESMTPSA id 139sm5517332pfz.35.2021.09.27.20.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 20:11:26 -0700 (PDT)
Date:   Mon, 27 Sep 2021 20:11:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] input: rmi_spi: Add missing entries SPI to device ID
 table
Message-ID: <YVKH3Oe2Ezv79Evf@google.com>
References: <20210927134000.15993-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927134000.15993-1-broonie@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mark,

On Mon, Sep 27, 2021 at 02:40:00PM +0100, Mark Brown wrote:
> Currently autoloading for SPI devices does not use the DT ID table, it uses
> SPI modalises. Supporting OF modalises is going to be difficult if not
> impractical, an attempt was made but has been reverted, so ensure that
> module autoloading works for this driver by adding SPI IDs for parts that
> only have a compatible listed.
> 
> Fixes: 96c8395e2166 ("spi: Revert modalias changes")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/input/rmi4/rmi_spi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/rmi4/rmi_spi.c b/drivers/input/rmi4/rmi_spi.c
> index c82edda66b23..1dccb8dd8919 100644
> --- a/drivers/input/rmi4/rmi_spi.c
> +++ b/drivers/input/rmi4/rmi_spi.c
> @@ -511,6 +511,7 @@ static const struct dev_pm_ops rmi_spi_pm = {
>  
>  static const struct spi_device_id rmi_id[] = {
>  	{ "rmi4_spi", 0 },
> +	{ "rmi4-spi", 0 },

I do not think this is needed as kmod "normalizes" module names and
modalias strings by converting all dashes to underscore before executing
matching.

Thanks.

-- 
Dmitry
