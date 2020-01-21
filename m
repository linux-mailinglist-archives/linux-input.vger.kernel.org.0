Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 088CF143655
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2020 05:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgAUEom (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jan 2020 23:44:42 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39097 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbgAUEol (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jan 2020 23:44:41 -0500
Received: by mail-pg1-f194.google.com with SMTP id 4so778939pgd.6
        for <linux-input@vger.kernel.org>; Mon, 20 Jan 2020 20:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qqiAZUaDOXq/TrGhcVDoCfcxTpSsU14yS8GHKbBAOtM=;
        b=HmPOr4y1eGZsDI3gbUrtVdgf1tnYnOm9hKydyhNQmSrxly6Eori+6gh5MT9K16/Icg
         qMT8hO8XwpnoyfwOcQj/mnB/0uYpKjJKU5uiz1BekIq8uZEj3wSeTUlWije3jlI1EBXK
         4+ivgS5k4EGoNfVL9RyPvCOLR4NaoPxnOhAXT+ZaFTXTZ5D47lNWnfttL7/Unx221t8C
         9K1vtKPjinGtKveMLiR7Y3WMw+vTarsCxmiEzZRK7ysPueWqVy4+art/ld4+T0AksSao
         Osq2h7OHc5vg4WoVYRShqmQSGPwPfnBNdCM7zCkhFXlv3okYCCvxPzY4tCQO3z5PFdd7
         FqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qqiAZUaDOXq/TrGhcVDoCfcxTpSsU14yS8GHKbBAOtM=;
        b=qN5c9rwXccKRGCZ+610a7AESdmOE0hLA88IQ54O12yNIxpWz/BACoL3WF/8TbsTI5i
         Mdd39GmGJwYN8LWmZ5pPZpHaEk4faM72izgcJQrQTYg4lTVO1kQiBJPY6GA8+cqcPMCN
         vrHhPOCvFoIsUj9yJq8jWnURvwZUotsO58b22ngkTBxdwsKemDnNx4uH9WGngpe626lr
         YZbCqCiK1/jfGfq7AyhUb+pX4NSnH2Qcn2rFA9I2+LcdCP/8s+q0Rq/odkuCw3PIr41R
         OO+b9tCzuDxHbFM7XFFuXu0y2IjmZCLcUCTcG/qruy8rZx7kkZFm/hkzG1knV7B9KdoM
         t9eQ==
X-Gm-Message-State: APjAAAW1WaCacGDDWTX6OgZKCvAg6uwJ/37TZfoeJ2rT7+4mjdBbp+Hk
        gnbRDxb0Rb0prd8xMZZ9h1I=
X-Google-Smtp-Source: APXvYqwkDBVt/TgbDozMpJGGzvCRZjE8NJsG6ukjRPb9qh5DONak0ivoIrsxlQ7i8TJSuL/r9ty7pg==
X-Received: by 2002:a62:1a16:: with SMTP id a22mr2718961pfa.34.1579581881150;
        Mon, 20 Jan 2020 20:44:41 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id l9sm37285472pgh.34.2020.01.20.20.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 20:44:40 -0800 (PST)
Date:   Mon, 20 Jan 2020 20:44:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-input@vger.kernel.org,
        Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: Re: [PATCH v2] Input: pm8xxx-vib - fix handling of separate enable
 register
Message-ID: <20200121044438.GM47797@dtor-ws>
References: <20200114183442.45720-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114183442.45720-1-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 14, 2020 at 07:34:42PM +0100, Stephan Gerhold wrote:
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

Applied, thank you.

> ---
> v1: https://patchwork.kernel.org/patch/11286073/
> Changes in v2:
>  - Changed regmap_update_bits(..., regs->enable_mask, on ? regs->enable_mask : 0)
>    to regmap_update_bits(..., regs->enable_mask, on ? ~0 : 0)
>      (suggested by Dmitry Torokhov)
> ---
>  drivers/input/misc/pm8xxx-vibrator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
> index ecd762f93732..53ad25eaf1a2 100644
> --- a/drivers/input/misc/pm8xxx-vibrator.c
> +++ b/drivers/input/misc/pm8xxx-vibrator.c
> @@ -90,7 +90,7 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
>  
>  	if (regs->enable_mask)
>  		rc = regmap_update_bits(vib->regmap, regs->enable_addr,
> -					on ? regs->enable_mask : 0, val);
> +					regs->enable_mask, on ? ~0 : 0);
>  
>  	return rc;
>  }
> -- 
> 2.24.1
> 

-- 
Dmitry
