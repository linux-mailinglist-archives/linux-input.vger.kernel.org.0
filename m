Return-Path: <linux-input+bounces-8884-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14676A0145A
	for <lists+linux-input@lfdr.de>; Sat,  4 Jan 2025 13:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CA7B1884568
	for <lists+linux-input@lfdr.de>; Sat,  4 Jan 2025 12:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3091B653E;
	Sat,  4 Jan 2025 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="O4AXni0f"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-77.smtpout.orange.fr [80.12.242.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC01B6CFF;
	Sat,  4 Jan 2025 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735994771; cv=none; b=LJou7wVNzAskPP7yyiUEIux02EiBB1WbILZO0bAjeR0Fzr3+A4Um1+YTajaYNnsdTyforEUQoBJc7hD22h+FWbHBPhyUHH9hku1zGWjzyRsn5AAT91d567QkrIp9N9QUBtZmk386vk/6bBKaO7prqBxhFhP/Ftb2gcg/kOCubeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735994771; c=relaxed/simple;
	bh=Ny9aIxU37YgjirAhZAzLOYOUoLUcuFtxN76qA2oseao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeTGnhFws8eyqo75plSBIRXmePx9T6j7McHXXbg+hSBySzJ44EkMrRBkt7iIaZVKgAOemWgcfi2NV3bKal4+G/D890476Z8T/KudDWsEt0lMEKL5B7MkaS7eAhfsJRgsV0rlLqKMTZ6lxFQ+FYc7qijqTju2JzJGoyHVYe76oUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=O4AXni0f; arc=none smtp.client-ip=80.12.242.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id U3XOtvIQgJiySU3XStiycP; Sat, 04 Jan 2025 13:45:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735994758;
	bh=MmPJAOzNMQswoxwTjmbjSPIafbqHVdbO2W/f4pmCofk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=O4AXni0foDMGXlK3HBO9+6UDhwr2sD8Xt4YTINLpMDyd2SOA35Jc1uLhR/IYHWz8k
	 IwDs6DCJG+8O5Hpd2rXww4h+jas4v5fScPqo29sc0xgRKTbYV7Uy5IpyMryTM1j8jj
	 MGlEjdhEM2WwxcfQar9v2bW8b5rDvV57a5DgDGEcSo0pIlqgMFbzkh/7iU1WUu3dUZ
	 okxciBHkGQQ9DEXU+YkNw9wR0uwHvPhcA5EffBewJETWoUhM/noBCGXeoaLbmDY/5d
	 dd61Np1+qnRL9G/4cdIKxJCMTATSi1w7E2dF3JziAFXCLoyxPzXl0ojzmLg/JEfAqy
	 rxS4O7H1SlHZQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 04 Jan 2025 13:45:58 +0100
X-ME-IP: 90.11.132.44
Message-ID: <63eb7eda-7db5-4e2c-a976-2f2eb088bf44@wanadoo.fr>
Date: Sat, 4 Jan 2025 13:45:53 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] HID: steelseries: add SteelSeries Arctis 9 support
To: Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bastien Nocera <hadess@hadess.net>
References: <20250101151209.100072-1-git@mayer-bgk.de>
 <20250101151209.100072-2-git@mayer-bgk.de>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250101151209.100072-2-git@mayer-bgk.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/01/2025 à 16:11, Christian Mayer a écrit :
> Add support for the SteelSeries Arctis 9 headset. This driver
> will export the battery information like it already does for
> the Arcits 1 headset.
> 
> Signed-off-by: Christian Mayer <git@mayer-bgk.de>

...

> -static int steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
> +static int steelseries_headset_request_battery(struct hid_device *hdev,
> +	const char *request, size_t len)
>   {
>   	u8 *write_buf;
>   	int ret;
>   
>   	/* Request battery information */
> -	write_buf = kmemdup(arctis_1_battery_request, sizeof(arctis_1_battery_request), GFP_KERNEL);
> +	write_buf = kmemdup(request, len, GFP_KERNEL);
>   	if (!write_buf)
>   		return -ENOMEM;
>   
> -	ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
> -				 write_buf, sizeof(arctis_1_battery_request),
> +	hid_dbg(hdev, "Sending battery request report");
> +	ret = hid_hw_raw_request(hdev, request[0],
> +				 write_buf, len,

This could be on the same line.

>   				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> -	if (ret < (int)sizeof(arctis_1_battery_request)) {
> +	if (ret < (int)len) {
>   		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
>   		ret = -ENODATA;
>   	}

...

> +static uint8_t steelseries_headset_map_capacity(uint8_t capacity, uint8_t min_in, uint8_t max_in)
> +{
> +	if (capacity > max_in)

 >= ?

> +		return 100;
> +	if (capacity < min_in)

<= ?

> +		return 0;
> +	return (capacity - min_in) * 100 / (max_in - min_in);
> +}

...

CJ

