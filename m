Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A171AF68F
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 06:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgDSESe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 00:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725769AbgDSESe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 00:18:34 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D66AC061A0C;
        Sat, 18 Apr 2020 21:18:34 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id h11so2634422plr.11;
        Sat, 18 Apr 2020 21:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rEiU8SaLExT2bwa3LkvDAdTz36OwDQsEFW3OIT7jvi0=;
        b=fVZuUy1S+JXROMM7sw9oiIJI/EvhjSp461/28N+T3iKaix8cjxs8Sr6meMrGX4dJ8j
         i1atIBEUxzKGnxQ6Vsi45qKZWt/1EJNfusQlqa7bKv5J5CPz96PVEMhMWVjfTuHN6JxK
         OLCz/59yYNMSVjMiTSmtYCcIcnesPgj47TO4qYLUyZGPmuyNUw2ZWscxvATws6VG3KNu
         95R6gWrSyhS8idKcqmrYVsiVDNiVZ9PZoAKsR5Ayo5r0F3ACMY98xk8Ow1YHuu6S9DEn
         aLtTW9DO7hlgfN2Z7CJDSrrVm5bL1Kb4z6226aa1bW6VFoSsYaOo/ZO1nAAFaLxjt6xe
         3yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rEiU8SaLExT2bwa3LkvDAdTz36OwDQsEFW3OIT7jvi0=;
        b=Y8gXqvt++T6tZkd1tNvZi0Vl4+dtCdNMbD5VBB0Qdg06phkEdNe6ZLsuii9PV7jz+R
         ac3K7Pab5p4O35HGmW94+JN43J0MW10szOPElw6L/Sa+DpihJvyCSxUYDIyBJYWKUQtf
         iTaEDGJX85BplW4RgrJypLQtbRLYxoVxN8ky2okdKU9YIjD7p7cxENEpeKMjYXTSyS2R
         noXMClGZF1cFD7638JrVyAhkSWVi2ydkSITjqO2Xm+nVwNeR963eY7or79wuljOl8mlN
         b3RIZ5OF3ex6giCL2spBvitem+qf2p02CrI8+chQokY4Nv4MHX4DC37nEKoGo0TQfLor
         LHsA==
X-Gm-Message-State: AGi0PubudydD32OhFDKqK7dxz73TC6+FWBnYkBkUCsxUvKmuGkNBWukf
        WQYq9koyF1Vtj6VgB/CEzY0=
X-Google-Smtp-Source: APiQypIfMLxz5SPVhlLgxcYESL8q/VZx5LsYXSiGsqQEEjh96OR3skPEcB1sVPwpyHqN7Yrnu+Ae+g==
X-Received: by 2002:a17:90a:5d96:: with SMTP id t22mr14163074pji.132.1587269913536;
        Sat, 18 Apr 2020 21:18:33 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id b189sm14982848pfb.163.2020.04.18.21.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 21:18:32 -0700 (PDT)
Date:   Sat, 18 Apr 2020 21:18:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     tglx@linutronix.de, info@metux.net, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: tca6416-keypad - Fix a typo in MODULE_DESCRIPTION
Message-ID: <20200419041830.GF166864@dtor-ws>
References: <20200413152329.4435-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413152329.4435-1-christophe.jaillet@wanadoo.fr>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 13, 2020 at 05:23:29PM +0200, Christophe JAILLET wrote:
> This should be 'tca6416', not 'tca6146'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.

> ---
>  drivers/input/keyboard/tca6416-keypad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
> index 21758767ccf0..9b0f9665dcb0 100644
> --- a/drivers/input/keyboard/tca6416-keypad.c
> +++ b/drivers/input/keyboard/tca6416-keypad.c
> @@ -374,5 +374,5 @@ static void __exit tca6416_keypad_exit(void)
>  module_exit(tca6416_keypad_exit);
>  
>  MODULE_AUTHOR("Sriramakrishnan <srk@ti.com>");
> -MODULE_DESCRIPTION("Keypad driver over tca6146 IO expander");
> +MODULE_DESCRIPTION("Keypad driver over tca6416 IO expander");
>  MODULE_LICENSE("GPL");
> -- 
> 2.20.1
> 

-- 
Dmitry
