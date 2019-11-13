Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA63DF9F92
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 01:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKMAtx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 19:49:53 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36873 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbfKMAtw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 19:49:52 -0500
Received: by mail-pg1-f196.google.com with SMTP id z24so168658pgu.4
        for <linux-input@vger.kernel.org>; Tue, 12 Nov 2019 16:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pCt96X5Y0jPDYRN2VQOZAa6BGM7iVmVgJEE2DseJE/U=;
        b=XIg5TXM9k/7XgTfNDDLaJiRws7NynFk2a+C0+QRSZJZDF85U4E6vqRyIVpd1TmW4Bk
         W9zCTup7PSYskSV3xxSvj1nZ8/Fnk0v4mcZULdyqOcgDcxyth/2yDiCNNdW59OCio1Nm
         WTZD33aVCyrjVme25pyicT2GBX0HzNrus8192L8l2fXXdkB/XhhxH6JLJzoTFEUY6Meh
         aKcMJLZxkfTY4LIc91eKEKuj9mNg9GfBbAkVQ8rYT6ZK7lqIXzmMNdbn18dGhfrNu3FC
         LMr/sfpFiZL/XT4xgQrOFlddjgTbpCULogtDMbPQmnzYP53V7js06/WiKqEqRlvbMf06
         ArIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pCt96X5Y0jPDYRN2VQOZAa6BGM7iVmVgJEE2DseJE/U=;
        b=E7ce7GLXIubQgrFDw+7pU7NIGgrZFuaOMQMvm5DZfps8oUUDAaAigVN7dkynyrqANM
         CWln0xWG934vyeA9X94tQiYcArQvIq52Kzv87bk1z0D7Ousjd/XCoVPBpqCKOf83mURB
         ftsRpZgR5kcvShixhvp3Tb+PFR6Z75TJ1Demt0mxMO9vWAXoyWDcFnx1GXvAuPPQP/ly
         F83kT/X+YEnAskdfoLYCgG7Siaa74v/VsnSl62tfmti3bJzj3uMsRjWVseylKMJQGTx5
         8whcMf2Rt91leTCjSry2e7WZHosdXHnnyVK60Sfclv58ZCbwxe41n4L6BYOwrar1PTUo
         pXQw==
X-Gm-Message-State: APjAAAW3KcGizdvRuZBxY/z95w/PxCf6v593z+iOU9fZvtDRaBgivGj3
        8QrlqbKXOxX6uSLcn1O8QuQ=
X-Google-Smtp-Source: APXvYqwCZCkPiB8AlFNAcWBIAoNGm81DtHNTKnw27HZNbQJNAGuVjec/OiBC/8nU7rEIMDKiQfmwNQ==
X-Received: by 2002:a17:90a:a58b:: with SMTP id b11mr944898pjq.46.1573606190414;
        Tue, 12 Nov 2019 16:49:50 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 206sm187312pfu.45.2019.11.12.16.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 16:49:49 -0800 (PST)
Date:   Tue, 12 Nov 2019 16:49:47 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH] Input: synaptics-rmi4 - clear IRQ enables for F54
Message-ID: <20191113004947.GL13374@dtor-ws>
References: <20191105114402.6009-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105114402.6009-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 05, 2019 at 12:44:02PM +0100, Lucas Stach wrote:
> The driver for F54 just polls the status and doesn't even have a IRQ
> handler registered. Make sure to disable all F54 IRQs, so we don't crash
> the kernel on a nonexistent handler.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thank you.

> ---
>  drivers/input/rmi4/rmi_f54.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
> index 710b02595486..7e6243ecaf32 100644
> --- a/drivers/input/rmi4/rmi_f54.c
> +++ b/drivers/input/rmi4/rmi_f54.c
> @@ -601,7 +601,7 @@ static int rmi_f54_config(struct rmi_function *fn)
>  {
>  	struct rmi_driver *drv = fn->rmi_dev->driver;
>  
> -	drv->set_irq_bits(fn->rmi_dev, fn->irq_mask);
> +	drv->clear_irq_bits(fn->rmi_dev, fn->irq_mask);
>  
>  	return 0;
>  }
> -- 
> 2.20.1
> 

-- 
Dmitry
