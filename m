Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC60E547D
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2019 21:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbfJYTlF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Oct 2019 15:41:05 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:40074 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbfJYTlE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Oct 2019 15:41:04 -0400
Received: by mail-yb1-f196.google.com with SMTP id d12so1352913ybn.7;
        Fri, 25 Oct 2019 12:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=K6rid3xoZ0SUQoUbenfuddaBWiDM3moIgw0C3o2jRnk=;
        b=SdscXnbpRp8+9dDackirDap/mrhvQUZHdpAdPgmDkjKQ1WziduyAEazOI5kL56j18h
         IA8M4J/QnTLgCQq0XQHCUmChwxevBJ94Sr6ldZQC2LxB0c8nEhYGy8ArN7qAfNXFyZQH
         eqLE2nl4QfQaF+dUBCWOjvmrZoAkCtRxFD54zStDH+n1LdJBrEco8zc+DkC6IKZvYxGi
         ERDd5yqYTyti+SG+zbFCtQFjHoJJ9QdiP84QpzhFBrdGjF370xVNsyG9Z7CVSAZgbj/k
         FHQvD53fz1tGcd7FtBBP2mLBV8uF5MfbSxtwpMdX9ZNcXsf2l1i43a82IoVhWt5T7ReA
         imMA==
X-Gm-Message-State: APjAAAVQVBQza6Qb0VnXd9+el6o66Cytd+i2duYpeDhtcg5zUbaPRxW9
        GFYS9Ggrj8dRe3A3Yjo4bYAcIVI=
X-Google-Smtp-Source: APXvYqzdWvAAHX5FZcfrQ3oJzfNP/kKDWxh6B5Dzyl4KOyRE8HPtwOQDWvcC5f50KEGgRl6vBFBitg==
X-Received: by 2002:a9d:7b41:: with SMTP id f1mr4283724oto.323.1572032462697;
        Fri, 25 Oct 2019 12:41:02 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o184sm815722oia.28.2019.10.25.12.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 12:41:01 -0700 (PDT)
Date:   Fri, 25 Oct 2019 14:41:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boitchat <drinkcat@chromium.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Add DT bindings for Whiskers
 switch
Message-ID: <20191025194101.GA4734@bogus>
References: <20191023024348.225969-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023024348.225969-1-ikjn@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 23, 2019 at 10:43:48AM +0800, Ikjoon Jang wrote:
> Add the DT binding document for Hammer's TABLET_MODE switch.

This doesn't have any properties. Why does it need to be in DT? Just 
have the EC driver instantiate it.

> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
>  .../devicetree/bindings/input/cros-cbas.yaml  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cros-cbas.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/cros-cbas.yaml b/Documentation/devicetree/bindings/input/cros-cbas.yaml
> new file mode 100644
> index 000000000000..3bc989c6a295
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/cros-cbas.yaml
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0

(GPL-2.0-only OR BSD-2-Clause) for new bindings please.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/cros-cbas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ChromeOS Hammer's Base Attached Switch
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +description:
> +  This device is used to signal when a detachable base is attached to a
> +  Chrome OS tablet. The node for this device must be under a cros-ec node
> +  like google,cros-ec-spi or google,cros-ec-i2c.

This should probably just be part of an EC schema where it can be 
enforced that this is a child node. It could be either embedded into it 
or referenced. I'd lean toward the former given this is only a 
compatible string...

> +
> +properties:
> +  compatible:
> +    const: google,cros-cbas
> +
> +required:
> +  - compatible

Add here:

additionalProperties: false.

> -- 
> 2.23.0.866.gb869b98d4c-goog
> 
