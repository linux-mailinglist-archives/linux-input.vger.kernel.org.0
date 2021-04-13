Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7003F35E212
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 16:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345385AbhDMO6R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 10:58:17 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:35541 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345397AbhDMO5w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 10:57:52 -0400
Received: by mail-ot1-f46.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so16372813oto.2;
        Tue, 13 Apr 2021 07:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=y28J5P3915Fjgg5N0/u5jZ49Kq2YIVbhsw1yas2D+lE=;
        b=ZkNouwYdW8SKZ3dhhbEdFHGBNkYapIdeGWEFoOgiXD9LfIsUvvROtIuKOEvZYLvJL/
         CGueyvVnhVrnAgYiNzmlHXbFomtj9y5gs8RKvQIEfvXIJXUq6C4OlFvJJlWKcgGn+xOu
         U6JO1ekQQIPkaM7M3/IzHYqE1MSy0cuQwPenZQj9TkedWJ4zVojhqYCiKBHSI8Fu3Z6I
         jG0LkGlGDMy2Jk670C56sT3ZXoU9vEsU41xYJC2V/5R2vMInJlpj6EIlIy+F2uTb1HgU
         ypj/9jEwGxuXHL1FwMIKyVKXoP6b0CaaUMdTTyContNmhQqYIy0oTiPLC6qnQPB/CQPA
         G/1Q==
X-Gm-Message-State: AOAM533E3zzdSHSmkU7bP0zhv5xW/QWhVvJpSffGUwc3T+Fzi2b5hcGP
        l1KtatGYtivvXvry6JSDPQ==
X-Google-Smtp-Source: ABdhPJxv4dnCfFBvqlcpVTYMsz0yIgIONuFjvatAYBflcXXtcLXQOtNIMscMfavB39pSE4iPDGikfQ==
X-Received: by 2002:a05:6830:210e:: with SMTP id i14mr28634759otc.229.1618325852331;
        Tue, 13 Apr 2021 07:57:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 62sm3465329oto.60.2021.04.13.07.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:57:31 -0700 (PDT)
Received: (nullmailer pid 1670638 invoked by uid 1000);
        Tue, 13 Apr 2021 14:57:30 -0000
Date:   Tue, 13 Apr 2021 09:57:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Dmitry Torokhov <dtor@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] mfd: google,cros-ec: add DT bindings for a
 baseboard's switch device
Message-ID: <20210413145730.GA1667299@robh.at.kernel.org>
References: <20210412113020.2724134-1-ikjn@chromium.org>
 <20210412113020.2724134-2-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412113020.2724134-2-ikjn@chromium.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 12, 2021 at 07:30:19PM +0800, Ikjoon Jang wrote:
> This is for ChromeOS tablets which have a 'cros_cbas' switch device
> in the "Whiskers" base board. This device can be instantiated only by
> device tree on ARM platforms. ChromeOS EC doesn't provide a way to
> probe the device.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> 
> ---
> 
> Changes in v4:
> Define cros-cbase bindings inside google,cros-ec.yaml instead of
> a seperated binding document.
> 
>  .../devicetree/bindings/mfd/google,cros-ec.yaml  | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index 76bf16ee27ec..c76809cd9f7f 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -127,6 +127,18 @@ patternProperties:
>      type: object
>      $ref: "/schemas/extcon/extcon-usbc-cros-ec.yaml#"
>  
> +  "^cbas$":

Not a pattern, put under 'properties'.

> +    type: object
> +    properties:
> +      compatible:
> +        const: google,cros-cbas

Blank line

> +    required:
> +      - compatible

Blank line

> +    additionalProperties: false
> +    description:

Make this 1st or at least before 'properties'.

> +      This device is used to signal when a detachable base is attached
> +      to a Chrome OS tablet.

This can't happen at runtime?

> +
>  required:
>    - compatible
>  
> @@ -180,6 +192,10 @@ examples:
>              interrupts = <99 0>;
>              interrupt-parent = <&gpio7>;
>              spi-max-frequency = <5000000>;
> +
> +            base_detection: cbas {
> +                compatible = "google,cros-cbas";
> +            };
>          };
>      };
>  
> -- 
> 2.31.1.295.g9ea45b61b8-goog
> 
