Return-Path: <linux-input+bounces-5163-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE63693CA40
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 23:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A325C280F96
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 21:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2F913CFAD;
	Thu, 25 Jul 2024 21:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="c23b/NH4"
X-Original-To: linux-input@vger.kernel.org
Received: from msa.smtpout.orange.fr (out-72.smtpout.orange.fr [193.252.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555671C6BE;
	Thu, 25 Jul 2024 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721943266; cv=none; b=G/12D7rjEWQ6rGx536qQpaK5pDHTSWuT6E7312jjZmjqofdSy/DIxVaYSzgFOT0cyfne8ai2+/Q7DkVLr27B6CzrZyf+f08PzIy3A0sXRXbz+vdX+qvvmejRbfZK1kvUfvK+tG9UGVXV3ZZfmVAcGCwB22u2Tawm0mwFCU6LwLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721943266; c=relaxed/simple;
	bh=ENvliYBDHhnNUQ7Ss1C3ejAnQDtta+Uy8bEhB7BpKQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0ji/1jNAc/U+im4uXFlWmClMSkvZ48ygqlSJeFlHugIFn2goCAbaXlUn82oWIJJiv6o/CdvexXwb1lOofFq8N/s+6z4SeF1vI0bj1eOG/3zBLuqCtMJofIm9y8SjQBUIcXX/6BG8jOf5WQyUQTLsZvocTVHkq6R9jaR9efPCbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=c23b/NH4; arc=none smtp.client-ip=193.252.22.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id X66Isaw5Skc2vX66Is5muB; Thu, 25 Jul 2024 23:34:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1721943255;
	bh=3GVf49Ag0mfDTmCUha6spZlC3Hf8V+KJjEIwoWetM0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=c23b/NH4UbAKdVV6/6Z7xMBHTuWstBgJ38Akw5MOSGJkn1mtUu2Ogtyi15UJYPTFG
	 H8y9dJuQbsxBdmpMEVNAyj+ee+HPDnbLjP4lNBaAVlaZl4/i6KJFpPfCwJNoTEQkQU
	 yDKDBBTt9Tq/hqrHWKU0uiB1qUkasqyigleSmH8HnyISiTOTdqChhODnlj119c25QR
	 E3DDkNxE76ZinY754V3f02v5QnPfv3m5ybqkgor7/gCC2nv5uwm7Fy9HSDhPjLd7U0
	 TeWj1RKFfUjQdWW8OgCav93kB39eNBE4CEWz9M1iqWwY2JdIMfRba+Pjas/VccHYNF
	 aRntIjImJst5Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 25 Jul 2024 23:34:15 +0200
X-ME-IP: 90.11.132.44
Message-ID: <0e4f8499-97b1-49a7-b5af-11203cf625d7@wanadoo.fr>
Date: Thu, 25 Jul 2024 23:34:14 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Input: spear-keyboard - Fix a double put in
 spear_kbd_remove()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: vipulkumar.samar@st.com, viresh.kumar@linaro.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <cover.1721939824.git.christophe.jaillet@wanadoo.fr>
 <a39197be6248ebe5385e4f352241b4ba5e857c42.1721939824.git.christophe.jaillet@wanadoo.fr>
 <ZqK7HQMtV8oavTsM@google.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <ZqK7HQMtV8oavTsM@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 25/07/2024 à 22:52, Dmitry Torokhov a écrit :
> Hi Christophe,
> 
> On Thu, Jul 25, 2024 at 10:46:49PM +0200, Christophe JAILLET wrote:
>> The 'input_dev' is a managed resource allocated with
>> devm_input_allocate_device(), so there is no need to call
>> input_unregister_device() in the remove function.
>>
>> In fact, this call was correctly removed in commit 6102752eb354 ("Input:
>> spear-keyboard - switch to using managed resources"), but silently
>> re-introduced later in the commit in Fixes.
> 
> This change is incorrect as it leads to an active and enabled clock
> being unprepared to early. We need to unregister input device which in
> turn will call spear_kbd_close() if needed which will disable the clock
> in question. Only after that we can unprepare it.
> 
> There is also no double put as input core will recognize that input
> device was unregistered explicitly and will not attempt to unregister it
> 2nd time through devm:

Got it.

Thanks for the review and the detailed explanation.
Sorry for the noise.

I'll resend as asked in patch 2/2, if saving some lines of code makes 
enough sense for you.
But as said in the cover letter, if there is no issue, I'm not sure it 
worth the time for an old driver.

CJ

> 
> void input_unregister_device(struct input_dev *dev)
> {
> 	if (dev->devres_managed) {
> 		WARN_ON(devres_destroy(dev->dev.parent,
> 					devm_input_device_unregister,
> 					devm_input_device_match,
> 					dev));
> 		__input_unregister_device(dev);
> 		/*
> 		 * We do not do input_put_device() here because it will be done
> 		 * when 2nd devres fires up.
> 		 */
> 	} else {
> 		__input_unregister_device(dev);
> 		input_put_device(dev);
> 	}
> }
> 
>>
>> Fixes: 9336648978c2 ("Input: spear-keyboard - add clk_{un}prepare() support")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested-only
>> ---
>>   drivers/input/keyboard/spear-keyboard.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
>> index 557d00a667ce..5d9fc8dc9433 100644
>> --- a/drivers/input/keyboard/spear-keyboard.c
>> +++ b/drivers/input/keyboard/spear-keyboard.c
>> @@ -276,7 +276,6 @@ static void spear_kbd_remove(struct platform_device *pdev)
>>   {
>>   	struct spear_kbd *kbd = platform_get_drvdata(pdev);
>>   
>> -	input_unregister_device(kbd->input);
>>   	clk_unprepare(kbd->clk);
>>   }
>>   
>> -- 
>> 2.45.2
>>
> 
> Thanks.
> 


