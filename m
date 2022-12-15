Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1D064D8A7
	for <lists+linux-input@lfdr.de>; Thu, 15 Dec 2022 10:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbiLOJdJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Dec 2022 04:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiLOJc4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Dec 2022 04:32:56 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE9C26A8D
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 01:32:50 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so1343232wms.2
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 01:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=adVaT2TDf6tyO19cFwkp1Hj1S/OUfa0k6laC1tHxQ7U=;
        b=u3Dno6UnMl/OVpGIdXUDBlwrpV4nNRK8UokOJ7Z8D+32Z/M05JFq8ey4N7Ndu7joFr
         K9+tqbsQpCedhL3934C28Mv3GkVFgnGQLC3EV0pRM7pd2784WJq9MyU+ZtJOg0CsP3nF
         DFG5VNJE16Sat79amnzQA9OnewczzOk80Ia7AowS6sHDkPBwnrXqYwnUTAFjE42VwG54
         n+Qukvq4G2TyRbm+csfpTS0qxEWKtWFHnP7qPNlsPEhMx/c03IuGe0a0ymgRZh2fD8eI
         RATf//U/XTJQjrOOG6q8bgpSZEO/YvQ78cHDl2Rp2jWieM9nb1gxIf7JJcSuaerH2FUR
         rieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adVaT2TDf6tyO19cFwkp1Hj1S/OUfa0k6laC1tHxQ7U=;
        b=1Y9VpFwe85eSfs+sptDeIuaKt+Ve3vozVQzkK9f37WKa5YFbnm9rPXZK9Qc+vg9zJT
         INZzd9Yvp5yNHu3odqCfvTrjFNGbjmvFVNoIduUljFdWkEl8l+HNPswbAfKNrlTDLW+E
         FRVcrooBLyqO/YHbfKxulPbt5IUyqzd/vHryZo9/JisjQrOpeIRamsFLXqhInQDodRzu
         hXF3zJBidIYg0poM5vPInPSLcrDbloEN4jcHTeAo7LFqwA3wEQ+JoyvSH3u7Y90DxSi9
         oNkD2Qxq/Jiatw2Jlwp7W4dQnzYjlBneL3hTAjm4lVhQ/6Vs73SLdDukKpRSehQGosZW
         uPwA==
X-Gm-Message-State: ANoB5pnxM7dmnBfZnkCu8eu6rukuIeNpbE0rZNbcoPjl3ij/QKqao8sD
        dAi2hcbWYpjriNgeTlybtTEcMw==
X-Google-Smtp-Source: AA0mqf65+sjAR4tuAJlyHoMfdzSLuWMpUrjCTyaA3tOWPNXDq7cyrk582JCVPCDL43rWZPLTq301lA==
X-Received: by 2002:a05:600c:1da9:b0:3c7:a5:610e with SMTP id p41-20020a05600c1da900b003c700a5610emr21891006wms.27.1671096768861;
        Thu, 15 Dec 2022 01:32:48 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id z9-20020adff749000000b00236576c8eddsm5545844wrp.12.2022.12.15.01.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 01:32:48 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: Re: [PATCH 2/5] Input: iqs269a - increase interrupt handler return
 delay
In-Reply-To: <Y4V2R7GB48a2BOke@nixie71>
References: <Y4V16ey6osEaaZJ/@nixie71> <Y4V2R7GB48a2BOke@nixie71>
Date:   Thu, 15 Dec 2022 10:32:47 +0100
Message-ID: <87r0x1j9kw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 28, 2022 at 21:02, Jeff LaBundy <jeff@labundy.com> wrote:

> The time the device takes to deassert its RDY output following an
> I2C stop condition scales with the core clock frequency.
>
> To prevent level-triggered interrupts from being reasserted after
> the interrupt handler returns, increase the time before returning
> to account for the worst-case delay (~140 us) plus margin.
>
> Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/iqs269a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index 5620a009bf55..711e67db71a4 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c
> @@ -153,7 +153,7 @@
>  #define IQS269_PWR_MODE_POLL_SLEEP_US		IQS269_ATI_POLL_SLEEP_US
>  #define IQS269_PWR_MODE_POLL_TIMEOUT_US		IQS269_ATI_POLL_TIMEOUT_US
>  
> -#define iqs269_irq_wait()			usleep_range(100, 150)
> +#define iqs269_irq_wait()			usleep_range(200, 250)
>  
>  enum iqs269_local_cap_size {
>  	IQS269_LOCAL_CAP_SIZE_0,
> -- 
> 2.34.1
