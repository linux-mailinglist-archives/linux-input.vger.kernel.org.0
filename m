Return-Path: <linux-input+bounces-12105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE57CAA678D
	for <lists+linux-input@lfdr.de>; Fri,  2 May 2025 01:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 903A71B66AEF
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 23:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0272222A9;
	Thu,  1 May 2025 23:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="REeP7MMl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D99E1DFDB9
	for <linux-input@vger.kernel.org>; Thu,  1 May 2025 23:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746143536; cv=none; b=V/66hazKB2P1hcDmBt/UYR+eUqQ4iG2rnSqtjQSnuzY3ERI8dIsfJpaveheKioS8/cl5AEbUK9ayS35RYT3FmOTXkOGMlJhM+T+iFgcnfBdHTJFPgxFW2924X9HlTICN6fnzrHp7fR8diLmy6/7ftHIK/mtk8pwyecBw9Nku4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746143536; c=relaxed/simple;
	bh=OQUWGEVgZ+PDwRlv2+NEZXwr26U7U2Avy7r6dUmpfsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3Jb8kxDX8zsoK3S8iyfSMg//xr5JtKBS5hsLhiqxo45pYg395BWW+My0YlWMzmmWRUfum7h8omutpQudYMo5/LRcMgLRDNiE4yiZgQsHyUJrLhbm42a6ekb/kwomXpy+yhFx31mfkBXCnvUzqC66t+QJHr/1xSM28UiXizwFp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=REeP7MMl; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-606477d77easo939064eaf.1
        for <linux-input@vger.kernel.org>; Thu, 01 May 2025 16:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746143532; x=1746748332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OyKraObEURHCA1O3iED2hm26WFNl7Mw0i9SjHNz0w2M=;
        b=REeP7MMlFo7US1ZJSgBq7bHwmHkgBvv4kJWSJEEGdjsPFn1Cl/PMzgSONIoZFzcyui
         XuclwF7FWsPFrE/u9HJpD/o2rBv2tdnN9M09RYJB6f/MkOWAKvBht4fmAnNo/HbXyRcs
         BN0i5u4ppYom9ENaokt90KouYOHNKjFedy3/Pwo0oevVJTyWGswvwud/d221GRmi5eYF
         UFiWt09anE6iX5YT1aeFCM4WhAT1rKmGQrcAgtDetKp1lJyN09/jp3+aktQWNUnexjy+
         7+TmKSkmlRpd/HarVtF57kMnKiNRB/427S3QCoEAo6Q/Qsy2kptUkw4iVSLSScPw9qnT
         HyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746143532; x=1746748332;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OyKraObEURHCA1O3iED2hm26WFNl7Mw0i9SjHNz0w2M=;
        b=xMXUFNp6/BqEvlfj77WxwG5GYNfFKAOmas57Dkf7SnCP+wjIehKq0xMCNYOVQRqVlH
         VHw/fXt+Vxvox1tPJ3s5dfevLLHhew77DtCmgXUiCYdA7IV6n6AeEAm/Bb+M3W421U6W
         lQhbz3GxT0yfFjijUNzSxc3JjaGqeDaTvXFw9B9Mi9Wk4FO5B1eW1MICC3RyaseFmL9y
         xksWCR/BzRnG6JLvzXnaiuNVlVb+I8oaYMXUv47e7LsFSIYQjmGP4/24GisKbhZwVIOe
         blwKObVNLg1e8AVP7VGRPGnQ9ByEnPht2Mbw91sT2hDQzqA50l5vkvjINDL4sE4mTNpo
         SitQ==
X-Forwarded-Encrypted: i=1; AJvYcCW50c/D3j97mPC1O8g/vk5+gGoSW90FYg5lD2pTID10Tc5hYSmHm0VO0zwimqxUNCKElTdjWOVqYVTvsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVk2DG6+mNZh9eik5FMNgpIt7J0zuJozTMTRVr7qxXi5ogLW2Q
	zXea0qcINpeYBJVgE4aUXyLz9r5LehIiTMizP8ty+kvRY9jjUim5HVO9kJZItaI=
X-Gm-Gg: ASbGncso/Qovc1TpYJyFSeMRx90l6AsYuRShTqVN9bNQRYXVRZCH2DonHJgWVl3OzkO
	ZQ32gAiGSRKE3418lbdPCE8q772YQXt+wsGrE/H62ppALYFAaM7vqn0ltOCUssnuG9+Fk+3Moyh
	3kRHFeV4zmllN6Jj+FhQKl2anRMtuSPPBzHRO3CB9F+gMF/bPlOVi+pR8lpm7Agafa0x1G6Nrqr
	WtERV832TNwlOU4OYlXgelZMcJgsDR3C3IZ0ygzDHw5fcxxKNcUAAjw80aB1RGOM/710eJazttX
	qjtYUXBOJ1pDLMwwWUoqJ2Y56UovVhwA7q4qr2Y7OkHrEaCkyyqjG3HEi1a13CctmoT2HbSy3s7
	YWYIx99hrLm984ifC3g==
X-Google-Smtp-Source: AGHT+IG9i0SjqJNmrxwyVXWssfn4FV7bVAFVBFFYBmbJlnOnDNrSJ9/S9igAW+PRB5scHigMaDiLuA==
X-Received: by 2002:a05:6820:17c:b0:604:ac85:abe2 with SMTP id 006d021491bc7-607e1fde107mr2462578eaf.3.1746143532034;
        Thu, 01 May 2025 16:52:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0? ([2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7d11e1bsm324509eaf.10.2025.05.01.16.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:52:10 -0700 (PDT)
Message-ID: <741acf06-72b8-41e6-88ef-048273c3da26@baylibre.com>
Date: Thu, 1 May 2025 18:52:08 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: sensor-hub: Fix typo and improve documentation for
 sensor_hub_remove_callback()
To: chelsy ratnawat <chelsyratnawat2001@gmail.com>
Cc: jikos@kernel.org, jic23@kernel.org, srinivas.pandruvada@linux.intel.com,
 bentiss@kernel.org, linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250430182300.122896-1-chelsyratnawat2001@gmail.com>
 <1f8de7bd-7049-4933-82e3-8ce71685998e@baylibre.com>
 <CAOeBcHOw6CHbY6W+wAWvYsm_CGRMCgt_BLSV65X=rnhuU1r1hw@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CAOeBcHOw6CHbY6W+wAWvYsm_CGRMCgt_BLSV65X=rnhuU1r1hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/1/25 6:33 PM, chelsy ratnawat wrote:
> Hi, 

Watch out for HTML mail! The mailing list and other automated tools will reject
it, so some people won't see the whole conversation.

> Thanks for the feedback. Regarding your comments:
> 
> On Thu, May 1, 2025 at 12:47 AM David Lechner <dlechner@baylibre.com <mailto:dlechner@baylibre.com>> wrote:
> 
>     On 4/30/25 1:23 PM, Chelsy Ratnawat wrote:
>     > Fixed a typo in "registered" and improved grammar for better readability
>     > and consistency with kernel-doc standards. No functional changes.
>     >
>     > Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com <mailto:chelsyratnawat2001@gmail.com>>
>     > ---
>     >  include/linux/hid-sensor-hub.h | 7 ++++---
>     >  1 file changed, 4 insertions(+), 3 deletions(-)
>     >
>     > diff --git a/include/linux/hid-sensor-hub.h b/include/linux/hid-sensor-hub.h
>     > index c27329e2a5ad..5d2ac79429d4 100644
>     > --- a/include/linux/hid-sensor-hub.h
>     > +++ b/include/linux/hid-sensor-hub.h
>     > @@ -130,10 +130,11 @@ int sensor_hub_register_callback(struct hid_sensor_hub_device *hsdev,
>     >  /**
>     >  * sensor_hub_remove_callback() - Remove client callbacks
> 
>     This says "callbacks", so is it possible to have more than one registered at a
>     time?
> 
>    
>    Regarding the use of "callback" instead of "callbacks", what I understand is- 
>    - The function `sensor_hub_register_callback()` ensures that only one callback is registered for each `(hsdev, usage_id)` pair. If another callback is registered for the same `(hsdev, usage_id)`, it returns `-EINVAL`.
>    - Therefore, `sensor_hub_remove_callback()` is designed to remove that single registered callback for a given `(hsdev, usage_id)` pair. The function does not need to handle multiple callbacks for the same pair, as only one
>      callback is registered at a time. 
>     
>    Please let me know if my understanding is correct, or if you have any additional feedback or suggestions.

Based on the reply from Srinivas, it sounds like you understand correctly.



