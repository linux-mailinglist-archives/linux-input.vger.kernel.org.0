Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613972A439A
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 12:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgKCK6U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 05:58:20 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:3025 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728108AbgKCK6U (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Nov 2020 05:58:20 -0500
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id 44291E399A9F1DC65D48;
        Tue,  3 Nov 2020 10:58:19 +0000 (GMT)
Received: from localhost (10.52.125.233) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 3 Nov 2020
 10:58:18 +0000
Date:   Tue, 3 Nov 2020 10:58:17 +0000
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Necip Fazil Yildiran <fazilyildiran@gmail.com>
CC:     <dmitry.torokhov@gmail.com>, <eugen.hristev@microchip.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <paul@pgazz.com>, <jeho@cs.utexas.edu>
Subject: Re: [PATCH] Input: touchscreen: fix kconfig dependency bug for
 TOUCHSCREEN_ADC
Message-ID: <20201103105817.00005a7f@Huawei.com>
In-Reply-To: <20201102221504.541279-1-fazilyildiran@gmail.com>
References: <20201102221504.541279-1-fazilyildiran@gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.233]
X-ClientProxiedBy: lhreml716-chm.china.huawei.com (10.201.108.67) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 3 Nov 2020 01:15:05 +0300
Necip Fazil Yildiran <fazilyildiran@gmail.com> wrote:

> When TOUCHSCREEN_ADC is enabled and IIO_BUFFER is disabled, it results
> in the following Kbuild warning:
> 
> WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
>   Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
>   Selected by [y]:
>   - TOUCHSCREEN_ADC [=y] && !UML && INPUT [=y] && INPUT_TOUCHSCREEN [=y] && IIO [=y]
> 
> The reason is that TOUCHSCREEN_ADC selects IIO_BUFFER_CB without depending
> on or selecting IIO_BUFFER while IIO_BUFFER_CB depends on IIO_BUFFER. This
> can also fail building the kernel.
> 
> Honor the kconfig dependency to remove unmet direct dependency warnings
> and avoid any potential build failures.
> 
> Fixes: aa132ffb6b0a ("input: touchscreen: resistive-adc-touch: add generic resistive ADC touchscreen")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=209881
> Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/input/touchscreen/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index f012fe746df0..cc18f54ea887 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -96,6 +96,7 @@ config TOUCHSCREEN_AD7879_SPI
>  config TOUCHSCREEN_ADC
>  	tristate "Generic ADC based resistive touchscreen"
>  	depends on IIO
> +	select IIO_BUFFER
>  	select IIO_BUFFER_CB
>  	help
>  	  Say Y here if you want to use the generic ADC

