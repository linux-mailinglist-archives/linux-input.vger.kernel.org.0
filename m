Return-Path: <linux-input+bounces-7646-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B649ACB2E
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 15:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5300B220EB
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 13:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE89A1B4F1F;
	Wed, 23 Oct 2024 13:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqKDB4SW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C151DFEF;
	Wed, 23 Oct 2024 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729690110; cv=none; b=hrLS344g44ZuZvrPOvIcDSE4j4UShmU+EfPQ7O31XoZOKXoehsLxNEtjxFZNi4w+hgJUUz4mYHs8FdidZQveD5h5YQWkkyS53nFkvpLUUwe8cfR8hTfJhecrMEiLYJhBL63V9GBtDSXgeM7MYaXbn+EafefAKP/Qn1FLIBNWdXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729690110; c=relaxed/simple;
	bh=24qEN6D0LTwvDWITbryGhmOhhVBgdVhMwO4Z2D8zL2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2DmuVNAlqctUE7cRrzoecALqjXYjBDjKV78po9VIk5mKqjsfHliDJ5c7mZB8ymdSOv25nBetbGAy9beVHwbrmEs6J6okaff2P14sIYtSvCBZN4Ivm1nvxZhw5i6+QZGn010dcz4wQJFaDPG4KlRNoFO9DNAOTQzrTKkbjMHPo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqKDB4SW; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb49510250so66535631fa.0;
        Wed, 23 Oct 2024 06:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729690107; x=1730294907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5FukJiNYIfRRavDz6aUIEuTye2N8Bis4rnvXfShRyhg=;
        b=LqKDB4SW+e6r7LsYSdV6wbRw9aSvaiXK4PLiRw3wXYxAoDpPG8OjS5JnnYj1dKR06h
         mYKrVZTpLgq7QbwPG1pC5//XCxBTWzPncJ+d+qvfdKPWmCIElgdSpuI72bAbgKToA9fc
         kLVdbkzm+LfAfz+Kqsx/Y+4nK1oGzNxSKKnS9TJjcHL5rIjpAbVmJ22TJjEkEdinnLGD
         p7Hv08YixVD+EmwSl/G86fI3PErmGLpNT5Mber+RwaJ7XRjJ3Yo6RWGcxqhvfIfYxE77
         +leVJpalbpAM8Rtexq97XvYJ2EHSGYSlALA9BIp6tlYZTOX0e6b0X8I4jBEmE2GrTHoY
         2RlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729690107; x=1730294907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5FukJiNYIfRRavDz6aUIEuTye2N8Bis4rnvXfShRyhg=;
        b=Zw5SxAvjy56wDfyEvUJ4Vr6qsSaPf+ee8j3izXTN+YYIl7ySx3KSZCWBkctETOSaug
         BSdRP7sZXyQzPLwDYsst6oXqZGJHuTVxKkzRLLyR7HdLYDoYM+6JdTVu+DfH0BG1cQPI
         n5/+l2A3+jMlYWzEEeXh/Gf13WSN06gQxDIJzUlI2az6WnEZa2aPmm4sQa3aX5MtXT8r
         awzctDdC4/9DPT1e81TEAm29ZfaxfG5uuuvaHSomcsspRsPGOsCbct9GSVDel9ALED5H
         BQjmDpMzesAXLMrG3a9WwlvoOW0D+GEK2GCq8vZInZ+O+yGq92zj+iGcGAyTFZtCeWLS
         oOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLbMbB9j1DgKaFeD6rtBUu8bUgBpH6aF+dI5m8dWTlhrmsJKSDb2LRxtvzY1dX8SO5pAefEjXlceIdPVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwML4y/Wc05SBYVSUooUT7YgbdIgT+rrCovubVMKojv9B84NSyF
	GD2MWctLbknR4GnDO6egOq3qijuqu+zJbfGs2RCMKJeryfPhglb6
X-Google-Smtp-Source: AGHT+IH7w1azbwgI6P68BjI4XS1dYhoR9JABmwXqtBbbny0QtGZJs22sYgrSMQAQlVFpCVHuqhn8WA==
X-Received: by 2002:a05:651c:1989:b0:2fb:51f3:9212 with SMTP id 38308e7fff4ca-2fc9d32ed3bmr16687281fa.6.1729690106503;
        Wed, 23 Oct 2024 06:28:26 -0700 (PDT)
Received: from [192.168.1.107] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae10131sm10607641fa.107.2024.10.23.06.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 06:28:26 -0700 (PDT)
Message-ID: <ed4ada83-807a-44f5-840a-47b3a77c4eb9@gmail.com>
Date: Wed, 23 Oct 2024 16:28:25 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] input/touchscreen: imagis: Fix not used variable
 'imagis_3038_data'
To: Zeng Heng <zengheng4@huawei.com>, raymondhackley@protonmail.com,
 dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, bobo.shaobowang@huawei.com,
 linux-kernel@vger.kernel.org
References: <20241023094831.1680214-1-zengheng4@huawei.com>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <20241023094831.1680214-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 10/23/24 12:48 PM, Zeng Heng wrote:
> Fix the following compilation warnings:
> drivers/input/touchscreen/imagis.c:422:39: warning: ‘imagis_3038c_data’
> defined but not used [-Wunused-const-variable=]
>    422 | static const struct imagis_properties imagis_3038c_data = {
> drivers/input/touchscreen/imagis.c:415:39: warning: ‘imagis_3038b_data’
> defined but not used [-Wunused-const-variable=]
>    415 | static const struct imagis_properties imagis_3038b_data = {
> drivers/input/touchscreen/imagis.c:407:39: warning: ‘imagis_3038_data’
> defined but not used [-Wunused-const-variable=]
>    407 | static const struct imagis_properties imagis_3038_data = {
> drivers/input/touchscreen/imagis.c:398:39: warning: ‘imagis_3032c_data’
> defined but not used [-Wunused-const-variable=]
>    398 | static const struct imagis_properties imagis_3032c_data = {
>
> Only define the variables 'imagis_303*_data' when the CONFIG_OF
> is enabled.
>
> Fixes: 1e48ee99f603 ("Input: imagis - add supports for Imagis IST3038")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>   drivers/input/touchscreen/imagis.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/touchscreen/imagis.c b/drivers/input/touchscreen/imagis.c
> index aeabf8d057de..abeae9102323 100644
> --- a/drivers/input/touchscreen/imagis.c
> +++ b/drivers/input/touchscreen/imagis.c
> @@ -395,6 +395,7 @@ static int imagis_resume(struct device *dev)
>   
>   static DEFINE_SIMPLE_DEV_PM_OPS(imagis_pm_ops, imagis_suspend, imagis_resume);
>   
> +#ifdef CONFIG_OF
>   static const struct imagis_properties imagis_3032c_data = {
>   	.interrupt_msg_cmd = IST3038C_REG_INTR_MESSAGE,
>   	.touch_coord_cmd = IST3038C_REG_TOUCH_COORD,
> @@ -427,7 +428,6 @@ static const struct imagis_properties imagis_3038c_data = {
>   	.protocol_b = true,
>   };
>   
> -#ifdef CONFIG_OF
>   static const struct of_device_id imagis_of_match[] = {
>   	{ .compatible = "imagis,ist3032c", .data = &imagis_3032c_data },
>   	{ .compatible = "imagis,ist3038", .data = &imagis_3038_data },

Acked-by: Markuss Broks <markuss.broks@gmail.com>

- Markuss


