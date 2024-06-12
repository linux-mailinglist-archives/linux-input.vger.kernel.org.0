Return-Path: <linux-input+bounces-4322-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE46F904D86
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 10:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42BD9287BD9
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 08:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A1716D9B8;
	Wed, 12 Jun 2024 08:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="snnBI0fq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC4B16C861
	for <linux-input@vger.kernel.org>; Wed, 12 Jun 2024 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179439; cv=none; b=gVtXSDzsAxa7v7xZhEHVjdWK5bjsrRUfg4DO5VHU59nawTBKBJuoT8OOeyPxxgXywd7kMLKFWbnrvcf7JM+WqXm7h/WwDlxL5dH/UBiCuixU5FjBeVw+e3WcMTu2WA/31Gh+e5tkayypN0f3JwIU45nBDC4XcCtj1OTEyjaYM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179439; c=relaxed/simple;
	bh=miU6xLH9WgvvFJePZYX1TYDDFtay5O2Y4hrEKw4Jjkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHsGfmnFfqey5t1qj4A07yA1k7pTpN1XSjLq9JS/DhzhYmVS1q9sFiEDAPIsfsLFliUwQfb5jmSioB4SJ8t647irbTMinK6yVhrtywbxgYg8ftrlWPk/H5BjpV4cCabQSz035HrGUArP8wXHyRitzQ0DFgl5fo/aLOxdCCKJtws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=snnBI0fq; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57c75464e77so2470165a12.0
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2024 01:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718179436; x=1718784236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TXzg+fdrVbFQOuN+HCUNAkTpjxuEQIMLRvuvbmDikrU=;
        b=snnBI0fqM8hNdsjhIQqxRuOHe57NUHOJNDPa2YmzjC5lBm7TZVZPJbdmDdvpjkJwsm
         4gGp+9l6G/c2m10IFixkeSEg+FfBsagHAM1WKe2lTerT7F2Jk+Vp0/hE3HrKKaTntznl
         AegEpJObGW1l656Nc4T8USlTGYbSqxadzf3Kr7KV9XAWS1pai1G/FgE90UooCXO0d/8G
         +eM+HA6ZEwGW83fKBoRuctZwG0XVdtlmaIxUcpDvOQvnSgqesnOmuQInSnpt2NYA5z1x
         UWgSzLEyfNPrrhMt74dn7AxXZwnEqOlYv+KOh2nHpMusMLiqcVoiOn8JZ0M/50qGhb7h
         tgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179436; x=1718784236;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXzg+fdrVbFQOuN+HCUNAkTpjxuEQIMLRvuvbmDikrU=;
        b=sdz4YJXj0gIP/up/cxzaEaA6NKV+MV53XT8M2BP7TcdBH3P8XpagVC25I7t5nDq0QD
         kr4hFFG9kndaY61tBojsCR14wAYI/q6LaJUs1Hv47lXeDzXx51PBWi0Jbn0EOtH4JLzf
         SoOv60s8BFVqKl4KJ0wHmrj1z6jGlNfui01HYCUJO88te7UcCnKurAMVnIMemvcviazx
         Xe8x//EDaFrbxuEs6HkE/Ut90TEieC9Cc7stIq/hnsiAv/Ipg6OkJVS0xDgr4Q02nXNS
         WOEUldjd8Hv7AERNkWbd7OeeDc9AirjCW8NbsfBUgef2NoOMcoMSFArCKo/jhW3Tjj9u
         hTcw==
X-Forwarded-Encrypted: i=1; AJvYcCVuyTYYJwVoP/31jlDqCN8CxyL4JCLM/bMZ08NO1gV8m75Us50CbXy1ZECn5XMtzuEqef9WKoMWrASChnIbTwBezZ2Um/fcYpSsGMI=
X-Gm-Message-State: AOJu0Yz8ysUw2H16i1IXoWyhPBhtanaboOtpmMRhViyGUaHzVwu+MJYC
	2kjXKY1Tm+5/jBi3Z2pZYwtrOrwd88AO4vH2awHiXRYCT0Q/KNEmBmRqMlwSyu7zjy6QQK5OGax
	0
X-Google-Smtp-Source: AGHT+IGTIJ1QYmTS9L1R7y/6y1Xrs1RxvCRihf75QgCLe7/eA7Mm8HF8S7UsWutWliGYiDN/FWzfcw==
X-Received: by 2002:a5d:6a90:0:b0:354:e729:c0f0 with SMTP id ffacd0b85a97d-35fdf79cf45mr719801f8f.2.1718179415223;
        Wed, 12 Jun 2024 01:03:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d484absm15780193f8f.30.2024.06.12.01.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 01:03:34 -0700 (PDT)
Message-ID: <3a227b28-dd0d-43a2-bd9c-1a3440d64435@linaro.org>
Date: Wed, 12 Jun 2024 10:03:32 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: input/touchscreen: imagis: Document
 ist3038
To: Raymond Hackley <raymondhackley@protonmail.com>,
 linux-kernel@vger.kernel.org
Cc: Markuss Broks <markuss.broks@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240612032036.33103-1-raymondhackley@protonmail.com>
 <20240612032036.33103-4-raymondhackley@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240612032036.33103-4-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2024 05:21, Raymond Hackley wrote:
> Imagis IST3038 is a variant of Imagis touchscreen IC. Document it in
> imagis,ist3038c bindings.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  .../devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> index 77ba280b3bdc..2aea21bfe6ac 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> @@ -15,6 +15,7 @@ properties:
>  
>    compatible:
>      enum:
> +      - imagis,ist3038
>        - imagis,ist3032c

Don't add entries in random order. Keep alphabetical order.

Best regards,
Krzysztof


