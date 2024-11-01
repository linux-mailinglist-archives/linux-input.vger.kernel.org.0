Return-Path: <linux-input+bounces-7828-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 239959B8EE8
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 11:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C380B1F211CE
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2024 10:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915451586F2;
	Fri,  1 Nov 2024 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Vmz8C9rt"
X-Original-To: linux-input@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-218.smtpout.orange.fr [193.252.23.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14965156F28;
	Fri,  1 Nov 2024 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456265; cv=none; b=pp8dQWWIi2wZZv3iyb7tdtCCUO43YXiRt3nGmTKOnIe/MSLdtoTAQ5EZ4FMk3J9l0hI47+hAYFulY0pNGemFanLZCpzM8Reg8sbCB361Q27jYexni1CtFllZms7yTZH5SLkk/j9RobanrX8ZZxFsS0epU2YTO2zbMfttKVj3EWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456265; c=relaxed/simple;
	bh=/kpNeAZ5W7kfgLzBK3bZ9/+VoPRaZE0HpJHhDpbcJqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJGDkslTSOkeRjTBgp/s/x0YtXJ5rp138mBE7wdfLl++zyKMdexpQIPZUGtNHSrx/apA1hAp3s11/qGpkuh38v2Y6H2KJ2Igod5Dr2QyVnsYOJUr/DqYVrae7T91mCbTzisuyC8+jRqgYt9asZPF9TgxfTepR3ReTknYdFqMdjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Vmz8C9rt; arc=none smtp.client-ip=193.252.23.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 6oiitPoJqlUew6oiitfNq9; Fri, 01 Nov 2024 11:17:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730456252;
	bh=TJm0FTTapjfsTGHQas8+XIvgu/RJ1IZnH5FHoN9D0qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Vmz8C9rt2n48leYSOdBgKlNf7m7wEV4yE8zpBHfBwTwOMR9LL2ARDs1BYM+hPvXWn
	 fQivIGZLGNgPGm32a/EjGSN2kMCXrEpSVhvk31PQyjp1NAJQtvx2FjyW6nxjzDItRP
	 jaos0rZEmbY3q98zEj5ExK/l697wMChcBXjQzYnm6eI8UuTrMwpkN+TZgICSp4hgIc
	 wp3LgffU103yKZmrnBthmEqFc2WuEc5I2AyCvXVovgL3QDUphE/z+PnKG8oJ8miQFf
	 2M+5np8pV5avdndIwpB6+3fhhc8P3egk/jIQkfOTpUyW2YUuDY3OKZ1Gg/+aHiJYJV
	 qGPGM9waDlXDg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 01 Nov 2024 11:17:32 +0100
X-ME-IP: 90.11.132.44
Message-ID: <4fada863-b125-454d-97d0-efbf44ec3bc8@wanadoo.fr>
Date: Fri, 1 Nov 2024 11:17:32 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: bbnsm_pwrkey - add remove hook
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, dmitry.torokhov@gmail.com
Cc: Frank.Li@nxp.com, ping.bai@nxp.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20241101101222.1448210-1-peng.fan@oss.nxp.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241101101222.1448210-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/11/2024 à 11:12, Peng Fan (OSS) a écrit :
> From: Peng Fan <peng.fan@nxp.com>
> 
> Without remove hook to clear wake irq, there will be kernel dump when
> doing module test.
> "bbnsm_pwrkey 44440000.bbnsm:pwrkey: wake irq already initialized"
> 
> Add remove hook to clear wake irq and set wakeup to false.
> 
> Fixes: 40e40fdfec3f ("Input: bbnsm_pwrkey - add bbnsm power key support")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/input/misc/nxp-bbnsm-pwrkey.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> index eb4173f9c820..847964f7ebdd 100644
> --- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
> +++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> @@ -187,6 +187,17 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static void bbnsm_pwrkey_remove(struct platform_device *pdev)
> +{
> +	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> +
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +	device_init_wakeup(&pdev->dev, false);
> +
> +	if (bbnsm)

IIUC, no need to test, if the remove function is called, this can't be NULL.

> +		input_unregister_device(bbnsm->input);
> +}
> +
>   static int __maybe_unused bbnsm_pwrkey_suspend(struct device *dev)
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
> @@ -223,6 +234,8 @@ static struct platform_driver bbnsm_pwrkey_driver = {
>   		.of_match_table = bbnsm_pwrkey_ids,
>   	},
>   	.probe = bbnsm_pwrkey_probe,
> +	.remove_new = bbnsm_pwrkey_remove,

I think that .remove should be used here instead.
(see 
https://elixir.bootlin.com/linux/v6.12-rc5/source/include/linux/platform_device.h#L240) 


> +
>   };
>   module_platform_driver(bbnsm_pwrkey_driver);
>   

CJ

