Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCBDECBC69
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 15:58:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388733AbfJDN6o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 09:58:44 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:32845 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388149AbfJDN6o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Oct 2019 09:58:44 -0400
Received: by mail-wm1-f65.google.com with SMTP id r17so9688283wme.0
        for <linux-input@vger.kernel.org>; Fri, 04 Oct 2019 06:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Dw8CR7XEfOJ9npS37MQu+Odwfp7WIPeVgi6WO13Fiz8=;
        b=NZ63z1xbbA8zyZllIg94iS2Gl8dmSZBFbzDDievubTzQdWyhcPRpEpeqP+TRNnITBz
         ESTirw/C1bsYg1SuDnnPBJoMOcwl5y/M+eR0bUavEA/ImrQFbYKnadf5eH05cZTKhFmw
         r4YgwYc2d9D1+Rb0vStCa7no5QfdjzMq63m4qJ/dicCu11SXBtao9lggWXcmhn+YhxOv
         k0hZLFhUuDXnuMe9WJZjeS0EyYkhPiVgW77yoCELJM1OW1uW2e1NnL/ZBiloAx04WdjN
         uebT2jmwJsNhAxnoexJkFkU0n1UiwwgZ0qoOJjfZUlIwen+NptFgGovzzTXuX0saHPQ1
         P3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Dw8CR7XEfOJ9npS37MQu+Odwfp7WIPeVgi6WO13Fiz8=;
        b=YIBdVZSswLqJaYlwcsIRbXLggdGVI0MTxoLdyLjwUbk97mQRkZQXjxIH4BGeznjr/K
         cdOxNuEIoTNzumrpv6V3C7K4aoKIh2q8roRaOlzTpuX9Kn220VHPDOYoB+vTexElaYpP
         7kuJu4SSql2Ob2DGdcS33swQR4kbRW39KKqEN8NkVcXzhawkEEsorxnQ78K6vKDbcxru
         2/EMd0sQhkfKUW3DCe4od4R1qQVbuHTUFLuIfDMxi7RgTpegiDvcManB4nPvtD4XxPKT
         rxmd9QnM/hmtxo+p1uoykslp3z/DtZv3h70HwOIC0p2BLfXsUIoMP4jL8LC2jfZ0darQ
         aaNA==
X-Gm-Message-State: APjAAAWEzntOlXDcjWhzB1cbF01uomziB2e8AFsrc/CVEm6jgMMK4E9k
        0yuk5kWagPprlDudwIOxphSjmQ==
X-Google-Smtp-Source: APXvYqxsSuehmxsrNPOlj9JuBPTRmUAulOr74tH9QtvFC3b0fMLFsR6SbdAFKt15AEdgwZaAq8dRAA==
X-Received: by 2002:a7b:c776:: with SMTP id x22mr10088165wmk.123.1570197521770;
        Fri, 04 Oct 2019 06:58:41 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id m18sm12287804wrg.97.2019.10.04.06.58.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 06:58:40 -0700 (PDT)
Date:   Fri, 4 Oct 2019 14:58:39 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 1/3] mfd: mc13xxx: Add mc34708 adc support
Message-ID: <20191004135839.GG18429@dell>
References: <20190909214440.30674-1-lukma@denx.de>
 <20190909214440.30674-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190909214440.30674-2-lukma@denx.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 09 Sep 2019, Lukasz Majewski wrote:

> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> The mc34708 has an improved adc. The older variants will always convert
> a fixed order of channels. The mc34708 can do up to eight conversions
> in arbitrary channel order. Currently this extended feature is not
> supported. We only support touchscreen conversions now, which will
> be sampled in a data format compatible to the older chips in order
> to keep the API between the mfd and the touchscreen driver.

Please take this opportunity to split all the ADC stuff out into an
ADC specific driver.

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> 
> ---
> Changes for v5:
> - Remove adc_do_conversion() callbacks from struct mc13xxx_variant
> - Remove duplicated MC13XXX_ADC_WORKING #define
> 
> Changes for v4:
> - None
> 
> Changes for v3:
> - None
> 
> Changes for v2:
> - Change the return code patch when the mc13xxx ADC is performing conversion
> - Introduce new include/linux/mfd/mc34708.h header file for mc34708 specific
>   defines
> 
> Changes from the original patches:
> - ADC conversion functions prototypes added to fix build error
> - Adjustments to make checkpatch clean (-ENOSYS, line over 80 char)
> 
> This patch applies on top of Linux 5.3-rc8
> SHA1: f74c2bb98776e2de508f4d607cd519873065118e
> ---
>  drivers/mfd/mc13xxx-core.c  | 98 ++++++++++++++++++++++++++++++++++++-
>  include/linux/mfd/mc34708.h | 37 ++++++++++++++
>  2 files changed, 133 insertions(+), 2 deletions(-)
>  create mode 100644 include/linux/mfd/mc34708.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
