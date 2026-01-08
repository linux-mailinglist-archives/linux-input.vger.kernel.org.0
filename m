Return-Path: <linux-input+bounces-16878-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6EAD04639
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 17:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FA24317ECF0
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 15:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E9238B7A5;
	Thu,  8 Jan 2026 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dETA1Yp2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E481F09AD
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879399; cv=none; b=oHD/hWfBmDfvNP5DvGJFIDoKba9ADP8FOLyCzTafhY+oS+RuFdp+LNouGjsm5Prv6wYpWpjdmhoaf4OY8cIH3CwNnMviAFLN0tc1+0vKjLjDz59/wrBPatn4fkvo7gcoVcxec31CyYSmHegGVaUuyUmYHXUxXTutn801Phny4kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879399; c=relaxed/simple;
	bh=hYZzk/qulSxWaTC/5mYyqc84xO+e/vN/svymz2EFLgk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qmktVYEN9lAsTmWfSmSmRAmfuVI0qXpHMToq4gFzkict6P1t+2HiYpcvlqjCdU1e7jnFLUh1UcpD/VFDs4Ekj0Zey9HMGjkm0hp4tx6o+lyffR2nKy4DZpCEWcX5C8Ltfd4vxnzFOnow95VYKtzo/pC41om/ic0/6Eca7Ab40pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dETA1Yp2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so19227505e9.1
        for <linux-input@vger.kernel.org>; Thu, 08 Jan 2026 05:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767879396; x=1768484196; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYZzk/qulSxWaTC/5mYyqc84xO+e/vN/svymz2EFLgk=;
        b=dETA1Yp24tO7FZ+tQZBsTLTtlWn3aQhQyeEJXWv3yhgOYiuW7EuoWizZKB0337Feqh
         GvMih9FsqLhapq5ER+tqri/lmBmwGwsohkuoQZSqdCfz55elp5syHn7iuVvpgN+F6qhn
         PcdpWFG4S/MdjIIGaGgtJwb6lPHuImHV3QerrWixlksBUpjjghPlLSdrARELPrDgVBo6
         D7R3wFi56AAv+COeGGkPfu5gtm39BLCCsvbhT4/0UT2y3d3PJ+/PmZ7SpCUaab7/EoSF
         Ht9JaEP8Me6Zld16GdxzPN8EjTVj9ZeIsUlrl7FBvNa+jYW2bmCg+RAq8S62/Cc0aq8m
         aZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879396; x=1768484196;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hYZzk/qulSxWaTC/5mYyqc84xO+e/vN/svymz2EFLgk=;
        b=OjCStruQ3fkmVEZ3/QJlPgKRacz62hF+29o/L3hij54IAHj4cdC0jskgmHkQMRDzrz
         74YeOADTrbKJVF4FoZFAj4hfEhSnlanGwN7dhd2+Ow8wua4MgytQa2N7EE4JWEHsNR79
         tmZftqV4BPQUJt+dIiOnsi4ZR1Dsdw1oflOxZuOuyAiW+FglDBDh95si/Xn5us2hXbN4
         Z9EAYf8FhkxDF6n3YYjrmSHK2vxMVvxhU8pnXKVUWHOyZyF5Ngu/5BH2xQQi1ggmmwpH
         yl0DTEmmdXbHGg+0CopilEgO7C0AnjuyL10RC2em5Kqu/ePP1a16hcRwPSD1RmI5zN89
         XnOA==
X-Forwarded-Encrypted: i=1; AJvYcCWu1rNFGReovjqaIixK/Ud6HFI9oiiW9vLp2rTLIwOPsW6HkPbllYoFfl7z7LJb6imqbygT6FYypELNHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd1Lulff05V/opu3393+lbL5Q6vGGpjcb2PI5ftxgFfXpzeM0H
	Ar7rrWF/pBluo0ZjDe2qbqP1roa0N1gGno3VqDCjqXsLEMzWrdGaOAOP0jBx6w==
X-Gm-Gg: AY/fxX7Lq5iQfm9qXgtUKxC/MAk+BGID/6x/u4yasAk3QxM0+PnIzd92hQKDKj2lamu
	mlUtdl4R4D+nLBOd/pklIzlPYzqSXIYCCwxF7zA29WjjjdlW0uRfRhpGcFrkgSHI/yWMGy+dMsy
	w+h6ZUyLYHR55lBj8mWDhXLdwPYn1EBvA+vy3cNlekumVtJays1sSaU8bsh81zN5K7ZAGMEyQ3D
	tlNbrhBKqdpqQyR6yd/6eJrcPVTHZ7JDGzM4yRVEcLZp5o+8RO23DKjkCnKCCl2j9hlhWj9/WKp
	9xPyi+/BigHOKhBxy7dLf6jVEtcvenW+aLdIBt/oifeeU6UpcknESP+EXbIGPmDRk4A0Ph4DFqP
	sJTep13nZMPxq0sY2pO4RzT9Zwre7r84RMuQOVOwbi7lGlz3VEVhlCiBlOViMpd+KaG9v4EZd43
	GtXiTNgVvo9980ag8amGi7p9c=
X-Google-Smtp-Source: AGHT+IFWeaxPAh92AZovsHbT7JsUtzZUFDtHgT/y7wVHzwcDS3qRKtyeBQwoY59pYZMTc3gCAicTOw==
X-Received: by 2002:a05:600c:8b6d:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-47d84b4a7b4mr75576915e9.35.1767879396259;
        Thu, 08 Jan 2026 05:36:36 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d870c73c0sm39516805e9.3.2026.01.08.05.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:36:35 -0800 (PST)
Message-ID: <3e36262d-8eed-443c-afdd-beef2f8be5e9@gmail.com>
Date: Thu, 8 Jan 2026 14:36:35 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it-IT, en-US-large
To: LKML <linux-kernel@vger.kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, rust-for-linux@vger.kernel.org
From: Denis Benato <benato.denis96@gmail.com>
Subject: hid-asus: integration of some rust code
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

These past months I have been considering moving some userspace code to the kernel.

The userspace code is past of asusd and manages a feature of ASUS laptop called anime matrix:
a series of leds forming a display on the back.

The code in question was written by the previous maintainer of that application when
the kernel was not accepting any rust code, and now that it does I think it's about time
to port this well-tested feature where it belongs since it's talking directly to the hardware.


For context hid-asus must remain loaded and attached to the device as this new code
needs to manage just a subset of what is supported by the device, using the same hid_device*.

My (main) questions are the following:
- is this something that is acceptable?
- is this possible, and if yes what is the best way?
- is a mixed C/rust driver something that is accepted or does it break some rule?
- technically is this something that today the kernel has infrastructure for?

Specifically to Jiri: since you are the maintainer of hid-asus do you have any
objections in doing this?

Thanks to everyone who will respond and help me out.

Please feel free to add more considerations and answers questions I haven't
made since I'm sure there will be more anyway once I start working to this.

Best regards,
Denis B.


