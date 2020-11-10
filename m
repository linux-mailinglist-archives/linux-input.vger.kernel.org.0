Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7046D2AD7E4
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 14:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730617AbgKJNno (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 08:43:44 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34858 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730099AbgKJNno (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 08:43:44 -0500
Received: by mail-oi1-f194.google.com with SMTP id c80so14350735oib.2;
        Tue, 10 Nov 2020 05:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WpFVE6ofl5+PZ7ETLOM4YJeMuugBjXN/ryVQoNcTj3w=;
        b=iiwbustvPPGhdGy0jQt5BjOUWl/JCSLciOZAIiraoAC7xC2ohe8H1i4OeKTK/NbZ4I
         QMorKb0wOApDEZSnZYwes1Xp42Ls6jmd/W08MAasDycHQcXseppaFIRaqZJeFYD2XfVo
         IZrsqFxcVXSAfJ6bRPl5w7MQiY6FqZHsrPNjyEPEkCD15WBhsaA6Ba9AfITas7tuLBwu
         N5LIWgDMhTtsF2GpjTNHZHddfkoAf1TQkcnlgpxWPIovmm7ARzjdGpOIt1tUCIzAoRaT
         cipMI3P+TDGHJvdkT6VZAD38pxuiniN09njqwmp0bCV/Zx/6QmFICDJJNysLh0+bgBd6
         lOrg==
X-Gm-Message-State: AOAM531fPU8HCIZxpK1oTD1iXKpYR/A9LX7oTu2cc1r3lZiV8CbBcCLj
        afgZppNCePnAt4OxO3WRCHUJHK3aHw==
X-Google-Smtp-Source: ABdhPJxLq0HuK77T+P1JhbEOUFMIPB7pENYAAjIDpcPFoqU5pJqnjH9fqPQkwQ4DHmeCnkrjJ4qD0A==
X-Received: by 2002:aca:4387:: with SMTP id q129mr2827367oia.108.1605015822787;
        Tue, 10 Nov 2020 05:43:42 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a23sm3117370oot.33.2020.11.10.05.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 05:43:42 -0800 (PST)
Received: (nullmailer pid 3068702 invoked by uid 1000);
        Tue, 10 Nov 2020 13:43:40 -0000
Date:   Tue, 10 Nov 2020 07:43:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andrej Valek <andrej.valek@siemens.com>
Cc:     dmitry.torokhov@gmail.com, nick@shmanahar.org, hadess@hadess.net,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: touchscreen: goodix: add info about
 disabling FW loading
Message-ID: <20201110134340.GA3068076@bogus>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
 <20201110090720.6650-3-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110090720.6650-3-andrej.valek@siemens.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 10 Nov 2020 10:07:18 +0100, Andrej Valek wrote:
> Add information about option how to disable FW loading for each boot.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml: properties:goodix,do-not-load-fw: False is not of type 'object'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml: ignoring, error in schema: properties: goodix,do-not-load-fw
warning: no schema found in file: ./Documentation/devicetree/bindings/input/touchscreen/goodix.yaml


See https://patchwork.ozlabs.org/patch/1397438

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

