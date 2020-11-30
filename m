Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C2D2C8B5E
	for <lists+linux-input@lfdr.de>; Mon, 30 Nov 2020 18:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgK3Ri3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Nov 2020 12:38:29 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:39596 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbgK3Ri2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Nov 2020 12:38:28 -0500
Received: by mail-io1-f67.google.com with SMTP id j23so12624409iog.6;
        Mon, 30 Nov 2020 09:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EbxO5evUKiSM0aVpZ7264LVzqvIYud6EcfSFwKJe+00=;
        b=S5F/COts7B7BEtmUHgwCJxIt4a+c3mtXDVfKybVnRE9Xl+YQP5Fm3f5+nZB38/p0AK
         QFOVkUPAU0A9ZwTnKDUS7JC8RjtyC/c86mIQngS3E1xpQ5k0Pp2Low9A8MQ+CKPgb6mm
         euEE9tq34oMu9dFPBvxaQ35siXN+ikS+J8h6N2Ft1C+3rHmz0CQcn0itbcHRuTQuwx1X
         yRr9tG1Di6VqarfHApYbgkYvaPq1NycRqLOO0wbA+5GsBV04snjnpnGgm3NXokZYxl39
         UBCcZk6PeJtgo0QsAkM+lkDwvqUqaHjmMvxfH5jp6u26lOL+bvyo1vAN1lG5tH8qNvn8
         PLow==
X-Gm-Message-State: AOAM533jQ091vd9LX5ntXVC7o44WM69S/i3r0dGsocjOhhPneeF6oizS
        8S5qt5zSLTwKQO1N8xcgAg==
X-Google-Smtp-Source: ABdhPJxvNJsc+yBF/qkTCdkG0iTv3fy8ib/WXMjqHGbHr52Gef3w5tVyMdoRREpVDkBtg7GqqxpG4A==
X-Received: by 2002:a5e:d80f:: with SMTP id l15mr17359037iok.21.1606757867424;
        Mon, 30 Nov 2020 09:37:47 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id r4sm4953747iop.24.2020.11.30.09.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 09:37:46 -0800 (PST)
Received: (nullmailer pid 2685741 invoked by uid 1000);
        Mon, 30 Nov 2020 17:37:44 -0000
Date:   Mon, 30 Nov 2020 10:37:44 -0700
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add Dell Wyse 3020 Power
 Button binding
Message-ID: <20201130173744.GA2684526@robh.at.kernel.org>
References: <20201129142145.1526022-1-lkundrak@v3.sk>
 <20201129142145.1526022-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201129142145.1526022-2-lkundrak@v3.sk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 29 Nov 2020 15:21:44 +0100, Lubomir Rintel wrote:
> Add binding document for the Dell Wyse 3020 a.k.a. "Ariel" Power Button.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> Changes since v1:
> - Collect Rob's R-b
> 
>  .../bindings/input/ariel-pwrbutton.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/ariel-pwrbutton.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/ariel-pwrbutton.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/ariel-pwrbutton.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/input/ariel-pwrbutton.yaml


See https://patchwork.ozlabs.org/patch/1407831

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

