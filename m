Return-Path: <linux-input+bounces-6425-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2F49751B5
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 14:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8633F281456
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 12:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8B517E017;
	Wed, 11 Sep 2024 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GoDD4cxU"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5601F176ADE
	for <linux-input@vger.kernel.org>; Wed, 11 Sep 2024 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726056979; cv=none; b=jjiSND16BvPZ1Ra48luw89gsAF5J4QgqOOvdqn2JG+8UofqLr3BYCbQ6t4y3Fe6kUT9YesE0Yw15Z5HlJmsWdBvIsapDKt56fv5SEml9D3r2V58BmyfpPNTOgxHAixXPbe28eTlLnqTCth/3GJLpanTWxe0qx8i7OsOg9Uu/8+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726056979; c=relaxed/simple;
	bh=eoJfABtYqMvLlN9x7GOSU6I15AplIKK3khXoF1GL8AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAl8a4daVIh48oNGQ+pAPVXCq+OF+0rknApcSSF5T479qYfM99OZevpR8IovY0X9p41YxYN06Z/8un9JtCWzI2dWrC9r921iFCYtPBEgJzkga0c7qnw8QTZD5r0LhdYSbgyoog7z02ljfaEVeV/uzGO4OJ2RZkn0ZkaA+tnyJ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GoDD4cxU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726056977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwQ3vlWoVxvl74dbWTtkNwifYV2roKP6SQNjP0xDYZU=;
	b=GoDD4cxUDsno7glnbuQ6xw41o0Oqs6phS7Tey4FuZVxFPU8dPoXfyBxnHaA7aYy2sr3hVG
	GGinDZjBKgnkd3nAefgpGJcc36hdEaJOP0cbrIbUyFm2U1KtcbRD6fhmo7/ZXqaBmnqhwU
	/vpu4b+nEN1hW2mc0M8nBTrkFTQZLm8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-WVLIRxv0N8C8Xl0bFTJvrA-1; Wed, 11 Sep 2024 08:16:15 -0400
X-MC-Unique: WVLIRxv0N8C8Xl0bFTJvrA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c25e0a50bfso4743314a12.0
        for <linux-input@vger.kernel.org>; Wed, 11 Sep 2024 05:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726056975; x=1726661775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwQ3vlWoVxvl74dbWTtkNwifYV2roKP6SQNjP0xDYZU=;
        b=cUFfq2Y4L+1JatmrvIBHvQ9l3IPaJ7UgkxkYg/mSwLk54w/qdcnMF4nx8c7pEgpqeN
         qEfVl1SO4m09Q1nZ97hwE4/FQeN29KhVFCIEispXtEYkEzaM/2Q8U1/ErYpFIWGIu5zR
         ZRAswtekctpetiCkXv4YY09vlWC8paX4kDPUgCcCv8Se0JErrhQNe45TMqjxibH2YH4p
         VAPaVJkaQDs4uuFHUj7ZhxTc3fO15mSqi67Ylsh963lF2hrYOlR5IcBHuWFjFGW37SSV
         x5PLXccuIQRZzeXpkTQK8dKZ2GJa4XeNVEfk4WRtTACTYFi80QA6osp0P/cQYXy1YSx9
         uy9A==
X-Forwarded-Encrypted: i=1; AJvYcCUTAURoQBqT0QlGbJoEFdSaXMmIKtxQkiR117Kel0YCNJTdfTKdhznVUTp5s5Yb612vsIcv0cPFGw31KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkReLcw8+9glJ5KkASnp3xA4JwwJgnynuDffXvk5cKe8+wwAEf
	VBTqPiR3euMGnRN6GjlbTAgGyWNEIXrp8gjKHdnNkMRmQFDhyCzh53BTZHZAJVkP9JOp6hIflLF
	gCJMM42cb55vUv1YmMfKe6i3PH6inFgG6wnX4MJcTkb+pK7wuskaF+xONKtpg
X-Received: by 2002:a05:6402:360c:b0:5c0:bba5:60d2 with SMTP id 4fb4d7f45d1cf-5c3dc7a1cb6mr12697027a12.21.1726056974681;
        Wed, 11 Sep 2024 05:16:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxzXIn8XOPpBJr8Jixmc7y00/vhUtIqpGesUYgpfj+7qRi00gLt3n1xfQeW8GFdI5o/04x3w==
X-Received: by 2002:a05:6402:360c:b0:5c0:bba5:60d2 with SMTP id 4fb4d7f45d1cf-5c3dc7a1cb6mr12697001a12.21.1726056974076;
        Wed, 11 Sep 2024 05:16:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd466dcsm5355311a12.24.2024.09.11.05.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 05:16:13 -0700 (PDT)
Message-ID: <20e04024-ee86-4be3-9945-bf1c5148b9ae@redhat.com>
Date: Wed, 11 Sep 2024 14:16:12 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: i2c-hid: ensure various commands do not interfere
 with each other
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, ". Benjamin Tissoires" <bentiss@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Kenny Levinsen <kl@kl.wtf>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <Zt9clAu04BinzIcd@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zt9clAu04BinzIcd@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/9/24 10:37 PM, Dmitry Torokhov wrote:
> i2c-hid uses 2 shared buffers: command and "raw" input buffer for
> sending requests to peripherals and read data from peripherals when
> executing variety of commands. Such commands include reading of HID
> registers, requesting particular power mode, getting and setting
> reports and so on. Because all such requests use the same 2 buffers
> they should not execute simultaneously.
> 
> Fix this by introducing "cmd_lock" mutex and acquire it whenever
> we needs to access ihid->cmdbuf or idid->rawbuf.

Typo: s/idid/ihid/

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 42 +++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 632eaf9e11a6..2f8a9d3f1e86 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -105,6 +105,7 @@ struct i2c_hid {
>  
>  	wait_queue_head_t	wait;		/* For waiting the interrupt */
>  
> +	struct mutex		cmd_lock;	/* protects cmdbuf and rawbuf */
>  	struct mutex		reset_lock;
>  
>  	struct i2chid_ops	*ops;
> @@ -220,6 +221,8 @@ static int i2c_hid_xfer(struct i2c_hid *ihid,
>  static int i2c_hid_read_register(struct i2c_hid *ihid, __le16 reg,
>  				 void *buf, size_t len)
>  {
> +	guard(mutex)(&ihid->cmd_lock);
> +
>  	*(__le16 *)ihid->cmdbuf = reg;
>  
>  	return i2c_hid_xfer(ihid, ihid->cmdbuf, sizeof(__le16), buf, len);
> @@ -252,6 +255,8 @@ static int i2c_hid_get_report(struct i2c_hid *ihid,
>  
>  	i2c_hid_dbg(ihid, "%s\n", __func__);
>  
> +	guard(mutex)(&ihid->cmd_lock);
> +
>  	/* Command register goes first */
>  	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
>  	length += sizeof(__le16);
> @@ -342,6 +347,8 @@ static int i2c_hid_set_or_send_report(struct i2c_hid *ihid,
>  	if (!do_set && le16_to_cpu(ihid->hdesc.wMaxOutputLength) == 0)
>  		return -ENOSYS;
>  
> +	guard(mutex)(&ihid->cmd_lock);
> +
>  	if (do_set) {
>  		/* Command register goes first */
>  		*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
> @@ -384,6 +391,8 @@ static int i2c_hid_set_power_command(struct i2c_hid *ihid, int power_state)
>  {
>  	size_t length;
>  
> +	guard(mutex)(&ihid->cmd_lock);
> +
>  	/* SET_POWER uses command register */
>  	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
>  	length = sizeof(__le16);
> @@ -440,25 +449,27 @@ static int i2c_hid_start_hwreset(struct i2c_hid *ihid)
>  	if (ret)
>  		return ret;
>  
> -	/* Prepare reset command. Command register goes first. */
> -	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
> -	length += sizeof(__le16);
> -	/* Next is RESET command itself */
> -	length += i2c_hid_encode_command(ihid->cmdbuf + length,
> -					 I2C_HID_OPCODE_RESET, 0, 0);
> +	scoped_guard(mutex, &ihid->cmd_lock) {
> +		/* Prepare reset command. Command register goes first. */
> +		*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
> +		length += sizeof(__le16);
> +		/* Next is RESET command itself */
> +		length += i2c_hid_encode_command(ihid->cmdbuf + length,
> +						 I2C_HID_OPCODE_RESET, 0, 0);
>  
> -	set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> +		set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
>  
> -	ret = i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
> -	if (ret) {
> -		dev_err(&ihid->client->dev,
> -			"failed to reset device: %d\n", ret);
> -		goto err_clear_reset;
> -	}
> +		ret = i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
> +		if (ret) {
> +			dev_err(&ihid->client->dev,
> +				"failed to reset device: %d\n", ret);
> +			break;
> +		}
>  
> -	return 0;
> +		return 0;
> +	}
>  
> -err_clear_reset:
> +	/* Clean up if sending reset command failed */
>  	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
>  	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
>  	return ret;
> @@ -1200,6 +1211,7 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
>  	ihid->is_panel_follower = drm_is_panel_follower(&client->dev);
>  
>  	init_waitqueue_head(&ihid->wait);
> +	mutex_init(&ihid->cmd_lock);
>  	mutex_init(&ihid->reset_lock);
>  	INIT_WORK(&ihid->panel_follower_prepare_work, ihid_core_panel_prepare_work);
>  


