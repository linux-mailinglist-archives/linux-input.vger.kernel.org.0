Return-Path: <linux-input+bounces-2148-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874A86F0D9
	for <lists+linux-input@lfdr.de>; Sat,  2 Mar 2024 16:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0C261F216CA
	for <lists+linux-input@lfdr.de>; Sat,  2 Mar 2024 15:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AD1182AF;
	Sat,  2 Mar 2024 15:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcxTKqEr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D9310FA;
	Sat,  2 Mar 2024 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709393074; cv=none; b=tbUp6wpBD+EOuX/fMUQNWMaxENPusnI7RaLzVlJlvSkJH1XvNMGLfGu1JWqlIVjGOS+3Q/OucCgE7gtdMaQhbYpyd9AKyhREdrIjClbOAvFR5eRtJzPzVSqZQGHol/goYgS8E2rK4uLJU4TZBCgwrFuh543Oqd7cF8EodcsStPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709393074; c=relaxed/simple;
	bh=xD+hFcNg7fqN8cbrsHJZUQUE8dErfDtlAheqiEmgrLU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=OXXRTiv378bsAXrwq/7kTghyLB55TR38xs56IXFwQsEivf9RvEgitvIcMbpEbf+B30+mrrg9HEKkxSpSgUezArGhuln9VaIxJwgdVV3w5GyYyZDSkFzSDQzCh4Za6InpGwjPUvxRQ9RKGDuKKvZqffiqvoH7H+eDzro8mdFxSR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcxTKqEr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33e122c8598so1673501f8f.1;
        Sat, 02 Mar 2024 07:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709393070; x=1709997870; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Suj8iyI7f2lF+x7NvsRpt/pPuqERVxzuZWaHeCIhdCA=;
        b=fcxTKqErb6HTRF6Bl9qU58OEHrln8YeCJ6TOV5LBy9gNqCZOwoipatYtooEKKmaiXC
         N+lX6XsDNjRzULM+IfeNRzeBPM2hZxfw4lXcrersvDynw1fodnfgwytI2+gre3ugUd58
         BY2BDQLRiF9WBC32S9HvGEg2mZAZf936yT6OZasHJOem3/4enMY1nG4+EZkypmrJxvMq
         bZsu1jEGJAfukq4wm+Y2uD1YAN5xEQPBTSDGpFDLvPkdzoB4lIZOo59j8yGdGidtRoVl
         rRv0jLLwLbP8IfKJry80pooF8pPVw9t8ulszw7DaGu6NLzCVWAZs4KHzcdTJTFw4wI4e
         i22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709393070; x=1709997870;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Suj8iyI7f2lF+x7NvsRpt/pPuqERVxzuZWaHeCIhdCA=;
        b=gbkY4YBe5IED10NsLTc9KAbI3dH1/nV9PQuJC5F42cq7xDZZJntt3cN4QKwjf0LcVq
         NRg0xTaJxUG7j9+cmnmIBYZqeDJGCgWZjNAJuLt1nDH7wAJ1TCAkFiLYcsSTtVOQkZ50
         fzicv3YEVn1I166wialrUH74/XWB1tmgDBpSRIMpfVC8AT60lak6ckACOyaxC5QadhAC
         gSdfF2Ry0GfaBzMYgcu/CFEScYV7qFdyZP6jxJ/AcuyUf244hEzp2CsCpLDvYj51ox/N
         RQT2wcDI30j0xQvvpXy4QRfi6fhbIoo2+vn5o2+IIO2BP1Hw5g6/iSpjXQA5ESaZsni8
         WJCA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7AeG0YfU7sNJJfnMzP2lZhyiQfWr0ny5AEMt7F65oEvmK8RHlg3gQ1+Bhkt9GZA62kVRU1AyOGsduD7I3AfDS2xypVwLEUtASg==
X-Gm-Message-State: AOJu0Yw9cEbTMs8pDtXp0DJyL79FELlKbWlzDCCbbzAwSwKAcmEsd93W
	lV8VESztLZMgsTvoLxIDSNBPxs8DmSSGOLAkDcCmHNtbgCn/zBoe
X-Google-Smtp-Source: AGHT+IEDaUm1JW2wT+UOKJL8sv6flYHv/bG/dWi4swfTXLNn2Vy/2PsDbLFDnk7LVjKhnnFV93zjFg==
X-Received: by 2002:adf:a39a:0:b0:33d:a944:54c0 with SMTP id l26-20020adfa39a000000b0033da94454c0mr2943696wrb.22.1709393069788;
        Sat, 02 Mar 2024 07:24:29 -0800 (PST)
Received: from ?IPV6:2a01:c23:bcce:a400:2519:2036:7f0:6005? (dynamic-2a01-0c23-bcce-a400-2519-2036-07f0-6005.c23.pool.telefonica.de. [2a01:c23:bcce:a400:2519:2036:7f0:6005])
        by smtp.googlemail.com with ESMTPSA id f15-20020adffccf000000b0033dedd63382sm7528506wrs.101.2024.03.02.07.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 07:24:29 -0800 (PST)
Message-ID: <6011ca63-187c-42dd-a5fd-7dd733d6257c@gmail.com>
Date: Sat, 2 Mar 2024 16:24:28 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 Lee Jones <lee@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] Input: leds: Change config symbol dependency for audio mute
 trigger
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In a follow-up patch implementation of the LED audio trigger will be
moved to sound/core/snd_ctl_led, including removal of config symbol
LEDS_AUDIO_TRIGGER. Also as of today the audio mute LED trigger
is effectively a no-op w/o config symbol SND_CTL_LED being defined.
Therefore switch the dependency to this config symbol.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/input/input-leds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
index b16fc8194..6bbf3806e 100644
--- a/drivers/input/input-leds.c
+++ b/drivers/input/input-leds.c
@@ -18,7 +18,7 @@
 #define VT_TRIGGER(_name)	.trigger = NULL
 #endif
 
-#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
+#if IS_ENABLED(CONFIG_SND_CTL_LED)
 #define AUDIO_TRIGGER(_name)	.trigger = _name
 #else
 #define AUDIO_TRIGGER(_name)	.trigger = NULL
-- 
2.44.0

