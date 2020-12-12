Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670CB2D8419
	for <lists+linux-input@lfdr.de>; Sat, 12 Dec 2020 04:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgLLDFD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 22:05:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437990AbgLLDE6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 22:04:58 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A21C0613CF;
        Fri, 11 Dec 2020 19:04:18 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id v3so5589117plz.13;
        Fri, 11 Dec 2020 19:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=munrt+lhXv+uJg/N5N5WzdrCtcarWc53yAhr+k4WCKs=;
        b=Q8yADwDyaQ+yOB+1SPblDyj2k/ml8OXk2FBOvI7z3HelF4Lm2QiyLmiG6iyBxLe8wJ
         pXi186aukCywRl1fEvKfdeAhm78U3HUm+yid2usrEb7KFzKQg/lSefFbVKA8omCkWA+Z
         TK8qfjrvatBwngHiaofAIIOyLG1xVGrf6mMfmrFPLy+k/zwGySZdJuj9ZZ7RUu3DWChi
         w2ZsSt6c7o9rX57IEq80Ak+zbqLllo87/mdylHIm9gKBhn9bFMZkKBv7J2R9AugUKSVf
         kUksObcl0UXuYnWv3UZfbIbiM7g8LCNDsO8E9oFTOxtycROV2EPy8C4+cqbDdcbgAVeR
         4WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=munrt+lhXv+uJg/N5N5WzdrCtcarWc53yAhr+k4WCKs=;
        b=NfcD9RRWt4OHPQdo4Vb7bN3CsZlD7S6vkV8j0swUD+OlSOEdVXGipIo7lQrD4rsomz
         RVGOlA2Q9+Ykzuy1DI/kAxVkpby4DJGvSCYSYd/W3ebf6Jr9Y1HVmvUuFDzhMbPx69ty
         jyniiuGfKP/KPppJC42hs95TH/5D2smw1g4FfprPfnZfy2ZG9DcHd3B2p3LKLLTvJc3r
         J4GVbGHCVvYqh7YCJMmg0mAFJQ0cgZ824F1n1LtxuFgxHVljIRiX2UhGSXsnXV7+mmAX
         0PQTqEUETbxN2ZCXxebXq1fmjX7vcj0NLZH95XEzTXlm69KMJy7jGXunc2IITbd2mgXb
         0H8A==
X-Gm-Message-State: AOAM532KHUKsnFUCGn8oAjHbUU3MMMwtb0FxsM7C6KlB9HdTzC5qE64R
        xFr8KgIvHn91b/oLmVWy0J2TNCht6VhZuA==
X-Google-Smtp-Source: ABdhPJxV18jEQvEmrqkLqutdJI3tQJaofnhUF3/ZaudMLXfS1CT0TmxtwWlegr6DQJ08ROwf6sqW5A==
X-Received: by 2002:a17:90a:17a4:: with SMTP id q33mr1532114pja.0.1607742257159;
        Fri, 11 Dec 2020 19:04:17 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h36sm12362983pgb.28.2020.12.11.19.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 19:04:16 -0800 (PST)
Date:   Fri, 11 Dec 2020 19:04:13 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Nemo Han <nemo.han@unisoc.com>
Subject: Re: [PATCH v2 1/3] input: sc27xx: Add support for sc2730 and sc2721
Message-ID: <X9QzLcbk8ZrWbFH9@google.com>
References: <20201117034949.47877-1-zhang.lyra@gmail.com>
 <20201117034949.47877-2-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117034949.47877-2-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chunyan,

On Tue, Nov 17, 2020 at 11:49:47AM +0800, Chunyan Zhang wrote:
> @@ -78,8 +112,15 @@ static void sc27xx_vibra_close(struct input_dev *input)
>  static int sc27xx_vibra_probe(struct platform_device *pdev)
>  {
>  	struct vibra_info *info;
> +	const struct sc27xx_vibra_data *data;
>  	int error;
>  
> +	data = of_device_get_match_data(&pdev->dev);
> +	if (!data) {
> +		dev_err(&pdev->dev, "no matching driver data found\n");
> +		return -EINVAL;
> +	}

This does not have to be OF-specific, so I changed it to
device_get_match_data() and applied, thank you.

-- 
Dmitry
