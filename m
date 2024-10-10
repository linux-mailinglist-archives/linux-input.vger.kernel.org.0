Return-Path: <linux-input+bounces-7279-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D19994E1
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACDAF1F23F0B
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 22:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6F91E284E;
	Thu, 10 Oct 2024 22:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAAwHYVC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369071BBBFD;
	Thu, 10 Oct 2024 22:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728597715; cv=none; b=kfeTfAZG3o0uMoSLCjjVXP68aX85jvynfE/Litf0GkiNvyOCP3IyBMCwdKmlj9ruduHB5qc0fNp1jUAQbCzbccJdPV+qmAZArZEW6OwpRaQPdaGN6ASqcyc9snAMvUe0RBcpagBBq1YWO0MAj7DOve4SYbX4VN2O/KQvMZ6mOoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728597715; c=relaxed/simple;
	bh=cfsIjF5ZKXnPFP+qfupxmI4Z5J8YfoMgIDvOaduggd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcBmeitRImjWFN90A1CgIsW+qNGAJTEfLKwn0OelspVINE9i/eD1uYl4zROIYppzFhX+52Tr39KyrCtZiOAlomi80zxVTPQP2QXtVOmFqVXndQCU7aaBURWU8wdVgIZkQ3UySfS/ZDkifnRvPALtlIkWhYnQ2M9XHFbacIDfGog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAAwHYVC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-430ee5c9570so15122205e9.3;
        Thu, 10 Oct 2024 15:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728597712; x=1729202512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qRo5pZaJYjcwJ3wqBtd7Mqnyiz4mZlGFWnd1eshq0HI=;
        b=NAAwHYVCiosAuT/8Tz3hMysOVyo5TxB6Si+UKIuQkTZjM8eu/+FEtGLIGT6K8t5pU7
         7mlfUImaEX7CHTcckvMDO8Bsc8o8Pt0u6ZxABu5gFtzY5soF/vJXpYTJzvMbbchHYEC5
         Ezuqxlib6n3hCiGkXCLHg0ojD9sUSX24/Y3+Z1P4PpbhgFmYGTqzsss/60dlmL1SWFv4
         u0y7FtYWRMt2IOgHjHAMajEHf2hwKl+IHtDXQpD9JTMEIIFNCzx+7QKJt074FguwDVs6
         F05S1ogcOaL1k/TTs3pNsOiEpz2wJViiPkdWvNGnT4ijbdWvAiMUE5e+4vf1JJXDx66Z
         40pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728597712; x=1729202512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qRo5pZaJYjcwJ3wqBtd7Mqnyiz4mZlGFWnd1eshq0HI=;
        b=A7yEdRFIqpjOD/ILAFllRr3oRVLTzfSAAVo72GCQl3wyjUSBHN6TQrLbqB2GTQhIr8
         WA0e5TUPHg0iINtHLosiRpFh+aaZQhEDCWbumAw3Vb0au38bM2T5Qf7GYaboNoLW1FSG
         xm7jzFsl4XaYPYtC0EM75DGQCOUKPCLul2wFbPzLENBmTG5fIcGTZlPD2ejcuiPVPoAZ
         8T/+0YLEYVApNE5EWZJHv0U+A3MlCZZGnMYmEwXOapOqZ7qDkOJuvNSTy8lWY/1RYerx
         oKQj2coVVavkbPDYBLqbiePNkXLqhp2WLld7TPZ1DDm3zR0LBFSyzHes2LLP8YkijQ+b
         0BnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpyScwAMkj+OPCzbzrXlkhdqPBi3ULgMPcnvCxWwfZBca1rGqycj0G7wvWFrN/hyqWdn/ka0c0aBNY9xQK@vger.kernel.org, AJvYcCW4WUcYznLmDZvb1SJhV0jln3R+qQ9q9jNHrGgEkpBDF390bgWkrq8j0pUu9aYnoztD7gtGZTpeEd1Anw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxKYyrws+10ECbDfI6HXQgR4gW73rlKZSLojDQQQWYANHM363P
	vDuaEUDV68M8k3Nid9mo+vtBNGl+1ykbvhMpu05t3b5mOkaaE1gB
X-Google-Smtp-Source: AGHT+IGXyz41JoTVviqZ6D56nKWyD7SMBw2XM/zgZy0gAt+4cCNQIYl2jc1hqRENs3/tmimOyBTBmQ==
X-Received: by 2002:a5d:67cf:0:b0:37d:2de3:bf8a with SMTP id ffacd0b85a97d-37d551d541amr439244f8f.26.1728597712420;
        Thu, 10 Oct 2024 15:01:52 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:3d08:841a:562:b7b5? (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182d793fsm26275335e9.9.2024.10.10.15.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:01:51 -0700 (PDT)
Message-ID: <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
Date: Fri, 11 Oct 2024 00:01:48 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
 <20241010214348.GD4017910@ZenIV>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241010214348.GD4017910@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2024 23:43, Al Viro wrote:
> On Thu, Oct 10, 2024 at 11:25:56PM +0200, Javier Carrasco wrote:
>>
>> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
>> index 20020cbc0752..bb1c732c8f95 100644
>> --- a/drivers/input/misc/sparcspkr.c
>> +++ b/drivers/input/misc/sparcspkr.c
>> @@ -188,7 +188,6 @@ static int bbc_beep_probe(struct platform_device *op)
>>  {
>>  	struct sparcspkr_state *state;
>>  	struct bbc_beep_info *info;
>> -	struct device_node *dp;
>>  	int err = -ENOMEM;
>>  
>>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
>> @@ -199,14 +198,13 @@ static int bbc_beep_probe(struct platform_device *op)
>>  	state->event = bbc_spkr_event;
>>  	spin_lock_init(&state->lock);
>>  
>> -	dp = of_find_node_by_path("/");
>>  	err = -ENODEV;
>> +	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
>>  	if (!dp)
>>  		goto out_free;
> 
> Sigh...  See that
>         state = kzalloc(sizeof(*state), GFP_KERNEL);
> 	if (!state)
> 		goto out_err;
> above?
> 
> IOW, this will quietly generate broken code if built with gcc (and refuse to
> compile with clang).  Yeah, this one is trivially fixed (return -ENOMEM instead
> of a goto), but...
> 
> __cleanup() can be useful, but it's really *not* safe for blind use; you
> need to watch out for changed scopes (harmless in case of device_node)
> and for gotos (broken here).

Hi Al Viro,

sorry, but I think I don't get you. First, I don't see sparc64 as a
supported architecture for clang in the Linux documentation. Maybe the
documentation is not up-to-date, but I tried to compile with clang and
it seems to be true that it is not supported. Anyway, that is not the
issue here.

Second, I might be missing something about the scopes you are
mentioning. 'state' gets allocated before the device_node is declared,
and when the device_node is declared and its initialization fails, it
should jump to 'out_free' to free 'state', shouldn't it? Sorry if I have
overlooked something here.

Thank your for your feedback and best regards,
Javier Carrasco


