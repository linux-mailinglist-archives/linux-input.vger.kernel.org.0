Return-Path: <linux-input+bounces-11917-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E91A96D67
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 15:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBD6916ED90
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 13:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A023728368B;
	Tue, 22 Apr 2025 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKBk8lAN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB1F28150B
	for <linux-input@vger.kernel.org>; Tue, 22 Apr 2025 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329755; cv=none; b=YHx1P7rw7vd8BJptiB+4V/fcZIT4xOhg0OD2HUYpiIjFvTC1v2JUliWzgV/IIy6CeWLEp+u+aEdvCcYdtPZ/TPWbA2bzwMlHOyYVgeAECZ5gbVp9gRNYH9qCyjKy6KH0+6fwOe/p3KKc+ntiA1/J31p2IgLpAyidzsTiXUaQKB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329755; c=relaxed/simple;
	bh=t/nsZtQzJkxlxWAeLmLAOPfvM3imWBmvJSy//xCxPXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sp9xzzEQ2ntPLcSYg4OuYABXN7Qc36ZMNxGC8xg+gA0OHTCdKpwQrSfnGcgak/KibQgwyMbxlneLwDgzTD+Lksd/XhSimgLjN1bWgeHKqQeG+hmjllu/ktgt/OHAgtH0YGPTyg0bXBeGvBWYQdDBzZerWBZ4u/Jei1TCR7zkepo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKBk8lAN; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c1138ae5so4599846b3a.3
        for <linux-input@vger.kernel.org>; Tue, 22 Apr 2025 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745329753; x=1745934553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOAx4lAsu+XGGKSdrHD8VhSjBDkm2ZpEvZ8hWaIZOg0=;
        b=dKBk8lANLTRJB212MPdqbzNraM+IGOBZHitx1x3CiSypr8tTeidRc3Pbqb8pkbz9fS
         9Q5Z6DEQsnhUc/l9flDBhCYhUrMLt9YQA40hZff229rQDEm86gxHAMRZfShwa+vKKkH1
         /YL50mThGYa/KCEHr0E8ycIL1z9oaTDeC8/4F7qOZSYp8DEaWl4Uiq2lYOummGeu4Vj8
         BpRKMY3gxyDFHYT74Tq9WWKl+/jHLY/1Ot/vnLHW9X2CzRGg5AkH9F/4GBP662lEkUcO
         X0kqq4S1+EyDKctHTHa74EwSi/9MyJRMxrTWcgGmEVtll7OUHciTRR/+15GwEAmP/6qY
         C3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329753; x=1745934553;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOAx4lAsu+XGGKSdrHD8VhSjBDkm2ZpEvZ8hWaIZOg0=;
        b=oLAm6jgxknWnQDzJIqeZ2pSPIOODZ5X0460kiQAczHjj3jhIASYJyohAjXtAznkGC9
         8nkEPeJ3IcPFLGuK9puDj4ZxyTx+fsCUgxSV228etCTfYGRxpjIR5oKo7EY3UP9mEPcW
         W2fpxFm4uuB+Hcx3HExPrKeBHb9fN//lLxE+u7r03bY6K462sCPSyhMmsFeVfbgDRz05
         jlyw4N1I9hYkgaGQAKl8WKtsHIAfhZn59z/mRhh5D54Wza0cDjSA4zBoJS61NG1717Wl
         zsimtKRP9cLnJ4IB2P6Vfl24Brm4zWvT7WG4RfYV6ASeAoDTW4CR6reuKsRD2GCpVY/p
         A9jQ==
X-Gm-Message-State: AOJu0YxLD6ksBCPWPY5aLcKUzx6ZdT6UZMkJBs9p8gyS5IDYJaa7mtF+
	+twXC/4rG/n7T239jnAoK833Q3IK6sG2s7cOR3l5Ep9nodFYhEBs
X-Gm-Gg: ASbGnctf2UPGNijdJi7B1KeMxcHw+Npgax2jWVurFAwr2dPgolK8IYyiPeA3B3Fz1Ke
	SPZWKY09waDI/vYKxycLB9aldlx2z7MOqxSr6AIRiUq5hcNqcg4B/8PQ5YLpzQs/BlITnWog32P
	wQQss78CrGW02Q2q2rY18Iz+nKJXCOTAnjYaMqk9mfCJOxf7Ao9R5i/fMayRH0PQCXV8YJ4Zvjb
	gwWmM0afWKAi44rZm/86KF0GkkeshFLE7TbJCSklFEaNiUl2N6B+k2zWJ72ISDitIHYmgj7HXx6
	3Sqyy8y8LKOZTvTDZ+DZOtIv/GP1O0md7PhknTt3B3vBi7QUHkU90TaWYK7Wi5NKhOnvCD/MVLm
	BAHK+YHHp/b3igeih
X-Google-Smtp-Source: AGHT+IFQdrJD7aGoR7bzPrCfr6Lp1G/sMPWB5uoYuTXr5yvEzTlo5Yu4oQk7F0e+Vziz9XQXCF8A4g==
X-Received: by 2002:a05:6a00:4606:b0:736:a77d:5412 with SMTP id d2e1a72fcca58-73dc14cd331mr19458555b3a.12.1745329753126;
        Tue, 22 Apr 2025 06:49:13 -0700 (PDT)
Received: from ?IPV6:2804:d51:49ad:6800:615e:be5e:6da8:965c? ([2804:d51:49ad:6800:615e:be5e:6da8:965c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0bbesm8636095b3a.37.2025.04.22.06.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:49:12 -0700 (PDT)
Message-ID: <c332518c-f997-49bd-a2cd-4612def52b81@gmail.com>
Date: Tue, 22 Apr 2025 10:49:09 -0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add keycode to Dell G-Mode key
Content-Language: en-US
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org
References: <20250419113132.36504-1-marcoshalano@gmail.com>
From: Marcos Alano <marcoshalano@gmail.com>
In-Reply-To: <20250419113132.36504-1-marcoshalano@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2025 08:31, Marcos Alano wrote:
> This key exists in some Alienware and Dell machines.
> On Windows it activates the performance mode.
> 
I noticed just now the missing of a rationale about my patch. Sorry 
about that.

This patch is part of a multiple stage plans to enable the G-Mode key on 
Linux.
The most important part is this patch, that will define an exclusive key 
code for the key.
There will be necessary a newer version for libevdev, specially the 
Python support, using the newer headers with the key code I'm adding in 
there.
Subsequently, I will update my change in systemd so the scan code for 
this key, 0x68, returns `KEY_GMODE` (today is returning a very generic 
key code).
Finally, I will release a simple Python code I developed that is 
responsible for monitoring event devices, /dev/input/event* (since I 
doubt that I have how to know what is the keyboard device).
When detect `KEY_GMODE` it will enable performance mode, and when press 
again, it will disable.
Today I'm using D-Bus to call power-profiles-daemon, but the idea in the 
future, with a quite set in stone key code, any user-space tool, like 
power-profiles-daemon, can use and manage the key by themselves.

Please let me know about any doubts or considerations.


> Signed-off-by: Marcos Alano <marcoshalano@gmail.com>
> ---
>   include/uapi/linux/input-event-codes.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 5a199f3d4a26..85c6a612ee84 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -765,6 +765,9 @@
>   #define KEY_KBD_LCD_MENU4		0x2bb
>   #define KEY_KBD_LCD_MENU5		0x2bc
>   
> +/* G-Mode key present in some Alienware and Dell machines */
> +#define KEY_GMODE			0x2bd
> +
>   #define BTN_TRIGGER_HAPPY		0x2c0
>   #define BTN_TRIGGER_HAPPY1		0x2c0
>   #define BTN_TRIGGER_HAPPY2		0x2c1

-- 
Marcos Alano


