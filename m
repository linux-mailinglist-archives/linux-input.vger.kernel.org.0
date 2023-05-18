Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1B727086AB
	for <lists+linux-input@lfdr.de>; Thu, 18 May 2023 19:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjERRWG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 May 2023 13:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjERRWF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 May 2023 13:22:05 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BD0E40
        for <linux-input@vger.kernel.org>; Thu, 18 May 2023 10:22:04 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-76c626eb5d1so53078739f.0
        for <linux-input@vger.kernel.org>; Thu, 18 May 2023 10:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684430524; x=1687022524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+rwc/rApgwI+dAA3an+HwUXLn0bCgY2XPrm6uv+NV8=;
        b=PSkpNA7fOT3HlIDrptAtDnmWIkRRMc4Vb6U+89YAScGhdQHDFjWODzeaeEb0ildOfT
         DHq7xm1T2OeJwmp/JH+voIrMmT4rZ00OgaaIxi829J6h76qeJxk6RCCZmIwogCM1lMFA
         c2Rcp0rhKT0noWiCNdw35AKYJKsHYBxepNlnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684430524; x=1687022524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+rwc/rApgwI+dAA3an+HwUXLn0bCgY2XPrm6uv+NV8=;
        b=OSOU3auPpckO2QI4/5JUrCrWKonKmK9aj45EY/zKr9zsw1cM5mkk5MzCyoFRd03NG0
         oeyC8vMkVQ/X/VxR+Z5ZEa4a2t/Qv04g2DILMiu04N2a9Tlc1IGugDL8eR3yh1aaBOdS
         5GZZ25oF148vmty3Mi5lGuVl+ySCWCB8mklxmuYFKJjYrl0jHcEr2LAMRKpaQZn8wF1P
         7zcdywkJI9kbYJhL4fTCJ+BMj1mJPA9vNUhmTBIlhyNKAXmxJomhMw7GLEf2ocRIwXeu
         rPr0VXFfyug+3Ha5elUUE823gl/wRqHkm1q6tVoQZW3hN3//K+Q1RUHuq5LxMbES+4E1
         92QA==
X-Gm-Message-State: AC+VfDxI0xZ80YDffmk6DttuvJqG2YNDVIVmjWiDD0hE1B256K6QlQaK
        xSBGGNRJP9qGKQuarVHvw1DGeQ==
X-Google-Smtp-Source: ACHHUZ4xpFmaILiALVMeKbWql3sTKBfxXBgu4a4uW2vPQDggszF/w0P10vH9UKIpccuG6QCBHY5hYQ==
X-Received: by 2002:a6b:4f0f:0:b0:760:f795:ccdf with SMTP id d15-20020a6b4f0f000000b00760f795ccdfmr6571153iob.8.1684430524165;
        Thu, 18 May 2023 10:22:04 -0700 (PDT)
Received: from google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id n19-20020a027153000000b0040f9af9237asm604223jaf.41.2023.05.18.10.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 10:22:03 -0700 (PDT)
Date:   Thu, 18 May 2023 11:22:02 -0600
From:   Raul E Rangel <rrangel@chromium.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] Input: libps2 - fix NAK handling
Message-ID: <ZGZeuuh1KmWsMz5q@google.com>
References: <20230511185252.386941-1-dmitry.torokhov@gmail.com>
 <20230511185252.386941-5-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511185252.386941-5-dmitry.torokhov@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 11, 2023 at 11:52:44AM -0700, Dmitry Torokhov wrote:
> Do not try to process "resend" or "reject" responses from the device
> as normal response data for a command.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/serio/libps2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/serio/libps2.c b/drivers/input/serio/libps2.c
> index d09450eca9a7..14b70a78875d 100644
> --- a/drivers/input/serio/libps2.c
> +++ b/drivers/input/serio/libps2.c
> @@ -445,7 +445,7 @@ bool ps2_handle_ack(struct ps2dev *ps2dev, u8 data)
>  	ps2dev->flags &= ~PS2_FLAG_ACK;
>  	wake_up(&ps2dev->wait);
>  
> -	if (data != PS2_RET_ACK)
> +	if (!ps2dev->nak && data != PS2_RET_ACK)
>  		ps2_handle_response(ps2dev, data);
>  
>  	return true;
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
