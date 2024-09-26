Return-Path: <linux-input+bounces-6733-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8F986C63
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 08:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14288B25214
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 06:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0923418786B;
	Thu, 26 Sep 2024 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iX33sO8o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C276185941
	for <linux-input@vger.kernel.org>; Thu, 26 Sep 2024 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727331652; cv=none; b=icIXDO8EQjg/qSHZkrSDkAgrY11pRrqgZGWEvrK8CfZSj5CW4baPxOdyIw7VjPsV64QveaWbyU9BURkYFdMsPN+AJV8EeVTvudfAQGnNDAUaOIiYPGHOSGgQ8W6YU+0c228ctB3lNEBK+Teuh/vua08NBrmVrYGzMHM21BzjcEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727331652; c=relaxed/simple;
	bh=/NSdZP4J7/FYuBnftGWiw3R56u6cmpOjtZ5oYGrVELw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxYqCg5wXU2rS3isXtI36jO4WzG5TWcykRZy5HOBCp8hx9T+rPzi3yw0f5fBW5dvTWsME+gHHihjLST2J8GWnkxWUFC0ziVpWr33njgaGRF7fUav76CQXZ5CzIKw41Fb+mhXVi6l+AcdxsmIHz0iRwpvf+/5JJAMB6tqVwCVg8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iX33sO8o; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c877f18276so57272a12.1
        for <linux-input@vger.kernel.org>; Wed, 25 Sep 2024 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727331649; x=1727936449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cQWy5A5BXxaneTnVxcRvOvXGhuaSax7wWVjqlQFgoNw=;
        b=iX33sO8ov3bZBMTMvwk6BgkD/hx4fMH+QcNhag6MZlr+VY9Z4Gp5LvbDziKNMyzp7Y
         uxizf2ExfLwvDqbgMBGnP8XhgOJFnvAvLGNhUwaZSqj6LlXpF1f8wQjO5K1W6vQUsOQo
         94+THZbJNIp4ulAmiaW4csFMR0PuPin7mTHnXJor8wqJ1RP1SZ9vCdOr7mxgpZf7eUiW
         Qfs8iIjXlHcw2cQ6WUiipcJwnqwehoW00Jw5fM+J2rj++64p646JfqNcY4bIM1KdJqz0
         XiqxOHjuoFIFn9BkJPnnJFgARhEuS/2okUDOwWx0FBbnNMgZez6NNuflC1QMSS08Q6hl
         5RBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727331649; x=1727936449;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQWy5A5BXxaneTnVxcRvOvXGhuaSax7wWVjqlQFgoNw=;
        b=RbzOv7NP4PtZKwqOJ2Tp/3Zqy1h+E7TEZUDLp2Ni6Y/1h8fVWnkJWMqep+6UF1jA5d
         k9HDmjfCPwIoxSHnrTyKMYFP1gSNVjsF6SZ04+j5zz8c/XuxvroQuuecwq01lt0sgErZ
         ah6Hhrtb86+LgS4dgdGzbYPuS0HOlTWDIU+2mYhlxXQApm2/X3wExsfLsfHMyIdmjdFb
         01gWFnwgiacouPlhP8BJEAzWhvA9HPz7c3z6YzoC9jUKn9TYX1I2OarETiPiKwlvUq07
         8X5TmtBqLC9yMPiCkIqKLNPdJPGbAjuPHkZyKuLHfdArtbcQxUXYLyEndueRNp9pAEHQ
         iQMA==
X-Forwarded-Encrypted: i=1; AJvYcCXysYii0ENlGtMKp653VAw32OhSf+yEd/Rf4lR7ND34gzG8dZny5DtC9Xle0xp6UCryAkGvmtpm64IB2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw33DeAD4cq9PSsotETz58lLKqQCscpaY3FNX1YTkdM6cFHOtOL
	HTFclQQUCGiT2aUbMeRHFKkm4Q0Qwvs4Xt/f+xMnS7e6sNKm+E5XnLClJVdOH+4=
X-Google-Smtp-Source: AGHT+IFMPVWih8ET0UJY6wrc9291Mk1AekrhcJOny1Lnev3ooTXoMRPIZqminSsIbWenrEiBF+C3IA==
X-Received: by 2002:a05:6402:26c2:b0:5c3:eb29:5400 with SMTP id 4fb4d7f45d1cf-5c72075fec8mr1673859a12.8.1727331649354;
        Wed, 25 Sep 2024 23:20:49 -0700 (PDT)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4d7a02sm2766357a12.84.2024.09.25.23.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 23:20:48 -0700 (PDT)
Message-ID: <039c8de5-4599-468a-9f15-986bf2d3641e@linaro.org>
Date: Thu, 26 Sep 2024 08:20:47 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: input: Revert "dt-bindings: input:
 Goodix SPI HID Touchscreen"
To: Jiri Kosina <jikos@kernel.org>, Charles Wang <charles.goodix@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240925194921.18933-1-krzysztof.kozlowski@linaro.org>
 <20240925194921.18933-2-krzysztof.kozlowski@linaro.org>
 <nycvar.YFH.7.76.2409252306420.31206@cbobk.fhfr.pm>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <nycvar.YFH.7.76.2409252306420.31206@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/09/2024 23:07, Jiri Kosina wrote:
> On Wed, 25 Sep 2024, Krzysztof Kozlowski wrote:
> 
>> This reverts commit 9184b17fbc23 ("dt-bindings: input: Goodix SPI HID
>> Touchscreen") because it duplicates existing binding leadings to errors:
>>
>>   goodix,gt7986u.example.dtb:
>>   touchscreen@0: compatible: 'oneOf' conditional failed, one must be fixed:
>>         ['goodix,gt7986u'] is too short
>>         'goodix,gt7375p' was expected
>>
>> This was reported on mailing list on 6th of September, but no reaction
>> happened from contributor or maintainer to fix it.
>>
>> Therefore let's drop binding which breaks and duplicates existing one.
>>
>> Fixes: 9184b17fbc23 ("dt-bindings: input: Goodix SPI HID Touchscreen")
>> Reported-by: Rob Herring <robh@kernel.org>
>> Closes: https://lore.kernel.org/all/CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com/
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I've applied both patches now and will expedite them to Linus.

Thanks Jiri,

Charles,
If you ever receive a report about an issue in your patch, you should
respond to it and address it. Regardless whether it is on the lists only
or already merged.
If you do not respond to issues reported for your commits, it might
cause impression that you only care about getting your stuff into the
kernel and whatever after does not matter. As maintainer I would not
take more patches from you in such case, I bet other maintainers would
be reluctant to take them too.

Best regards,
Krzysztof


