Return-Path: <linux-input+bounces-16064-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49BC552DB
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 02:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EAC4434FEC9
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 00:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429131E3DED;
	Thu, 13 Nov 2025 00:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPBaYa46"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802541E1E1E
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 00:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762994762; cv=none; b=gSr+DC0PIUnOhgt5+K7YiDL0y5TUDamYhtuTlBN0V2xAmPWYnMN0lKXiQ2BaV467eIV8qeC/PQ9iIjsybkYx1UPym4Ko6uqPu0OCdc6JnnnFxzBHYiR73juonotWK6ZOanoyHaVh448Zl6tjLHd1lUgubfDiAWr4OGl9ggZVEBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762994762; c=relaxed/simple;
	bh=L6MdIryciHIIdyMFc25M+QNex8Bs9rTNozsEgXpbrcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5dyzGS64iXQw4FVvP3XtPtXqbN8SCa52y40uKuUQf1UkBRV85vgv2ekBRe/pTN84wQAboIKo7u/CHw5MUVDkO8xatYg6iroswYhqbcQBWZM0u2613+TXIPFZsbhUObpGE3b2pcaZWMweqjzQf2W6QC2yPnG3VOxjc7O1nggHvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPBaYa46; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477632cc932so990775e9.3
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 16:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762994759; x=1763599559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L6MdIryciHIIdyMFc25M+QNex8Bs9rTNozsEgXpbrcE=;
        b=kPBaYa46DcTCyF8+det4oWE7acR45Xwt4J4zRE/LTBLziV0r+frd1+Tlv0q//U2OqQ
         5E+wwDQjSFo8RR+4Llruw8bZkX+p/6cWNfNx2YxXV8X+PkZYo0/KXWXtpItYT5pmV9AF
         ZAyxGYNNUQjhWIwB686Z65C5Y1mxnWQZ9lsYcg7RatNGBvN14Lc1KQQaSsep3BWiw08W
         Hx0iT50t18tLLugjYABCayOOnHRi3mOVCcVd9t4k1V6oXFHdp5DMbjW7bc67AUS48RDy
         8CKbq8Oz9fG9Y7v06I+pttZYn2vCyaTAZJz1X6t740Mztuz0uKlPl6mJuDJrs5oYaWku
         1B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762994759; x=1763599559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6MdIryciHIIdyMFc25M+QNex8Bs9rTNozsEgXpbrcE=;
        b=W7AkiIDY/1Y5dLgFzOuP1bAOQIM0+LXzXOBivLBOv9yw8+63ccJHlZQ4ajgZ1nb4Yv
         KeCA/r2VPfd9RE+Q3+5xfrFdIpaQ9HeuTd5h2zBatV7RmdqIqGX3lqqGiPMMAssk93Sn
         xYuWqwfCRwXiVEKZhOUz32UOloDwCvEerDFxpcQE5N2g4b0Eo1u9S8AgIXgNWUT5zjkR
         TETrb7dsDWNOC+/ipYW6qi/DAU4L9uERdFD07xGkwcl77qY1dNkrmlFIK9QsZFUGxHGr
         Y8xFaj8mdVxdSuLE1/6HBjoDRj/KiKRSTTDRF8STU2lSWCg2MRfE1+llVKdvJzroS6zH
         SXZg==
X-Forwarded-Encrypted: i=1; AJvYcCUpKA2sWaEtB4Tbvaybz9zbQ4ibULeUib0j3m8h8il4stL4N2E6Kyu1q6bEIgM9gz71rsW4vbrAMbHmeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5kQGMW74IVaaEiKuqh3ZK3NBtn1GaTOZH6NMeZRtBVRsvwK0o
	fHuAViktvQ/9kuQa8IDB3jWwDnWQaM76zpfa9cVUxj3kZs+Ztld7ZGRu
X-Gm-Gg: ASbGncuY82J+zls4U7/B1tXCSiP1YJ6dLHh+qtHh/PmqbF+7C6+eotuuIuj7SS5jHrW
	5XLTrXmHRxer/3rgDlorkFOs0WUmgEGGvGzjOuxYA0uAYx6UTNvyVjZewZU8dB8OTrx0ZZQJ6Be
	KuFA/RW6KmJc6c+bWdMhwuWYY9G9VFx5oJ974voGed8mtQ6kXriRSWnwqWk76LVotP15m/FwuoI
	MWrncBpR6cYiCqvFhXuzSkA3C/+JhbSYfkLrLLV5Zvtnl8RaDp2wLnu0l9r7EsMnPJ60gnCH8dS
	5Y8TFoMCtcZGTxy/070/R+lWfXKKi1z133RvqWRcRpjv1B7mohcQEozr/gRttTU4uAdVrMVlpp7
	wxJm/02P3HI3JN9Z4hVe3oOrr4sND5OVvuHM1p8YwJY3oSf5B32q479e3Qq9k7/+rf0R4zBFkWW
	qQ+qxq+RB18M35
X-Google-Smtp-Source: AGHT+IG8UNRUrUrgXbekaKPn2Po1l5mxi8W3YJa544txuMvsGRwAmb+3uXskvL2GPN1MJkZnmeqFMg==
X-Received: by 2002:a05:600c:3550:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-477871c4762mr52607495e9.28.1762994758707;
        Wed, 12 Nov 2025 16:45:58 -0800 (PST)
Received: from [192.168.1.121] ([176.206.83.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85cc0sm625869f8f.17.2025.11.12.16.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 16:45:58 -0800 (PST)
Message-ID: <7566a1df-35d8-4c47-adeb-4f1087a7ce0b@gmail.com>
Date: Thu, 13 Nov 2025 01:45:57 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
 <27a74ecc-bff7-f3ae-b23e-a8362ac3a6b3@linux.intel.com>
 <CAGwozwGpacR=wYXpf3vOiwWNxaV6pJ6CdE-E-G1gRRpO4VHVMg@mail.gmail.com>
 <74f91d3c-6494-4754-a10f-4d8c1d45f7ff@gmail.com>
 <CAGwozwEKqqJxxmtjJhy2MzNVhmBTMmy8xG5TZGkKJqJCgK=X5w@mail.gmail.com>
 <CAGwozwH4_5LnJ4kt-sbdwzL5Ezt74ddPOpGqvTvKiiVzkorSMQ@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwH4_5LnJ4kt-sbdwzL5Ezt74ddPOpGqvTvKiiVzkorSMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/13/25 00:22, Antheas Kapenekakis wrote:
> On Wed, 12 Nov 2025 at 23:08, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>> snip
>>>> Sure, sorry if it came out this way. Dennis had two comments on the V7
>>>> version of the series.
>>>>
>>>> The first one was that asusctl has a hang bug, which he hasn't had
>>>> time to look into yet. This should have been fixed by dropping the
>>>> HID_QUIRK_INPUT_PER_APP. I retested the series and that QUIRK was a
>>>> bit of a NOOP that does not need to be added in the future.
>>> So it is supposed to not regress it now, correct?
> I missed this. Spaces. Yes, quirk input per app created around 3 more
> input devices per USB device, plus the dynamic lighting one, so you
> went from 2 to 6, and there seems to be an issue with asusctl and a
> large number of event devices, that caused some intermittent freezing
> when the user typed on certain keyboards. I removed it. Although, not
> a problem with the kernel itself, per say.
Okay, I will ask asus-linux kernel man to load this patchset then.
> Antheas
>
>>>> The second is he is concerned with dropping the 0x5d/0x5e inits. Luke
>>>> said (back in March) that it is fine to drop 0x5e because it is only
>>>>> snip

