Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072553173CA
	for <lists+linux-input@lfdr.de>; Wed, 10 Feb 2021 23:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233740AbhBJW6B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Feb 2021 17:58:01 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:36590 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbhBJW6B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Feb 2021 17:58:01 -0500
Received: by mail-ot1-f50.google.com with SMTP id 100so3484722otg.3;
        Wed, 10 Feb 2021 14:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5iRJAn0f0xN2TM7z6kQZmogD3YmeZUTWDlfZtqycCP0=;
        b=cvib1Dz2AvwBE2MAE4kayK2WGTDsw01gcSRMzrAwy1vtj2wWT0vNXqNOM3uCy17o6a
         frsOX2StWR7s8/NfqP6U3bugKNDurDg1Rh7Hx2evLiQrB60/8r1KzIgtJ3tAE3JA32v+
         AS/iXpCIDqzcKSAu/zqXICuDM9T4YQHN+DAci0McdtQreRaumcYJRDS0ufiNWT/XHYX2
         pvuvadriN0TdznOpXRkIGY5Z4rxhA59cdRFCL3UugENnKIP3I+1NdL3UIdcFKAtFqQq+
         k/zBy8+1u4WpSykjgDJpr6/e9TMzZwBK8DmE4wsLeDJxJ9SbcOBe2VE3UVVQw9COWg2w
         Dgdw==
X-Gm-Message-State: AOAM532Sx8MKZYXx8mdvhH+bpDieIlqJPqTOUNa3+tAfpOHBWdrIo0fd
        dfWjxGntkWfiek6eDo/27T7my01FjA==
X-Google-Smtp-Source: ABdhPJwTebQ7cY5vmvbu1RCUSI6gAF8RATKkd8MXgdYVTQMSvnf+lxL1ER2cinv4Ix8fs7QJ4PBrcg==
X-Received: by 2002:a05:6830:1557:: with SMTP id l23mr3858853otp.181.1612997840073;
        Wed, 10 Feb 2021 14:57:20 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v14sm747185oic.54.2021.02.10.14.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 14:57:19 -0800 (PST)
Received: (nullmailer pid 2973653 invoked by uid 1000);
        Wed, 10 Feb 2021 22:57:18 -0000
Date:   Wed, 10 Feb 2021 16:57:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Joe Hung <joe_hung@ilitek.com>
Cc:     dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, luca_hsu@ilitek.com
Subject: Re: [RESEND PATCH 1/2] dt-bindings: input: touchscreen:
 ilitek_ts_i2c: Add bindings
Message-ID: <20210210225718.GA2971881@robh.at.kernel.org>
References: <20210204123902.18813-1-joe_hung@ilitek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204123902.18813-1-joe_hung@ilitek.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 04, 2021 at 08:39:01PM +0800, Joe Hung wrote:
> Add binding documentation for ILITEK touch devices.

Bindings are in DT schema format now. Please convert.

> 
> Signed-off-by: Joe Hung <joe_hung@ilitek.com>
> ---
>  .../input/touchscreen/ilitek_ts_i2c.txt       | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.txt b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.txt
> new file mode 100644
> index 000000000000..eb90d3bd7ee7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.txt
> @@ -0,0 +1,23 @@
> +Ilitek I2C 23XX/25XX/Lego Series Touch ICs
> +
> +Required properties:
> +- compatible		: Must be equal to one of following:
> +			  "ilitek,ili2520"
> +			  "ilitek,ili2510"
> +- reg			: I2C slave address for touch device.
> +- reset-gpios		: GPIO output high to reset pin of touch device.
> +- irq-gpios		: GPIO as active low input from touch irq pin.

Use 'interrupts' instead.

> +
> +Example:
> +	&i2c1 {
> +		/* ... */
> +
> +		touchscreen@41 {
> +			compatible = "ilitek,ili2520";
> +			reg = <0x41>;
> +			irq-gpios = <&gpio1 13 0>;
> +			reset-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		/* ... */
> +	};
> -- 
> 2.25.1
> 
> 
