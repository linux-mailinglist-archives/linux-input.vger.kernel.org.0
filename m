Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3CF5323AE
	for <lists+linux-input@lfdr.de>; Tue, 24 May 2022 09:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234453AbiEXHJZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 May 2022 03:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234628AbiEXHJW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 May 2022 03:09:22 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AABB68FFBB
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 00:09:19 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t6so24330406wra.4
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 00:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=pCN2Ft9e801Kz2zGVwTqNShXZsBm3Xuy/IzHCpqum90=;
        b=QHS3fNIZlm9bNSdTzgh3fGMY/SPIw+dw3SriYWos+fB49G2bs/sCPCHpL2rfit0yrQ
         YwuHcqsymJf3OrCGb/axRIsIZP9hbzgtbKtuAwBpuQ1LylnCAft14+dUEN4wfu3eqY7C
         fJdzIi9VW+vHTqTLAbomJeRQg2qXqp0y0WztBfFDT4nDQX48VwZQjUwy8xj3XKnV37Xz
         QcOEn5MrXG2n8rs9FRjuD9MtJIG6DEzZx+C4yRd3QYXbmpfNzKVuKRHK3hrAi0J+c5qo
         oeE88/NDbNcE+QSTal+ZGOiy4ZbnnJ0lyCepesGo5n/8RJtnVcfuNbkBMVQ/Whf7l6gf
         MYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=pCN2Ft9e801Kz2zGVwTqNShXZsBm3Xuy/IzHCpqum90=;
        b=ODX7mOhl19c49EjdNYNvH8FMtnE0O3F/ATmP1Iz1+XdoHgoNI6fXJSxCAOpRnGFNBX
         VstidCSyQ/OQncSyVMtBwwS/0hlwsOkquZnO13X4QhgJ+nZC3B87FPFaXrT4XhKgXiUY
         tcCUbeTis9EizM58Q0jBK0QsVzcegN6+qCvBdAXzMM/gi/2cheoBnqg5AEM7+mJAkDUy
         lC/PYzp7k9NMDoxv3UeBwtAJtbNgDOuMbKe+24VfLUWRbh9VOJ2hrDGIhvcU9DADTD7D
         E1UBd7NESZl9c0K/SrxoAQL/rrbjq223X2B1Z1ME862yvfwzOV6X7Rj9JxwtoF0JoHz+
         XqLA==
X-Gm-Message-State: AOAM530rrdnbTErOCd/F2iHbWcarrjTurPL4J9HF/DBTRbq8fLYM2WGH
        wrviWkA/a9Y0FIxywnlVbmUKEA==
X-Google-Smtp-Source: ABdhPJwAIeikzYSP7x3rEzUOCiB/3OcDcsJtJa8W2504qGXi0ukRqtYqiqggrZ/NqjEteuINAg8jeA==
X-Received: by 2002:a5d:458a:0:b0:20d:a92:73dd with SMTP id p10-20020a5d458a000000b0020d0a9273ddmr22098582wrq.170.1653376158275;
        Tue, 24 May 2022 00:09:18 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:de85:21d6:6f2:c7e3])
        by smtp.gmail.com with ESMTPSA id m6-20020adfa3c6000000b0020fc4cd81f6sm9420673wrb.60.2022.05.24.00.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 00:09:17 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: mtk-pmic-keys - allow compiling with COMPILE_TEST
In-Reply-To: <YowG7BVsJTNd0ELi@google.com>
References: <YowG7BVsJTNd0ELi@google.com>
Date:   Tue, 24 May 2022 09:09:17 +0200
Message-ID: <87zgj7e7aa.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On lun., mai 23, 2022 at 15:13, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> There are no hard architecture dependencies in the driver, so to improve
> compile test coverage let's enable the driver when COMPILE_TEST is
> selected.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/keyboard/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 4ea79db8f134..a20ee693b22b 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -795,7 +795,7 @@ config KEYBOARD_MT6779
>  
>  config KEYBOARD_MTK_PMIC
>  	tristate "MediaTek PMIC keys support"
> -	depends on MFD_MT6397
> +	depends on MFD_MT6397 || COMPILE_TEST
>  	help
>  	  Say Y here if you want to use the pmic keys (powerkey/homekey).
>  
> -- 
> 2.36.1.124.g0e6072fb45-goog
>
>
> -- 
> Dmitry
