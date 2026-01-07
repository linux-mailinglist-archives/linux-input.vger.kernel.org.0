Return-Path: <linux-input+bounces-16820-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED76BCFDD4A
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 14:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40E3F30A15BC
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 13:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCE42D8DDB;
	Wed,  7 Jan 2026 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nj8Ag6vM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00BF304BB8
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790851; cv=none; b=AOlypZxaL4+OwOyApJfssrnuRC9/9EcsmZX4YUWysSZw1f+BCh6A13vfNLBO0baKVxPStzT2tMbJLc/SLbnD7MnMIx+KVBhpMDUCoN5iTKX08aMiLtVBlWO7WEHltrVoeF6Xkd4VRVFoWerfC/RbJqFoS/zolfLvEe2blXzyZbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790851; c=relaxed/simple;
	bh=QGsKTxmVV99hmX0rYhtk+HpVTNTzdbKkajbBmmnHF1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TaDrvPcWdxiEyJ4qh9y6lfanTiHccjuYIx/oaGDkGW75OkZKS8VF3PPBC+69DYX6HsNyL2F+1yl3ItznefJUb8afCxmkAByACZjF/cJGtYgrMAA8dKJJQ07f1vvuFlg5rpi6BxVjggPKym3yZeao3nMsWKlW1hn1f/c5e5v3i6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nj8Ag6vM; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so1573463f8f.2
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 05:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767790848; x=1768395648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tHPzechyjZW8ClAP+jRkwTXoBXozHdHzAdMUgBg5wLs=;
        b=Nj8Ag6vM9HxSmDaDzi+BvJhiRT6Xq52TN0c7qBu0vsNdVw6kBPHfkAIJMudZOvIrwW
         E2zvoXEFHEM6jO+KPol/xnojVZ4nISzg1w2zw4PLzMfY2tGRd7+NC5YN6o+Qf+O5ssI0
         cjLR8hG7wlhLcVjHfqwzFJWD45WDR5OiO6FcT43j31diQAWSgPkVdtx9l0aRT9mC1glJ
         3hfhf7595ecsqGflxlN/+5ZMXLgoq1pgiEolSkMH4qb6Lo50dDsc9fB88vohltdrAVvO
         iiFYVHQ+lIrbh9wfyTOHcsXm2tVxTFrGkZiB0i3Oj5+uytLkMpBZ8T5mpy/at8elkxQp
         7rDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767790848; x=1768395648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHPzechyjZW8ClAP+jRkwTXoBXozHdHzAdMUgBg5wLs=;
        b=PUOXdDm4A3IHtitfcpcGc8dIVZDN4OWHpJEdAEfe6wq4bPIZysh5s73tkxzKflmCsL
         UzYpCeRHotFAwJEqOOKHcpSsh4qUWCBN87DPWvTITjot1jtPMZqfIgwDaXdU2EPuPXmR
         WcmES15wQHqoQ8Z/MMxu7Tnx3oqFNOtMWya2BnFkXqfBVj+ZxSJs82qbJFa89G5ZY//a
         wM6L3qsmYofHO7UhkiWZfZZlG5CfnVJp3o4g8NNWwsdg6esNq5DdE2cRD2qeJVw7X8Rr
         9I5mmTccZGSkxTBnF5cX0/uh0stspUXvSaueTKoJmCgmWEigSw86G20Jedec4eyGVyvE
         KqcA==
X-Forwarded-Encrypted: i=1; AJvYcCVTQiuH+kINPWLAYS9lRRIg5KGsdIr9gPkBOgQYfggBjY/jJ8yGZeG1u750EovRbkwGj8EsXbUInm9vMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLDsoOcc3EDy4SyjqFbtrFfvlIF+L1A2uwFwuV7cBJC4lcrld/
	Z70RdHBlunrhr2r/EzmPSM0v0aAxUpwaSL15vLi9tCIlvKTeMUYgmdpy
X-Gm-Gg: AY/fxX5l82Ksb+yjtWc0zYnqZ5yihSNgK3oNG8IM6vC59k1eFcB6k8o1eq3sYHAEmdE
	6X8/Oba9YRijVGGo4DaI8uGfroX5djxEAE4w9rSQZ/KCH9Mq2wv/A3O2JqU+Lpje+/N8tvEtqLM
	C6UOq6nfXmV7iBWvqGHQFmy9IQpw9jw97coJs31rNgehn/GgO6bCwVkZuO7lmZW0YVoHvCq86GO
	tK6TtyUMQtFPmBWgl323XM9pwUDYW4qfl8bDIwiFC/JxXrL5IMIYSAdNzsycnX42UMHrjMf8QO6
	6qeD6j6aEcozvIUi8IvKJAdelQIdJvLGbc0JVsjgH6aJdX8XyJfFcsYMb0vQbcY37qy9YNaNkpn
	QxO4AM1aPgHU/Cx1n8K30Ph8Y4O2OjbWczOtxoawmGCIsl0LHVWO26r245M5rx3IVipX6BOBU+4
	d5m7W1LZsKGwM82NrD5XMc0GU=
X-Google-Smtp-Source: AGHT+IFbH4q77au3nQIdyvjs1L43MxRoudeIc3Z20LoPEeegXSm0kcJg7s+bmrwf6BoO1Ulol5WkKw==
X-Received: by 2002:a05:6000:200d:b0:432:8504:befd with SMTP id ffacd0b85a97d-432c37c85famr3305716f8f.32.1767790847979;
        Wed, 07 Jan 2026 05:00:47 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa46sm10172637f8f.27.2026.01.07.05.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:00:47 -0800 (PST)
Message-ID: <6550db38-e5a5-49f5-ac60-02d0374dd553@gmail.com>
Date: Wed, 7 Jan 2026 14:00:46 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] HID: asus: Replace magic number with
 HID_UP_ASUSVENDOR constant
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: superm1@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, ionut_n2001@yahoo.com
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
 <20260107111945.48018-4-sunlightlinux@gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260107111945.48018-4-sunlightlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/7/26 12:19, Ionut Nechita (Sunlight Linux) wrote:
> From: Ionut Nechita <ionut_n2001@yahoo.com>
>
> Use the existing HID_UP_ASUSVENDOR constant instead of the magic number
> 0xff310000 for better code clarity and maintainability.
>
> Change-Id: I65cf58cd0cd47acc39b755fa9a5fb7f2ad271046
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
> ---
>  drivers/hid/hid-asus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 472bca54642b9..eb14b9d13823b 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -317,7 +317,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>  static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  		      struct hid_usage *usage, __s32 value)
>  {
> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> +	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
>  	    (usage->hid & HID_USAGE) != 0x00 &&
>  	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>  		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",

