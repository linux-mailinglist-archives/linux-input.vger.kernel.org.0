Return-Path: <linux-input+bounces-10707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F70A5C237
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 14:16:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A3D5188EE73
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 13:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379262C1A2;
	Tue, 11 Mar 2025 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FfQY5RTH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5187A12CDAE
	for <linux-input@vger.kernel.org>; Tue, 11 Mar 2025 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741699001; cv=none; b=c+oa9LPNXIJAlHsQg3IncoNIAp+Ugs76gMFnNvdcEDmIDXMeITQ6eg+qCBwcJX98yAxu8Gv3ZzcLMyk5cpXtOUkAYG5mtuwOPOBpMRcCRn9jFfh7Wt1jG4pJFYGAo2L0rkaUYI5ca+FR9ETm6HH7sdyg1sCLyW57LIl0h6WevKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741699001; c=relaxed/simple;
	bh=X3FGCdS9xaj5Pnm0E6RoFIi0kxKuxdWu0AxRIwE5nfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XidMxTOVDEOQPcFWwdOSq+ZnB4KS/2Nkcd7NfJjWrOo3cBZTA+16NrX123Bwbys8YAgdGOB5kq4J6eTbpxMRAwqkCk9dKBgL+zD3Qyyo6e0egwI+c8prr0dvqQsKdrXbQUrKkdbyf/J/Z/SQUKcsMN6X20I1RSeA7byA/E/xdsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FfQY5RTH; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e616736458so476280a12.3
        for <linux-input@vger.kernel.org>; Tue, 11 Mar 2025 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741698997; x=1742303797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l+TN31oAXynxfgn4SEM/dsCUQmjv4pWoDPubrSn3XNk=;
        b=FfQY5RTHF26kcuC8DlW3xxgVPyzEM3OFJbAB9oai+TIxDJAj2RixVDXXMPXrkJfXke
         mCCuxkDgtuuQXOXjmzqbiYEpX5UXqXp1mGIOUWZLydoQfmISOgvVrFAbyLmCpkn4IYbK
         7ZtIL9LvepRoMtldckShER9ZQpKc4h4LPXK1uQmtn6JIUC5tUPF7It5ETUI3rU9MO/AP
         DY89F/Wd5RQwq1+3OuoNuzCojLXLQuenIGqSDWgxgI2MA3Con5Rw3cEEkAKer6mffNG4
         AIylnXDpQm1GCsCD9Xtcz/fy5VaHilXN97QHs0N+1O1UOFh6pmKAco9PTLSf+fZeajxy
         qzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741698997; x=1742303797;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+TN31oAXynxfgn4SEM/dsCUQmjv4pWoDPubrSn3XNk=;
        b=LqGFxdautlSKZU94AuQa/TeM2E01DZW8D5QoyBZCe6ac7nHBlbiviphIxZHGUPlU7l
         VGs1tcmg55sRopoCAqLi9cV/HeYEp7W5qPuNlLnWdFCAymEKFEahPlkZ3ZHQVfUukh0t
         Ih/aACD/KAU3+5SzJ6v32em5tlZLZNDXRgxUoBFKP93jk97ZgUpEr1aI52k2nUPGrDxY
         kGg5acZOTxLf71OFoGyV6QPNu2J2HZYQsoAJ0tpX6vJhxumso5/yv6KuzgpCs4vYi7tz
         X74J+bz6UvHxtC37aPPg0YkLsgM1jEI2vrLAwR9Yg7LQz6AHmtknHf4nZOU1jtI9VgyU
         GuiQ==
X-Gm-Message-State: AOJu0Yx8esksQ3dbNK41VloEUCvzRNr88oUNQ1g3px4taRK+xEUEScZH
	NThfo41v5CwfAZdTrjxvUFu7JcdqBJXzSWmBZtIH8hn3DilHE1T9KngIEvnLGn4=
X-Gm-Gg: ASbGnctpOHR8Li1Sld4QASoa64QYcIkE5jq7M8jYB2bDvlSut3FygajGfNJV+85Wc0p
	KvUdYNGpyaT9x43feRzlWN+26b8Rc5RUQxV1SmvEze2O39FMPAdH8xhMKTM0Cyoy1i2aT8ka1ps
	mrov7Y1jZ+Vc0/o1SW9RZfKmYYfiY9Yq6N8zaj5Lh3wEufX0KkM7/u/pqhsJYwXAMgRuvDPx9qD
	1igmLfcbBpKVbOaI1OEyGrZj0jafrhSYM/Hg4XICIsAgDlt9xCRiRd8WtoSm9ZAA1R/BfbHPcDs
	FWWGiZ1VHFkdeRHzJup5hJyC9qDrDULLjW2x7P4fapuBVfVIl6dsHxk350qZjpI=
X-Google-Smtp-Source: AGHT+IHDl9bEuZPBLJEU8iNN9l9SyPqlOxCoNYVDjA7p92nEVa1ym2FhJkKekiyZ7ninSqU2Atyspg==
X-Received: by 2002:a05:6402:268f:b0:5e0:36fa:ac1c with SMTP id 4fb4d7f45d1cf-5e75f983d16mr1567613a12.9.1741698997500;
        Tue, 11 Mar 2025 06:16:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7473ea1sm8395088a12.29.2025.03.11.06.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 06:16:36 -0700 (PDT)
Message-ID: <553c738b-123c-4b79-81f7-de1a89c1572b@linaro.org>
Date: Tue, 11 Mar 2025 14:16:35 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: input: Remove bindings for Azoteq
 IQS269A and IQS626A
To: Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <Z89ugIeYkJ7rAzJP@nixie71> <Z89u5UBMDXtMw/Hq@nixie71>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <Z89u5UBMDXtMw/Hq@nixie71>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/03/2025 23:59, Jeff LaBundy wrote:
> The vendor no longer recommends IQS269A for new designs, and no
> longer manufacturers the highly similar IQS626A. No new product
> development will use either device.

What about all existing users? It does not metter if vendor recommends
if we have users. Intel does not recommend any of its CPUs older than
two years, so shall we drop support for the instruction set in my 3
years old laptop?

> 
> Remove both bindings to prune unused documentation and avoid the
> need for any further maintenance.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.


Best regards,
Krzysztof

