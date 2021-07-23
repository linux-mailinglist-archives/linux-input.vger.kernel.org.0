Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159693D426B
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 23:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232234AbhGWVJr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 17:09:47 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:37820 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbhGWVJr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 17:09:47 -0400
Received: by mail-io1-f50.google.com with SMTP id r18so4258673iot.4;
        Fri, 23 Jul 2021 14:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gPVzY5dkEKAjL9VEpIf3Lz8fxj/lGSEKdvycfvRSRVI=;
        b=r1G6S/zBgr5hH62NZhIbc47LNUq9rRzFGF87JgiJVW5cXCmN5yEcr6tDVwJ8QPpOjb
         q4yN+GcHi+uyeNgLw5kiLuXGMkx0FfEOOjnklaDrINFPceVvgn5Hb4cm3BRH5in7D09h
         i4w1W5tawXeTPkCYEMUhxTRlNFiHznRPi0XXd9D3g67VPsjUou+sncgvH90Uv/vvUY8s
         TfVK9wdfXJKetom0OPy8obGesPoUdCVQ65/YiyyLnDtKNxTgsQko2vAaHA6Lsb0fSVwu
         7a9jRF5rsbRSAFn6U5ZB65UKhrkfiS4ss9WEUt3HzYRD27tqBN7txqAVKkBOqJJs7fnx
         57lw==
X-Gm-Message-State: AOAM532WuiFmm68ULWAvhXy09AWvcK+Clqz/W8zQlRn58hOW48SDcxib
        WPT3ya/VS9lYDoSsUgx0cg==
X-Google-Smtp-Source: ABdhPJyT9jD4wGnL6K6f9CttGcJzvLV+Frp+4EUeAj8YBxaF0Jm3nE/72rVGCuO+oKLmK5GeabI3ng==
X-Received: by 2002:a05:6638:3181:: with SMTP id z1mr5847487jak.100.1627077019721;
        Fri, 23 Jul 2021 14:50:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z18sm8459426ilh.55.2021.07.23.14.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 14:50:19 -0700 (PDT)
Received: (nullmailer pid 2653282 invoked by uid 1000);
        Fri, 23 Jul 2021 21:50:16 -0000
Date:   Fri, 23 Jul 2021 15:50:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-sunxi@googlegroups.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH 18/54] dt-bindings: input: Convert Regulator Haptic
 binding to a schema
Message-ID: <20210723215016.GA2653221@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-19-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-19-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 21 Jul 2021 16:03:48 +0200, Maxime Ripard wrote:
> The Haptic feedback based on a regulator is supported by Linux thanks to
> its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jaewon Kim <jaewon02.kim@samsung.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/input/regulator-haptic.txt       | 21 ---------
>  .../bindings/input/regulator-haptic.yaml      | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/regulator-haptic.txt
>  create mode 100644 Documentation/devicetree/bindings/input/regulator-haptic.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
