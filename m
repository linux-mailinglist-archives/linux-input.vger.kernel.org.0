Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C65E45BF8CA
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 10:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbiIUIQC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 04:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbiIUIPa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 04:15:30 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D4813CC9
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 01:14:48 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id cc5so8544455wrb.6
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 01:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=88fl1KjxH+TC0ayPpqWy6RpDyiGrIBkoUgO6gt75sRU=;
        b=NxX7Ys2YHD+I+HV5YOjR+r2AXAgSCvjl1jbaEqXDNF0xB+dwJiaeirV+gmuvc/Q6c7
         7mrk+JI1Z1hZUO+cKdc3Ovc4u2hJaYaBGh4Rh7tzmD5aeddxybL2+smnSaHFc992V36W
         qOfE32F81bN551eHkW15ma+esaWQfxhAgWODv4m5Jf76/+EpfSkQXwJZvov73DDWq+hV
         q0fujIEumCV6DfjYU41T3wHSGSWYxkHqeJcrBIIc5TOIZEtsYPGjhinbCYnmSINP22lJ
         rv8haIsdqHsOecnPTviP3OJvquEK75T1+G4egAKEhbrfBIKYYC1/9gbFQ7i02zwn0LJp
         I4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=88fl1KjxH+TC0ayPpqWy6RpDyiGrIBkoUgO6gt75sRU=;
        b=OnQ8KMl3GzYo3QB0T7x5C7TQdXu1KIGn2DQ/FHmiuVGF2+/aDhFWpwG+467+Ca9hVw
         4H8xQg2pHr8dpJwRFFEKzjXj/07v7g6Om2Hj4kV6VnkhfDHvbtM4PCqZzLc17Mtp71QX
         8MkgVjOE/8GZQsryyx5x3Au78ll0MuMhflxcaRYkwaOYdTxloOTpLQ3rEZTVEVSGVq5c
         j5PxbbtDDGwL5ev/d0AnFDfdMLu4KxIzEry1w3vYXpmslUvPsPrktxSZvf3P7LxJlBBC
         BCyAgZX+0tz175mn7OaxW+9nHT+zsTo+RGXG8gCUhaKiy3GQZHxN34OQEKP2sxi/pE1B
         +ZaQ==
X-Gm-Message-State: ACrzQf20tEOAUzvliYwuxWVO2SWu117Xmg6vZPE1KrLio6deQRCstXy2
        iQQq+7wFBmj5FsZpPulou9/XMuPVRasFFSJu
X-Google-Smtp-Source: AMsMyM6QYsRKY+MYhj8RsY0DifaD5cs7pdGWK/E/8QpQiJlufPTkyMGP9Evimyzqk+iMChArtT2qoQ==
X-Received: by 2002:a5d:46ce:0:b0:22a:f992:42b4 with SMTP id g14-20020a5d46ce000000b0022af99242b4mr9707132wrs.108.1663748086702;
        Wed, 21 Sep 2022 01:14:46 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:f502:f399:73e9:2999])
        by smtp.gmail.com with ESMTPSA id m18-20020a5d56d2000000b0022878c0cc5esm1804470wrw.69.2022.09.21.01.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:14:46 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: Re: [PATCH] Input: iqs62x-keys - drop unused device node references
In-Reply-To: <YyYbYvlkq5cy55dc@nixie71>
References: <YyYbYvlkq5cy55dc@nixie71>
Date:   Wed, 21 Sep 2022 10:14:45 +0200
Message-ID: <87czbp9ma2.fsf@baylibre.com>
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

On sam., sept. 17, 2022 at 14:09, Jeff LaBundy <jeff@labundy.com> wrote:

> Each call to device/fwnode_get_named_child_node() must be matched
> with a call to fwnode_handle_put() once the corresponding node is
> no longer in use. This ensures a reference count remains balanced
> in the case of dynamic device tree support.
>
> Currently, the driver never calls fwnode_handle_put(). This patch
> adds the missing calls.
>
> Fixes: ce1cb0eec85b ("input: keyboard: Add support for Azoteq IQS620A/621/622/624/625")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/keyboard/iqs62x-keys.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
> index 93446b21f98f..db793a550c25 100644
> --- a/drivers/input/keyboard/iqs62x-keys.c
> +++ b/drivers/input/keyboard/iqs62x-keys.c
> @@ -77,6 +77,7 @@ static int iqs62x_keys_parse_prop(struct platform_device *pdev,
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to read switch code: %d\n",
>  				ret);
> +			fwnode_handle_put(child);
>  			return ret;
>  		}
>  		iqs62x_keys->switches[i].code = val;
> @@ -90,6 +91,8 @@ static int iqs62x_keys_parse_prop(struct platform_device *pdev,
>  			iqs62x_keys->switches[i].flag = (i == IQS62X_SW_HALL_N ?
>  							 IQS62X_EVENT_HALL_N_T :
>  							 IQS62X_EVENT_HALL_S_T);
> +
> +		fwnode_handle_put(child);
>  	}
>  
>  	return 0;
> -- 
> 2.34.1
