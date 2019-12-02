Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E830D10EF51
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 19:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfLBS14 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 13:27:56 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41757 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbfLBS14 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 13:27:56 -0500
Received: by mail-pf1-f195.google.com with SMTP id s18so58875pfd.8
        for <linux-input@vger.kernel.org>; Mon, 02 Dec 2019 10:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xCYWdFTSHfmmak+ESLnhDCUyodtslT0dGEk/k+0GyxA=;
        b=ZGhRlYZiPj/TYUQPvQYDASrjp1Ij22LwEQiqYkuMMHmRQUpiNn7jnsfkC76qZbuNJh
         EujPO62rL5M8xlzr4Z0XQMlEu8LFp+TvADQ2q6mI0O0aeGqxASVBrumCVIFlOQNyzGYt
         joPYZQx7etmMDgKkjXzHNHopEJ2bKhmqwRme6HsawKYDqJoZfJBhSqpsZciM/fHFRiaI
         iDFrxcNcdGYaACVLnuHIrbuKrv7digsYM0lpaXyun6m7aiMmxopESLJJfOw0WUjacR6A
         Wts7XtFUYpcSCHTlOLVZggAGIdeOdk34TgAW/ywgErRpI2MYgBXoYT323M2x7tUNNWTU
         QK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xCYWdFTSHfmmak+ESLnhDCUyodtslT0dGEk/k+0GyxA=;
        b=hVpM4RIgnfC9HGQkGifSgiBKqga/xxgp0newRoGXrW3aX1kP+MwIJid9kC6eLlP8NG
         9ur823PkLMb3vTNGCks2/n7F2aQlA289ZIu0tuJjrDCFQs4A+oM5JaoaWFqpgW7Fv1AW
         iCQQgs00w5u6XO0DySYvYII9SBrVAniMtzZNRn1uN4Q8WrKn72ZBBXyo2+Ug61Zy/4+I
         KjLjRHGyDcQmzwLBrFtrIXwyeD5ZH13QamSu8R9O3nHECJyhp97Eb9RvIiHQdnaVjCvU
         Ow/gX2ou0WNHiR/RXhZrPMxWIFla9dO9p0fhSXrIifoM1TUt10MJ0UPlWan/X4oNTj5I
         RBzg==
X-Gm-Message-State: APjAAAVAHLFxNE099ApVhkpmNhFFKbogFi/1zK7PHaNYljcmvmLd951J
        CbdQY1rurBxtvAQkJdNZ/aposlsa
X-Google-Smtp-Source: APXvYqz8+Mfj0eFoNsQ0hnRKNSmDiCOhDWjtBxOBK20dJmI7ggWU54XfYXunPO2xD+YxVuBQnXHJDA==
X-Received: by 2002:a63:5206:: with SMTP id g6mr452638pgb.49.1575311274062;
        Mon, 02 Dec 2019 10:27:54 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i9sm189269pfk.24.2019.12.02.10.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 10:27:53 -0800 (PST)
Date:   Mon, 2 Dec 2019 10:27:51 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH] Input: synaptics-rmi4 - re-enable IRQs in
 f34v7_do_reflash
Message-ID: <20191202182751.GH50317@dtor-ws>
References: <20191129133514.23224-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191129133514.23224-1-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 29, 2019 at 02:35:14PM +0100, Lucas Stach wrote:
> F34 is a bit special as it reinitializes the device and related driver
> structs during the firmware update. This clears the fn_irq_mask which
> will then prevent F34 from receiving further interrupts, leading to
> timeouts during the firmware update. Make sure to reinitialize the
> IRQ enables at the appropriate times.
> 
> The issue is in F34 code, but the commit in the fixes tag exposed the
> issue, as before this commit things would work by accident.
> 
> Fixes: 363c53875aef (Input: synaptics-rmi4 - avoid processing unknown IRQs)
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thank you.

> ---
>  drivers/input/rmi4/rmi_f34v7.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/rmi4/rmi_f34v7.c b/drivers/input/rmi4/rmi_f34v7.c
> index a4cabf52740c..74f7c6f214ff 100644
> --- a/drivers/input/rmi4/rmi_f34v7.c
> +++ b/drivers/input/rmi4/rmi_f34v7.c
> @@ -1189,6 +1189,9 @@ int rmi_f34v7_do_reflash(struct f34_data *f34, const struct firmware *fw)
>  {
>  	int ret;
>  
> +	f34->fn->rmi_dev->driver->set_irq_bits(f34->fn->rmi_dev,
> +					       f34->fn->irq_mask);
> +
>  	rmi_f34v7_read_queries_bl_version(f34);
>  
>  	f34->v7.image = fw->data;
> -- 
> 2.20.1
> 

-- 
Dmitry
