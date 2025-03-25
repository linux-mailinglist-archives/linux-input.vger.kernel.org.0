Return-Path: <linux-input+bounces-11229-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B5A70230
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 14:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4861168405
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 13:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191E825BAB8;
	Tue, 25 Mar 2025 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gqDo4yAn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2868C25BAA9
	for <linux-input@vger.kernel.org>; Tue, 25 Mar 2025 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742908995; cv=none; b=hv0az3rffKj0OsNPkUmMbje6uSX4S2qDPEf09vVp1vbPcwqodiR4dLYeOfYcQjxBlO3eDIdnxtg2ee1c57OT/GxxnXMTAoVSF3fk4d+/Ff2pEY3Pnvixxr8cIE6lzcyDI6Z6Cd52ynNizabhytIdk0qmEPHKYDxFlQVufD4EImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742908995; c=relaxed/simple;
	bh=bKVYE/T6NcIGu3cZrPKAkLor3MGJL9W7Ab8jFOEairg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGPzywv7VAbD6I6rmRC4AEOT8UjNzOkkpyiy9lUNjSWkBGbbRgRwpoio3/78gAi7hwxWXvYKNYdw+AzR18jSLE/ebSWstow55rS/uirZ5QqzgKSTiHpUPPZNFE38sC3jpWsx+9ftbsna8Uutv+m84c85gobDce5nT9zNwDYmogI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gqDo4yAn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3253493f8f.2
        for <linux-input@vger.kernel.org>; Tue, 25 Mar 2025 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742908991; x=1743513791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rnnj8guc/r23I6QAcBNhKNDl+BvAD7PlamUPifu4Lvg=;
        b=gqDo4yAnpYNJhZGDkKCCeVSb/1GreZGo116rv2M80/9M9juxfj5wIYECHgQ8ZqzKVO
         o+IgoNOCyh3suqUNhGuce8NF0Xlk5HZGJJH9AuPkxoCRnx42+zmTwPspCYXWqUcVvfv4
         ClsJk27FCW/u0BdNrLoW2IqXrXMm2f+5nwnn+kNdTPnRsulhdIrG/ShX4Gzul06uQS9l
         +fJod2SmMXnZGurMET5o0/ozbFul7yIFjGOnI+JF0e3TWtvti36xZ9wCNsJSVQ5lMeMT
         HlwDsTFuc+vLVM99T7o8741KZCv8erlCYzeVJxShf9A4boNgUHZkIG7QlJsrghucGTBr
         7NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742908991; x=1743513791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnnj8guc/r23I6QAcBNhKNDl+BvAD7PlamUPifu4Lvg=;
        b=fUtJ/tBSq44s/nLYdm1gzY3v2qfHqJY1A8LqwtOsKYK9WxU030yx7VNX+AaEIphrM6
         D81jhVwqNNK/itYT8u3li13fcLdn/KavE+9sdNb2Tx4mRTDp5YeRixOfDlSQMgC7Wm/3
         UuN4j6Qy18wYKe1ffZzAmBdebS3Ia6WhznhrTGTVJ0I1D6faHi55R5nfD/TdIRxnEy+o
         26tlWSoh3BuwoV4CYLvp9EfPRfhjhyXHNP8+ene3aBX0USfT467Wz4tlDjKRDOYkCxjt
         y3xOHVA8GkUkWcCptfUyP5UWqMH8m5Tsmtdbu0Pt91uQW7VX9qGSBXm+BGmtKIUo3AAL
         lddQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpd5h51SQW+KF7elqBtk1b3ROQTRBqBmUOMiubNzq59HMIgoF8jMJ/YTUHDQNaTHafGIFXVZVE2EVnVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJXRKBo1XBsWOwKIrSwBqcwbfH0iOE5YkCwanpHFcbeiV183n6
	QD7dsnuWoalaRM8TiwyIq6iww6/j1fHnJrZiIMxY3ccMKHBtOiFqRLZqjmDl8GQ=
X-Gm-Gg: ASbGncsTBpf/N0TItSE4Aya26l/cjDMzwqjqLPjuodCVJd3d7G/ZBhdGQfmKRlH4HwY
	oz0mQV5mOozNZZ2wdDGm9qIXQs4cWUioZNXBHBW/S8QHr1dTUCkDH/qIKFe9mDug38hmoYw+M2F
	4w08cLn+Mj+9WpqNiWqXZR01XK4gjUB5udprfcG2W+h1EzgwP8L0RpzeznTsYK4rHilGc3a0l33
	ZCyKAFswOKPtswtvDOvi5e7xwUFFBSJNqlLWLcRdrB3qNDyJFsctekCMa5IHLFdqEkFLDPlFe76
	iHmKCbdcdo1ETmjXM+7n13E+610OQ53oEmvsgCFHDnK1FHzZpurJAbh8Q0xBguOB2Wa2i2blQOE
	=
X-Google-Smtp-Source: AGHT+IGqEw79oUCCpFPjvaE0rhu3IpGoUoLYUQBasFQeCPtItEofwSci1Gugid+vwciyZDzyVaQTrw==
X-Received: by 2002:a5d:5885:0:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-3997f93c495mr13385193f8f.49.1742908991354;
        Tue, 25 Mar 2025 06:23:11 -0700 (PDT)
Received: from [192.168.1.38] (i5E863BED.versanet.de. [94.134.59.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9957aasm13931016f8f.10.2025.03.25.06.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 06:23:10 -0700 (PDT)
Message-ID: <48bb62eb-8aa9-465c-9e77-c0b375df0c9f@linaro.org>
Date: Tue, 25 Mar 2025 14:23:09 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: input: syna,rmi4: document
 syna,pdt-fallback-desc
To: Krzysztof Kozlowski <krzk@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Vincent Huang <vincent.huang@tw.synaptics.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
 <20250308-synaptics-rmi4-v3-1-215d3e7289a2@ixit.cz>
 <20250310-hissing-vagabond-pegasus-cc8aed@krzk-bin>
 <3c5e12fc-eb91-46e8-a558-9896f0bdcab4@ixit.cz>
 <b3a5ec89-0125-4b01-8cca-69b9985b6089@kernel.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <b3a5ec89-0125-4b01-8cca-69b9985b6089@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/25/25 08:36, Krzysztof Kozlowski wrote:
> On 24/03/2025 19:00, David Heidelberg wrote:
>> On 10/03/2025 10:45, Krzysztof Kozlowski wrote:
>>> On Sat, Mar 08, 2025 at 03:08:37PM +0100, David Heidelberg wrote:
>>>> From: Caleb Connolly <caleb.connolly@linaro.org>
>>>>
>>>> This new property allows devices to specify some register values which
>>>> are missing on units with third party replacement displays. These
>>>> displays use unofficial touch ICs which only implement a subset of the
>>>> RMI4 specification.
>>>
>>> These are different ICs, so they have their own compatibles. Why this
>>> cannot be deduced from the compatible?
>>
>> Yes, but these identify as the originals.
> 
> 
> It does not matter how they identify. You have the compatible for them.
> If you cannot add compatible for them, how can you add dedicated
> property for them?

Hi Krzysztof,

There are an unknown number of knock-off RMI4 chips which are sold in 
cheap replacement display panels from multiple vendors. We suspect 
there's more than one implementation.

A new compatible string wouldn't help us, since we use the same DTB on 
fully original hardware as on hardware with replacement parts.

The proposed new property describes configuration registers which are 
present on original RMI4 chips but missing on the third party ones, the 
contents of the registers is static.

The third party chips were designed to work with a specific downstream 
driver which doesn't implement the self-describing features of RMI4 and 
just hardcoded the functionality they expect.

Kind regards,
> 
> Best regards,
> Krzysztof

-- 
Caleb (they/them)


