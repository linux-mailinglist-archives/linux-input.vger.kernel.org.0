Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3EF05FEE91
	for <lists+linux-input@lfdr.de>; Fri, 14 Oct 2022 15:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiJNN0y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Oct 2022 09:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiJNN0y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Oct 2022 09:26:54 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40ABC1B8678
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 06:26:52 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id b4so7605950wrs.1
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 06:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/GHu+ziSUV29nmvLkGLJbg1F4rBhSSEZw5KsC3lsNw=;
        b=Hbf/GVK7V5vgZtbGpoWOFbBqM3ffi4GGIkdMZL1OOkraAEUJCAkVlZirqJrltrtDpT
         OnNPFIBa/Qi3Zrv5SPkMVCaI5FeW12tG8k3l/ptD7aLnS9ZqAnR/Fzsbzf+/aAMmoxUc
         Fzf3fegRgbTIcH3Vv6zOicA8ZiXC0Dy3l28ypsIuVYbHPYWmGrN9Ceb3WGNziujFOPtW
         +gH9OFeONhmc9j0xfUWuSKOzGYtoJgb2I22y4SLCouKOwLN7nAnHH6dwyPANKpkJbX7q
         V0OPpDNwDGxVGaTPSH/+BBNp0bTvtKseVi+k4leJq+6ldIm0YbpeALnVLW5uRF8cETwI
         nCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/GHu+ziSUV29nmvLkGLJbg1F4rBhSSEZw5KsC3lsNw=;
        b=wYvzHx9exam9XhvMLULonoBfD5p0L8yxxtJP6yi8aecmWT1qSGD/i4Vrg7820EinO0
         EMo5RjknAUyEZhXvrSsMqFTWB9UNdxqR4dV2Onpf6LIbY5MwrMua2GQM9kpciN0vG8L6
         rczH6TVymDp4ikSbiG/Ak8/N7lEWfwnFKL+yuPPWsgkd6J1dzGVJXLJoAiUJUu1poUET
         JXH3k9CWF324P8qiyY9k64XJquK8rtahDmnsaTYeGQq7eZhUCPUcYPFIL1RAcFJ/CgY6
         TgkIGU/Nml0YooksxIL7j6i2jZSnBmkAvUf2hvr8sL028HnRMoIa8qISz2D0azUf0u2d
         Ze4w==
X-Gm-Message-State: ACrzQf1Uq1D1jbjfdYgQ4RPimi0QwF1XIf70uknQXk6IqA0qJQcTlT2X
        ysp0VJzo2T/a9MI+vhrtfst9vg==
X-Google-Smtp-Source: AMsMyM5Sbw0Z3l0lsGeYdlOm3v3uxHvDzjV99vu0kFQJo5cbDBgnkBYhh8MoiEnmB+oKOG1cjZsWvw==
X-Received: by 2002:a5d:6a42:0:b0:22e:6706:647b with SMTP id t2-20020a5d6a42000000b0022e6706647bmr3459027wrw.58.1665754010654;
        Fri, 14 Oct 2022 06:26:50 -0700 (PDT)
Received: from localhost ([2a01:cb19:8ae2:e700:f916:30c4:a44d:8229])
        by smtp.gmail.com with ESMTPSA id fc12-20020a05600c524c00b003a342933727sm7998084wmb.3.2022.10.14.06.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 06:26:50 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Eirin Nya <nyanpasu256@gmail.com>, linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Eirin Nya <nyanpasu256@gmail.com>
Subject: Re: [PATCH V2 3/3] Input: elantech - Fix incorrectly halved
 touchpad range on ELAN v3 touchpads
In-Reply-To: <20221014111533.908-4-nyanpasu256@gmail.com>
References: <20221014111533.908-1-nyanpasu256@gmail.com>
 <20221014111533.908-4-nyanpasu256@gmail.com>
Date:   Fri, 14 Oct 2022 15:26:49 +0200
Message-ID: <87k052zgbq.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 14, 2022 at 04:15, Eirin Nya <nyanpasu256@gmail.com> wrote:

> On Linux 5.19.10, on my laptop (Dell Inspiron 15R SE 7520) with an Elan
> v3 touchpad (dmesg says "with firmware version 0x450f02"), the reported
> size of my touchpad (in userspace by calling mtdev_configure() and
> libevdev_get_abs_maximum(), in kernel space
> elantech_device_info::x_max/y_max, either way 1470 by 700) is half that
> of the actual touch range (2940 by 1400), and the upper half of my
> touchpad reports negative values. As a result, with the Synaptics or
> libinput X11 driver set to edge scrolling mode, the entire right half of
> my touchpad has x-values past evdev's reported maximum size, and acts as
> a giant scrollbar!
>
> The problem is that elantech_setup_ps2() -> elantech_set_absolute_mode()
> sets up absolute mode and doubles the hardware resolution (doubling the
> hardware's maximum reported x/y coordinates and its response to
> ETP_FW_ID_QUERY), *after* elantech_query_info() fetches the touchpad
> coordinate system size using ETP_FW_ID_QUERY, which gets cached and
> reported to userspace through ioctl(fd, EVIOCGABS(ABS_X/Y), ...). So the
> touchpad size reported to userspace (and used to subtract vertical
> coordinates from) is half the maximum position of actual touches.
>
> This patch splits out a function elantech_query_range_v3() which fetches
> *only* ETP_FW_ID_QUERY (touchpad size), and calls it a second time if
> elantech_set_absolute_mode() enables double-size mode. This means the
> first call is redundant and wasted if a second call occurs, but this
> minimizes the need to restructure the driver.
>
> Link: https://lore.kernel.org/linux-input/CAL57YxZNutUVxBtvbVWKMw-V2kqeVB5kTQ5BFdJmN=mdPq8Q8Q@mail.gmail.com/
> Link: https://lore.kernel.org/linux-input/20221008093437.72d0f6b0@dell-void.nyanpasu256.gmail.com.beta.tailscale.net/
> Fixes: 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
> Signed-off-by: Eirin Nya <nyanpasu256@gmail.com>
> ---
>
> Notes:
>     Should we move (elantech_set_absolute_mode ->
>     elantech_write_reg(...0x0b or 0x01)) *earlier* into elantech_query_info()
>     before "query range information"? See discussion at
>     https://lore.kernel.org/linux-input/20221008093437.72d0f6b0@dell-void.nyanpasu256.gmail.com.beta.tailscale.net/

I don't think it's a problem to query twice. To me the patch looks fine
as is.

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

>
>  drivers/input/mouse/elantech.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> index 263779c031..a2176f0fd3 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -1006,6 +1006,9 @@ static void elantech_set_rate_restore_reg_07(struct psmouse *psmouse,
>  		psmouse_err(psmouse, "restoring reg_07 failed\n");
>  }
>  
> +static int elantech_query_range_v3(struct psmouse *psmouse,
> +				   struct elantech_device_info *info);
> +
>  /*
>   * Put the touchpad into absolute mode
>   */
> @@ -1047,6 +1050,14 @@ static int elantech_set_absolute_mode(struct psmouse *psmouse)
>  		if (elantech_write_reg(psmouse, 0x10, etd->reg_10))
>  			rc = -1;
>  
> +		/*
> +		 * If we boost hardware resolution, we have to re-query
> +		 * info->x_max and y_max.
> +		 */
> +		if (etd->info.set_hw_resolution)
> +			if (elantech_query_range_v3(psmouse, &etd->info))
> +				rc = -1;
> +
>  		break;
>  
>  	case 4:
> @@ -1671,6 +1682,20 @@ static int elantech_set_properties(struct elantech_device_info *info)
>  	return 0;
>  }
>  
> +static int elantech_query_range_v3(struct psmouse *psmouse,
> +				   struct elantech_device_info *info)
> +{
> +	unsigned char param[3];
> +
> +	if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
> +		return -EINVAL;
> +
> +	info->x_max = (0x0f & param[0]) << 8 | param[1];
> +	info->y_max = (0xf0 & param[0]) << 4 | param[2];
> +
> +	return 0;
> +}
> +
>  static int elantech_query_info(struct psmouse *psmouse,
>  			       struct elantech_device_info *info)
>  {
> @@ -1826,11 +1851,8 @@ static int elantech_query_info(struct psmouse *psmouse,
>  		break;
>  
>  	case 3:
> -		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
> +		if (elantech_query_range_v3(psmouse, info))
>  			return -EINVAL;
> -
> -		info->x_max = (0x0f & param[0]) << 8 | param[1];
> -		info->y_max = (0xf0 & param[0]) << 4 | param[2];
>  		break;
>  
>  	case 4:
> -- 
> 2.38.0
