Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A18C40EB5F
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 22:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbhIPUJ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 16:09:58 -0400
Received: from mleia.com ([178.79.152.223]:49050 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231994AbhIPUJ4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 16:09:56 -0400
X-Greylist: delayed 589 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Sep 2021 16:09:55 EDT
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 830C9210E9;
        Thu, 16 Sep 2021 19:58:45 +0000 (UTC)
Subject: Re: [PATCH] Input: lpc32xx-keys - Make use of the helper function
 dev_err_probe()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20210916153311.14628-1-caihuoqing@baidu.com>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <5f832f6c-0807-9cfb-f441-6eff820c40e1@mleia.com>
Date:   Thu, 16 Sep 2021 22:58:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210916153311.14628-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210916_195845_556695_4A8AB492 
X-CRM114-Status: GOOD (  17.01  )
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Cai,

On 9/16/21 6:33 PM, Cai Huoqing wrote:
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>   drivers/input/keyboard/lpc32xx-keys.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/lpc32xx-keys.c b/drivers/input/keyboard/lpc32xx-keys.c
> index 943aeeb0de79..12bdf68b8fe7 100644
> --- a/drivers/input/keyboard/lpc32xx-keys.c
> +++ b/drivers/input/keyboard/lpc32xx-keys.c
> @@ -227,10 +227,9 @@ static int lpc32xx_kscan_probe(struct platform_device *pdev)
>   
>   	/* Get the key scanner clock */
>   	kscandat->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(kscandat->clk)) {
> -		dev_err(&pdev->dev, "failed to get clock\n");
> -		return PTR_ERR(kscandat->clk);
> -	}
> +	if (IS_ERR(kscandat->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(kscandat->clk),
> +				     "failed to get clock\n");
>   
>   	/* Configure the key scanner */
>   	error = clk_prepare_enable(kscandat->clk);
> 

thank you for the change!

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
