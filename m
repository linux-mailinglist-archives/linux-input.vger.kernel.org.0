Return-Path: <linux-input+bounces-9156-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E26A7A0A8E7
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 13:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A95767A3AF7
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 12:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B6D19DF8D;
	Sun, 12 Jan 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="qw+MDZ3S"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21A61AA7A6;
	Sun, 12 Jan 2025 12:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736683440; cv=none; b=AtPIZ2ihsABhiw8qB09pqAmFvjGjsC0RIZ0e8qry3zqc+eTRYv6Va7CdnrPFP1V+V+zzqMH7x803xyRrfFEud8jnX4r+WLjHk8I74XnXBxE+EVnLibCQtqga5R4R31V/asJGdtI4mddU5KZ6FwNVkftFfZISLLCf3kCSjpLDzcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736683440; c=relaxed/simple;
	bh=k8EmI9dYe1DGxog/vNY2Edu08Vem8sDEjFMOL/RMAsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8MCzuvy8MkDTy+TySHCnY0L7uqrvtcGPe8a2QeJdibRAPbEqNai9BnZ5bULLm8mILK3cCoiRuNJeww8+AFIr+RVyHzYq2hQXUnr66SKVHZ4MNh71ajP8E9NuK0YsRtSUVp7fPpslnrMQ/SQURvUqXLR6Kfdwto/nzgk5Gy1KC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=qw+MDZ3S; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id WwfztSJiWGG8LWwg2tiIgG; Sun, 12 Jan 2025 13:02:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1736683367;
	bh=Mriq9+ZDryaYLFo807AdnhR2l3mjsKBc3giXizL140g=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=qw+MDZ3S02fnOJunw7CQFxXDqaAUmpIJ68F/n3/rb+tzs3Z25ggECNAZkwrOSsZO7
	 8QePvbUGw4C+whqbscUIbkP2eFenH/y2yCgv6GPBabSeDWq5yGJFiYq28RtzVkGNL6
	 03YpViQgzGdGE/WpzEllww9Fgj7esEiQDrHa0RNymzbNoBeXidlHGjmpScLzNfmnWt
	 DZjqyg5SKwti9JvRXZ3pPpV8O46hs20+NHRIyqUVrU/EvjTTGTfbg39J7BS0wfRTs7
	 dJ28hVq9Y1t8UaX3MKVeH2Ry0ScRaWBw51z2bXEXAfFRaD8BUtUd4oyNb0sxx2AlEB
	 2TOxODotHQ5cQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 12 Jan 2025 13:02:47 +0100
X-ME-IP: 90.11.132.44
Message-ID: <d31906c2-a9d4-4907-ae1b-bea0520adbe2@wanadoo.fr>
Date: Sun, 12 Jan 2025 13:02:42 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] HID: steelseries: preparation for adding
 SteelSeries Arctis 9 support
To: Christian Mayer <git@mayer-bgk.de>, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bastien Nocera <hadess@hadess.net>
References: <20250112114438.2196-1-git@mayer-bgk.de>
 <20250112114438.2196-2-git@mayer-bgk.de>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250112114438.2196-2-git@mayer-bgk.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 12/01/2025 à 12:44, Christian Mayer a écrit :
> Refactor code and add calls to hid_hw_open/hid_hw_closed in preparation
> for adding support for the SteelSeries Arctis 9 headset.
> 
> Signed-off-by: Christian Mayer <git@mayer-bgk.de>
> ---
>   drivers/hid/hid-steelseries.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
> index f9ff5be94309..dc4ab55d7c22 100644
> --- a/drivers/hid/hid-steelseries.c
> +++ b/drivers/hid/hid-steelseries.c
> @@ -377,20 +377,21 @@ static void steelseries_srws1_remove(struct hid_device *hdev)
>   #define ARCTIS_1_BATTERY_RESPONSE_LEN		8
>   static const char arctis_1_battery_request[] = { 0x06, 0x12 };
>   
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
> +	ret = hid_hw_raw_request(hdev, request[0], write_buf, len,
>   				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> -	if (ret < (int)sizeof(arctis_1_battery_request)) {
> +	if (ret < (int)len) {
>   		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
>   		ret = -ENODATA;
>   	}
> @@ -404,7 +405,8 @@ static void steelseries_headset_fetch_battery(struct hid_device *hdev)
>   	int ret = 0;
>   
>   	if (sd->quirks & STEELSERIES_ARCTIS_1)
> -		ret = steelseries_headset_arctis_1_fetch_battery(hdev);
> +		ret = steelseries_headset_request_battery(hdev,
> +			arctis_1_battery_request, sizeof(arctis_1_battery_request));
>   
>   	if (ret < 0)
>   		hid_dbg(hdev,
> @@ -554,6 +556,10 @@ static int steelseries_probe(struct hid_device *hdev, const struct hid_device_id
>   	if (ret)
>   		return ret;
>   
> +	ret = hid_hw_open(hdev);
> +	if (ret)
> +		return ret;

Should we call hid_hw_stop() if steelseries_headset_battery_register() 
below fails, as done in the remove funcion?

> +
>   	if (steelseries_headset_battery_register(sd) < 0)
>   		hid_err(sd->hdev,
>   			"Failed to register battery for headset\n");
> @@ -580,6 +586,7 @@ static void steelseries_remove(struct hid_device *hdev)
>   
>   	cancel_delayed_work_sync(&sd->battery_work);
>   
> +	hid_hw_close(hdev);
>   	hid_hw_stop(hdev);
>   }
>   


