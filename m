Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A9C2A96F0
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 14:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbgKFNYb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 08:24:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727287AbgKFNYb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Nov 2020 08:24:31 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D7AC0613CF
        for <linux-input@vger.kernel.org>; Fri,  6 Nov 2020 05:24:29 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 10so626156wml.2
        for <linux-input@vger.kernel.org>; Fri, 06 Nov 2020 05:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6aMrN2ubH+NBTONrWTRgPhticMiP338JyBFBdD8aiTA=;
        b=ryD+Q4+MUVeASOzHNgxqAn+c8Ckbbiw3KyFVduQkViAJVQwGS/pL983W4lod999gRR
         2neJHDjYN45QOHP+7zv33wjGm/0aB5Bzc1CVEBHTY5XxkhkQ2oLGfD9DA0jXsrZB3oR4
         C5zjevroCDEDjpSvNz6zaV+a5PXjIqrXVRFtkzFY5hAD7l0orFjUR2C5PfYMxlF27J8s
         7ArtaDQERCSpieGQki8vnxUEafC5JfOQEFSKapmpkQ6TU1M0Xm6Nm4lfBVcs4CdtENT7
         VTUPoTXB9jnHoF1/4tp95v32AxRyco7/z3SfC+HAALo5mDVyJky9Gd4dgRjLW1vFZnef
         PVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6aMrN2ubH+NBTONrWTRgPhticMiP338JyBFBdD8aiTA=;
        b=S4FQcn5TyZntU3mycuJjKKqY3h2NgDJZY6mIhjlzUlQEvUu9oldFizJN/pXGDzinvb
         IfNq5jfshQFKe+NJT5+rI4UkZh67UlLn08gDmMt1FOG5vH2IIm2aJihA03scTemTyG1b
         eVSj4YV9m+TeBn4oL1IZQAb/n1es/PFofFxJ7sOM9+3GihuYRdeePzvsLJ7Wr4FVCu3a
         v8fY6/RFluPgEgvK0NBhcbP78eLm/L+O0cwGAZh52RwzTsSH8bZ2GxMdxbYZDDtjmuzf
         pmqB1KNdSmEs+x9D8V0uUgTXpAoz9ewP2rMY4CHFTZ6O6bEJPD7tmXfkdX9HARP8dPkk
         vvJw==
X-Gm-Message-State: AOAM533uJEzDTOsdA0xT9vvY25TaB7U4wazs70EIzavGA6Ve6TlDXMOM
        FVhne/GOha+W7xg9H+qmwhDdcA==
X-Google-Smtp-Source: ABdhPJzbr63idNagKF+sCXOawx64emFPOdldZh98ECXndCpPu17PiMLTo3LM5+RkLTNmeNcNznWRkA==
X-Received: by 2002:a1c:3c84:: with SMTP id j126mr2531900wma.151.1604669067945;
        Fri, 06 Nov 2020 05:24:27 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id u195sm2341908wmu.18.2020.11.06.05.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 05:24:27 -0800 (PST)
Date:   Fri, 6 Nov 2020 13:24:24 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Andrew Duggan <aduggan@synaptics.com>,
        Arjan Opmeer <arjan@opmeer.net>,
        "at www.cypress.com" <ttdrivers@cypress.com>,
        Benson Leung <bleung@chromium.org>,
        Bruce Kalk <kall@compass.com>,
        Christopher Heiny <cheiny@synaptics.com>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Dan Murphy <dmurphy@ti.com>, David Jander <david@protonic.nl>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dudley Du <dudl@cypress.com>, dusonlin@emc.com.tw,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Ferruh Yigit <fery@cypress.com>,
        Guenter Roeck <groeck@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        KT Liao <kt.liao@emc.com.tw>,
        Kumar G <naveen.gaddipati@stericsson.com>,
        linux-input@vger.kernel.org, Peter Osterlund <petero2@telia.com>,
        Phil Blundell <pb@handhelds.org>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        Sundar Iyer <sundar.iyer@stericsson.com>,
        Trilok Soni <tsoni@codeaurora.org>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Subject: Re: [PATCH 00/20] [Set 1/2] Rid W=1 issues from Input
Message-ID: <20201106132424.GG2063125@dell>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 04 Nov 2020, Lee Jones wrote:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> This is the first of 2 sets.
> 
> Lee Jones (20):
>   input: rmi4: rmi_bus: Fix misnaming of
>     '__rmi_register_function_handler's 'owner' param
>   input: mouse: cyapa: Fix misnaming of 'cyapa_i2c_write's 'reg' param
>   input: mouse: cyapa_gen5: Fix obvious abuse of kernel-doc format
>   input: misc: ab8500-ponkey: Fix incorrect name in 'ab8500_ponkey' doc
>     header
>   input: rmi4: rmi_f01: Struct headers are expected to start with
>     'struct <name>'
>   include: input: elan-i2c-ids: Mark 'elan_acpi_id' as __maybe_unused
>   input: keyboard: cros_ec_keyb: Struct headers should start with
>     'struct <name>'
>   input: rmi4: rmi_f11: Struct headers are expected to start with
>     'struct <name>'
>   input: touchscreen: resistive-adc-touch: Struct headers should start
>     with 'struct <name>'
>   input: mouse: synaptics: Place braces around empty if() body
>   input: keyboard: gpio_keys: Fix misnamed function parameter 'dev'
>   input: mouse: elantech: Demote obvious abuse of kernel-doc header
>   input: rmi4: rmi_f54: Provide some missing 'REPORT_TYPE' enums
>   input: rmi4: rmi_i2c: Provide some missing descriptions for struct
>     members
>   input: touchscreen: cyttsp4_core:  Move 'cyttsp4_tch_abs_string' to
>     the only file that references it
>   input: misc: drv260x: Fix kernel-doc formatting and remove one abuse
>   input: misc: drv2665: Fix formatting expected by kernel-doc
>   input: misc: drv2667: Fix formatting and add missing member docs
>   input: keyboard: nomadik-ske-keypad: Provide some missing struct
>     member docs
>   input: keyboard: pmic8xxx-keypad: Fix kernel-doc formatting

Dmitry,

Seeing as these changes are orthogonal, it would probably be easier
and certainly cause a lot less mailing list churn if you would be kind
enough to apply patches that do not need re-spinning.

I will rebase, rework and re-submit the remainder early next week.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
