Return-Path: <linux-input+bounces-7283-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ABF999533
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D2871F2864A
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 22:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC54A1E2839;
	Thu, 10 Oct 2024 22:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSkUnw/1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372281BE86E;
	Thu, 10 Oct 2024 22:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728599295; cv=none; b=UTB8/1yyxjMjQrL53FFKb3c1+Yt++maaXeuPibcPcNFb4jO5ME/tI9mKCbIV3jsQOeUnwIR1yLnfTHAsYQibG1//WnVmX+LGTpubCPChRx3K8HVprJRxk+HybcxnFbGgA6bUdxLPFAIyLSC1CBwXfh5cCEH7Q7fvRmzkAY8CUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728599295; c=relaxed/simple;
	bh=qcZVCuV4h/CWEWtF7cVhrUnJAhyRLz0eLmY4sJ0Iiug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5Hc2+9c+WrH7OxjlXJ6RWkHUux+Hyl0c0NWfPRh0TzDOm+/9qr4E2d7F5nGUO/2VVSpnf2vQhPYUpsbKR/zg4skZjguDWSwfSTRUEnrNj8TcvM7EiaGC31UPjGW9aYpxx8yNat4j0i4cDGjygFqrl6ZxlLIif6kAy6RKCKdyAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSkUnw/1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4c482844so618736f8f.0;
        Thu, 10 Oct 2024 15:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728599292; x=1729204092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEd3qglOswLcYcbhFNnKRIA0aABkVGP6KYCeIpbQEAc=;
        b=BSkUnw/1QsFwxqROuwYefniHPLuSLopfGqz96eVX9cKrlthXoqd9lXV+2AA8s4OY8B
         8bSk4y9ksAdzxfLvdHOLY4g8uO0Gb2VWEiKCArHKFd/FQbeW9YtqNvg+siZ+oby/AQPb
         oN5WqHEoQJTnYufAt5Uxza3cimokuz7OfmmbyWyIxmWNeD94IjJNaqvwH3krhKEsKGd5
         lLlGSbFQo5nQF7mRXQhbOi2zTjzeMNTfrNCiQboQZC6y6d0fKlbT3hxbJN4v773Luw5q
         RcdY0Iw/BdzpMIvbX6gZYPI1pMse5X9tKZXw8nqgMrLruUCi38rwNnhhMD8LTEesoor8
         f0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728599292; x=1729204092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEd3qglOswLcYcbhFNnKRIA0aABkVGP6KYCeIpbQEAc=;
        b=vJKAyOkfAlEjrRy7z3y9tUoeT7DzFpwX0XLgI0Doj5LWMfywOx0ylt8vmxzRL8bV8a
         390lNXpuB5nLLuLgvhSckW4mhh8ZoOw/ZuF7RdRWKfki/NI1wYgFySmRxszFQ3oME6hF
         Qf2hQo7fbGFPNSw7Ph3pYJ2hlGtvE9EBy1PR/6rpFui8TPl1Yml8oV5BwUI5PMmd08iN
         ZW++mP1K94AYwCneS1CQN0FwCHot/KhCLyj1N911WjVJr1tnHQW/R5J4+uqrpuyEdy6X
         aReZGPO7ecFaQ9b1N4gbahAu/0WR5CncVxSFQpez0p2znlUAHNNK/xI+naplwMkgZWwR
         uGuA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5a6q4veS4+X+yGCYFpjsEknJk+Ujn4j5aemXM0/bMTLRzkYBpqcWsS6Oy+KrJ7Uf/4Y6VcU02Xj15w==@vger.kernel.org, AJvYcCW6aJpBHbRRUV4AlgVjrJnWdqvG9/F0AES0HDk0D+YeMNZT5XMsPYVMpc67N2K+uvJT3+eR3kErTDCs4oCL@vger.kernel.org
X-Gm-Message-State: AOJu0YwhIStlXSSyIltAaubkf0j56JXObyzw8C1gN6V0zTKgAOMmvY0a
	hQCAKlK9I9bvFkwKXDJxGHqgebWdPD49CCyDGF0fCwajWXT62w3F
X-Google-Smtp-Source: AGHT+IEyhCb2gEHddkiaFk7no88fWWHUHs3t/T3X7uZbjBAibc4VOLvPsp4gP7X9WOW0E9zcoNOljQ==
X-Received: by 2002:adf:a31d:0:b0:37d:45f0:dd0a with SMTP id ffacd0b85a97d-37d551ab52fmr366574f8f.1.1728599292378;
        Thu, 10 Oct 2024 15:28:12 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:3d08:841a:562:b7b5? (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6ce001sm2472885f8f.47.2024.10.10.15.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:28:11 -0700 (PDT)
Message-ID: <56d74806-93f4-4e31-9b21-925b8deb5d3a@gmail.com>
Date: Fri, 11 Oct 2024 00:28:08 +0200
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
 <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
 <9a85e6bb-884f-4fa0-b198-bf7707af76c8@gmail.com>
 <20241010222240.GE4017910@ZenIV>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241010222240.GE4017910@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2024 00:22, Al Viro wrote:
> On Fri, Oct 11, 2024 at 12:09:01AM +0200, Javier Carrasco wrote:
> 
>> I think that the issue you are talking about is that the goto will
>> trigger the cleanup function of the device_node, which will not be
>> initialized at that point.
> 
> ... and gcc will compile that without an error.  Clang will not, but
> you need to watch out for build coverage in arch-specific code -
> clang doesn't cover every architecture (and won't cover some of them,
> no matter what - alpha, for example).
> 
> As for the scope changes... note that you've delayed the moment of
> of_node_put() in some of those.  It's harmless for device_node, but
> try something of that sort with e.g.
> 
> 	mutex_lock(&lock);
> 	something();
> 	mutex_unlock(&lock);
> 	foo();
> 	return 0;
> 
> where foo() itself grabs the same lock and it's not harmless at all -
> 
> 	guard(mutex)(&lock);
> 	something();
> 	foo();
> 	return 0;
> 
> is equivalent to moving mutex_unlock() to the end of scope, i.e. past
> the call of foo(), resulting in
> 
> 	mutex_lock(&lock);
> 	something();
> 	foo();			// deadlock
> 	mutex_unlock(&lock);
> 	return 0;
> 
> __cleanup *is* a useful tool, when used carefully, but you really
> have to watch out for crap of that sort.

For cases like the one you are mentioning, scoped_guard() is the real
one to be used, but I get your point.

I just overlooked the goto as it just goes to a return, and I processed
in my mind as a direct return, which is not! I have even reviewed such
issues in the past... karma.

The goto in that case is meaningless anyway, and a direct return would
be more readable anyway.

Thanks again.

