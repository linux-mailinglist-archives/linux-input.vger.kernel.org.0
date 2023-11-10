Return-Path: <linux-input+bounces-8-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4D27E84F3
	for <lists+linux-input@lfdr.de>; Fri, 10 Nov 2023 22:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF38D2812B1
	for <lists+linux-input@lfdr.de>; Fri, 10 Nov 2023 21:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0753C09E;
	Fri, 10 Nov 2023 21:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AC3C2D2;
	Fri, 10 Nov 2023 21:07:20 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510C21A5;
	Fri, 10 Nov 2023 13:07:19 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b2df2fb611so1568097b6e.0;
        Fri, 10 Nov 2023 13:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699650438; x=1700255238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhcaUbufGGCGl+oelTC2ECkW5UU6FCUTDhDK/m2sCfs=;
        b=XCxhNq2i+SJco4U/QUBzzTNEJYDRGbSemA/Ytn390VKM9D6ORpAJeXH6l9J2eFTLHI
         lOARsjKojknd0b3vydqzBxcZfzVgG7CPCT36kPQ+f7VH2Hoa36YpEJi8Cmq/Ttr/Mtl7
         Y/am0CYLXqw+istz8BKTl9nOYLJsKSSk4STpej+zVz/z6YlcOkCMbh4caWEcFw42hhpa
         K0JDcdQdXUD2XnUV9wRpoC/VTU1KXXE0WZTBVFjptUU4sOz6OB72ft7KNwv8tQf2c6h1
         biYLUi0jlOIFt+s8+v4zK7R21LYBDjc/7/7LuAVjJZY/2/akL864lU6fxv22h6hehybp
         y71w==
X-Gm-Message-State: AOJu0YxVeOVSvITd6YYeuxYEs4dgWusvyeeFkTpCA0jqF3qovYCkT3ka
	3r/DJaS/T/o8Dcv8B2kiaA==
X-Google-Smtp-Source: AGHT+IEQ7c/sxZ5ogUqRUDBd0ii59Sbjxux7vfokGIfN/0AadRuyYuXRaQGnZx2kQuCJ3B3CfRxsGA==
X-Received: by 2002:a05:6870:2b13:b0:1ef:b809:3f26 with SMTP id ld19-20020a0568702b1300b001efb8093f26mr476789oab.17.1699650438610;
        Fri, 10 Nov 2023 13:07:18 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e5-20020a056870920500b001e9b02b00e9sm67574oaf.22.2023.11.10.13.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 13:07:18 -0800 (PST)
Received: (nullmailer pid 434762 invoked by uid 1000);
	Fri, 10 Nov 2023 21:07:16 -0000
Date: Fri, 10 Nov 2023 15:07:16 -0600
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [RFC PATCH v2 5/7] of: hw_prober: Support Chromebook SKU ID
 based component selection
Message-ID: <20231110210716.GB419831-robh@kernel.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
 <20231109100606.1245545-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109100606.1245545-6-wenst@chromium.org>

On Thu, Nov 09, 2023 at 06:06:02PM +0800, Chen-Yu Tsai wrote:
> In cases where the same Chromebook model is manufactured with different
> components (MIPI DSI panels, MIPI CSI camera sensors, or trackpad /
> touchscreens with conflicting addresses), a different SKU ID is
> allocated to each specific combination. This SKU ID is exported by the
> bootloader into the device tree, and can be used to "discover" which
> combination is present on the current machine.
> 
> This change adds a hardware prober that will match the SKU ID against
> a provided table, and enable the component for the matched entry based
> on the given compatible string. In the MIPI DSI panel and MIPI CSI
> camera sensor cases which have OF graphs, it will also update the
> remote endpoint to point to the enabled component. This assumes a single
> endpoint only.
> 
> This will provide a path to reducing the number of Chromebook device
> trees.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/of/hw_prober.c | 160 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)

This certainly does not belong in drivers/of/.


> diff --git a/drivers/of/hw_prober.c b/drivers/of/hw_prober.c
> index 442da6eff896..4345e5aed6d8 100644
> --- a/drivers/of/hw_prober.c
> +++ b/drivers/of/hw_prober.c
> @@ -8,6 +8,7 @@
>  #include <linux/array_size.h>
>  #include <linux/i2c.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  
>  #define DRV_NAME	"hw_prober"
> @@ -108,9 +109,168 @@ static int i2c_component_prober(struct platform_device *pdev, const void *data)
>  	return ret;
>  }
>  
> +static int cros_get_coreboot_sku_id(struct device *dev, u32 *sku_id)
> +{
> +	struct device_node *node = NULL;
> +	int ret;
> +
> +	node = of_find_node_by_path("/firmware/coreboot");
> +	if (!node)
> +		return dev_err_probe(dev, -EINVAL, "Cannot find coreboot firmware node\n");
> +
> +	ret = of_property_read_u32(node, "sku-id", sku_id);

Not documented.

Rob

