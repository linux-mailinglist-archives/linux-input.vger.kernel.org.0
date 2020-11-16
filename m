Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76672B466F
	for <lists+linux-input@lfdr.de>; Mon, 16 Nov 2020 15:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730305AbgKPOyr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Nov 2020 09:54:47 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33822 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728396AbgKPOyr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Nov 2020 09:54:47 -0500
Received: by mail-oi1-f195.google.com with SMTP id w188so19077067oib.1;
        Mon, 16 Nov 2020 06:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H1fyXfriaU5b4SAeacTn2vCNWOWHstHOi6kBAkwLmps=;
        b=Go7vaomOVVHxeTMKCsb/9a4of+7qRb7TrSFKzmwhQr6rZfcuAfwX4/tRrkvI8H2q06
         DugXbHjPUAgbLiJwvCZ3ODBHYSra/B9A4KQjhld3EZMPYnJvlgGI2J7QGWFBFJKhWb/O
         VfE7ivfxmEMHxsMwpz2ykJ5BGN1bRDDOb65r8e1Q4xcLi3PgDe2PgnjZ7x6AZUdrCM32
         8yiduEs0El6oZC+YwOgnLJtqeg1O+HuH0QtXABAH5Ghxb2YZXFjAGsQq81m+AQ8WvhSR
         cY6c5Iv187uad39hoMZg+BCB3NFtUygVwmmFtmYRV2jat1P9i6F6Qw4TioG+X6cLW0Ai
         pVug==
X-Gm-Message-State: AOAM5302Qo6wnv3ZFWemkFji+11KG1t5bSKIx2w/N/IYoghKxXknxPHk
        yTbSj4N6IsYZEv04coqM8Q==
X-Google-Smtp-Source: ABdhPJz5gWioJ8NqYo4oG9SUmUzRw7oWLBP2V+XP7Gx8sDtfeW4CefAXIkAElVf39xP91omtQMlQqg==
X-Received: by 2002:aca:bdc4:: with SMTP id n187mr884007oif.154.1605538486308;
        Mon, 16 Nov 2020 06:54:46 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k10sm4849639otb.81.2020.11.16.06.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:54:45 -0800 (PST)
Received: (nullmailer pid 1635671 invoked by uid 1000);
        Mon, 16 Nov 2020 14:54:44 -0000
Date:   Mon, 16 Nov 2020 08:54:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Baolin Wang <baolin.wang7@gmail.com>,
        Nemo Han <nemo.han@unisoc.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: input: Convert sc27xx-vibra.txt to
 json-schema
Message-ID: <20201116145444.GA1635499@bogus>
References: <20201113113451.52355-1-zhang.lyra@gmail.com>
 <20201113113451.52355-2-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113113451.52355-2-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 13 Nov 2020 19:34:50 +0800, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> Convert the sprd sc27xx vibrator binding to DT schema using json-schema.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>  .../bindings/input/sprd,sc27xx-vibra.txt      | 23 ----------
>  .../bindings/input/sprd,sc27xx-vibrator.yaml  | 44 +++++++++++++++++++
>  2 files changed, 44 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
>  create mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml


See https://patchwork.ozlabs.org/patch/1399724

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

