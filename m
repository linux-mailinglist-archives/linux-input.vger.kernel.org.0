Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C763A7199
	for <lists+linux-input@lfdr.de>; Mon, 14 Jun 2021 23:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbhFNV5u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Jun 2021 17:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231636AbhFNV51 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Jun 2021 17:57:27 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB967C061767;
        Mon, 14 Jun 2021 14:55:23 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 13-20020a17090a08cdb029016eed209ca4so209840pjn.1;
        Mon, 14 Jun 2021 14:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n7uYeUnQHRN8Nl6Ldfot2gZEPq2ram/9bJnItzNoEn8=;
        b=qFvwtZCDo7ulnyTgkW4rxRCqOTQdLDn3Xcw0Q3DUlBGwAmY42uhj5Au4cBVnjvdUCI
         OzIHIc8f5jiTkv+AmdB6IMHGFWCNEj9UqZg8Gk5DhsUpBRe0pYumeOwk0aPom9DwumRX
         1k+wlpZPYHLAGOjb2RZkV+lC3G9U5HddNvPqvdZXUvPytr8dNH+KwRrozOrxedVTQZkF
         1G9or7xzKx1jnrRShrx4PLwiS/Zf03r/nk27Lh2xQSKmRgmawAOyMPFP79zdt3I5pjQR
         qXH8w7LVzlvmNKJs4lNpF5su5/i6X2XKMqTwtWdLWqSxujSxUhV51DqhjuqJmRe78ion
         u0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n7uYeUnQHRN8Nl6Ldfot2gZEPq2ram/9bJnItzNoEn8=;
        b=alEhdBZafsGB1evCAHN9+hcj9yPcIUHC2vO/zZCeMyLmsf9tJyXSOvHKmgxspMoPsU
         OyOVPt8WH91eqma4VwDUL14xQGF1/Sf5ejjX33EnOVwHx1UF1KVMEQdhDnKmIorE7hL2
         6JQCL091U03dgGeNnLgD2I1EooRoJqJMWhJmfILBMK83uPI4WyA8OGGwAMSdVytUcKYK
         VyrrYZqpVrWrFeKf3nBii6Xx+73rAbz8eEuzj4sVBwxSPu5+pubfWOTCX7ig68/gsrY4
         PvRVI+MPmlOgOx8SQxA/VsgqoteH9WzHkvamyOkJhqSsNvq4xXny5JSx4aQTZp8YAY+P
         S3qA==
X-Gm-Message-State: AOAM530lo9wwIn5MwquHsA8ELMkfJvVr/tYWHYifnkuiT4Zw0eHXOaAF
        N+ZtUYkb0apNe9FH4oIKL68=
X-Google-Smtp-Source: ABdhPJx2GE4PSoxUgNiWHnou2aRLJd4bY3YT/54u9rZ9X3gDoY+PSjirSFav7AY8wWB8Ozmkr5SIcg==
X-Received: by 2002:a17:902:d386:b029:11a:6d87:a7db with SMTP id e6-20020a170902d386b029011a6d87a7dbmr1193907pld.31.1623707723196;
        Mon, 14 Jun 2021 14:55:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2a26:15ba:dc71:c4ba])
        by smtp.gmail.com with ESMTPSA id t12sm13874891pfc.133.2021.06.14.14.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 14:55:22 -0700 (PDT)
Date:   Mon, 14 Jun 2021 14:55:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] Input: ep93xx_keypad: Prepare clock before using it
Message-ID: <YMfQR8iM9be5Qg8+@google.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
 <20210613233041.128961-4-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210613233041.128961-4-alexander.sverdlin@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alexander,

On Mon, Jun 14, 2021 at 01:30:37AM +0200, Alexander Sverdlin wrote:
> Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
> to Common Clock Framework.

Can this be merged standalone?

> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  drivers/input/keyboard/ep93xx_keypad.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
> index c8194333d612..e0e931e796fa 100644
> --- a/drivers/input/keyboard/ep93xx_keypad.c
> +++ b/drivers/input/keyboard/ep93xx_keypad.c
> @@ -157,7 +157,7 @@ static int ep93xx_keypad_open(struct input_dev *pdev)
>  
>  	if (!keypad->enabled) {
>  		ep93xx_keypad_config(keypad);
> -		clk_enable(keypad->clk);
> +		clk_prepare_enable(keypad->clk);
>  		keypad->enabled = true;
>  	}
>  
> @@ -169,7 +169,7 @@ static void ep93xx_keypad_close(struct input_dev *pdev)
>  	struct ep93xx_keypad *keypad = input_get_drvdata(pdev);
>  
>  	if (keypad->enabled) {
> -		clk_disable(keypad->clk);
> +		clk_disable_unprepare(keypad->clk);
>  		keypad->enabled = false;

While we are at it, I wonder about handling suspend/resume. I see that
we disable the clock even if keyboard is configured as a wakeup source.
Is it really capable of waking up the system when clock is off?

Thanks.

-- 
Dmitry
