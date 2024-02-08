Return-Path: <linux-input+bounces-1756-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9720184DAB0
	for <lists+linux-input@lfdr.de>; Thu,  8 Feb 2024 08:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E18B287343
	for <lists+linux-input@lfdr.de>; Thu,  8 Feb 2024 07:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4EA69314;
	Thu,  8 Feb 2024 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bctN3dxC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FD692EB
	for <linux-input@vger.kernel.org>; Thu,  8 Feb 2024 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707377388; cv=none; b=J0jVYrro+LY0aP2Vd+/baTjSSP4qZBDJnJcHKOJ9fmotULOrwh59M3l7NX8syYU4iv1Vb5fGOtwU2mzmTUqaqlfCp/ac3AghscpZHnSgfv/vGuEFjCGTBpDi1J01jxv1z2mviOFxyQPnIAsXjYlDrpZ252GyQMyKLb1OfHqzKmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707377388; c=relaxed/simple;
	bh=Paa5SnRIlKkPvBlKLdVacmEMB1hdpYl3sazVCnFA3Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=l6jI6BSAAnX1+omZGF4nDUZhttBveoZy8rdU/HjARhMIxjIzIMbu1D9HMveFkO2JyhSqDnDIjCGXeko9sbwf2vIVpwLiuo13+DjSSBjXy3cQiWeJ32U+VZjML1+14JrI6QDGhy+xTWug7/ZqZZauDZyTLpdtj9R7Gryi4+9I7oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bctN3dxC; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-42a4516ec5dso10739531cf.3
        for <linux-input@vger.kernel.org>; Wed, 07 Feb 2024 23:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707377385; x=1707982185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X8GfuUECNrI7jCf2NNIk0M337xBIYCYX1bPSr2SNtlM=;
        b=bctN3dxCbnaHNZDgXPbMr5Uy3nvTl8vdHVB9pKUaziNrQY5iw/ZK96LsVK2P0a7+08
         I4ylE9Z4+9S5i/sS5E0nsCCo3o8X/9BHcs0m/J/zhiLtKZ2qx1uV82ql/On8keYxsvk8
         zwAQMwliyZpmuzPbsQL21TizkcGXJNAyouvsoU6fjvdKt2umCtT9YTpjnBhGUhS2ucTr
         WRXBw8O+CRNANM7BKEWdUeb5fqexKRET1sa7/iDEvSN8x0P/DJoLxgw6Z9OizbMWr0By
         M0l3nOegUNEpC5WBH4Ig56Rnq+8MJRaXclqnae0JTypdqHiEwwzcecV9aU9CIfefTJAK
         N2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707377385; x=1707982185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8GfuUECNrI7jCf2NNIk0M337xBIYCYX1bPSr2SNtlM=;
        b=i36sd5AUlOVpXy8tXq2X4E0F4lT/0iACinfSMNIb7tAxfGq96eQZKu7wSVp2Jk9ugn
         /G/tyUUQXwfN9FOdv0wU7oWvTMDb1QCwbgXQRDCGBHoLmI1Qxs4vEF5fLm/dLHnyJ8Jd
         KJWh6H5oxy8hFUG1B644lFwOdvYHvFim0VhXGglSUZrPR22R6xRM6buJXo0io4hB6anp
         4LsltwTaIEGIU3hK0odHU+XjR4+IrcFM4/57HQTu9NW9UVHOKmaxdzmp2dwe2BocuK80
         Pl0hO9JcWqisH6lOUsml1h0c2CNAlYEzplR33pUgrXbRlYY3US7xB4T1ZlXKeLKB0O+Y
         Wy5g==
X-Forwarded-Encrypted: i=1; AJvYcCXWhqRZ7tfBrmo5HhpVkYu5ns54OxpRHsz2ct7QWJTtgsrcQNU5na/p6OstPgJ13o4PG/Yj8NgQnn2wwFYsH3ntrnT8SBti1PmO6RI=
X-Gm-Message-State: AOJu0YyVHur0HGUTW0H2jldTZ6OdDKIzunLUdqoNpTyYgP+9z6ca3gHM
	Gup6YuZy8hhR0Rh8+Zw0t6TcE2zMVqOmvyq2zN+7SA6DYbaEMj6Om34E9U4tdPM=
X-Google-Smtp-Source: AGHT+IG22T6gy4UTv9+xkrL8MuXUvskCkD9zMqSKmcH84iVFhrvyv5RrOKwafMGRdtnNI0o3MuJroQ==
X-Received: by 2002:a05:6214:29cd:b0:68c:3c2d:4375 with SMTP id gh13-20020a05621429cd00b0068c3c2d4375mr9346933qvb.24.1707377385692;
        Wed, 07 Feb 2024 23:29:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQbiJIjiT68PWINCTFlRdWh4OfhPgBsePs6Iw5uwS5ayPyGs5EYW7X6fN3NZ397AbB30HsN1vIMHaiSKwVRwhcNQIvJ66bvkjls3X7OHdCEiflAvKKnrQZpWJS4Ybm9cZBOWw8eq7WBUJjBrkPvDx+PORDmLIZBsKusRZCypJ/8sRFSvvxyVt/HJAa9+8jH+wef5Up640EqC2Z+nEYUHO4hQZ4Zz5lF5FHZLYXAIiLm3K1iUczmp2f+wL0g1WkzsJ8lI8y9+12AnWf4wbmWuKdnonFPulW7tc7CKclKVyz06teVbrGAAfgNvDRteq0R9dqa0VSRUT6XbXI1vMJZIwlQJ5RL/le7GOEXHTYIPVjVW1itw4DKZNIlSkCwjJ27FVxX3KPv/xB/Zn40MElW/7WHT4CfYI2rStjhvUOwKFgYTzAaAXiG3NdRJrk9UI2jQ3JhtgnYz65EPtS+X80MPscJRyNN1nVwd8=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id oi8-20020a05621443c800b0068cc16f33c4sm985111qvb.80.2024.02.07.23.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 23:29:45 -0800 (PST)
Message-ID: <6e703599-0389-435e-b163-55e5a046a8f5@linaro.org>
Date: Thu, 8 Feb 2024 08:29:41 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: input: atmel,captouch: convert bindings to
 YAML
To: Dharma.B@microchip.com, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240207090853.188400-1-dharma.b@microchip.com>
 <982e81db-3bf9-49e9-b57f-a91612d62f5c@linaro.org>
 <09c25824-f56b-4598-b8cc-1df992812754@microchip.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <09c25824-f56b-4598-b8cc-1df992812754@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/02/2024 04:59, Dharma.B@microchip.com wrote:
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: atmel,captouch
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  linux,keycodes:
>>> +    minItems: 1
>>> +    maxItems: 8
>>> +
>>> +  autorepeat:
>>> +    type: boolean
>>
>> You can drop entire property, coming from input.yaml.
> 
> Sure, I will drop the 'linux,keycodes' and 'autorepeat' properties.

Why linux,keycodes? Is the size restricted in any other referenced schema?

Best regards,
Krzysztof


