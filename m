Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD7726844C
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 07:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgINF5b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 01:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgINF5a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 01:57:30 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BDE1C06174A;
        Sun, 13 Sep 2020 22:57:30 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t7so4881962pjd.3;
        Sun, 13 Sep 2020 22:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6nXx8m73G/yLLa+o2SYtS5pVXzxJzPpoZbuheZI/4yE=;
        b=tXo//rnDp9hf2V0cD6yGO5ck7ueT2niNQHareboS4j5ruxE8mJkKDJcKT1eWmcjEwP
         4juv5eeIHWEMabFF3a3bflJ4smNqDMqEko+hX40O+x8HJQ7NRF8h4hMJUiAbcKE1j95F
         z329LnKaO0l56dIPMSx4jl4TSpPpaofX1UxiS9uwBFqfSBMUGxRlighCQ4rwyC5MRy5y
         puxbmd9wnvbnxfLZBRNLSOUE/I0M+U8b/ugpE7Tv/2hQEn0D8CezitWHs/CdkMfNXkj2
         YAUvE4gr1ccUXIDy0bLZ3hJerf7QsmuKqQ9ApnHc9rr4SDLknvupVP2xcrnGHUeUuD3v
         JkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6nXx8m73G/yLLa+o2SYtS5pVXzxJzPpoZbuheZI/4yE=;
        b=QzCsXTXyUxrTJo8FGeXb0z0/kKTxIaxgFTUOK0fbTsfxAnmehlwdN1TuX/XmrqkxD+
         XrzCxAZUPwrVu1fn/5hzsTWIGB5YwRhx6R9irRgDNkCmKDYrHporTVrOFQjgnk2SpqL9
         TAaoVLXBJG+dnUgEh4Gl9kMAwinijBSrzpDRVfsOlvRKVD6z43ORwN1uWCYiOMv6UySq
         xS8PYgc+PspMUBo6toEldZSh7vF5j23vjI4+O7kaK2m1Olrk6rzbd3cnuWGL4gRMwHZw
         /faEUdjuW3Zy1zAKXxLteEDfVEV0iIIE57xAi7dSQT5SvOB1U2LuTpaCW3UfvrTOwDF1
         kWFw==
X-Gm-Message-State: AOAM533yaWpE8VA2dDIciS7WKhBBOyKu2ne5bgS3wAwopXXBzec3Bg0y
        AWfSIKyIrndqfryrqVwZ6cxPrTtMzh8=
X-Google-Smtp-Source: ABdhPJyFH7WvXc602lU62MmVkFY6oKYvGDDhawrnbZwmSinSPKFg4L8xnr+ql1RFtvf1vfRz+1RkVA==
X-Received: by 2002:a17:90a:d496:: with SMTP id s22mr12095979pju.167.1600063049684;
        Sun, 13 Sep 2020 22:57:29 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id t3sm7803521pje.43.2020.09.13.22.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 22:57:28 -0700 (PDT)
Date:   Sun, 13 Sep 2020 22:57:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Duggan <aduggan@synaptics.com>
Subject: Re: [PATCH] Input: trackpoint - add new trackpoint variant IDs
Message-ID: <20200914055726.GK1665100@dtor-ws>
References: <20200909083632.12971-1-vincent.huang@tw.synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909083632.12971-1-vincent.huang@tw.synaptics.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vincent,

On Wed, Sep 09, 2020 at 04:36:32PM +0800, Vincent Huang wrote:
> Add trackpoint variant IDs to allow supported control
> on Synaptics trackpoints
> 
> Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
> ---
>  drivers/input/mouse/trackpoint.c | 2 ++
>  drivers/input/mouse/trackpoint.h | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
> index 3eefee2ee2a1..c54d2f9e1c4a 100644
> --- a/drivers/input/mouse/trackpoint.c
> +++ b/drivers/input/mouse/trackpoint.c
> @@ -21,6 +21,8 @@ static const char * const trackpoint_variants[] = {
>  	[TP_VARIANT_ALPS]	= "ALPS",
>  	[TP_VARIANT_ELAN]	= "Elan",
>  	[TP_VARIANT_NXP]	= "NXP",
> +	[TP_VARIANT_JYT_SYNAPTICS]	= "JYT_SYNAPTICS",
> +	[TP_VARIANT_SYNAPTICS]	= "SYNAPTICS",

Do these need to be capitalized? This is simply used in log messages, so
nicer formatted strings can be used.

Thanks.

-- 
Dmitry
