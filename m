Return-Path: <linux-input+bounces-9164-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DCFA0ABA8
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 20:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC7863A4BF6
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 19:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1E51547E8;
	Sun, 12 Jan 2025 19:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBVU/znX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB9A14A0B3
	for <linux-input@vger.kernel.org>; Sun, 12 Jan 2025 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736709533; cv=none; b=Iel84goJlYQckDA/MxxTdX5/qgTqxPId42jtaD/3ZRJYAmLc5KZIJ/Db+3h8S58QKHPBfSgqGS7lMRj4EcrONChgFWmK7qhvmKRGu/HvZJcML4HQ5EaQSOCPbNIa8B+aVdP9OoM2jxA1OhJ6QYkrGi73rdCq8MvOkbAu7ONBs7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736709533; c=relaxed/simple;
	bh=WpamBzQarLaY7DrEUZOJ9jacxPIkAO7n+l7WGq9anII=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=H6nXv0xjkC2l7jM/MvoO0l4tuugtB/TOudXYTHAoUHYCR+XhWIlEKGQGt4RAnBGheGIIWlAyq3cpob0UaUpQVjtRqOlHIE8ijqzHR67SvyjSQIv4TM/CO6WcVtJ9bced5JbVx1j6J8mtVlxwW9yhenKu2S3atHuzgrZGbYnCYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBVU/znX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43675b1155bso41775225e9.2
        for <linux-input@vger.kernel.org>; Sun, 12 Jan 2025 11:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736709530; x=1737314330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f00P6yumcaaCoGRToCEmGUN71MLYaSe6dYrWbYIH62Y=;
        b=eBVU/znXw8bVifsm476tenN/cO+hb/RevO68bWQlu2es2QiduHFN8srEIYppz49Hp2
         xRkJp5QD4Pk63+owLZ28mpIATRT+gun10C1pa6KrlAuiYN5F707UmYYYOuxOq1HAUFrD
         fmKaJ6al9BvOsYiLSm+O78r2He0yTe2ylJ5igNsJqxdBipLC9jR8gLtujiwIz0ycIYPR
         MpnLUSYVCGGly2m16//xqJQag/Nkeb0DHUDgAll6Tf7LX+/wRenyxF6ut6f1Xr33ZByX
         vbFagp1olnT9bbT7120yhuEI3srS7vwi0dbQcwrJyaEPzGggi3q2jc5j20BDN9NHOkII
         lJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736709530; x=1737314330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f00P6yumcaaCoGRToCEmGUN71MLYaSe6dYrWbYIH62Y=;
        b=kRdB1zIu2ZGDkccaAalE6UD5mlmrGsbvqhq8+Ypwycn/Jc5b8PFZPvIxJNFfj6VRW/
         Qc26cEb3S8bNttjM5OjNSSVHx+SF4HY0fszXDd2F5F5KseoHNHtPpj2MABiI2TDYI2/6
         vbc8kUtknE1CJgjbnEl7Ucy2ftu/lIPxFq9M4IorH+VjEZCzgGwTeUTloeLZkDLkLzl5
         eVyNIVU0lMgFF1fgrPF/GlPywvH5NZWnY956FFKmTq+k0DF+pAbInKHnfWplbVWnHjv5
         GqqPuhqnoXwoZmP0225x5M703MEG/tq6c/rygn0Tu1IE2LXE7uhrigFuz8vmUAl4UGgS
         moqQ==
X-Gm-Message-State: AOJu0YzrYYpQw6bgXaWVfQOaBLVyhHUze5spTAfqvz2BkUZYBUxDD3rr
	yBFTmDrmp2imlR16kXjz672wvfOjHEQLYYIq0nVwym06NbyDlf6T68KfCcPoSI4=
X-Gm-Gg: ASbGncszhgXfX0Gaxi+zlLtsKjyr5F2Oz+ZG+m5gUj4c6yz5GClWuhQJ44idHJ+oDq9
	B5Un9PfBgvDioZm01RMlckhNOI3afrvNhOVrQWxLRxDwqEPrgE8Htc5pzg/xtnK+7L3ElOqHmOp
	9ziEVLvOsZBGCFMAyxqGn34/pPlPmhyOR+PyplrVuOMAKdEDXu52g9CN8DxW9+q5bidpvYnbQcO
	aSRXogCPr1R9k7WT71ApXPwQWRToQdGTg8INUBH5MRwkAUodUa30OeRjgAY/EWcMK+LYjNt19i4
	Nga7yGb6awCBFhxv3VF+S5RENEjV
X-Google-Smtp-Source: AGHT+IGU8eUT18omm/v3Klkqb9+HFiGRHl1p8xxJMUUR3/g3f8+ev4b7GBDG+7WJSg6FCyB4xjpjCg==
X-Received: by 2002:a05:600c:4e0b:b0:434:a7e3:db5c with SMTP id 5b1f17b1804b1-436e26aeeeemr181102005e9.11.1736709529780;
        Sun, 12 Jan 2025 11:18:49 -0800 (PST)
Received: from ?IPV6:2001:16b8:b4af:ae00:ccc5:f463:86dc:4a94? ([2001:16b8:b4af:ae00:ccc5:f463:86dc:4a94])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2dc08bbsm153123465e9.12.2025.01.12.11.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 11:18:49 -0800 (PST)
Message-ID: <19c26b78-dff0-4d67-90e6-2cf840f2f283@gmail.com>
Date: Sun, 12 Jan 2025 20:18:48 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] Input: xpad - sync with github fork
To: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
 gregkh@linuxfoundation.org
References: <20250107192830.414709-1-rojtberg@gmail.com>
Content-Language: en-US, de-DE
From: Pavel Rojtberg <rojtberg@gmail.com>
In-Reply-To: <20250107192830.414709-1-rojtberg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 07.01.25 um 20:28 schrieb Pavel Rojtberg:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> This updates the list of supported devices as contributed on github.
> Compared to v1 bouncing patches were merged into one
> with me as the author.
> Compared to v2 all checkpatch.pl errors were fixed.
> Also one patch with an correct author was incorrectly squashed in v2.
> 
> Andrei Ilyashenko (1):
>   Input: xpad - add support for Xbox ONE liquid metal controller
> 
> Fernando Petros (1):
>   Input: xpad - add support for Thrustmaster ESWAP X2 ELDEN RING
> 
> Greg Savage (1):
>   Input: xpad - add support for PDP Mirror's Edge controller
> 
> Jack Greiner (1):
>   Input: xpad - add support for wooting two he (arm)
> 
> Jocelyne Jones (1):
>   Input: xpad - add support for SCUF Instinct
> 
> Leonardo Brondani Schenkel (1):
>   Input: xpad - improve name of 8BitDo controller 2dc8:3106
> 
> Martin Stolpe (1):
>   Input: xpad - add USB ID for Nacon Revolution5 Pro
> 
> Matheos Mattsson (1):
>   Input: xpad - add support for Nacon Evol-X Xbox One Controller
> 
> Nilton Perim Neto (1):
>   Input: xpad - add unofficial Xbox 360 wireless receiver clone
> 
> Pavel Rojtberg (1):
>   Input: xpad - add multiple supported devices
> 
> Thijs Reus (1):
>   Input: xpad - added Turtle Beach Recon support
> 
>  drivers/input/joystick/xpad.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 

are there any further changes that need to be made here?


