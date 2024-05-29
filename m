Return-Path: <linux-input+bounces-3961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 506458D41EC
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 01:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0665A1F23A01
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 23:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E2215B0E5;
	Wed, 29 May 2024 23:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="dA3Qf+Bx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B3928F3;
	Wed, 29 May 2024 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717024577; cv=none; b=qAvNgY6AJQ4mtRUfFQnCRzYrAf2d6h4ZTjYoIpf/bPkvG8/d+jKXFWMrAWxP72vfO+3f2ZlNFeT7dJ0TfORTk0fBgfDP7SctehonbvYbtoiutdKY7AIS7PrFodqs8+iAI1LWvvbRN9sqEaWW4P+I0AcE1y5WvPSoiPWEXsafvz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717024577; c=relaxed/simple;
	bh=0mxyy6nmrKWMs62jGYfJK+jI1mtrNo02vUVORzUuSmM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NF4N7R3+c5UT1/2kBDsq5oYU0g/1Ztrpri+1VnbjKdhy5bOjSrzY60VGa59btLs4OMZUlilw4HUlVD4l3jUIGRnPnoutJfbTrp4H14bjZFxvBY5L0lNvtNeuPrM3+23LzZB0s9kXdKOsuZ1OvkCfZ5xC4/s41+5upVTQo0EocgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=dA3Qf+Bx; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89CD9C005F;
	Wed, 29 May 2024 19:08:26 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1717024109; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PDLpjtD8+3OyvFRYxZd0ZhadxMjnIfuZmLlbltpqaZ4=;
	b=dA3Qf+BxPAIQ7NCoICy7S3OpYAGFkO3PKWXmv7LQ/YiG5E4Uim1T12jk0pqy3ACnzqhXUL
	gpjQl8704UWBpWOD3J19fZeuEHSUSEapfZwLi2HVq3Mtbq2uwEK7RuVekibABdryz6MLGL
	oOLl+hux41Zz5Vc3h5rFyZi+N7mntDc=
Message-ID: <b065e243-58dc-4ebe-8dbc-8b23c0b46cd1@kaechele.ca>
Date: Wed, 29 May 2024 19:07:23 -0400
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] input: himax_hx83112b: implement MCU register
 reading
From: Felix Kaechele <felix@kaechele.ca>
To: Mark Brown <broonie@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Job Noorman <job@noorman.info>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240511121245.109644-1-felix@kaechele.ca>
 <20240511121245.109644-4-felix@kaechele.ca> <ZkKb5_SRNwG1pRou@google.com>
 <44570cd2-9540-47f8-a409-26220b0812fb@sirena.org.uk>
 <afab9026-e843-4cc4-8733-f45e9ab34276@kaechele.ca>
Content-Language: en-US
In-Reply-To: <afab9026-e843-4cc4-8733-f45e9ab34276@kaechele.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 2024-05-14 10:01, Felix Kaechele wrote:
> On 2024-05-14 05:46, Mark Brown wrote:
>> On Mon, May 13, 2024 at 04:01:59PM -0700, Dmitry Torokhov wrote:
>>> On Sat, May 11, 2024 at 08:12:24AM -0400, Felix Kaechele wrote:
>>>> Implement reading from the MCU in a more universal fashion. This allows
>>>> properly handling reads of more than 4 bytes using the AHB FIFO
>>>> implemented in the chip.
>>
>>> Mark, do we have anything in regmap to support this better or having a
>>> wrapper is the best solution here?
>>
>> No, I've not seen something that explicitly requires toggling a burst
>> mode on and off to do a bulk operation.  Off the top of my head I'd
>> suggest just always leaving the burst mode enabled but I assume there's
>> some downside to doing that.  We could add something but I'm not sure if
>> it's worth it without having seen any other devices with the same need.
> 
> I can experiment some more with just leaving burst mode enabled.

I've done some testing now and can confirm that, unfortunately, not 
enabling burst mode for every read of the FIFO register results in 
unreliable touchscreen operation.

For testing purposes I only enabled burst mode once at both probe and 
resume.
The touchscreen will stop working both randomly in normal operation and 
reproducibly after returning from screen blanking.
My wild guess is that DSI commands (e.g. for re-initializing the panel) 
alter the state of the IC such that the burst mode on the I2C interface 
ends up disabled again.

That means the bus read function from this current v2 series could be 
used as-is.
I have a v3 in the pipeline to address the comments Conor made on 
another patch in the series.
So far those are the only changes compared to this v2. If you have any 
other ideas for what I could test in regards to this, please let me 
know. Otherwise I'll be sending v3 in the next few days.

Regards,
Felix

