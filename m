Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CC94014F2
	for <lists+linux-input@lfdr.de>; Mon,  6 Sep 2021 04:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238487AbhIFCIL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Sep 2021 22:08:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234294AbhIFCIK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Sep 2021 22:08:10 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E762AC061575;
        Sun,  5 Sep 2021 19:07:06 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id w7so5194305pgk.13;
        Sun, 05 Sep 2021 19:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8YLXjAz0g5k3I7xB8PeuCY4SAGh46UdYPaS6bLn7yHU=;
        b=jT1eKflCrHvPFmUn+yTYnbMuM5sbXraoAQ9Xp+tfroppL1TuFSK9fRG358A9zh0Y0l
         52cyay6FMeB3HxsLE97qzjQExOApUW9EMtC3FfYh07bxIv2aF9A/5OpHLt3i+Z47Zvbg
         kOzKn2u3cKAGaIOH19xTiQaYKK7TKA3I9NJZ1S2J4UB4dyeIihIFJeKc08RxG0EtA5Hn
         jXa1SfHNpXeeHFbHG3pkbKPl5j1ZQpvIZkbq67AU9a3Mx01LFlOyBr/bxM6TjD2L9veh
         YcsrMWHyeefTCxyH2MkCDkNPUJpHPiSgFag9ol2XREXcgT4ELdNn1Cbw3N/brhzIpHrQ
         EwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8YLXjAz0g5k3I7xB8PeuCY4SAGh46UdYPaS6bLn7yHU=;
        b=H+/BMruJV8ZybJ2K6gfWTrRiwbPDj3uq4nbUDjITLfBgTZy9doEkONs8kxYIVdIoN3
         oMIHMfq6pjeZ0VR3AJBhIRLy3D8lDu5TKqm8I4MXe6jSMj7ra4QLyuLKa6RYhJ0NCdTu
         TTWgqczrRV9kbmm3L1vlxNfy7Brs+5/mQWwPF2CPoXu/uwTE5CeVLmjWIC8MFG01oGGE
         0x/S169EEcczRFjH4bWVle2kf+c4PzjaRrmo6mWjYZA3XKkM0Hwg+ykfnQPFGRbFu1Av
         WDh+vVZq28SeC3yN9L4sBLy8eqwCfTEyWGT8p9YEss9RdWG2AtkqG/S2YSxtYpguIRu1
         93lQ==
X-Gm-Message-State: AOAM533HAYdObZJ/Z4Pi0JEV/eVjbodlmYwRU74QXI+b0kvUQsbJ6vds
        XCEpk67QQTDV+swNtmz6ji4=
X-Google-Smtp-Source: ABdhPJwpaA2p4iyn1QYwfLTrydwM39dcHc7m4fAs3j7q7V9hfpKWZYwRMKvjjsREeXs9GAWQ/dAzHA==
X-Received: by 2002:a63:5f8f:: with SMTP id t137mr9956318pgb.420.1630894026226;
        Sun, 05 Sep 2021 19:07:06 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4bc3:62de:220d:cd94])
        by smtp.gmail.com with ESMTPSA id a194sm5608894pfa.119.2021.09.05.19.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 19:07:05 -0700 (PDT)
Date:   Sun, 5 Sep 2021 19:07:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: cpcap-pwrbutton: Add an error handling
Message-ID: <YTV3xny2etxZ/TNG@google.com>
References: <20210802121740.8700-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802121740.8700-1-tangbin@cmss.chinamobile.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Aug 02, 2021 at 08:17:40PM +0800, Tang Bin wrote:
> The function cpcap_power_button_probe() does not perform
> sufficient error checking after executing platform_get_irq(),
> thus fix it.

Yes, indeed. request_irq will fail regardless, but it is nice to return
proper error code.

> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  drivers/input/misc/cpcap-pwrbutton.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/misc/cpcap-pwrbutton.c b/drivers/input/misc/cpcap-pwrbutton.c
> index 0abef6321..0a1f2e8b4 100644
> --- a/drivers/input/misc/cpcap-pwrbutton.c
> +++ b/drivers/input/misc/cpcap-pwrbutton.c
> @@ -57,6 +57,9 @@ static int cpcap_power_button_probe(struct platform_device *pdev)
>  	int irq = platform_get_irq(pdev, 0);
>  	int err;
>  
> +	if (irq < 0)
> +		return irq;

I moved the platform_get_irq() here and applied, thank you.

-- 
Dmitry
