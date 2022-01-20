Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35FA495689
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 00:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347572AbiATXAu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jan 2022 18:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233876AbiATXAu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jan 2022 18:00:50 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F77C06173F
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 15:00:49 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id l64-20020a9d1b46000000b005983a0a8aaaso9571089otl.3
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 15:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TrvQTuFf4wSv4Q5s7NHAHkNBxd8yoqRnHP4rc1hgP+w=;
        b=tQlWGtQ2pCTLcA3DZ3UOI00jnMnHtWbfcGaIVFICq2M9RQLN99ZuKOxNJk0FiMvdyl
         E1GsA6Jb2vbu48PlF560FjYpDt7W396p3B0lSZDwc+sURvhY/T8l4ExYk+ViSTkUmIMr
         vGjFaCcPA5Gyi7UhmToH4BawjNPi/NmpJXCxOyJFV6WVinVfp59k8B0kUpGq8N7VpLTt
         oK6PWkiskxVQ5CCFKvlLPB2kIHnzKoydzImK9T27BqsxQMaf0dD4NbL/UPe1MF0Py3Tl
         Qw0N0a7SK3xCnpRabM6Cp7mSAxeKKZtAJBFHmD5pzX1spyh3c7k7iSR7aMp8b6tap3by
         BrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TrvQTuFf4wSv4Q5s7NHAHkNBxd8yoqRnHP4rc1hgP+w=;
        b=BojxQg2BnLcSMo3v8krpzWdn/7uFUuTcKqHLa5qbSb1BPX/K452yQl+2Yo2DVgTEpG
         eoWTu3+8sqDx9KTFWmfwG1OyWct1xKMvGMTlVn/swkPHmmJCPp3T25o7giAQfUcXHvbO
         5+TqWUkQCXzaycqEhAzRiFklUiGbYgfQy4uXuClTxVczOjDxOKLADQuL9bDoSd/xCceU
         l1e0hjkn3z18B9Q/2+RkYrNU/Gef4DW5LvXtg9r7iHWVFrK4Wv63qoXZOF3RbMD8SmEp
         SJPvVQWsK1Hu6xgCnK6l6dMrsJRPLcGwgeb2DolWyG0/T/U5k3HYbWMj0GMva4VMY/mH
         1AnA==
X-Gm-Message-State: AOAM531Ev5pxceAyt6cHFNuNuire5Hr3D9HuQrd5y0wgJvUqrxSIjSlO
        QrNn6rcb8hXh2TA7EVkgFp0EmQ==
X-Google-Smtp-Source: ABdhPJwex3Uu/ZT2ptJZsPUbsB1kn9GWL63hAQQrv8t9SgrC2JIdy866cfkAs59zglhGuNIdMFfj/w==
X-Received: by 2002:a9d:5919:: with SMTP id t25mr515127oth.318.1642719649017;
        Thu, 20 Jan 2022 15:00:49 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id x15sm241753otr.38.2022.01.20.15.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 15:00:48 -0800 (PST)
Date:   Thu, 20 Jan 2022 15:01:22 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Anjelique Melendez <quic_amelende@quicinc.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        collinsd@codeaurora.org, swboyd@chromium.org, skakit@codeaurora.org
Subject: Re: [PATCH 3/3] input: misc: pm8941-pwrkey: avoid potential null
 pointer dereference
Message-ID: <YenpwnE3WrIEAOlm@ripper>
References: <20220120204132.17875-1-quic_amelende@quicinc.com>
 <20220120204132.17875-4-quic_amelende@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120204132.17875-4-quic_amelende@quicinc.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu 20 Jan 12:41 PST 2022, Anjelique Melendez wrote:

> From: David Collins <collinsd@codeaurora.org>
> 
> Add a null check for the pwrkey->data pointer after it is assigned
> in pm8941_pwrkey_probe().  This avoids a potential null pointer
> dereference when pwrkey->data->has_pon_pbs is accessed later in
> the probe function.
> 
> Change-Id: I589c4851e544d79a1863fd110b32a0b45ac03caf
> Signed-off-by: David Collins <collinsd@codeaurora.org>
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---
>  drivers/input/misc/pm8941-pwrkey.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> index 0ce00736e695..ac08ed025802 100644
> --- a/drivers/input/misc/pm8941-pwrkey.c
> +++ b/drivers/input/misc/pm8941-pwrkey.c
> @@ -263,6 +263,10 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>  
>  	pwrkey->dev = &pdev->dev;
>  	pwrkey->data = of_device_get_match_data(&pdev->dev);
> +	if (!pwrkey->data) {

The only way this can happen is if you add a new compatible and forget
to specify data and when that happens you will get a print in the log
somewhere, which once you realize that you don't have your pwrkey you
might be able to find among all the other prints.

If you instead don't NULL check this pointer you will get a large splat
in the log, with callstack and all, immediately hinting you that
pwrkey->data is NULL.


In other words, there's already a print, a much larger print and I don't
think there's value in handling this mistake gracefully.

Regards,
Bjorn

> +		dev_err(&pdev->dev, "match data not found\n");
> +		return -ENODEV;
> +	}
>  
>  	parent = pdev->dev.parent;
>  	regmap_node = pdev->dev.of_node;
> -- 
> 2.34.1
> 
