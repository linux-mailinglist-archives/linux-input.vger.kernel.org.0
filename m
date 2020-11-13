Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B868B2B168F
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 08:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgKMHhV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 02:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbgKMHhV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 02:37:21 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779AFC0613D1;
        Thu, 12 Nov 2020 23:37:21 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id e21so6401870pgr.11;
        Thu, 12 Nov 2020 23:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pGl1T/X7glmGQw+bW48W2QxXj7iIaZxRp4+Gv/0KHjM=;
        b=gmjNkxcTyM2aow4yEoRjkPrAVowkDSw0OjmJV0yuXSfk5XJCuFhNufwKNoXDP+PBcU
         eOAxaL1PFmtjCkuMV0rdPIejEwWZFfEHSmeCONaEV8sYIFTpnTkCSmijR1jSALpGb6De
         p5AxhHgtQPZ0L515XkcP/b5EAZ2g2CsaEx+bo7oLXiLPvMpR22TPwNVgj4cwHkxfyhUF
         KwvLl+ZDeyhV9nxFWllaVvC4HAs3K//sC0zihWUZCGYOBZguZLI9Z7582OTboXuc99tX
         ai/8xMrozCNdwjpaZv78y0CnfisSpsNGK0M8MJNeH+1WUp21dFu54CHp2eFJvSAba5HT
         fxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pGl1T/X7glmGQw+bW48W2QxXj7iIaZxRp4+Gv/0KHjM=;
        b=gTcfgiMRXORIG/2HSc8ORAp9URSUnBTqzOQ30nMaG0FyoH6YOtmVbXcyQ/TOCTw3uo
         pEJD4GBWS0rneWYEFXv122SX4S2PPXznSWl+4aP3gZAhGGobOqwKxTByDSj0IaOSUKlQ
         +qtZycP1BxCe6o2asUa4ie+CzapIOgAu7/75S3ZsKlUsSs1Dc21WQtNB//byvGRsIVbS
         D8BhNjw+CdvjbnXFhIQX2tT3kAiNitlljikFVAKbVxuaVdh8tpwTFDEC+5xdoHc8mgrA
         YkRUwBY1IujtXbwhB/H0znHlISMH2P9DGuAPiFmRV8CmejMs96a8/Hepu3DCgYcRMxA9
         Xvdw==
X-Gm-Message-State: AOAM532fEdzXt1ehNBp5bHWb3EHDZlr9LZAruvRQl+jnYnFoeh95+Dhj
        rh2iAnv+xq4j1s0fq0My1sU=
X-Google-Smtp-Source: ABdhPJyWzhyxEMBysh75YzdH5qE4DB1uAB3aFWQBYbtVQ6sdPwH2Jki7PGaXg7TYsp2mjgtAYT1d7g==
X-Received: by 2002:a63:4558:: with SMTP id u24mr313713pgk.376.1605253041068;
        Thu, 12 Nov 2020 23:37:21 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id d9sm7624218pjh.9.2020.11.12.23.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 23:37:20 -0800 (PST)
Date:   Thu, 12 Nov 2020 23:37:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Haibo Chen <haibo.chen@freescale.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 05/15] input: touchscreen: imx6ul_tsc: Remove set but
 unused variable 'value'
Message-ID: <20201113073718.GH356503@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112110204.2083435-6-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:01:54AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/imx6ul_tsc.c: In function ‘adc_irq_fn’:
>  drivers/input/touchscreen/imx6ul_tsc.c:307:6: warning: variable ‘value’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Haibo Chen <haibo.chen@freescale.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
