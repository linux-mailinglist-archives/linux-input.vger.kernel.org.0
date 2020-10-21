Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F326F29462C
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 03:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439832AbgJUBOo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Oct 2020 21:14:44 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:7913 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439830AbgJUBOo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Oct 2020 21:14:44 -0400
IronPort-SDR: vfMMZbMrvhynx/OHgDO01je5JhrfEJXz4n0Goj22cn35m5OTsfmbJgp/mYTCVegcRx13zLvlVj
 +OGzYXpR3S8ZN0t5UMY/CToFQ0PcQpyxEYLaRGVtzXhTymS8o68ezFjMbybiU2JnZHSdiEWuIS
 YfMrO0uTWY0oj6A94ekr4gyfIiqeijJGrwmiSqMF4zNUiSZq/mKx6it/ywudLYLHfRfcd2jZO7
 jX8vjAsSplVla0rxwWTGA4/vD3VPBbEQ2BduU7RYTS0eDZw9Dqm9w16aS9Bn6fkND8TK/eREpF
 TRo=
X-IronPort-AV: E=Sophos;i="5.77,399,1596528000"; 
   d="scan'208";a="54294566"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 20 Oct 2020 17:14:43 -0800
IronPort-SDR: 85YMpVnbLfxUK1a+jmxhDCviXgDNMb8OelwxFri+DnANo5VLi2+uV9HRtg85TTf4D5RxfI0pJd
 twwUxlr7wjnHBJzcYgWEQU2yqmjkp/8Peac8BtAZECdDUoXkijOFPJR+pMxdpFixS4OxSIiq7D
 FPTVDjCf97Eqaf2DZkpDAz8PbVIkd8vOzPqsG1WXPSWdnG8Pe4urz5eRwhB062UtB0QBOdNztL
 yzzvgzXh5BbqjGMZ9ZUE4IKX//UHy1Wn4LrS1DOyvM68Y5vwXo/xnp307dsbQv5OZvmrHfWdGb
 oRY=
Subject: Re: [PATCH v3 0/3] implement I2C retries for mXT1368
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <andrew_gabbasov@mentor.com>
References: <20200930151259.18119-1-jiada_wang@mentor.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <653c24a4-704a-4d65-2622-49c55a82c901@mentor.com>
Date:   Wed, 21 Oct 2020 10:14:29 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930151259.18119-1-jiada_wang@mentor.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry and all

Kind reminder on this patch-set


Thanks,
Jiada

On 2020/10/01 0:12, Jiada Wang wrote:
> According to datasheet, mXT1386 chip has a WAKE line, it is used
> to wake the chip up from deep sleep mode before communicating with
> it via the I2C-compatible interface.
>      
> if the WAKE line is connected to a GPIO line, the line must be
> asserted 25 ms before the host attempts to communicate with the
> mXT1386.
> If the WAKE line is connected to the SCL pin, the mXT1386 will send
> a NACK on the first attempt to address it, the host must then retry
> 25 ms later.
>      
> This patch adds compatible string "atmel,mXT1386" for mXT1386 controller,
> when I2C transfer on mXT1386 fails, retry the transfer once after a
> 25 ms sleep.
> 
> 
> Jiada Wang (3):
>    dt-bindings: input: atmel: add compatible for mXT1386
>    Input: atmel_mxt_ts - implement I2C retries for mXT1368
>    ARM: tegra: add mXT1386 compatible
> 
> ---
> v3:
> change compatible string to lowercase
> 
> v2:
> add bool retry_i2c_transfers to struct mxt_data,
> to indicate whether retry is needed when i2c transfer fails
> 
> v1: initial version
> ---
>   .../bindings/input/atmel,maxtouch.txt         |  1 +
>   .../boot/dts/tegra20-acer-a500-picasso.dts    |  2 +-
>   drivers/input/touchscreen/atmel_mxt_ts.c      | 62 +++++++++++++++----
>   3 files changed, 52 insertions(+), 13 deletions(-)
> 
