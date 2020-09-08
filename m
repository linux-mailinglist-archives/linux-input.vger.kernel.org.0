Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1E2261455
	for <lists+linux-input@lfdr.de>; Tue,  8 Sep 2020 18:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731699AbgIHQOd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Sep 2020 12:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731605AbgIHQNo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Sep 2020 12:13:44 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E05C0619CC
        for <linux-input@vger.kernel.org>; Tue,  8 Sep 2020 06:53:41 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l9so17272404wme.3
        for <linux-input@vger.kernel.org>; Tue, 08 Sep 2020 06:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=B+1VfXen+elHkQ0c/cVTagZOsQR6RJZxVQx50u2DiS0=;
        b=ur7XQ+57izCy8+tIwJLzUvp8sT5FRKPYIoSAvr7zyDHDKAS4EBQOGYTbALgv0X2Zip
         SP9gkVcEb3AATxK7wVtlXYJVkRKEUSQB46KbPOqPdsxyCIVs3TBreRtUk2Yz1UIv67Qk
         sOLReEbVaoIfg0YBCK72rFbte1mhED361oZ0UC/dwGXp8oKZD5nzIt8LGcxZnnThquSW
         8OP75wVIcrfoBMTA87Ox37TQkPM23JcuwAZiNTv5Fli8Qimu+ZRyMOVrRJ0/P3xpf+NB
         YqBsT/YGYa9ZLW2EPhzOgTteS0NV0vqWtsHS7pJmhhAri5D2nkqFp/No6nXbEwN/B8ep
         vsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=B+1VfXen+elHkQ0c/cVTagZOsQR6RJZxVQx50u2DiS0=;
        b=Df54Jf49RdPX805DhUdJuezHS/rQ0ejKKLCgAWFaG2QYH02V65m0j3XBDxu+j5/nL3
         Zl39H7YX4uR0EYiNW0HV7QO41attbm38c99Vn1bIJgSlcFvNEWsFu7k0R5wdKeqbhtRH
         Oo7t6MtVZGH9fTtlQRFMSqKyYd2tpTK6h84AmCwM4qck6hf9PZDUgJ9uf/R8Ys4P07zM
         s4gTne+SquZGA2ctUc87EE2Mm//2c7L2BzL9utAQwB9GxxVKlczfK0wEscTc7SUWZ2Yo
         YjO8S4hJzlrXkBQcphjJq384kqK6Auv8qYIFrV2ryc2IjfTxSvFrrP+DKGetGE+PDj7t
         7I0Q==
X-Gm-Message-State: AOAM533KgufvtUcaax+OkT80D677iAsuEijSwSSPhjSI48uQV9SDnL+Y
        gpskWPNOGosDCmXeGRf1jN61dQ==
X-Google-Smtp-Source: ABdhPJwDv4u0H+BSdKLM+omVpuUAOz5Yeed32BmPpuyyp4itgV9xiKDoOqTL2i0JUXwLRZlFMkf0mA==
X-Received: by 2002:a1c:6187:: with SMTP id v129mr4456831wmb.35.1599573219737;
        Tue, 08 Sep 2020 06:53:39 -0700 (PDT)
Received: from dell ([91.110.221.179])
        by smtp.gmail.com with ESMTPSA id z13sm34709161wro.97.2020.09.08.06.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 06:53:39 -0700 (PDT)
Date:   Tue, 8 Sep 2020 14:53:37 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, hsin-hsiung.wang@mediatek.com,
        matthias.bgg@gmail.com, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com
Subject: Re: [PATCH v5 3/3] mfd: mt6397: Add support for MT6392 pmic
Message-ID: <20200908135337.GU4400@dell>
References: <20200907103311.1601907-1-fparent@baylibre.com>
 <20200907103311.1601907-3-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200907103311.1601907-3-fparent@baylibre.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 07 Sep 2020, Fabien Parent wrote:

> Update the MT6397 MFD driver to support the MT6392 PMIC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> V5:
> 	* Rebased
> 	* removed mt6392-regulator compatible. This will be send in another
> 	  series to make this series easier to merge.
> 
> V4:
> 	* Use DEFINE_RES_* macro to define RTC ressources.
> 	* Use PLATFORM_DEVID_NONE instead of -1 value when registering devices.
> 
> V3:
> 	* No change
> 
> V2:
> 	* Pass IRQ comain to fix invalid MFD devices IRQs.
> 	* Remove resources and mfd cells for device we don't support.
> 	* Rename IRQ names to follow what's done for MT6397.
> 
> ---

You shouldn't need to add your own '---' marker.

Just place the changelog under the existing one.

>  drivers/mfd/mt6397-core.c            |  40 +++
>  drivers/mfd/mt6397-irq.c             |   9 +
>  include/linux/mfd/mt6392/core.h      |  42 +++
>  include/linux/mfd/mt6392/registers.h | 487 +++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   1 +
>  5 files changed, 579 insertions(+)
>  create mode 100644 include/linux/mfd/mt6392/core.h
>  create mode 100644 include/linux/mfd/mt6392/registers.h
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index f6cd8a660602..6ba3585b1b36 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -13,9 +13,11 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/mt6323/core.h>
>  #include <linux/mfd/mt6358/core.h>
> +#include <linux/mfd/mt6392/core.h>
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6323/registers.h>
>  #include <linux/mfd/mt6358/registers.h>
> +#include <linux/mfd/mt6392/registers.h>
>  #include <linux/mfd/mt6397/registers.h>
>  
>  #define MT6323_RTC_BASE		0x8000
> @@ -27,6 +29,9 @@
>  #define MT6397_RTC_BASE		0xe000
>  #define MT6397_RTC_SIZE		0x3e
>  
> +#define MT6392_RTC_BASE		0x8000
> +#define MT6392_RTC_SIZE		0x3e
> +

Nit: Why aren't these (all) in the header files above?

>  #define MT6323_PWRC_BASE	0x8000
>  #define MT6323_PWRC_SIZE	0x40
>  
> @@ -40,6 +45,11 @@ static const struct resource mt6358_rtc_resources[] = {
>  	DEFINE_RES_IRQ(MT6358_IRQ_RTC),
>  };
>  
> +static const struct resource mt6392_rtc_resources[] = {
> +	DEFINE_RES_MEM(MT6392_RTC_BASE, MT6392_RTC_SIZE),
> +	DEFINE_RES_IRQ(MT6392_IRQ_RTC),
> +};
> +
>  static const struct resource mt6397_rtc_resources[] = {
>  	DEFINE_RES_MEM(MT6397_RTC_BASE, MT6397_RTC_SIZE),
>  	DEFINE_RES_IRQ(MT6397_IRQ_RTC),
> @@ -50,6 +60,11 @@ static const struct resource mt6323_keys_resources[] = {
>  	DEFINE_RES_IRQ(MT6323_IRQ_STATUS_FCHRKEY),
>  };
>  
> +static const struct resource mt6392_keys_resources[] = {
> +	DEFINE_RES_IRQ(MT6392_IRQ_PWRKEY),
> +	DEFINE_RES_IRQ(MT6392_IRQ_FCHRKEY),
> +};
> +
>  static const struct resource mt6397_keys_resources[] = {
>  	DEFINE_RES_IRQ(MT6397_IRQ_PWRKEY),
>  	DEFINE_RES_IRQ(MT6397_IRQ_HOMEKEY),
> @@ -99,6 +114,20 @@ static const struct mfd_cell mt6358_devs[] = {
>  	},
>  };
>  
> +static const struct mfd_cell mt6392_devs[] = {
> +	{
> +		.name = "mt6397-rtc",
> +		.num_resources = ARRAY_SIZE(mt6392_rtc_resources),
> +		.resources = mt6392_rtc_resources,
> +		.of_compatible = "mediatek,mt6392-rtc",
> +	}, {
> +		.name = "mtk-pmic-keys",
> +		.num_resources = ARRAY_SIZE(mt6392_keys_resources),
> +		.resources = mt6392_keys_resources,
> +		.of_compatible = "mediatek,mt6392-keys"
> +	},
> +};
> +
>  static const struct mfd_cell mt6397_devs[] = {
>  	{
>  		.name = "mt6397-rtc",
> @@ -149,6 +178,14 @@ static const struct chip_data mt6358_core = {
>  	.irq_init = mt6358_irq_init,
>  };
>  
> +static const struct chip_data mt6392_core = {
> +	.cid_addr = MT6392_CID,
> +	.cid_shift = 0,
> +	.cells = mt6392_devs,
> +	.cell_size = ARRAY_SIZE(mt6392_devs),
> +	.irq_init = mt6397_irq_init,
> +};
> +
>  static const struct chip_data mt6397_core = {
>  	.cid_addr = MT6397_CID,
>  	.cid_shift = 0,
> @@ -218,6 +255,9 @@ static const struct of_device_id mt6397_of_match[] = {
>  	}, {
>  		.compatible = "mediatek,mt6358",
>  		.data = &mt6358_core,
> +	}, {
> +		.compatible = "mediatek,mt6392",
> +		.data = &mt6392_core,
>  	}, {
>  		.compatible = "mediatek,mt6397",
>  		.data = &mt6397_core,
> diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
> index 2924919da991..9bf95e2ddf02 100644
> --- a/drivers/mfd/mt6397-irq.c
> +++ b/drivers/mfd/mt6397-irq.c
> @@ -12,6 +12,8 @@
>  #include <linux/suspend.h>
>  #include <linux/mfd/mt6323/core.h>
>  #include <linux/mfd/mt6323/registers.h>
> +#include <linux/mfd/mt6392/core.h>
> +#include <linux/mfd/mt6392/registers.h>
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6397/registers.h>
>  
> @@ -181,6 +183,13 @@ int mt6397_irq_init(struct mt6397_chip *chip)
>  		chip->int_status[1] = MT6397_INT_STATUS1;
>  		break;
>  
> +	case MT6392_CHIP_ID:
> +		chip->int_con[0] = MT6392_INT_CON0;
> +		chip->int_con[1] = MT6392_INT_CON1;
> +		chip->int_status[0] = MT6392_INT_STATUS0;
> +		chip->int_status[1] = MT6392_INT_STATUS1;
> +		break;
> +

Nit: These line breaks seem superfluous.

>  	default:
>  		dev_err(chip->dev, "unsupported chip: 0x%x\n", chip->chip_id);
>  		return -ENODEV;
> diff --git a/include/linux/mfd/mt6392/core.h b/include/linux/mfd/mt6392/core.h
> new file mode 100644
> index 000000000000..7575a79ea052
> --- /dev/null
> +++ b/include/linux/mfd/mt6392/core.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.

This is out of date.

> + * Author: Chen Zhong <chen.zhong@mediatek.com>
> + */
> +
> +#ifndef __MFD_MT6392_CORE_H__
> +#define __MFD_MT6392_CORE_H__
> +
> +enum MT6392_IRQ_numbers {
> +	MT6392_IRQ_SPKL_AB = 0,
> +	MT6392_IRQ_SPKL,
> +	MT6392_IRQ_BAT_L,
> +	MT6392_IRQ_BAT_H,
> +	MT6392_IRQ_WATCHDOG,
> +	MT6392_IRQ_PWRKEY,
> +	MT6392_IRQ_THR_L,
> +	MT6392_IRQ_THR_H,
> +	MT6392_IRQ_VBATON_UNDET,
> +	MT6392_IRQ_BVALID_DET,
> +	MT6392_IRQ_CHRDET,
> +	MT6392_IRQ_OV,
> +	MT6392_IRQ_LDO = 16,
> +	MT6392_IRQ_FCHRKEY,
> +	MT6392_IRQ_RELEASE_PWRKEY,
> +	MT6392_IRQ_RELEASE_FCHRKEY,
> +	MT6392_IRQ_RTC,
> +	MT6392_IRQ_VPROC,
> +	MT6392_IRQ_VSYS,
> +	MT6392_IRQ_VCORE,
> +	MT6392_IRQ_TYPE_C_CC,
> +	MT6392_IRQ_TYPEC_H_MAX,
> +	MT6392_IRQ_TYPEC_H_MIN,
> +	MT6392_IRQ_TYPEC_L_MAX,
> +	MT6392_IRQ_TYPEC_L_MIN,
> +	MT6392_IRQ_THR_MAX,
> +	MT6392_IRQ_THR_MIN,
> +	MT6392_IRQ_NAG_C_DLTV,
> +	MT6392_IRQ_NR,
> +};
> +
> +#endif /* __MFD_MT6392_CORE_H__ */
> diff --git a/include/linux/mfd/mt6392/registers.h b/include/linux/mfd/mt6392/registers.h
> new file mode 100644
> index 000000000000..8858b58e3b67
> --- /dev/null
> +++ b/include/linux/mfd/mt6392/registers.h
> @@ -0,0 +1,487 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.

This is out of date.

> + * Author: Chen Zhong <chen.zhong@mediatek.com>
> + */
> +
> +#ifndef __MFD_MT6392_REGISTERS_H__
> +#define __MFD_MT6392_REGISTERS_H__

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
