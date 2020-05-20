Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929EA1DBAE0
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 19:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgETRNa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 13:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgETRN2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 13:13:28 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBEEC061A0E;
        Wed, 20 May 2020 10:13:28 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 23so1866245pfy.8;
        Wed, 20 May 2020 10:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=arFxXWIilJc8yilr6THATlL+mM94NJsqQ+xYHRPI28o=;
        b=eQ8ZueCAAmKF481dSsTzEfptXR3E56PhUUH9kEaE5lcwybZBOx13OC+Xi9wkqf8yJl
         eMd1L2e88OjzLZqUwjft5kT4q1ykz42UQV6MVOEia2NuXW7QNNZ7A34YWkJl2fTeKnXd
         x57lOvCSMymfWq5CIUCMSTFmCQ+QTFXWfQxGIl0MyJIAsxvIWaGoYNiaL9FYDbjjsASH
         yrczDke/1e9q5QAzunll1NsU34AZd3fkwQAvuZ8SyOMsHhrXwdE+C5ocxHRWMG94nAuo
         mFEYgVnx+pQB6bpLbpXdPCQm3xxHlbpl8IjeNyIIG5xyCXVHShY2DHAh3VorO1Fq2dCg
         0CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=arFxXWIilJc8yilr6THATlL+mM94NJsqQ+xYHRPI28o=;
        b=P2vjEHQ9VpwPhDtvoFr5CY/Z/Uil7iUvKz0eU+UOO48q1oM+iWteBSQmDqzBOjIBw1
         dxLbmqEBWWJsa6b7Psk+5GkQcGk4dY9m6wZIFDNFd2XmgxShF21VXw27C9ioXh6ZWFYn
         iCFeuV2ykQXQE+mM9AieND7fQizRm+xX5NY1BUSxKeCS4h7GRdLwDBVO/kvGGPQpSUyk
         tuL2Zp0AJuuREaoS34pnFB5jXBX8JXjZsYh8Uk6olVG0G5tKt+wzUep4PgDtGMmgjhqt
         KrqVYd8ck39aj2OyQ9ZDhMEHQDF+agPPKw+fuNCt+nazZ121qIf7PDZSh6v669KPr9Aw
         uOxA==
X-Gm-Message-State: AOAM530wd0LcDgNuhXOoeRM0JhTm/wO5pLtGEA2sU4I34Z5465jafcO7
        dXsO/xO0pAt8WLLqQyZ3sJg=
X-Google-Smtp-Source: ABdhPJzPAJW/ATUYvu+6WYxM82y1cMxLnDMGV4gQ97nd84re0gsoxcS0Os/XSLxbUD3hZDiX3Ghrxw==
X-Received: by 2002:a05:6a00:150e:: with SMTP id q14mr5106146pfu.325.1589994807327;
        Wed, 20 May 2020 10:13:27 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id e1sm2512647pjv.54.2020.05.20.10.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 10:13:26 -0700 (PDT)
Date:   Wed, 20 May 2020 10:13:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: edt-ft5x06: change reg
 property
Message-ID: <20200520171324.GS89269@dtor-ws>
References: <20200520073327.6016-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520073327.6016-1-jbx6244@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Johan,

On Wed, May 20, 2020 at 09:33:27AM +0200, Johan Jonker wrote:
> A test with the command below gives this error:
> 
> arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml:
> touchscreen@3e: reg:0:0: 56 was expected
> 
> The touchscreen chip on 'rk3188-bqedison2qc' and other BQ models
> was shipped with different addresses then the binding currently allows.
> Change the reg property that any address will pass.
> 
> make ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/touchscreen/
> edt-ft5x06.yaml
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> index 383d64a91..baa8e8f7e 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> @@ -42,7 +42,7 @@ properties:
>        - focaltech,ft6236
>  
>    reg:
> -    const: 0x38
> +    maxItems: 1

Should we have a list of valid addresses instead of allowing any
address? Controllers usually have only a couple of addresses that they
support.

Thanks.

-- 
Dmitry
