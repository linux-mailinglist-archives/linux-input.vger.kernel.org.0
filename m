Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA41132FCC0
	for <lists+linux-input@lfdr.de>; Sat,  6 Mar 2021 20:29:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbhCFT2z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Mar 2021 14:28:55 -0500
Received: from mail-ot1-f43.google.com ([209.85.210.43]:45489 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhCFT20 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Mar 2021 14:28:26 -0500
Received: by mail-ot1-f43.google.com with SMTP id d9so5241580ote.12;
        Sat, 06 Mar 2021 11:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=5SNSAM5E65XcMxL5cAjZSiL26gAUzQ/0J5AODu6jDRY=;
        b=syPeSPNCuXa2MIGuJvXP1Z+a+pht9Ao1VDVtQH3hBQ70ApDmcrB+2xicb9+BAMZ8Xh
         uvzswu+43s/ssiN+emTpyqGQizKWhKm2KxD36e9aqLiVUSi9XUFBpe+tajyYtYSemwbK
         lcm551bhYfAK+ZWYLF60aMtt17eLFL6g919kUfMfN98jFdCQ4Htz/oDYzXLKBxdBGC2K
         dmj0G2Cfeo0ja7VRnR+4vDkTYCq0i2UK7LITD0X4G7lLpS7YsL+4T9MP3kcTJYgju81U
         Hex4O0znupm00SVdnWsdg8VcnNuNGRyIwoIjx/UNl4UMXUbeILab71EUl7wd2tEpzjjU
         WwaA==
X-Gm-Message-State: AOAM530q8Mv9xr4tuaNYNnYaudB/Fn1d6cl5dPWCn1yWNiWtzW+ua6sL
        rQWbIxckO9ZDhkZqoWlNgw==
X-Google-Smtp-Source: ABdhPJzIBNNbMGn/mivFil/iLzPsKERicom3xi1GgWmv8MOPu0XmO0hksS7BHqKm2MsuJEbWbQEvJw==
X-Received: by 2002:a9d:6c0a:: with SMTP id f10mr6856396otq.250.1615058904942;
        Sat, 06 Mar 2021 11:28:24 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.102.249])
        by smtp.gmail.com with ESMTPSA id u15sm1327560oiu.28.2021.03.06.11.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 11:28:23 -0800 (PST)
Received: (nullmailer pid 1058181 invoked by uid 1000);
        Sat, 06 Mar 2021 19:28:21 -0000
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Giulio Benetti <giulio.benetti@micronovasrl.com>
In-Reply-To: <20210305163834.70924-3-giulio.benetti@benettiengineering.com>
References: <20210305163834.70924-1-giulio.benetti@benettiengineering.com> <20210305163834.70924-3-giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Date:   Sat, 06 Mar 2021 12:28:21 -0700
Message-Id: <1615058901.069674.1058180.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 05 Mar 2021 17:38:33 +0100, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
> This adds device tree bindings for the Hycon HY46XX touchscreen series.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  .../input/touchscreen/hycon,hy46xx.yaml       | 130 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/input/touchscreen/hycon,hy46xx.yaml#

See https://patchwork.ozlabs.org/patch/1448030

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

