Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461012FF770
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 22:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727353AbhAUVjP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 21 Jan 2021 16:39:15 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2983 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727747AbhAUVjM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 16:39:12 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DMG2H5y0WzR3L9;
        Fri, 22 Jan 2021 05:37:27 +0800 (CST)
Received: from dggemi759-chm.china.huawei.com (10.1.198.145) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Fri, 22 Jan 2021 05:38:29 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggemi759-chm.china.huawei.com (10.1.198.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 22 Jan 2021 05:38:28 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.002;
 Fri, 22 Jan 2021 05:38:28 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "maz@kernel.org" <maz@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 00/12] add IRQF_NO_AUTOEN for request_irq
Thread-Topic: [PATCH v3 00/12] add IRQF_NO_AUTOEN for request_irq
Thread-Index: AQHW5Uav1s1FE9lhq0KcBdg/8U38O6oyrhwg
Date:   Thu, 21 Jan 2021 21:38:28 +0000
Message-ID: <848fb07c3073401bbbe15db71f5922c9@hisilicon.com>
References: <20210107223926.35284-1-song.bao.hua@hisilicon.com>
In-Reply-To: <20210107223926.35284-1-song.bao.hua@hisilicon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Thomas, Greg, Dmitry, Marc,
Any further comment on this new API? 

Thanks
Barry

> -----Original Message-----
> From: Song Bao Hua (Barry Song)
> Sent: Friday, January 8, 2021 11:39 AM
> To: dmitry.torokhov@gmail.com; tglx@linutronix.de; maz@kernel.org;
> gregkh@linuxfoundation.org; linux-input@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Cc: linuxarm@openeuler.org; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>
> Subject: [PATCH v3 00/12] add IRQF_NO_AUTOEN for request_irq
> 
> This patchset added IRQF_NO_AUTOEN for request_irq() and converted
> drivers/input to this new API.
> Other drivers will be handled afterwards.
> 
> -v3:
>   added examples with respect to Greg's comment
> 
> Barry Song (12):
>   genirq: add IRQF_NO_AUTOEN for request_irq
>   Input: ar1021 - request_irq by IRQF_NO_AUTOEN and remove disable_irq
>   Input: atmel_mxt_ts - request_irq by IRQF_NO_AUTOEN and remove
>     disable_irq
>   Input: melfas_mip4 - request_irq by IRQF_NO_AUTOEN and remove
>     disable_irq
>   Input: bu21029_ts - request_irq by IRQF_NO_AUTOEN and remove
>     irq_set_status_flags
>   Input: stmfts - request_irq by IRQF_NO_AUTOEN and remove
>     irq_set_status_flags
>   Input: zinitix - request_irq by IRQF_NO_AUTOEN and remove
>     irq_set_status_flags
>   Input: mms114 - request_irq by IRQF_NO_AUTOEN and remove disable_irq
>   Input: wm831x-ts - request_irq by IRQF_NO_AUTOEN and remove
>     disable_irq
>   Input: cyttsp - request_irq by IRQF_NO_AUTOEN and remove disable_irq
>   Input: tegra-kbc - request_irq by IRQF_NO_AUTOEN and remove
>     disable_irq
>   Input: tca6416-keypad - request_irq by IRQF_NO_AUTOEN and remove
>     disable_irq
> 
>  drivers/input/keyboard/tca6416-keypad.c  |  3 +--
>  drivers/input/keyboard/tegra-kbc.c       |  5 ++---
>  drivers/input/touchscreen/ar1021_i2c.c   |  5 +----
>  drivers/input/touchscreen/atmel_mxt_ts.c |  5 ++---
>  drivers/input/touchscreen/bu21029_ts.c   |  4 ++--
>  drivers/input/touchscreen/cyttsp_core.c  |  5 ++---
>  drivers/input/touchscreen/melfas_mip4.c  |  5 ++---
>  drivers/input/touchscreen/mms114.c       |  4 ++--
>  drivers/input/touchscreen/stmfts.c       |  3 +--
>  drivers/input/touchscreen/wm831x-ts.c    |  3 +--
>  drivers/input/touchscreen/zinitix.c      |  4 ++--
>  include/linux/interrupt.h                |  3 +++
>  kernel/irq/manage.c                      |  8 ++++++++
>  kernel/irq/settings.h                    | 10 ++++++++++
>  14 files changed, 39 insertions(+), 28 deletions(-)
> 
> --
> 2.25.1

