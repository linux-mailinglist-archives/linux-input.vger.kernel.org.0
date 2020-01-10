Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8213B13649F
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 02:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730458AbgAJBQS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 20:16:18 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39004 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730456AbgAJBQS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 20:16:18 -0500
Received: by mail-pg1-f196.google.com with SMTP id b137so167355pga.6;
        Thu, 09 Jan 2020 17:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=K1fUKQoqVrc2gBuC0Xa6OebKj/ndQDIk9auPZlDrjlA=;
        b=dqv1bN75FVMKWG07B++J/QTdSBppwKw1hY4c/cZXVVN2OtLW/PC9af9AeSVMm3VPef
         mM91Si/Lmkq0jktGdfJwxcHbWKeDMWzMKZls1fBayxZfmywr0UZlTcd08+zUpWqdrY56
         MiBmHEhP0Ey7mksJEN3Jgj3oJ1VkG8KAt+4hjo8up1H2USH3a/YY5+lQ1HvBqsN6YLVn
         6M0Y2oSeqHlcX33+oemISnHJ2u7C5lbYrvd1NwYQwdghvjmMKskTnd7Cm83fMBRSk6m6
         BthPBiYmAqsAtBWRICNir1naG6QJSKI1k0DKGjoNXDytIi9Hdd82XuIj8fiR1w6yBcM/
         bgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=K1fUKQoqVrc2gBuC0Xa6OebKj/ndQDIk9auPZlDrjlA=;
        b=n12iZwXr2rafw1aSHt+KjRZqSk3MYFw01xuylnhEz5IoT3DY6D4KuNFA4b3+4dyrfK
         E8Ms0tCT9L/3AxZhcrKhfLSZL8AHXNQ80EEkTtPGn2f1fB20GWtLAG625+tpvbZEvrJi
         Qylr5LzSRPZf+flzJFr9VJthTr04gCGnLOKBrfg+UUdDoTT15wsFe9xycYACxhvMjB1m
         URDXFgnnr/3cs79LEBtnw3s1Rb4hRWPwPJ7tAqgIVu5Zs2RMEstOwk/Jn/EwpG5U4cQi
         n+ck2CpNHpphKsOR4WMzDLY8IzY3GgPI0GqnlrpF7/9wYQoA0a/K3VE7P8aDdZy2TWlb
         fBVQ==
X-Gm-Message-State: APjAAAXcVQvOsPqvgCU62ACPmUzsd24li9w0/F0wGX+HR28i0+ubWUSr
        zF/MOX76vsjOVKC95FUBVeU=
X-Google-Smtp-Source: APXvYqwrzlEFCd8aEl+MX707ABW9/oKXaAfQb9y3qVddfy9HcwNI8V2Uy6mC5DRt0o/+z+5hD8uriw==
X-Received: by 2002:a63:f5c:: with SMTP id 28mr1085276pgp.348.1578618977355;
        Thu, 09 Jan 2020 17:16:17 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y21sm271676pfm.136.2020.01.09.17.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 17:16:16 -0800 (PST)
Date:   Thu, 9 Jan 2020 17:16:14 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     fengping yu <fengping.yu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <mripard@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Stefan Agner <stefan@agner.cn>, Jacky Bai <ping.bai@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH V2 1/2] Documentation: devicetree: bindings: input
Message-ID: <20200110011614.GQ8314@dtor-ws>
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
 <20200108062923.14684-2-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108062923.14684-2-fengping.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fengping,

On Wed, Jan 08, 2020 at 02:29:22PM +0800, fengping yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> Add mtk keypad device tree documentation.
> 
> Change-Id: I415b76ee980784992763c768829b2dda76699dea
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.txt     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.txt b/Documentation/devicetree/bindings/input/mtk-kpd.txt
> new file mode 100644
> index 000000000000..2af81e696159
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.txt
> @@ -0,0 +1,45 @@
> +* Mediatek's Keypad Controller device tree binding
> +
> +Mediatek's Keypad controller is used to interface a SoC with a matrix-type
> +keypad device. The keypad controller supports multiple row and column lines.
> +A key can be placed at each intersection of a unique row and a unique column.
> +The keypad controller can sense a key-press and key-release and report the
> +event using a interrupt to the cpu.
> +
> +Required properties:
> +- compatible should contain:
> +	* "mediatek,mt6779-keypad" for MT6779 keypad
> +	* "mediatek,kp" for common keypad
> +
> +- reg: The base address of the Keypad register bank.
> +
> +- interrupts: A single interrupt specifier.
> +
> +- mediatek,key-debounce-ms: Debounce interval in milliseconds, maximum value
> +  is 256ms
> +
> +- mediatek,hw-map-num: Number of entries of keycode in mediatek,hw-init-map
> +
> +- mediatek,hw-init-map: An array of packed 1-cell entries containing the
> +  equivalent of hw-map-num linux key-code. Each cell is Linux keymap of
> +  corresponding row/col, arrange like this:
> +
> +  row0col0, row0col1, row0col2,...row0col8,
> +  row1col0, row1col1, row1col2,...row1col8,
> +  ...
> +  row7col0, row7col1, row7col2,...row7col8.

Please use standard "linux,keymap" property as defined in
Documentation/devicetree/bindings/input/matrix-keymap.txt. You can use
API from drivers/input/matrix-keymap.c to handle the property.

Thanks.

-- 
Dmitry
