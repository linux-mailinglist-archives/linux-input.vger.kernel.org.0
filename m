Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5282A26C5F5
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 19:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgIPR0U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 13:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726995AbgIPR0I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 13:26:08 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A79C061A31
        for <linux-input@vger.kernel.org>; Wed, 16 Sep 2020 10:26:02 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o16so1965747pjr.2
        for <linux-input@vger.kernel.org>; Wed, 16 Sep 2020 10:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dcORvUSHFuc/2G/iXoWa782Eeu9E2gpD8olFsrn/RK8=;
        b=VKY/Ob4LxHr3rmxWJlHhtQhz0isrEucUui3fwW7dFbUF5iZnBtOXcc6hyrHl5W3CBT
         +sKGFn0CKkv2IK1v8VBbjZLzFCiVg9xXM+1RGkFY8t8npBK7xUw9bQOIE7tt44dW1T80
         LoYUe2ZKYh50iwWsvaA8mZ5R4mqzkEotz6AFiuEoqoxUePT4W1PFXloVQ01UV1dNQXo0
         wVNbr9RfBWBOM7/bb8qZuylSUZQ/zWXJWXJwTM9oEvh4LAFw6D50dcBvUOwwudfmPJkn
         +pwB5kwg1ibM7Vzt9EBKSsP4iYXKMphzgWoGjpDxAD4STZNRi88k0VHBsuA5fgesdczo
         FZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dcORvUSHFuc/2G/iXoWa782Eeu9E2gpD8olFsrn/RK8=;
        b=FEKr4BdaKqXo+uRC1nN94TnkDO+wPdLTG4Df5/laBqyLySPbaSmS/411sqvnIq/reE
         jeSKopyxCd3u38+NX3LzVte4rq/kuMd6/cVuamT57N9Q/2I/2MzEAaXRUkBc9QFFVvbw
         wiQzs7mVNo7uLrWAjqIKBYNxPvhBBGQDcJLPZTfw6pq14VM75PolP2g8dK/sAdwt9Y25
         B2+GG9picGFCn/Yx5ABwboCkZNvKmQmAbqfFTENkUPwmI887ZVlbFKnG2mroDQnT8GLL
         CEwQn8i9Zf+PrQ34QV//AxTNMUr/wpvz5WSg9YYkOtXYag3vN/m0XarXtzRQTGxvwFK0
         vnhA==
X-Gm-Message-State: AOAM532zRJV/E7VJTTWFQvU2fyFraLyuV06jSOBgutDiF9kAPdZwkR0f
        pMYVO8SIe/EZXe0WrrFCiC9LkZSrMEo=
X-Google-Smtp-Source: ABdhPJzGnBNT9KwwY6fLde4sYW7IYBeGJk5ZxamnK0nB6z5oKXysBS114AYJ+WNNbmwVVcch38oiqg==
X-Received: by 2002:a17:90a:cc17:: with SMTP id b23mr4958178pju.32.1600277162054;
        Wed, 16 Sep 2020 10:26:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z127sm9193621pfb.34.2020.09.16.10.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 10:26:01 -0700 (PDT)
Date:   Wed, 16 Sep 2020 10:25:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [RESEND] input: iqs62x-keys: Remove superfluous function
 parameter
Message-ID: <20200916172559.GJ1681290@dtor-ws>
References: <1600276053-3336-1-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600276053-3336-1-git-send-email-jeff@labundy.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

On Wed, Sep 16, 2020 at 12:07:33PM -0500, Jeff LaBundy wrote:
> It is not necessary to pass iqs62x_keys to iqs62x_keys_parse_prop,
> because it can already be derived from the platform_device cookie.

Yes, it can be derived, but why is better to have it derived rather than
passed in? Is the code smaller this way?

> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  drivers/input/keyboard/iqs62x-keys.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
> index 93446b2..e2a2b38 100644
> --- a/drivers/input/keyboard/iqs62x-keys.c
> +++ b/drivers/input/keyboard/iqs62x-keys.c
> @@ -42,9 +42,9 @@ struct iqs62x_keys_private {
>  	u8 interval;
>  };
>  
> -static int iqs62x_keys_parse_prop(struct platform_device *pdev,
> -				  struct iqs62x_keys_private *iqs62x_keys)
> +static int iqs62x_keys_parse_prop(struct platform_device *pdev)
>  {
> +	struct iqs62x_keys_private *iqs62x_keys = platform_get_drvdata(pdev);
>  	struct fwnode_handle *child;
>  	unsigned int val;
>  	int ret, i;
> @@ -258,7 +258,7 @@ static int iqs62x_keys_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, iqs62x_keys);
>  
> -	ret = iqs62x_keys_parse_prop(pdev, iqs62x_keys);
> +	ret = iqs62x_keys_parse_prop(pdev);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.7.4
> 

Thanks.

-- 
Dmitry
