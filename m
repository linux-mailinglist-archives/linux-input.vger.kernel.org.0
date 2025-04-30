Return-Path: <linux-input+bounces-12087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC26AA549A
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 21:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89FE71C21518
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 19:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463802690CF;
	Wed, 30 Apr 2025 19:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lhWWqPXS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACD73B2A0
	for <linux-input@vger.kernel.org>; Wed, 30 Apr 2025 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746040667; cv=none; b=YZWqAninLAC2Nek9PRdbRU2io9CFvtc83QYHFC1uOIJECFTxVmZpY+hBg5phdDHIAbQuu8tO5+ZEbEOTNJ1iZpTlsXBfsYtDaAjWcH1vgwF8U9wufe2MfiSbrnTiMMF2vIyxxCz9IyKXBmatVa1GkdWC1HV9UGTGbL6dzSS60oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746040667; c=relaxed/simple;
	bh=DyHVpZe7sPP3pdh2AqiHnweC4kVwYKyUKswOh2cdzBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6bdFrTQMNfDLc6qpvDaYEtnBq5E1fqYk7lfPxuTcCNMduRvYintoaZibchRJdxck7zAWOgGerRbtrFaeNmNZIbq5fAG37gmWiUjbWg94wyOkjLf7VT6mxlMTbxovnQEpLm0M6+hqF9HQunmVYdSz2jtpyukfAZSTqNB8RLC6vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lhWWqPXS; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3feb0db95e6so191840b6e.1
        for <linux-input@vger.kernel.org>; Wed, 30 Apr 2025 12:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746040662; x=1746645462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xXhOqh4ZLVwyszMvf+9Z/x0nU/kY8/7DOicY6xuWBc4=;
        b=lhWWqPXSjbb8svBw2Nexbhm8/Qlr4vLGQqi6fANlIs29mZi/YM1ngIyGJBiSDgEkVq
         hbzJW3eiP0e84s794SKaCJ0oaeDVOc/SfDliyOBiR00FaWopS193z8qb1eQTkbJyEcKq
         uA4lD1MMmDOtsCaaeP+pc6PfaR0t7nQT7dafSBtizksRNoBWWY9AU4/rYWqffNMeixS5
         Wq7Wme0xQQPZJQsJDZwi7aBlgR3zDGFZqEZs+KPjBOOYP6Hu/w8Ldaj7EOV9TZ6dYlcB
         qnTi/23gZv/sCq8xofcALvfzrrk0Yi2KvXNp+vVBHPiApRJKFkSVBdAMEK5U4aJeOLj6
         FOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746040662; x=1746645462;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xXhOqh4ZLVwyszMvf+9Z/x0nU/kY8/7DOicY6xuWBc4=;
        b=ZA8rpScmsKbHA+IPC9hmPtJVJuQ6OrqxZ1kbxWCt2zB7ZwwQk6lM9Q8Cges94t0hqp
         0iHd28RZKQag0BNY3b1VHik16I3HXmNp6AG/0lJth2OEndpIaEuqL2gnTirMYD0J9Xcs
         uHJP9cCb0zthjzqt/AUp22XfF5DlRHp+0ygigQMrrwCoyoW0/zbuw5vHapanX2jDZzPw
         Qbmycnm1ggZrWfJMHpKvM0A2meh+Bu9+C8vdFngUb5z1HW6LE8Ix3SvnOD0+l81wUgW0
         x3IBaKOl17+so2gIoJFsEbhRRGZIzH+bjyfUDnvI8VYRHmaAHOTe6aAfuEhJ9SwQdvGZ
         FfQQ==
X-Gm-Message-State: AOJu0YxKPJvIwPLF0CppS16wmuccCd9MHq4WFEB/E8xwiwsWZ8s9WOIn
	7E9pVofnix0hm1CQuupuHktwPcZlrL6SJE2QI4zGncuAN11V6c9A+3mtpJpBmh4=
X-Gm-Gg: ASbGncuu6kBvej7xP+AS0fSfEOTyc1Y9yym9PhRy/fzvkKCmClQ23x0N1M6l8xLxOog
	CfmBiNur/CY4JR27MXFumiP4pFtaPe15vyRkJ9+6prIf870bScDIuL8kajVMpbvDCrTZN8R6bQZ
	egJbf6SW5sAPPloZpcmrbc6H/ZB/MjngCBOb5y7VYhgf+8lUrAFwCLt6ZZotZGZZrT/zTG+YbqJ
	o7soRZsseQBxF/IXL+3UyAMcDVgL0uTBFZBBw6lml7rZXEXzv+VSj13sA92n0c7T5/N9JXUfrNh
	ze86RlQW+nNAhHbCRU+6ACAYlaV8YC09HtPXOnMFJ5eyDnTU6AGOsNvtmgTmn0NoLo5DOlEVpL3
	bpDvb+FMuwzl41oU=
X-Google-Smtp-Source: AGHT+IGy4UEKIqEqUHbe0JTx+91yGHN8GtDOL5hK/oCVz9Muk88lGWpmRT+rWl7rMdtnMbKuWLummQ==
X-Received: by 2002:a05:6808:2e4f:b0:3fe:aeaf:26a5 with SMTP id 5614622812f47-402439689d7mr2636968b6e.31.1746040662560;
        Wed, 30 Apr 2025 12:17:42 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:359a:f1e:f988:206a? ([2600:8803:e7e4:1d00:359a:f1e:f988:206a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4021291e53esm923240b6e.9.2025.04.30.12.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 12:17:42 -0700 (PDT)
Message-ID: <1f8de7bd-7049-4933-82e3-8ce71685998e@baylibre.com>
Date: Wed, 30 Apr 2025 14:17:40 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: sensor-hub: Fix typo and improve documentation for
 sensor_hub_remove_callback()
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, jikos@kernel.org,
 jic23@kernel.org, srinivas.pandruvada@linux.intel.com, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250430182300.122896-1-chelsyratnawat2001@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250430182300.122896-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/25 1:23 PM, Chelsy Ratnawat wrote:
> Fixed a typo in "registered" and improved grammar for better readability
> and consistency with kernel-doc standards. No functional changes.
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
>  include/linux/hid-sensor-hub.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/hid-sensor-hub.h b/include/linux/hid-sensor-hub.h
> index c27329e2a5ad..5d2ac79429d4 100644
> --- a/include/linux/hid-sensor-hub.h
> +++ b/include/linux/hid-sensor-hub.h
> @@ -130,10 +130,11 @@ int sensor_hub_register_callback(struct hid_sensor_hub_device *hsdev,
>  /**
>  * sensor_hub_remove_callback() - Remove client callbacks

This says "callbacks", so is it possible to have more than one registered at a
time?

>  * @hsdev:	Hub device instance.
> -* @usage_id:	Usage id of the client (E.g. 0x200076 for Gyro).
> +* @usage_id:	Usage id of the client (e.g. 0x200076 for Gyro).

should we also make gyro lower-case?

>  *
> -* If there is a callback registred, this call will remove that
> -* callbacks, so that it will stop data and event notifications.
> +* Removes a previously registered callback for the given usage ID.
> +* Once removed, the client will no longer receive data or event
> +* notifications.

I like the revised wording, but possibly looses some clarity that could be
fixed with:

Removes a previously registered callback(s), if any, for the given usage ID.

As above, not sure if singular or plural callbacks is correct.

>  */
>  int sensor_hub_remove_callback(struct hid_sensor_hub_device *hsdev,
>  			u32 usage_id);


