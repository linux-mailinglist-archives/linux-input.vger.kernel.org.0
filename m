Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B32A1699FD4
	for <lists+linux-input@lfdr.de>; Thu, 16 Feb 2023 23:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjBPWoO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Feb 2023 17:44:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjBPWoO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Feb 2023 17:44:14 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5204046D4A
        for <linux-input@vger.kernel.org>; Thu, 16 Feb 2023 14:44:13 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id cp18so1200217pjb.0
        for <linux-input@vger.kernel.org>; Thu, 16 Feb 2023 14:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMEIj3/WpJeGDtqk20yFhaMv0+hldCXkTjpZOPeynH0=;
        b=G52iZNoCVV83WND/TTLX8yitDfLwZj2qBknlfMzzNe3j+Fa3zAmSP2XF75eSRcTp8k
         V5Jrl9vW8k1TQ89T7Su77zqWliojyQNmHq726IpLVzIPMDftVJrcvC8aBrifgAEG3rNe
         AT9tUyvc6A/L9p3MhASXM0vjTmhjrTq093AXybFctUBY3P937Q02VI9K6Wi3sJ0chFx4
         j/aHw8shXB9Ed1ztg75C9SWYPrF5isinyPzyahOyj1MoMD5rHq7eiebtWu79RHp7ALMA
         D/oSY3TK2JXbRz7eB0/cB3iIZEmfoA13yEJ7RKWvu0wPm3X4vAiUXDp/yOP27ohlbPHV
         C2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMEIj3/WpJeGDtqk20yFhaMv0+hldCXkTjpZOPeynH0=;
        b=VRwicxBIUqRRZJBlvbuy9F7+CfGFJFxt4kTaF3DEyQPqHf6Q8EpTQYhzCrbLutpRZ+
         QwFTxzM321kJfu4fTYbbnofXKEJDPWqfmmFvINiEJB6qeGMo2fkyJKWKBAoQdNvkriXl
         HNDX4qqgA6x4gJGTiTA7v8wuPRL9ScC1pf4jOcqlYU8K7TGlhah2f8g14vCPMRfwZuep
         Myi1p47KGnueB7hETzIEoBB57sBFbFjhF7tFExzeKksxM51ylrAILZVOAvLAZi0r3ytU
         xe9YoMiPA4FpHprN3ybiLzsG2lC3OwTCYEB4UhqmBfPTECxIh2fgRqm9Z7ANb2wclZBE
         1e3Q==
X-Gm-Message-State: AO0yUKWG/bTSW5ZmUQb0+2iG8jOIeKCKlzvONHW4t8R7WlpP6j8zthu+
        szznA1j65AWcLRP7Nhod5t0=
X-Google-Smtp-Source: AK7set8agcZ+7B2+5wohNSQUZ7Wv72iexws3f1tEFYRZ7Q0TuAr8Bba6rzOjUp+q2YeiBPtmWC208g==
X-Received: by 2002:a17:902:d4d2:b0:198:9bf8:298e with SMTP id o18-20020a170902d4d200b001989bf8298emr10077732plg.60.1676587452377;
        Thu, 16 Feb 2023 14:44:12 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:823a:41fd:c20e:e653])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902e9c600b0019bd934433dsm94169plk.286.2023.02.16.14.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 14:44:11 -0800 (PST)
Date:   Thu, 16 Feb 2023 14:44:08 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH] Input: ili210x - Probe even if no resolution information
Message-ID: <Y+6xuOJwVpYYFW6H@google.com>
References: <20220715155905.219391-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715155905.219391-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marek,

On Fri, Jul 15, 2022 at 05:59:05PM +0200, Marek Vasut wrote:
> Probe the touch controller driver even if resolution information is not
> available. This can happen e.g. in case the touch controller suffered a
> failed firmware update and is stuck in bootloader mode.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joe Hung <joe_hung@ilitek.com>
> Cc: Luca Hsu <luca_hsu@ilitek.com>
> ---
>  drivers/input/touchscreen/ili210x.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index e9bd36adbe47d..ad25081e301c6 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -370,22 +370,32 @@ static int ili251x_firmware_update_resolution(struct device *dev)
>  
>  	/* The firmware update blob might have changed the resolution. */
>  	error = priv->chip->read_reg(client, REG_PANEL_INFO, &rs, sizeof(rs));
> -	if (error)
> -		return error;
> +	if (!error) {
> +		resx = le16_to_cpup((__le16 *)rs);
> +		resy = le16_to_cpup((__le16 *)(rs + 2));
>  
> -	resx = le16_to_cpup((__le16 *)rs);
> -	resy = le16_to_cpup((__le16 *)(rs + 2));
> +		/* The value reported by the firmware is invalid. */
> +		if (!resx || resx == 0xffff || !resy || resy == 0xffff)
> +			error = -EINVAL;
> +	}
>  
> -	/* The value reported by the firmware is invalid. */
> -	if (!resx || resx == 0xffff || !resy || resy == 0xffff)
> -		return -EINVAL;
> +	/*
> +	 * In case of error, the firmware might be stuck in bootloader mode,
> +	 * e.g. after a failed firmware update. Set maximum resolution, but
> +	 * do not fail to probe, so the user can re-trigger the firmware
> +	 * update and recover the touch controller.
> +	 */
> +	if (error) {

Do you want to maybe dev_warn() here to explain the weird values?

> +		resx = 16384;
> +		resy = 16384;
> +	}

Thanks.

-- 
Dmitry
