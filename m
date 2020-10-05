Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D699282EF3
	for <lists+linux-input@lfdr.de>; Mon,  5 Oct 2020 04:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgJECvZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Oct 2020 22:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbgJECvY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Oct 2020 22:51:24 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AE8C0613CE
        for <linux-input@vger.kernel.org>; Sun,  4 Oct 2020 19:51:23 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id x2so4627012pjk.0
        for <linux-input@vger.kernel.org>; Sun, 04 Oct 2020 19:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jguGFO9IijSFIlcFX3vSq019U1TdYDCiWqSdlebGqlQ=;
        b=ji2WIoxbof5JK0dNoTuv9FpNgxXBbeObpCBrBeWsEIqBkev6G6DRsdfePSng5x/DRE
         vx2vWa8FyWVyiLOIED70AoTjNavYHRq/0nqtqNYvO84RMT/8jFiL/M71j5E/sKwOGv7t
         vZscUmRGAx4dQOrjZIdasBwiuh5mciJDWbp7zRG6UTVbeGfcLWf+BTwrPqMwASKnh9YQ
         ABeu8UXnmD8MUx5Ti50ieIk4tytDqSmVcxlTY9Gd9ZAJjSm1R+o5tmgjgfvsFQsLFIgH
         Z1H/rsUn+WCsZh4hhm563Clqs2DS8frOgJfkF5qOIjjWWi0qAfatLrykCbJhE4m1YlR+
         gx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jguGFO9IijSFIlcFX3vSq019U1TdYDCiWqSdlebGqlQ=;
        b=l1VLuRrU7CgMso1WCzVBGq38d9bxFBge8TD4Xq8JPRVnHrt4oq+5HiOZFc36BVvh0b
         ha8aNy/gSLQLzZrywBtCh8nSYgA523dGda7OMBsAb+ddzvN8dLhxK2c5tkVnhxW5MJvV
         whI0b+O7V/s2FCZTTgb05zHX0oPUO4hYmG+q9yPicD/JOcXUh8P7s26lx/QJ4AYP5T2x
         a/OJcV2BAngw516b6dfPDxbOWd6mAA1/OPVqawUuw+OfLkdux3mlrTDxXHIObbkJje+f
         m+xtRKLhUnuM7JPcPs1gLr0NcUwyn8yhInLMzfaIiyDJOQe4PlMrrgAoB5quQo1RgHB/
         YdXg==
X-Gm-Message-State: AOAM530Fh0W1uA6A+XjpdTBkpmT6jQBSGyZn0oePIwXrirttnWogox3D
        ubotEOiGhVbGvzGb6mLcuKjjXCOMxZ0=
X-Google-Smtp-Source: ABdhPJw72+iZ4g4qfBHqKYoc1a0l0tahQX0ePjMac9wT9yq6ZvepkkaDG4af9bOst/xRlIiz7wrvRw==
X-Received: by 2002:a17:90a:aa05:: with SMTP id k5mr14043388pjq.59.1601866282849;
        Sun, 04 Oct 2020 19:51:22 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x22sm7985672pfp.181.2020.10.04.19.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 19:51:21 -0700 (PDT)
Date:   Sun, 4 Oct 2020 19:51:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Lyude Paul <lyude@redhat.com>, Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Subject: Re: [PATCH v3 2/2] Input: synaptics - enable InterTouch for ThinkPad
 P1/X1E gen 2
Message-ID: <20201005025119.GE1009802@dtor-ws>
References: <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
 <20200930225046.173190-1-Jason@zx2c4.com>
 <20200930225046.173190-3-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930225046.173190-3-Jason@zx2c4.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 01, 2020 at 12:50:46AM +0200, Jason A. Donenfeld wrote:
> With the new RMI4 F3A support, we're now able to enable full RMI4
> support for this model. We also tidy up the comments a bit, as the X1E
> is essentially the same computer as the P1.
> 
> Acked-by: Lyude Paul <lyude@redhat.com>
> Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  drivers/input/mouse/synaptics.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 8a54efd6eb95..bf0f3fdf10d9 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -179,7 +179,8 @@ static const char * const smbus_pnp_ids[] = {
>  	"LEN0093", /* T480 */
>  	"LEN0096", /* X280 */
>  	"LEN0097", /* X280 -> ALPS trackpoint */
> -	"LEN0099", /* X1 Extreme 1st */
> +	"LEN0099", /* X1 Extreme Gen 1 / P1 Gen 1 */
> +	"LEN0402", /* X1 Extreme Gen 2 / P1 Gen 2 */

Moved this entry one down to keep the list sorted, and applied, thank
you.

-- 
Dmitry
