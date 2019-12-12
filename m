Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B751011D76F
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 20:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730593AbfLLTue (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 14:50:34 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36033 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730284AbfLLTue (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 14:50:34 -0500
Received: by mail-pj1-f65.google.com with SMTP id n96so1524597pjc.3
        for <linux-input@vger.kernel.org>; Thu, 12 Dec 2019 11:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5/6Yrwz+vabqsWSc3MHCLFVFJfqv2+mfjnvxSNl5fhg=;
        b=LjtE2SbSCSzFaZzVicvFW3s5amudz6YpSGVrkmVHDz9uPtAe8ku+tMR3Q0zvjbKn4t
         qT0QDQAOyHlsmh3qK8qhk+tVeQCZdqoNKyrdE9c+hAYruI9JZwIRDOWRRYKEKEiVs5X8
         4o1QFGwbzTTu9rxqouKsvSyTDLNiEJ/sXIQVdJC85vjUTQTxdIWjlql1s/Kb04/tVEo9
         ZdWlMWXCskPjHmYchi9Ws4T0IqfRsh6ms11p57JJcAMKchl9kI/pfzmpzG0GZZ7fnLLd
         +DlXeq3gjEaCnpcKUPngJCHcdMYjWvl20Jnk+sxXfw9fPCSdxH3Zn/mhQ1FP7+SNKFVo
         6qVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5/6Yrwz+vabqsWSc3MHCLFVFJfqv2+mfjnvxSNl5fhg=;
        b=gtcikfSFv75QbcUdYRZMnqdQb2vZYsuLWPkQojgbZVZYvyF9k1dWKiwpb+ymCWYx3F
         RMKh3bjg7HknJj1VwO5f4IQy5Dqq79+vSPbANaVEn9qwWtcxNblfXXFkXj9mwn7/Zu8B
         CSV/1xJhMvxGA3RJnLIbkiksSWt5F2jNopMhLYQezAeb3sjPq+BXkY3j77hNw04WcWdx
         8fJBdErggmCfQENv/qPLoB6mokZ6uB+SmsYEFMwcSlJj9GWHpW99coQNhY2nz+R+WcfF
         sQsPvGfnAWawjilTpjXZkp7NeAVmAjaCHLnK7sNqZICKR9uOoyntJjhUFcQhNvI4Yg7g
         K4tA==
X-Gm-Message-State: APjAAAUYeL1fW7FlI3reZextAwtOC4nMmyHYov24H2zlz3tq2D2PQbox
        ltmU0WEi0Mj/+xCkz335zM8=
X-Google-Smtp-Source: APXvYqwiiAoO70WtLKDfcbohD4pehvbCVbxywxqeh69aDxw3/VrhqKyDaL2zVchEfSOroHxnf7eSaQ==
X-Received: by 2002:a17:90b:4396:: with SMTP id in22mr11358942pjb.111.1576180233741;
        Thu, 12 Dec 2019 11:50:33 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c184sm8389969pfa.39.2019.12.12.11.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 11:50:33 -0800 (PST)
Date:   Thu, 12 Dec 2019 11:50:31 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-input@vger.kernel.org,
        Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: Re: [PATCH] Input: pm8xxx-vib - fix handling of separate enable
 register
Message-ID: <20191212195031.GE101194@dtor-ws>
References: <20191211190026.52662-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211190026.52662-1-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 11, 2019 at 08:00:26PM +0100, Stephan Gerhold wrote:
> Setting the vibrator enable_mask is not implemented correctly:
> 
> For regmap_update_bits(map, reg, mask, val) we give in either
> regs->enable_mask or 0 (= no-op) as mask and "val" as value.
> But "val" actually refers to the vibrator voltage control register,
> which has nothing to do with the enable_mask.
> 
> So we usually end up doing nothing when we really wanted
> to enable the vibrator.
> 
> We want to set or clear the enable_mask (to enable/disable the vibrator).
> Therefore, change the call to always modify the enable_mask
> and set the bits only if we want to enable the vibrator.
> 
> Cc: Damien Riegel <damien.riegel@savoirfairelinux.com>
> Fixes: d4c7c5c96c92 ("Input: pm8xxx-vib - handle separate enable register")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/input/misc/pm8xxx-vibrator.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
> index ecd762f93732..8dc345604a4d 100644
> --- a/drivers/input/misc/pm8xxx-vibrator.c
> +++ b/drivers/input/misc/pm8xxx-vibrator.c
> @@ -90,7 +90,8 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
>  
>  	if (regs->enable_mask)
>  		rc = regmap_update_bits(vib->regmap, regs->enable_addr,
> -					on ? regs->enable_mask : 0, val);
> +					regs->enable_mask,
> +					on ? regs->enable_mask : 0);

Would it be even clearer to say

		rc = regmap_update_bits(vib->regmap, regs->enable_addr,
					regs->enable_mask, on ? ~0 : 0);

?

Thanks.

-- 
Dmitry
