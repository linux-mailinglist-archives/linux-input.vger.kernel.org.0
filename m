Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8F93437CB
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 05:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhCVEHZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 00:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhCVEHA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 00:07:00 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921C0C061574;
        Sun, 21 Mar 2021 21:06:59 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so9745261pjc.2;
        Sun, 21 Mar 2021 21:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ES4QZ8JcCzo/NXPF4nKmm6dJiLQoc+Re/EHJIlgtzeM=;
        b=S/ZGg6b+Kjl2MJQI7Qex4yvjX2fvqwGMxbdLCJ9pVbXXLZkdt90ELCvhrPdd9Hw8GR
         WKWL3ofbkLcVlccMVs/ogQ/IWNSxTgeOdf2LFpMGczX2hyWHdl7IwbIEXe7iuslCPy7R
         UEFuXvMxAiKjUstTjyn92AvL2cHkr4hbXVBCcF2ol+ie9ybnQsVlTZN4youO/TyprCf0
         1tG/xX3Ov4BNwhuPE6XCBBxm2kOdUB+1gyvjKhEZpXZ/TOIbxFaz8l1h0PTVZf7ryo2x
         Uhs3GAKKApTEPHULADdArcjyZy5KNzVMEr2Y3HwMgVIERwn1skxj9F5DSzCmKbhxxvml
         RurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ES4QZ8JcCzo/NXPF4nKmm6dJiLQoc+Re/EHJIlgtzeM=;
        b=S8Vgq1rx/AIUIyPk1HinTQGAubK0oVFAIL2aK8hxT05CxFAmqkPtkvM8QA4RZlMijQ
         wyLvgkKzwLme6VyU7B9OmT7Hu18VTIgG6r6dROy7AVVDZIWt3mGzPJPpTo4owjeG0WA/
         F8NOnrdip+flD4eiFCZ0Cr5BpN5CfBPxSxJIoCT368q2DamGd5Acru9KL4jI3RmlFRJl
         HPOdAbhtcG6ub3CTieGZ97D+mHyeEz9rqh7v0p6cApxldr2hYktw615P6LlSWJBXp89w
         oQCsvRxd43B6YPdQxOBcRI3fzp4gOBFQlKvWv3g0iqreLbpWn+S4v7cV2kbac5exI8Ks
         kmXw==
X-Gm-Message-State: AOAM530XUq11Vb8fsA9IECyKEqIep56qOvF6/zg9lsXPoPZitrAiNnYV
        NlJCi8NG3UjMYB9eLNRfAaI=
X-Google-Smtp-Source: ABdhPJzQ/mBYMTBxIWQSM0kop0f0zQyRntbnF9OhCvjRm2FFKQb1amqOj9ICOGsw53I1jtbxwVSlRg==
X-Received: by 2002:a17:90a:d911:: with SMTP id c17mr10671090pjv.98.1616386019148;
        Sun, 21 Mar 2021 21:06:59 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id i22sm11308649pjz.56.2021.03.21.21.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 21:06:58 -0700 (PDT)
Date:   Sun, 21 Mar 2021 21:06:55 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 8/9] Input: iqs5xx - make reset GPIO optional
Message-ID: <YFgX37ody0bHwv10@google.com>
References: <20210313191236.4366-1-jeff@labundy.com>
 <20210313191236.4366-9-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210313191236.4366-9-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

On Sat, Mar 13, 2021 at 01:12:35PM -0600, Jeff LaBundy wrote:
> @@ -989,7 +993,11 @@ static int iqs5xx_probe(struct i2c_client *client,
>  		return error;
>  	}
> 
> -	error = devm_device_add_group(&client->dev, &iqs5xx_attr_group);
> +	if (iqs5xx->reset_gpio &&
> +	    iqs5xx->dev_id_info.bl_status != IQS5XX_BL_STATUS_NONE)
> +		attr_group = &iqs5xx_attr_group_bl;

I would prefer if we defined is_visible for the attribute instead of
conditional registration.

> +
> +	error = devm_device_add_group(&client->dev, attr_group);
>  	if (error) {
>  		dev_err(&client->dev, "Failed to add attributes: %d\n", error);
>  		return error;
> --
> 2.17.1
> 

Thanks.

-- 
Dmitry
