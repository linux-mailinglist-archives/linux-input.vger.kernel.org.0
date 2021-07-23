Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38EB53D4268
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 23:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbhGWVJB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 17:09:01 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:40812 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbhGWVJA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 17:09:00 -0400
Received: by mail-io1-f41.google.com with SMTP id m13so4207025iol.7;
        Fri, 23 Jul 2021 14:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8fRJVcOJ+Brkc9LZuEeklqc3pVelEiW0RBMYwaheEYY=;
        b=ifG5dZupjiWZKYxP+pQ+kd/f049pNXfQcwjgwDEneJECLFpvXna8JYo1spGj7yrEiL
         aJPU2jx0wcQvi+3GhvfFZYDr7Kz3uNPgX5T8HQ+o45OkxlTd2UnijSDpK5UNKD6u6YCA
         1J9mpvBhkjcZU9Z73SI3TXKniv2m6yGovAxHFlU9WtOrcObQ4V1lPurxHNekSunPIkQM
         HyF76b5Tely2O+G4nano5D61kaoZxHwgZuXitM8krmtxAAK76njc4rypzFSHEu/LSjxf
         iA2WbLWBvcDcxFY8i9JYqaYs5KEIHqyTlPyNcfTmRtKoKCkOCXN1OZ9NS6xXPtx//Z2e
         PHdA==
X-Gm-Message-State: AOAM533JaSHa+P/hVENtTPzZvMUC0OiZUvAzrG+jut4psU4icx7z2qOo
        bf93o88XIaEliQtALS4I6w==
X-Google-Smtp-Source: ABdhPJx1wDjeUBaY44s1QpQ1D3mxvPy4aGnKqWZapfw5h488/SHDXJru504LhBcu8gLjLuUu5D7k/w==
X-Received: by 2002:a05:6638:14c1:: with SMTP id l1mr5692530jak.97.1627076973569;
        Fri, 23 Jul 2021 14:49:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m184sm18718627ioa.17.2021.07.23.14.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 14:49:32 -0700 (PDT)
Received: (nullmailer pid 2651959 invoked by uid 1000);
        Fri, 23 Jul 2021 21:49:29 -0000
Date:   Fri, 23 Jul 2021 15:49:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 17/54] dt-bindings: input: Convert Pixcir Touchscreen
 binding to a schema
Message-ID: <20210723214929.GA2651907@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-18-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-18-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 21 Jul 2021 16:03:47 +0200, Maxime Ripard wrote:
> The Pixcir Touchscreen Controller is supported by Linux thanks to
> its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../input/touchscreen/pixcir,pixcir_ts.yaml   | 68 +++++++++++++++++++
>  .../input/touchscreen/pixcir_i2c_ts.txt       | 31 ---------
>  2 files changed, 68 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/pixcir,pixcir_ts.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/pixcir_i2c_ts.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
