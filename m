Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAEFC584E1F
	for <lists+linux-input@lfdr.de>; Fri, 29 Jul 2022 11:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbiG2JhM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Jul 2022 05:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233485AbiG2JhM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Jul 2022 05:37:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE6184F674
        for <linux-input@vger.kernel.org>; Fri, 29 Jul 2022 02:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659087429;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/azwi5xIgQ96LQP0a/nNpm5S5erGJtWP4pb2ZOi6mo=;
        b=DKEEiA/bCGw9ypdnBSpIpU6xRBVaUo361zYK9a2Qp1EXoL3naUUQfdGc6f3iY7r8fZ/FoE
        RSVEOY8eO/7lhQ0VoO62cbPircd58zMZJOMDo8Y7/NRpsgjQ9eITiB744Nm7fsY+eyv55A
        fZsiXqesrNhRl1ptARDtPtAugkALKi4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-48mvyMqlMkSjj0xPYTDajQ-1; Fri, 29 Jul 2022 05:37:07 -0400
X-MC-Unique: 48mvyMqlMkSjj0xPYTDajQ-1
Received: by mail-ej1-f69.google.com with SMTP id hv22-20020a17090760d600b0072f2cce7d10so1589446ejc.19
        for <linux-input@vger.kernel.org>; Fri, 29 Jul 2022 02:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T/azwi5xIgQ96LQP0a/nNpm5S5erGJtWP4pb2ZOi6mo=;
        b=OMg/68hIlv0hXtL70ZgJqHIE/fHAIckYFdFWiXD+RJU728Z3Vi9k17+eLGBq3yQ+qb
         5O0dmkx3P1RggGDdicGnzpuHOFvXhSIBwILgFJ+gROxR/l0pcL5g2yg3AterymsEDxwk
         FmDeFvMhLDd5x9q1bvjVdNBLUTXk4oRXZ+UCpkyUNi0GNOIhppgSsqstE2ZmY/Q14oVb
         +zhXKbKGLgFheU9f1JCRhGRvLPCjDMFwuweXD9aV0nDs11VYhyXLMpQcUN4FplElIP1E
         oDrZQrua55x6kl9CbXq15o+/cvmRzrp/8ObNyCQUW2kAujsSlukNvqc6mi52fyR70ujS
         /2ZQ==
X-Gm-Message-State: AJIora+rEfLzFYskQWW/5b9jQODMZ77gPTN68ieKY/rLies2u84gYyUB
        eSZuA9nF1IyQ+ClenFQklq3uHn/5NytmmbDdHsFD86be/CYsAx2MTAtGe83+U+h2ttJiF2pfAFA
        YPHWHt0ScaAH6fMtdY9f0eew=
X-Received: by 2002:a17:906:cc5d:b0:72b:1313:cd09 with SMTP id mm29-20020a170906cc5d00b0072b1313cd09mr2251995ejb.482.1659087426146;
        Fri, 29 Jul 2022 02:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s51YOo+r58iUpfCWiOhjJpZG04z8VDPZ8mhA7GfyhtmLhHCcOW3IpvQv/CpeLKODkvc4jx9w==
X-Received: by 2002:a17:906:cc5d:b0:72b:1313:cd09 with SMTP id mm29-20020a170906cc5d00b0072b1313cd09mr2251981ejb.482.1659087425976;
        Fri, 29 Jul 2022 02:37:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b22-20020aa7dc16000000b0043d2424aeefsm545033edu.87.2022.07.29.02.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jul 2022 02:37:05 -0700 (PDT)
Message-ID: <6dba3316-ddb9-c876-06ea-90312fda0ffb@redhat.com>
Date:   Fri, 29 Jul 2022 11:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] Input: Fix comment typo
Content-Language: en-US
To:     Jason Wang <wangborong@cdjrlc.com>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220725042903.4954-1-wangborong@cdjrlc.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220725042903.4954-1-wangborong@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 7/25/22 06:29, Jason Wang wrote:
> The double `we' is duplicated in the comment, remove one.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/touchscreen/chipone_icn8505.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/chipone_icn8505.c b/drivers/input/touchscreen/chipone_icn8505.c
> index f9ca5502ac8c..ea98657e6e49 100644
> --- a/drivers/input/touchscreen/chipone_icn8505.c
> +++ b/drivers/input/touchscreen/chipone_icn8505.c
> @@ -285,7 +285,7 @@ static int icn8505_upload_fw(struct icn8505_data *icn8505)
>  
>  	/*
>  	 * Always load the firmware, even if we don't need it at boot, we
> -	 * we may need it at resume. Having loaded it once will make the
> +	 * may need it at resume. Having loaded it once will make the
>  	 * firmware class code cache it at suspend/resume.
>  	 */
>  	error = firmware_request_platform(&fw, icn8505->firmware_name, dev);

