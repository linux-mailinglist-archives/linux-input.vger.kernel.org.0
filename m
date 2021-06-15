Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EB23A8857
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 20:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhFOSRg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 14:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbhFOSRf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 14:17:35 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9CFC061574;
        Tue, 15 Jun 2021 11:15:30 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id g22so7057294pgk.1;
        Tue, 15 Jun 2021 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VENcnHrIpqVN7W2ZnNshC5Gck0m4VD57ATl1tW4bxjU=;
        b=NHA1damOaUqGWmDiJIHtKH5TnjulokP6hupL3KtyVJex5Y2h2A2tLDTnh0kQvsb/QI
         M+Cy7fQIHov3faBKlnYrwaKBsT0APioDikv7lU8v8CIdVUXSRhaE6V5j6yJ055bnTHR/
         vavxiaLb5IVL5s5/sSQUT5nBzE4dw+uB4ruqhKE7Cuu9aEOtWVsVQcaTnU5kriWxbtsZ
         0AOVHOQxZGIymZDvLxMuIsmfockb7x8xevpp8KQmeY27M151964Wuf84wbKSr/UZrI7G
         2sOz0BgkOlpSqCyTvB7QWdkp3M9zBwNflfZbNTL34lc3zXkEFQRPp+MNTIqpSSKntS7/
         SVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VENcnHrIpqVN7W2ZnNshC5Gck0m4VD57ATl1tW4bxjU=;
        b=b6t19Sghj8Ct4FKzQrt2CuIIAL77pFmooyhiHSUEANXIrXU4an6Vd00eaQ6PPWDlQH
         5eaVlJhPSXx7M9dcwGi6GSJv7JKNjLc7c7S3iVd4rKsqgZf/0ULFlDVRJ1t973dNF5wE
         CCJhe6JFlRxMaaRZhgDVJGFQY7uLteV69u4YXbY/lY3ZzvT63R9/6D9ajCEdsZR5uO+t
         q6yGbe61IVBl4fryALguBOhRPlkSKrVPYsCfYF/3v65KP93c9mOB6u/1sEkhI0y1DBMC
         xiukWD8AgShVAYqQUMaMrJZbuM2Mzy5mJPrDP7NG+ZDecnjOCZg2gAzQK0fS7fgvOtSV
         FKrg==
X-Gm-Message-State: AOAM530TVW30GNK4YZ0unHgZb7zgIA/rR5fGAlBzZx52R8mqjLou3oHl
        rbztChEIRRRBSEl0LyMrpps=
X-Google-Smtp-Source: ABdhPJxnhYpBHFp7o805jqU+q5nNgZsrr+rwOFS4X0NCvnt2yolKM/4LXuYatjFiMLxzAsy9CGcD8Q==
X-Received: by 2002:a63:db43:: with SMTP id x3mr736959pgi.383.1623780929601;
        Tue, 15 Jun 2021 11:15:29 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c700:bb55:c690:c756])
        by smtp.gmail.com with ESMTPSA id z24sm16735625pfk.149.2021.06.15.11.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 11:15:28 -0700 (PDT)
Date:   Tue, 15 Jun 2021 11:15:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yizhuo Zhai <yzhai003@ucr.edu>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: hideep - fix the uninitialized use in
 hideep_nvm_unlock()
Message-ID: <YMjuPtKtiaVLLO0q@google.com>
References: <CABvMjLRuGPgEJ3Ef7=sBk3m3oa+3HuyV9mVY0ZCYuHK=rJRA4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABvMjLRuGPgEJ3Ef7=sBk3m3oa+3HuyV9mVY0ZCYuHK=rJRA4w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yizhuo,

On Tue, Jun 15, 2021 at 10:26:09AM -0700, Yizhuo Zhai wrote:
> Inside function hideep_nvm_unlock(), variable "unmask_code" could
> be uninitialized if hideep_pgm_r_reg() returns error, however, it
> is used in the later if statement after an "and" operation, which
> is potentially unsafe.

I do not think that simply initializing the variable makes the code
behave any better. If we want to fix this properly we need to check for
errors returned by hideep_pgm_r_reg() and hideep_pgm_w_reg() and exit
this function early, signalling the caller about errors.

> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---
>  drivers/input/touchscreen/hideep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/hideep.c
> b/drivers/input/touchscreen/hideep.c
> index ddad4a82a5e5..49b713ad4384 100644
> --- a/drivers/input/touchscreen/hideep.c
> +++ b/drivers/input/touchscreen/hideep.c
> @@ -363,7 +363,7 @@ static int hideep_enter_pgm(struct hideep_ts *ts)
> 
>  static void hideep_nvm_unlock(struct hideep_ts *ts)
>  {
> -       u32 unmask_code;
> +       u32 unmask_code = 0;
> 
>         hideep_pgm_w_reg(ts, HIDEEP_FLASH_CFG, HIDEEP_NVM_SFR_RPAGE);
>         hideep_pgm_r_reg(ts, 0x0000000C, &unmask_code);
> -- 
> 2.17.1

Thanks.

-- 
Dmitry
