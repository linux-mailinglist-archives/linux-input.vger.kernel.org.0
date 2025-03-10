Return-Path: <linux-input+bounces-10682-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CF9A590B2
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 11:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7966E7A52CB
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 10:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831E52222DC;
	Mon, 10 Mar 2025 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tyhQFcly"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65421225A39
	for <linux-input@vger.kernel.org>; Mon, 10 Mar 2025 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741601071; cv=none; b=cVpyHxNK00BiNzzCqZcpmS88RnuB8IjYNmg3FZ5HQcoNSrOkFPDTrS21Xb0zYXVZo/BkYNV/rP7XNBSNqtFwZqUs781lPPZsVcZsekLaFpxR8R3oEdaAq/V9qL+yOb+DsKQqWIQ8x7SQW3b21VJuvnJiWIn6q+Bel8pSh85iMQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741601071; c=relaxed/simple;
	bh=N1D+HJpnsYxDpdlfY8rFvIZivaRl8RkUHS+RuFooO6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBEHJ1Tx8hK7zsZgRuMpgY1BzGIweR2zEYkJpuYe96D/d+8uK0/pKwVtpiuiA8150UVZ1Njn9pT/a0pTB54Jiuxno2u3OEvBusvGHQsK5C/1p1Ch8B/IQlfF24BSu1KRgbYQXgh+QzFpiYEv6ZFAaIo5lRupmB5ROxNMK6fKQXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tyhQFcly; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf848528aso6107365e9.2
        for <linux-input@vger.kernel.org>; Mon, 10 Mar 2025 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741601068; x=1742205868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMmB7C6GdDSQIb1MdRYMbiBDFafOAbha/ZnZCufI0c8=;
        b=tyhQFclymAWe5F0KzFKB++hijW51ykomNHvWIFeJxV61Xa0ldwTU1sTwFw/trSEVJN
         TdsMU+BZ7ijNUnwWTLRFOugwQ2L0I3j2VROQCejb80roJAeVNhvP4Nz4Mv2cXG3oyZ0q
         dtK23sJw/m/j8qDz7K2r+CZU6koSWigweXQE9gVqdUPHMcrj7bY73AhhD+ZBiO9mWTso
         HdXSMn+maZOrPitZnhA5UboKf3m7i2AUgG3j+zkn2sr2o9C0SCezISwKNlfHOiAb7pXl
         ZZpNf/U7KxZD4iqwdtk5W79UqPv30KwGkAzOfK5BU7yEbWihuOmncV76y9rl4SlCP1gs
         u4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741601068; x=1742205868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMmB7C6GdDSQIb1MdRYMbiBDFafOAbha/ZnZCufI0c8=;
        b=cc0Sq9ZDoGYZ/jVe3Gg3eZqTWj+k7XQO5ARY6CSmPZSsxPz6rabZJ5gMRKx5CPIZOw
         9OyEe2juWnn3uDUXjow+jagAu5WBsPc0qGQG9+7r/a8dtZ0P3zqddk4AVw17HfA8NZ2T
         Hm1vUD5hOvs/C/QIntxHqtbJkfs8E6EQ8JBRwyIuBfYCXatNkc2XNE2VAZVfzCe0TFu0
         Tvmb9RaNG/6CHsr+jIovdyznpf2ZEuZoEgDxEia4EA5lMeOhuDuKlQPXDiTMXSOsYO7G
         hUHzHSMuyYgO3wTL90jSn3QvdchHC0UjX7BMhOPxpT6OOdsdp9+BCwNdvLLdc1PydDOi
         tw3A==
X-Gm-Message-State: AOJu0YwkdtHDWVHCPv8N15GC1bczGLFvVEhvmAt7xPJjxwqGG8ECcydJ
	FuNWg1fc3i95B7Js84VLqI5Q13ncZFzhu/6SieDh+ifuvJnhMPwWu5bi1IGpEaI=
X-Gm-Gg: ASbGncueQkILrHyT/ceJ37M292vbXQ6zFTWHIArd/7zRfQes0QIOotlMv8SB619G7In
	5PNU6XEjYzMZttikPglyx2rnm6rs+89OAzsmQ9YpwQxDPUWRfkI7v9g3xP7fbf0Yl5Qip/zqZII
	8WDe7ZFW1zWdOA72D0JG7brd34eIYD5HQb7DpcslTKzjX1IArPeB2psS5lTA9oEhVtopTHLIUJV
	IZVpFTVwq9um/4JmGqXF5pfJnt3fIsFA67JxyvdyvrhgtB/wxkyfSxl0qmdB4G+ov5Y3eYKV3GS
	6wrNNta8M5JMn1EmeT9TNba5FylNm/ZsRT9TFz74/v3GlJN/AzlVqYyrTqwG0teFqKLVQEqtcI0
	gW5fKjaj+tf3B9nEycX5fqxmfbQ==
X-Google-Smtp-Source: AGHT+IHVDGL9yAGgPhwwPg4SOVnRezC9H197dgGjQGfk5VzYoJ2tNp0DsVGb6s/MeViXMstj6N8JkA==
X-Received: by 2002:a05:6000:400b:b0:391:2d61:4542 with SMTP id ffacd0b85a97d-39132d074a0mr8135391f8f.11.1741601067665;
        Mon, 10 Mar 2025 03:04:27 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:1d11:ab01:5743:8dc9:85c4:5f56? ([2a0a:ef40:1d11:ab01:5743:8dc9:85c4:5f56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e4065sm14594645f8f.62.2025.03.10.03.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 03:04:26 -0700 (PDT)
Message-ID: <53224260-4f3a-447b-9e7b-f68c5c4ba05e@linaro.org>
Date: Mon, 10 Mar 2025 10:04:25 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Subject: [PATCH v3 0/7] Input: synaptics-rmi4: add
 quirks for third party touchscreen controllers
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, methanal <baclofen@tuta.io>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

Please at least give me a heads up if you're going to resend a patch 
series of mine. I understand it's an old series but I don't think that 
courtesy is too much to ask.

On 3/8/25 14:08, David Heidelberg via B4 Relay wrote:
> With the growing popularity of running upstream Linux on mobile devices,
> we're beginning to run into more and more edgecases. The OnePlus 6 is a
> fairly well supported 2018 era smartphone, selling over a million units
> in it's first 22 days. With this level of popularity, it's almost
> inevitable that we get third party replacement displays, and as a
> result, replacement touchscreen controllers.
> 
> The OnePlus 6 shipped with an extremely usecase specific touchscreen
> driver, it implemented only the bare minimum parts of the highly generic
> rmi4 protocol, instead hardcoding most of the register addresses.
>    
> As a result, the third party touchscreen controllers that are often
> found in replacement screens, implement only the registers that the
> downstream driver reads from. They additionally have other restrictions
> such as heavy penalties on unaligned reads.
>   
> This series attempts to implement the necessary workaround to support
> some of these chips with the rmi4 driver. Although it's worth noting
> that at the time of writing there are other unofficial controllers in
> the wild that don't work even with these patches.
>   
> We have been shipping these patches in postmarketOS for the last several
> months, and they are known to not cause any regressions on the OnePlus
> 6/6T (with the official Synaptics controller), however I don't own any
> other rmi4 hardware to further validate this.
> 
> ---
> Changes since v2:
> - reworded dt-bindings property description
> - fixed the rmi_driver_of_probe definition for non device-tree builds.
> - fixed some indentation issues reported by checkpatch
> - change rmi_pdt_entry_is_valid() variable to unsigned
> - Link to v2: https://patchwork.kernel.org/project/linux-input/cover/20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org/

Please use lore links
> 
> Changes since v1:
> - Improve dt-bindings patch (thanks Rob)
> - Add missing cast in patch 5 to fix the pointer arithmetic
> - Link to v1: https://lore.kernel.org/r/20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org
> 
> ---
> Caleb Connolly (2):
>        dt-bindings: input: syna,rmi4: document syna,pdt-fallback-desc
>        Input: synaptics-rmi4 - handle duplicate/unknown PDT entries
> 
> methanal (5):
>        Input: synaptics-rmi4 - f12: use hardcoded values for aftermarket touch ICs
>        Input: synaptics-rmi4 - f55: handle zero electrode count
>        Input: synaptics-rmi4 - don't do unaligned reads in IRQ context
>        Input: synaptics-rmi4 - read product ID on aftermarket touch ICs
>        Input: synaptics-rmi4 - support fallback values for PDT descriptor bytes
> 
>   .../devicetree/bindings/input/syna,rmi4.yaml       |  18 +++
>   drivers/input/rmi4/rmi_driver.c                    | 140 +++++++++++++++++----
>   drivers/input/rmi4/rmi_driver.h                    |   8 ++
>   drivers/input/rmi4/rmi_f01.c                       |  14 +++
>   drivers/input/rmi4/rmi_f12.c                       | 117 +++++++++++++----
>   drivers/input/rmi4/rmi_f55.c                       |   5 +
>   include/linux/rmi.h                                |   3 +
>   7 files changed, 258 insertions(+), 47 deletions(-)
> ---
> base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
> change-id: 20250308-synaptics-rmi4-c832b2f73ceb
> 
> Best regards,

-- 
Caleb (they/them)


