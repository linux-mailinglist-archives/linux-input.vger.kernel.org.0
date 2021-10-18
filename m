Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BD6432780
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 21:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhJRTYU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 15:24:20 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:45605 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbhJRTYR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 15:24:17 -0400
Received: by mail-oi1-f169.google.com with SMTP id z126so1179516oiz.12;
        Mon, 18 Oct 2021 12:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V1VnPfu2AuP5zIjik8TfylZ3NxfW6iX2aHgGQlj0jqg=;
        b=lJeW3jfCIf9MCViLcFl3pPE7z5aMYY4upFPt0248/IzLavjcWrGfXpBcQBXlGDYCqf
         20bVC7vqyThRepmVQmWlezjLKPAACcewfEtknAm8ZjdmqR/DBEY+5rKe3mYeX/EjFEWu
         HdnY4KHm9BmIVFOX2w67eOzUV8Ao4csMaJjddpP2mjBl/DT91+bYH7dxPgAmyX+VK69x
         muUM2KnoFX7dwoekv9dNYvNZXBaWgiqP7q86d8aPdra/LqNgKjpAiy9Fgx4VP3rmhY46
         z99D20CyiVKjMTHdKvWy7FLaHnElbj/s7TZmR1ZkZqAlhdCP7ER9n7yahHMwkn6adaZr
         Zw4A==
X-Gm-Message-State: AOAM533xkFENYyeT5roRvtVftn8guoYUngtblCHfTXKQZeJosPkrEj73
        ZGhIoZB4l+RlZbwUESaUxMpYhykGug==
X-Google-Smtp-Source: ABdhPJxh2LC3W8dQZ8gqVlEq2VAcnrlQgUXPPILPrFtjFirbOy3w662Y8RAwHo0haLYLz14lx34unA==
X-Received: by 2002:a05:6808:1795:: with SMTP id bg21mr635590oib.150.1634584925790;
        Mon, 18 Oct 2021 12:22:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id az14sm3127906oib.51.2021.10.18.12.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 12:22:05 -0700 (PDT)
Received: (nullmailer pid 2793607 invoked by uid 1000);
        Mon, 18 Oct 2021 19:22:04 -0000
Date:   Mon, 18 Oct 2021 14:22:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: input: Convert Silead GSL1680 binding to
 a schema
Message-ID: <YW3JXGS4toCgDw2c@robh.at.kernel.org>
References: <20211015073006.8939-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015073006.8939-1-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 15 Oct 2021 09:30:06 +0200, Maxime Ripard wrote:
> The Silead GSL1680 Touchscreen Controller is supported by Linux thanks
> to its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v2:
>   - Fixed firmware-name property name
> 
> Changes from v1:
>   - Added maximum to the number of fingers
> ---
>  .../input/touchscreen/silead,gsl1680.yaml     | 91 +++++++++++++++++++
>  .../input/touchscreen/silead_gsl1680.txt      | 44 ---------
>  2 files changed, 91 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
> 

Applied, thanks!
