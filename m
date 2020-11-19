Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2C52B8E72
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 10:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgKSJMM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 04:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgKSJMM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 04:12:12 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0908BC0613D4
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 01:12:12 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id c9so6406395wml.5
        for <linux-input@vger.kernel.org>; Thu, 19 Nov 2020 01:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qrvNFqIshFToJZ8d6/WF6C/Crs0qG1otBamb+mHYUl8=;
        b=WiwugfDa9s4Dh5Kd+43uSCfEG86ljd1UiK0QrdShHAw7RpkhNGTapw++vyhFaJMfcY
         on/FSJb5XtIHuApwVqbT1LG+Mk9eXM+pzNecoh2zG9qia/s706DOcpdc3NioPmwKjv8r
         x8B9UAscQofTbLQLrdou54zFSwYsfaKvsREH54x3wuifIRrO5v81n4P/vCKfKJOCLb0F
         42fSSJldaIxWKRVd0tZVX9Zyf9bJCM7ind4ULhtgTGWSHChcVlDeG9fQvIxTI6BSWXbh
         yjwFWLps5dnwgZr5UuR1S+/HDTcOFY69vdIs1RpzBW7k6T9TVdbr6WxFBMvr5GsAgH3u
         zbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qrvNFqIshFToJZ8d6/WF6C/Crs0qG1otBamb+mHYUl8=;
        b=sOtRw3Yzcoow8CP9NNH1MasahYiRyGmMZhB2Kw56qkHuHttZLRW4kRByqIv38qVUd2
         8sK68whoLJhc76NZ6gnLkNdFMMHzUtdfD+5SJnDGXPCPrr2pbU52qaFjWAFL6am4gncD
         yUUXVClu0qrive2c4JqGvevy8u+JPu+wZkR/+eWxGwg19regDbhAVpxlknBDtqzxQmWz
         Y2lsGzmXRpJcVHGPiJezW4MG0HrBbaXXZFA2Tk8HwVOPW9jbAegLBd5MBL0Rv7lc5OMu
         EmXwoR1qqjG40YvtRdjvtA/8f7z4xqpSo6887nCALUJgo5yhUhv86mO6acP/K1pPWJVa
         F4fg==
X-Gm-Message-State: AOAM532py3UnMIanEVW2COqqNbkOjSqIRBUi3bMdD/YJ8TJxBoPEZrBs
        QTcWT1WN5av5K8sWe2LIyL5dqg==
X-Google-Smtp-Source: ABdhPJzzSx2Nv+LpqWm35A4XApOvrsh/u2QGuNG32M/53E82KFLWKyZFMWSSY4Ws0YMxNVe86TPxnQ==
X-Received: by 2002:a1c:7d13:: with SMTP id y19mr3309797wmc.98.1605777130663;
        Thu, 19 Nov 2020 01:12:10 -0800 (PST)
Received: from dell ([91.110.221.241])
        by smtp.gmail.com with ESMTPSA id l16sm36483432wrx.5.2020.11.19.01.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 01:12:09 -0800 (PST)
Date:   Thu, 19 Nov 2020 09:12:08 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Haibo Chen <haibo.chen@freescale.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 05/15] input: touchscreen: imx6ul_tsc: Remove set but
 unused variable 'value'
Message-ID: <20201119091208.GX1869941@dell>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-6-lee.jones@linaro.org>
 <20201113073718.GH356503@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113073718.GH356503@dtor-ws>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 12 Nov 2020, Dmitry Torokhov wrote:

> On Thu, Nov 12, 2020 at 11:01:54AM +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/input/touchscreen/imx6ul_tsc.c: In function ‘adc_irq_fn’:
> >  drivers/input/touchscreen/imx6ul_tsc.c:307:6: warning: variable ‘value’ set but not used [-Wunused-but-set-variable]
> > 
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: Haibo Chen <haibo.chen@freescale.com>
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Applied, thank you.

Good morning Dmitry,

Are you planning on finishing this review?

About half of the patches are unreviewed and there are a couple of
open questions on others.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
