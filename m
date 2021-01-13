Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3732F4E7E
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 16:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbhAMP0B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 10:26:01 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:39405 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbhAMP0B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 10:26:01 -0500
Received: by mail-oi1-f178.google.com with SMTP id w124so2479479oia.6;
        Wed, 13 Jan 2021 07:25:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b3870hR1XSDLI0lW/i97u3qoIBY+naXPh0eoGMPyvqM=;
        b=OBTnBQcWmaeKsBst+r1qGmiOhLBXIEBIgV50ihTBkfwkkadWkDxCHql6CXRc/PP0Wb
         SbcvmJgpEG2gHHia4p0G2rc0l0G8UhGK7rH85Evswf6aYvkVGOM8UZI3GWEwYx0qs+uF
         axwRRjUujwWeOwkrn8x8r4VVR8aEj0c/7/M63FKGLRT081p5ZkXof3KE3Yi7EgYsxNSa
         c9QBo4/7NJWtvAD/7u++fH6TivxNr9bfxXQyAVBnmFI7cqdLuWo11NUI34KKz3DxjoRC
         6VcjrGg+TIlVpFdPJFXFGgTDI6sMlQVfgyvlAofIYOyhTp0cKuejudksn/IFzlqzPi5E
         gj+w==
X-Gm-Message-State: AOAM531zfPYHRP1dm/PtGuZJC9bgd/lSyr8yaDivNyoELulwn7v/6rGC
        wAfmtoC/7LCNQzgz86IMPw==
X-Google-Smtp-Source: ABdhPJzIzAYH4lcuxU0hZPlKcwvH7suPUrE/oE44707VblY8cCBk5RMQr7VCRMjF/tMLFRTjwk03Xw==
X-Received: by 2002:aca:1102:: with SMTP id 2mr1562978oir.100.1610551520596;
        Wed, 13 Jan 2021 07:25:20 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w129sm443340oig.23.2021.01.13.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 07:25:19 -0800 (PST)
Received: (nullmailer pid 2475035 invoked by uid 1000);
        Wed, 13 Jan 2021 15:25:18 -0000
Date:   Wed, 13 Jan 2021 09:25:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Ondrej Jirman <megous@megous.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: edt-ft5x06: add
 iovcc-supply
Message-ID: <20210113152518.GA2475006@robh.at.kernel.org>
References: <20210108192337.563679-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108192337.563679-1-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 08 Jan 2021 20:23:36 +0100, Stephan Gerhold wrote:
> At the moment, the edt-ft5x06 driver can control a single regulator
> ("vcc"). However, some FocalTech touch controllers have an additional
> IOVCC pin that should be supplied with the digital I/O voltage.
> 
> The I/O voltage might be provided by another regulator that should also
> be kept on. Otherwise, the touchscreen can randomly stop functioning if
> the regulator is turned off because no other components still require it.
> 
> Document (optional) support for controlling the regulator for IOVCC
> using "iovcc-supply".
> 
> Cc: Ondrej Jirman <megous@megous.com>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
