Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B947D10791E
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 20:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfKVT6O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 14:58:14 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33295 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKVT6O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 14:58:14 -0500
Received: by mail-pf1-f193.google.com with SMTP id c184so3990886pfb.0;
        Fri, 22 Nov 2019 11:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=r11BfygBs6IhmuRawK17w4f/VmqvaEoWsWrxyCWo3ik=;
        b=B6yeMOeSTBPhaAxOX4WXLa1771gxHXC6/XcSqlpPAdmhIVqqx+7205zS1frV3P1lNa
         O09fOUw7P5mHnhtGUgC6UX1WSP76XaXHl0Ag2ynvIjdVyEG+6f+waxe2W9xg8iJQueIl
         o1C39+a1wUIcudIqh9djy7Gz/r0q1gZAYhISqM7em82aXUny1fAyYCpoAYkymbJMiU20
         D5kH4EiroZaWxZfXu6KAEhFukrJHd/VZvUfeZ7EBWaHwvi5unlfk3GQSY7nQwVhqEKxt
         TpOyhHlrCglYaMrseBzPRL1cpCOZBTgM7GCUsi24zJQH+fSl6MpPxjP+JvQUG6JgzcrL
         26sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r11BfygBs6IhmuRawK17w4f/VmqvaEoWsWrxyCWo3ik=;
        b=LaKTFHslDPkuFhUifGxY5AAXLiIzuGDl4BM96Ume/slRdjxPkfFZS6TfoH5u8k4C+O
         K1MrOoGtUanydp3tVERoPzWx3yMHgJTCcKPunAihd2rGfLKod8cAzWyEC1uyYGI6CMMP
         t2ML8PwTVf3X4ZcrVC9UBAex0VIoyz1UhFwVlyRwrhyxairRRgYAvpTNYVaqnUVNPiaU
         0lU6dvMB5iRX3rS48eRmD5MvwfN2RPZ0ZC7CUIZOosqTRoz2tf/2N+KpsxWA+0BOpRic
         5W0f0mafn5eCX4wDJEN3PheT7BRp+zuK5GrKyr54CUxE1zjK+euV0AKa6lywYsIQJQ02
         sJ2g==
X-Gm-Message-State: APjAAAXEh1IVHiHF4C95OwDD3v+XNQhlRJIu6Yv9JvRA5bD6iXGsVq8x
        7/pG2H8+vpZCdlGp8y28TnM=
X-Google-Smtp-Source: APXvYqzzIfgY6uVJLzj6FV1n4TPV09s7skwC/jfsXarfkBYi4XTYwa8QQK+UwqWRN/I06qyOJ0tEaA==
X-Received: by 2002:a63:6a47:: with SMTP id f68mr17905505pgc.35.1574452693046;
        Fri, 22 Nov 2019 11:58:13 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r15sm8656326pfh.81.2019.11.22.11.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 11:58:12 -0800 (PST)
Date:   Fri, 22 Nov 2019 11:58:10 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: misc: Kconfig: use select instead of depends on
 KEYBOARD_GPIO
Message-ID: <20191122195810.GD248138@dtor-ws>
References: <20191121132046.11977-1-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121132046.11977-1-info@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 21, 2019 at 02:20:46PM +0100, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
> 
> Make selection of the driver a bit easier by replacing depends on
> KEYBOARD_GPIO by select, so we don't need to enable KEYBOARD_GPIO
> before being able to enable INPUT_SOC_BUTTON_ARRAY.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/input/misc/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 7d9ae394e597..99d263177d8d 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -813,7 +813,8 @@ config INPUT_IDEAPAD_SLIDEBAR
>  
>  config INPUT_SOC_BUTTON_ARRAY
>  	tristate "Windows-compatible SoC Button Array"
> -	depends on KEYBOARD_GPIO && ACPI
> +	depends on ACPI
> +	select KEYBOARD_GPIO

KEYBOARD_GPIO depends on GPIOLIB and "select" does not propagate
dependencies, so you may still end up with invalid configs...

Thanks.

-- 
Dmitry
