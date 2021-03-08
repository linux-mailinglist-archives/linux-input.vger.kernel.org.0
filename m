Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4A3331847
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 21:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhCHUNp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 15:13:45 -0500
Received: from mail-io1-f52.google.com ([209.85.166.52]:34671 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbhCHUNd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 15:13:33 -0500
Received: by mail-io1-f52.google.com with SMTP id o11so11400474iob.1;
        Mon, 08 Mar 2021 12:13:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0xy+8GBNFB8v7Q8o1J++zwVaGoqF/2Cs1YxTIRsnqpE=;
        b=PkDoao9WdDuhuIsswjw1LaAaBwX+MgHn8uIi43iGdRPSaG68DctlJHk4NI8Ayn1JZ/
         V8rq90ojcDLii1Rr+YmTNosXP4rmhXrmiDwDFTExhwuLyJ/y/B4NhwbYvZTO2xTN19re
         KwSMjlUoR1r3If+vhev7Z+eKk6i2rZA17naCSTlVSSJQABV6479E6gDIL7qf6ePWX1N9
         tTvRrgp/HGAt5MVoXEupssWlloGZS+xJqzpWZhf9otkyQk/s4MSTYs5g08Fn6juFhdXu
         wj7YWrzLUUSQakAZMTVudLMzx6/MA7J4nKLbT9n4fYCv6mV8K6sswlXfuO/ZUTK1KXub
         NIaQ==
X-Gm-Message-State: AOAM533sLDyY38c7pY0DXSMC1ieBdUWWZuI+02DO3D79G+5IXvS1i92Y
        0ge2YkbxRhs8ndGJz/VZ+Zbx/4oZFA==
X-Google-Smtp-Source: ABdhPJyiOddfKIeGSGT+sVeLmUwwQTuWI+YLPWY9AolpDGnovi1vt1grPdEW5EGXXztSu1u+m9kAiA==
X-Received: by 2002:a5e:840a:: with SMTP id h10mr20400527ioj.206.1615234412440;
        Mon, 08 Mar 2021 12:13:32 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 5sm6646410ill.20.2021.03.08.12.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 12:13:31 -0800 (PST)
Received: (nullmailer pid 2886558 invoked by uid 1000);
        Mon, 08 Mar 2021 20:13:29 -0000
Date:   Mon, 8 Mar 2021 13:13:29 -0700
From:   Rob Herring <robh@kernel.org>
To:     Joe Hung <joe_hung@ilitek.com>
Cc:     luca_hsu@ilitek.com, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: input: touchscreen: ilitek_ts_i2c:
 Add bindings
Message-ID: <20210308201329.GA2886497@robh.at.kernel.org>
References: <20210304055724.63695-1-joe_hung@ilitek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304055724.63695-1-joe_hung@ilitek.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 04 Mar 2021 13:57:23 +0800, Joe Hung wrote:
> Add binding documentation for ILITEK touch devices.
> 
> Signed-off-by: Joe Hung <joe_hung@ilitek.com>
> ---
> Changes in v5:
>   - Remove tab in yaml
> 
> Changes in v4:
>   - Change IRQ flag to level interrupt
>   - Add support for common touchscreen-related properties
>   - Modify reset gpio to active low
>   - Modify irq type to LEVEL_LOW
>   - Add compatible for Lego series ICs
> 
> Changes in v3:
>   - Add include header in examples, and pass the dt binding check
> 
> Changes in v2:
>   - Convert to DT schema format
>   - Using interrupts instead of irq-gpios
> 
>  .../input/touchscreen/ilitek_ts_i2c.yaml      | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
