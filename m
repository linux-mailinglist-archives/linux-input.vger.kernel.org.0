Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0AC5A53E0
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 20:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiH2STN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Aug 2022 14:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiH2STM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Aug 2022 14:19:12 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF9F9C8C9
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 11:19:12 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t11-20020a17090a510b00b001fac77e9d1fso15485215pjh.5
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=egB32viCV9wLPvnXGpKq0hTRIs3w0koWG8REaAywSgM=;
        b=L2UzZDpnypl6BeO2lO/FsYDi4nGQ1cosg1Zq22zJueVlzaUMUSXL1icSMEF/Eyej7O
         EpJKRjdoCBanHEHUGKNZa7NVhmumoG5kjgzWENPdPjat2A/IpzGthZJSaijXyJLDrixB
         tngnTNth0QPXjF5F9FE6iAM7A6CvuU/wVyXlwiQO8kKyqIf3sp1tzXf5HUS/Hcqx1Ct2
         o8RFbN8CPFYfGOobaxvIc/dC4JfRIbXfM3YaVgYg8NqfhOD5QrK/DeINmrp6W7QfqJAl
         UlREO+k8Bm5rEIcGe6ARKJmkZmixW6qvuV/+6A9AJU4n0rWEX1yzXNpM6gUV5rpmFUdw
         02Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=egB32viCV9wLPvnXGpKq0hTRIs3w0koWG8REaAywSgM=;
        b=10imkq+xNU2uO/UV/QFAd2bF1z+dwLnk6QNvH50UZIolItW4fCDak3Bl83OaQL+pFU
         GmUOsfaus77ZYkNZHbiERuSP9ciHypLd0N45iubGOgK4642GwpCGY6v++1eiKqWXrwF7
         7317wnlmGy3t6IzckAVX861biOYqE71vdfybbacn/puL2PAVEpizEtiLU62TcUv4szb1
         M2oDuVbW8AfR/WgWdj3dmtXRYigPaQi+LE8M1Gh+31jkBggKbCZxP0XU9dBMUTcDCjGx
         eWPc5mCJFsTB6z9D4D4rEFB7tV/HDPO4bht2dLsq8ScFgQTY2CUMjXA0NR1dg4JWbHj4
         MXDQ==
X-Gm-Message-State: ACgBeo0SGp9fNIg4ZN6T58RBkWubOxT7CfHCxGa0ZNRpPhPlk1Y+G/ID
        1j/h0359wJPPHnutDMnlEBDbunZ0hQA=
X-Google-Smtp-Source: AA6agR5DUawLcdAcccFXAMVnMjnALeQvf3FwX+jEqeVUODD24NNkMUT1LjMoqQZYfBEBaLegKf+sBA==
X-Received: by 2002:a17:90b:33c4:b0:1fb:6311:db94 with SMTP id lk4-20020a17090b33c400b001fb6311db94mr19396025pjb.65.1661797151145;
        Mon, 29 Aug 2022 11:19:11 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a95a:58fc:2b39:1c99])
        by smtp.gmail.com with ESMTPSA id 185-20020a6205c2000000b005383988ec0fsm2701819pff.162.2022.08.29.11.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:19:10 -0700 (PDT)
Date:   Mon, 29 Aug 2022 11:19:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Tulli <greg.iforce@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: iforce - add missing vendor and product ids to
 the Unknown device name
Message-ID: <Yw0DHEQ4yQa60OzA@google.com>
References: <CAKEH-64P5HTWtqrgGoS4RF74XXOvnDZ4o5z2bx7LZ=9r=3tsjw@mail.gmail.com>
 <edc347e3-52d8-9621-c3f1-5c3872d95fcb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edc347e3-52d8-9621-c3f1-5c3872d95fcb@gmail.com>
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Greg,

On Mon, Aug 29, 2022 at 11:45:18AM +0200, Greg Tulli wrote:
> 
> An unknown iforce device is named "Unknown I-Force Device
> [%04x:%04x]". The vendor and product ids should be substituted.
> 
> Signed-off-by: Greg Tulli <greg.iforce@gmail.com>
> ---
> 
> diff --git a/drivers/input/joystick/iforce/iforce-main.c b/drivers/input/joystick/iforce/iforce-main.c
> index b2a68bc9f0b4..6de5d06d2bd0 100644
> --- a/drivers/input/joystick/iforce/iforce-main.c
> +++ b/drivers/input/joystick/iforce/iforce-main.c
> @@ -323,7 +323,11 @@ int iforce_init_device(struct device *parent, u16 bustype,
>  			break;
>  
>  	iforce->type = iforce_device + i;
> -	input_dev->name = iforce->type->name;
> +	if (iforce_device[i].idvendor)

If we are using iforce->type then we should say

	if (iforce->type->idVendor)

> +		input_dev->name = iforce->type->name;
> +	else
> +		input_dev->name = devm_kasprintf(parent, GFP_KERNEL, iforce->type->name,
> +			input_dev->id.vendor, input_dev->id.product);

This needs error handling.

>  
>  /*
>   * Set input device bitfields and ranges.

Thanks.

-- 
Dmitry
