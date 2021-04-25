Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975D136A428
	for <lists+linux-input@lfdr.de>; Sun, 25 Apr 2021 04:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhDYC2O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Apr 2021 22:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhDYC2O (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Apr 2021 22:28:14 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A8FC061574;
        Sat, 24 Apr 2021 19:27:35 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id m11so36675406pfc.11;
        Sat, 24 Apr 2021 19:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=URUmfHg69ru1rtAAU8sF2y/Od8zXksltkh0QYk6c5yk=;
        b=qZZmRSjsgr5a2cRWZubG4sgo+dyxb90KT0bERd/00/jl+q+EKHLfLVvT4IPcrslo1O
         gfjwfoUQQGYtgqnB8jybnRW8bu8KtGTfx7bl3hEVwJgQeA65Q3YlXSaxQX6s4SYjArNZ
         B5bucFd4IL0N4uQXxIcfHnHL/Ca5ji7gPT0egYQrD1nOdfl6lVU7DIv+oxRPvVfgc4DT
         NbSVsM+A/ZIIYYOVrl3Fx6GPj+pr1xsvuO5wSwapkk5J3Nffa8rWyA1vbye0vtMu2FCW
         ug1gj21J5H7r5thQtEcjvVGt58Dipw7ifOaZ+AdJm7LsxpMDUQBlCoLu93/x1T8lIF3w
         p80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=URUmfHg69ru1rtAAU8sF2y/Od8zXksltkh0QYk6c5yk=;
        b=lRVmTqBrgCCF1C3eBNGXTZnBFdFup+I2LCTOYf8MB7Gk7EJeQAQEzNI6jZgHDLp+XD
         y5V3QSe8n115/XqCa2qenqNs2h9KVU4FztrEEVq7IfurmFrA6fAzWBhVwXTsajdd7Kfd
         tEtS5Okt3+UHwPd5Ng9rGyp5Hs/iu/B3Cj4aFQ1cqGG1tMxMe8iGbyrhvAzvERHNGlOj
         4Ya29WLBqrWbVtMHArqwp89qppGiMTuuFmmiOI+ivCmgCD2IdOH2peko/jvexCrLX8N7
         A4t2T99bDODpX/Rwnqpjzm8C8oPRWW2Xz03wynADEHKvKNeITvCA++ywKnM/D8Vx5FeB
         qMIQ==
X-Gm-Message-State: AOAM533PV543XUix+dYNGVbcoerZPkaNveGNjkxM3igVVBYd8f4882B+
        2xleKPnSxJ6X55l0NFzcpEMLc5vl+sQ=
X-Google-Smtp-Source: ABdhPJxz+fvRubj8N3U41i+mc2OpjbO+EQz+u5/PQHZIfhqkS3ibY57MESZxvqj/Eu1ennhoa1eGag==
X-Received: by 2002:aa7:908c:0:b029:209:aacd:d8b with SMTP id i12-20020aa7908c0000b0290209aacd0d8bmr11349537pfa.74.1619317654560;
        Sat, 24 Apr 2021 19:27:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:28b7:b656:4f0d:6473])
        by smtp.gmail.com with ESMTPSA id a5sm2122865pja.37.2021.04.24.19.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 19:27:33 -0700 (PDT)
Date:   Sat, 24 Apr 2021 19:27:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - simplify atkbd_show_force_release()
Message-ID: <YITTkui8qer2S+4R@google.com>
References: <20210421201639.1541945-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421201639.1541945-1-linux@rasmusvillemoes.dk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rasmus,

On Wed, Apr 21, 2021 at 10:16:39PM +0200, Rasmus Villemoes wrote:
> We can just include the newline in the format string, and scnprintf()
> guarantees nul-termination. These days, sysfs_emit() is
> preferred in sysfs ->show methods, so switch to that.

Technically speaking the conversion is not 100% equivalent - original
code ensured that there is always a newline in the output. I kind of
like this, so maybe we need sysfs_emit_nl() or similar?

> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  drivers/input/keyboard/atkbd.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index edc613efc158..b146a3ec631a 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -1492,13 +1492,8 @@ static ssize_t atkbd_set_extra(struct atkbd *atkbd, const char *buf, size_t coun
>  
>  static ssize_t atkbd_show_force_release(struct atkbd *atkbd, char *buf)
>  {
> -	size_t len = scnprintf(buf, PAGE_SIZE - 1, "%*pbl",
> -			       ATKBD_KEYMAP_SIZE, atkbd->force_release_mask);
> -
> -	buf[len++] = '\n';
> -	buf[len] = '\0';
> -
> -	return len;
> +	return sysfs_emit(buf, "%*pbl\n",
> +			  ATKBD_KEYMAP_SIZE, atkbd->force_release_mask);
>  }
>  
>  static ssize_t atkbd_set_force_release(struct atkbd *atkbd,
> -- 
> 2.29.2
> 

Thanks.

-- 
Dmitry
