Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E2C315385
	for <lists+linux-input@lfdr.de>; Tue,  9 Feb 2021 17:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232738AbhBIQOE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 11:14:04 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:37368 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbhBIQOD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Feb 2021 11:14:03 -0500
Received: by mail-ot1-f44.google.com with SMTP id h16so187177ote.4;
        Tue, 09 Feb 2021 08:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jR97En3b34Ol6ESOXDCKQqtKUbkthU4wmGPDId0RT0w=;
        b=jCWc/ZjmJzXjISBk87D4kg0GdxbUOdxsUQOKqXwRGY2J+R0BAHxq4hPpnFT8ogLWON
         Nd2Dnhn+PdOE6A+B4yL/LM9MlAaawi0IC5yKusAWcyd1oI57CenO6XlUbVTZRtP705KD
         ffjECSXD5AOj6hQZDR0kb/hOqtm+LS76PatxDI9nx/Vnh4bdmQmD+vYj64Ys75SJ36J1
         DcfyrIlWVfYk0FuHgE+HpeqZwLGIqhBYKC36rdi8MZMD0jMamu2UeSOr8t5RRWU1uRGC
         WNYsDTv6t1hPjO8hs1mDVUQ3st8fy9KQc33QTIbAe68LUdqq9rpwpk26oDkgkk6ivFFF
         VZOw==
X-Gm-Message-State: AOAM531VMDh1TNCNv0c825A+OYMvUJAKVV5Q2wEILCvh/1Ffe80b7HAd
        G7/KVRkLeF7oLUshmnq49Q==
X-Google-Smtp-Source: ABdhPJxfuQiGnRgaL6GK4Bz7pZyeuUykNWGmbkZ3OE1l2180JsrofW7N4XDivm32eMrKNswAiNZpHw==
X-Received: by 2002:a9d:6c85:: with SMTP id c5mr16429869otr.300.1612887202769;
        Tue, 09 Feb 2021 08:13:22 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a23sm4331799oii.16.2021.02.09.08.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 08:13:21 -0800 (PST)
Received: (nullmailer pid 3861217 invoked by uid 1000);
        Tue, 09 Feb 2021 16:13:19 -0000
Date:   Tue, 9 Feb 2021 10:13:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/2] dt-bindings: input/touchscreen: add bindings for
 msg26xx
Message-ID: <20210209161319.GA3849081@robh.at.kernel.org>
References: <20210121174359.1455393-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121174359.1455393-1-vincent.knecht@mailoo.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 21, 2021 at 06:43:47PM +0100, Vincent Knecht wrote:
> This adds dts bindings for the mstar msg26xx touchscreen.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Changed in v3:
> - added `touchscreen-size-x: true` and `touchscreen-size-y: true` properties
> Changed in v2:
> - changed M-Star to MStar in title line
> - changed reset gpio to active-low in example section
> ---
>  .../input/touchscreen/mstar,msg26xx.yaml      | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
> new file mode 100644
> index 000000000000..5d26a1008bf1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/mstar,msg26xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MStar msg26xx touchscreen controller Bindings
> +
> +maintainers:
> +  - Vincent Knecht <vincent.knecht@mailoo.org>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    const: mstar,msg26xx

Don't use wildcards in compatible strings.
