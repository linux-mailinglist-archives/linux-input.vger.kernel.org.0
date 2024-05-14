Return-Path: <linux-input+bounces-3709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A68808C577C
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 16:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DEC728271C
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 14:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE591448C0;
	Tue, 14 May 2024 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="QUvGf7HF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15ACE6D1A7;
	Tue, 14 May 2024 14:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715695295; cv=none; b=KHRXNE1xyN4lGXjKI206ELUbRp9aWf+6icDQ6VdIZtQ/rkJRr6kB3DUmCCB6vqs3jGKoRxwv0Gh71BgDSMH/O+9sITfO1UPG8SkiPmmPniaE7eW7pG0E55WQEWaLi9vfsKsK+yf66cnEwlLohfJFHXAvZkEOgNaMdpADwi/iZ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715695295; c=relaxed/simple;
	bh=YgSzUyN9lZ6Q/NxD40/+BCSIfvnuzEnChocl9jnMGTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8PSVopjIy6AKmi2Tc/tZaVNE6+otFmefomoHqrORoNwLbgOA7QOyP8bnsnSKv+rb7FJNH/1n53g/3wyMYtba7VxgEZYlbeK/L1TQurj/dGy/uGueQFnqRBQZWdRDReG/0e5zDBWI19XWhTKy6SdnY4wfgKYnh8eNYFQICnGrwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=QUvGf7HF; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F33FAC005F;
	Tue, 14 May 2024 10:01:53 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1715695316; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1DbleZUcyOeQ+xpwumpPDRNYNQ1wnxSzV1kZWNcVPl0=;
	b=QUvGf7HFPDJHo1Q4joPoI5npTTCt2hRNsggtpbakvsSqo1z4JsgMLXwnChNvTTy4caxnRx
	/t7ClUZt7vbM8ma+CvBLRvUmUOBgYcmQAVUCf8C0iPVgX9XMWdJaRsUwR/tFU9oHi5oMSv
	br+1tMeaMVogDffiLhITByQJf15/MxA=
Message-ID: <afab9026-e843-4cc4-8733-f45e9ab34276@kaechele.ca>
Date: Tue, 14 May 2024 10:01:19 -0400
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] input: himax_hx83112b: implement MCU register
 reading
To: Mark Brown <broonie@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Job Noorman <job@noorman.info>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240511121245.109644-1-felix@kaechele.ca>
 <20240511121245.109644-4-felix@kaechele.ca> <ZkKb5_SRNwG1pRou@google.com>
 <44570cd2-9540-47f8-a409-26220b0812fb@sirena.org.uk>
Content-Language: en-US, en-CA
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <44570cd2-9540-47f8-a409-26220b0812fb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 2024-05-14 05:46, Mark Brown wrote:
> On Mon, May 13, 2024 at 04:01:59PM -0700, Dmitry Torokhov wrote:
>> On Sat, May 11, 2024 at 08:12:24AM -0400, Felix Kaechele wrote:
>>> Implement reading from the MCU in a more universal fashion. This allows
>>> properly handling reads of more than 4 bytes using the AHB FIFO
>>> implemented in the chip.
> 
>> Mark, do we have anything in regmap to support this better or having a
>> wrapper is the best solution here?
> 
> No, I've not seen something that explicitly requires toggling a burst
> mode on and off to do a bulk operation.  Off the top of my head I'd
> suggest just always leaving the burst mode enabled but I assume there's
> some downside to doing that.  We could add something but I'm not sure if
> it's worth it without having seen any other devices with the same need.

I can experiment some more with just leaving burst mode enabled.

Since the vendor driver invariably enables burst mode before any 
transaction of more than 4 bytes I'll have to see if burst mode does 
remain enabled under all circumstances of normal operation.
Since I don't have access to the datasheet I cannot know what the 
intended behaviour and/or downsides are. Due to that I played it safe 
and mimicked the behaviour of the vendor driver.

I'm guessing not having to enable burst mode on every touch event 
interrupt could also mean an improvement in latency, since we save two 
write cycles on the bus for each fetching of the event data.
Not sure how measurable that would be though.
I'm thinking to myself Himax at some point recognized this and that is 
why we see a dedicated touch event read register on later models in this 
chip family.

Regards,
Felix

