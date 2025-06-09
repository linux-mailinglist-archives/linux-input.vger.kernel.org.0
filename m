Return-Path: <linux-input+bounces-12739-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A17AD1DDA
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 14:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF8D73AF623
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 12:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA50D257455;
	Mon,  9 Jun 2025 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g14+ZF8l"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC17F25A35E;
	Mon,  9 Jun 2025 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471940; cv=none; b=gx9WUxjcuiwGn2vJRoz/TRNA4ckXvfpEzQ1OSpYHK27Q4LijDANpfov2+RBGJJ3bjWVPOsaP6ZPf0gWWxkFpojmLMb7wLgEzZkMqzjfbl4sRprlIvETFcQfYbFRg2LQKzwXniWpnQp5l91D4nlfJ8JRzfkhnvcnesvZf5z0PsSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471940; c=relaxed/simple;
	bh=l0eq9z+bwI2/6pPSlEWgKnX9533DmDLPCwHP+/s/+eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REzXLS85K23NKHgE3q8dhHNknnc7Ucw3vIUeVFgqiFPbgw6ICJboyj55PtTwRpJKekUysvDcs926r03m0ZISTRQklCmqWYlDOH+2//I7bDj5SNa6MCjKuuACSgaxq7IiwNbIor9qg6ZCD/HsIM2OW04uGncwo6sFrnCRQtAbomc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g14+ZF8l; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso3293357a12.1;
        Mon, 09 Jun 2025 05:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749471937; x=1750076737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lm8+J8LO9pTzE/AcmxF5BhTmx/0SQO6Kz6Y+OF2wnic=;
        b=g14+ZF8lnpQiTJ/o/BNDAtjyYyZal468gXyaLyRppI+mObyIX2S+g1TaDiJrMR5xTa
         wFqpAE0UWq1MSou9vuGJywCSz0m1S4HDhSjlHIfhshWWCnDmRsegacv6Ifx4/1TALpLN
         FUMVTsgrSSRNz7kajqxow4GIbToAjAF4gHL6LHfwcpbb0gQDhjTy0r/+Aor1n1iLTjAI
         SvMeu0/wiZSe1UTBYr3oheyiVVUviCe58wRUkSA01cOXXdOHLlAu71yZLFfN5SAEMj0i
         gRFk++wkEQpUo3EPm4pJrCq0IrnsFug6P4USL4/VOdL7kvACoRNM3Uswy80Coo+NwhrY
         V7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749471937; x=1750076737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm8+J8LO9pTzE/AcmxF5BhTmx/0SQO6Kz6Y+OF2wnic=;
        b=m0ZEjGtSFZa4ntQDyudQjSGmLDyHaLz++1zZ3bluNVgHkbljqFxeTnBPW1sbuyerDG
         C1Y72F+8zVAd6LJNVPlBHIrISGHbB+xnxAhwtb9aWiw6tprFTNARiprJLgJy/+mYzBl4
         yOPT7FpGLL6MIEJqvbJzoD2AyLWT6R7D3XAJqLIhHI9Wgz7ay3RTP9fDZ+m5MhoYK0Ab
         jKqJJsxS8OB4VnpLZDd9TS8VscqTOhragVPWVfqzzxx5yOPRep1ExyqEr19+MiaTJ75s
         umo342wGmQPLJuApUyvyE+wxbdR1xsPxYZr5K1hoVwBRzMp1JlFy1lDrb0SFLCxvZTC4
         BS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOCFWIerusLodEXyEMAqmaDpPFdViulXwm+1THyNEG0cdeowvs0/lC4EBw8yx8WiKOhRwjaV4Kprptp8GI@vger.kernel.org, AJvYcCXuTXUFHPGdCmquylitkAKqfncUAji4cPMYMYJwNuQAzm/zHhsp9Dit8ZHwKpd3cRABXjv7wot116BQDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywry+8g0Rql5GmcednJzqPgUf7pPteKeX7vQsxlF0SCFvt1xmR8
	skfIW229w0FvEwXcxaQ22riYXIDnDvrgQMm8BN6KFbOMkukLChn0YirX
X-Gm-Gg: ASbGncuRMiBKx/7KLvt2smx2UKF21dTkQtPM2TzMDx8YCNkVeEOal4zDuCBk5MCbneR
	tBuxz2cf9WFpJZ8P+8WKs3wT1VTnKY54faGX9zjd27dWHy8nbEUtmV59Cpj9VK/Td4kF2KwcZ45
	5jp9p6KIYhazDMCM4I2/LlHXaBx203r1wXQ/3iPUcXqQVaGv909c09Z8LwBRx1uBU2dflMZ/vUz
	TSj6lln3RNYFfyvS1YjcfDekhgz3VMQS8R2zourPjzfs8KZSHE35Y1O2EBFVD9/ezNPAJupmDpS
	Ap6pWG/QKGgzhKrYj1eo3Vttx9y+3ao/gSM2TfKuX2oUzn/rsPpiFmpO7Vc0iKKqgJ+7uJAASEC
	s3Ij4yQ2XUpV0
X-Google-Smtp-Source: AGHT+IFYv4rUYkaPQ9Vg+6CHFrzjuBMHZ3ntWNeCEBbU9TrLLDM5BfrvME31JEIqv1Zdo0LxsEGSlQ==
X-Received: by 2002:a05:6402:5256:b0:602:1b8b:2902 with SMTP id 4fb4d7f45d1cf-607743a5bc0mr11884785a12.15.1749471937031;
        Mon, 09 Jun 2025 05:25:37 -0700 (PDT)
Received: from [192.168.32.20] (public-gprs400974.centertel.pl. [37.47.197.143])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60804dfb96fsm675481a12.65.2025.06.09.05.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 05:25:36 -0700 (PDT)
Message-ID: <7a6083df-9060-4d07-8293-304a3f5f6cdd@gmail.com>
Date: Mon, 9 Jun 2025 14:25:34 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: playstation: DS4: Add BT poll interval adjustment
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20250508210148.799578-1-titanv3585@gmail.com>
 <20250508214305.836406-1-titanv3585@gmail.com>
 <CAEc3jaCEENSMbWFcQyjWLP+4UPv3_2inARZLJsmXYF7zVbhkug@mail.gmail.com>
Content-Language: en-US
From: Vadym Tytan <titanv3585@gmail.com>
In-Reply-To: <CAEc3jaCEENSMbWFcQyjWLP+4UPv3_2inARZLJsmXYF7zVbhkug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Do you have a strong use case or reason to add it back?

I wouldn't say *strong* per se, but if something:
- Can be adjustable
   - I think if hardware is capable of such thing it's better to have 
adjustment of it available to user.
   - It's better to have an option then no option at all, let the user 
decide.
- Doesn't break the hardware nor software
   - When decreasing polling interval
     - Battery impact is just faster discharging, it doesn't "breaks" it
     - Bluetooth stack won't break, it could be just "overwhelmed"
   - When increasing polling interval
     - No negative impact at all (if we wouldn't count the user who can 
set polling interval to like 63, and have choppy controls, that's why 
defaults exists)
- Have benefits
   - PI can be decreased for smoother controls in cost of battery life
   - PI can be also increased to save battery in cost of smooth controls
- Doesn't impact anything nor anybody on defaults.

> The not adjustable referred to USB, which is not adjustable. So keep
> that one the way it is.

Oh, OK, I understood this in another way, but that make sense too.


