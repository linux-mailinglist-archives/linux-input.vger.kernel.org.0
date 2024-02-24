Return-Path: <linux-input+bounces-2082-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 195028625F9
	for <lists+linux-input@lfdr.de>; Sat, 24 Feb 2024 17:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D2E21C20C4E
	for <lists+linux-input@lfdr.de>; Sat, 24 Feb 2024 16:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81933250EA;
	Sat, 24 Feb 2024 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsPGnFNI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98F047A6C;
	Sat, 24 Feb 2024 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708791321; cv=none; b=FhUhoTCf4F0lRwUltBVGRDG1eJ0aUOOCs6FvhGm6XDloRVbRVtDuATRk3xHLJ0Oa+TJ4V7Z2QOw3NyccC04wOhpFToCU+HdgLiLFjkRBmlUQ5FPp1ZPke43NbTB6YhCayN/h1ZwoPE90JbUzI3EHdXXy55WanmL33FqWi6dtF3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708791321; c=relaxed/simple;
	bh=g+DTbQCprT09ui/iajZuZwaiHYmxNTwsRxuBYrt6p28=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TC8t89PkGeYL5DGl+0g+6De0YYOBcSRWkHoFpR44DnBEZhkLAepGbVuiFulAYn9uOzv9tU6nllK1JkghiydaZkXUc1JbH6DFq5DisCt6T8Le4YzkEeqU8fQlZoSPGwM4ati7FQKqBHfJJEArI4yYBgMM8lM0KBTE2aMLIEwV1Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsPGnFNI; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so30104901fa.0;
        Sat, 24 Feb 2024 08:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708791318; x=1709396118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JyhmGWcuUbEjVhEB7bKU+F0sM3z5qyWYqCSve3HLVM4=;
        b=RsPGnFNIascB+EAbAkO3S5N/zr78xH82b84zYCf9N1i+RCCTzQeVyJQKv0JVsdvPmN
         Lq0RUDGL2S8HOUK/BNiALbUBneX5HFIQTSYhCIR7WtiKK4tXucIgLiDHYQql9freKppJ
         z8iaynvOkTcc44wVxlM68sIqBB1WGMVQ70EEJGPrKizrzmvpSg5EmYKFbkcYCvoMQvxP
         Slyu9CrXfOMwaeelHyPqzjhfi6iObkcfbRAfLq6TBOQEn3ddkrTOfKmllJsjg9FMpk0O
         33/N5MN5IXwYDbeWpuAqtBI23J1dLjLmlxDAPKH4dTyXEBI6P0c70TiRzJC2p8ea99sv
         1jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708791318; x=1709396118;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyhmGWcuUbEjVhEB7bKU+F0sM3z5qyWYqCSve3HLVM4=;
        b=RYUtpdmMZtlscp/xnUH7eqQdyZU0Ikicx2ctL0GmUSHsUtq5/gvLjMIEYP2M3Y+xXG
         D6J+iibI0Dhzi5Lz+Yj+yUSoZFXDFfNZmOymtBlhzwdZaXBBfmixKat1UyC/VZ24dZeB
         3AIaEC597rfzW7T/dXXQfepq5frTCqhFSTg9DpigjFm54bRFQCnjB7mQRBusMJ/rUOJa
         CAaoXWOH6FbFSJp3odQk0TbWSzEGy1oXSDdUKxj6Pr7h1TSePZu/DXFuIB78uDecAxdD
         i7XFODlIiIhDvsxaLKk38W7EWj/WZmZKf5EpSFiHSILOpVPH8WWK6cgsozv5DCz+6Jj3
         YSoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJykb865C+8vG2fKnHmaSIpyDDMEAEbL6e06Uk3WaCdGmQflHXiUvR8AeaPLS9hcQm+MO3jaw8eiCuu6t/Z+ukkAVy0vTa
X-Gm-Message-State: AOJu0YyQdF2dS0QPdZSqgrwgHJBakwZLS5aGySeKg2gG6ODVMDhxinf9
	rA01wlHDi+Ici7U1Bc+bOX0/ls7+tIBj0dzqTdNc4RPo8FSxGL3Z
X-Google-Smtp-Source: AGHT+IHVRMMz7iNRFF2Edvrc/ipJh31i8mijV3rF4fE6vaaPChoOH6mtiD8M8KNx/U0vIrVBdN5aiA==
X-Received: by 2002:a2e:a7d3:0:b0:2d2:777e:70f3 with SMTP id x19-20020a2ea7d3000000b002d2777e70f3mr1704709ljp.3.1708791317489;
        Sat, 24 Feb 2024 08:15:17 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec5f:c111:ab46:ec03:bf48:53f1? ([2a01:e34:ec5f:c111:ab46:ec03:bf48:53f1])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c211000b004126732390asm6406182wml.37.2024.02.24.08.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Feb 2024 08:15:16 -0800 (PST)
Message-ID: <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
Date: Sat, 24 Feb 2024 17:15:16 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Mikhail Khvainitski <me@khvoinitsky.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 Linux Stable Mailing List <stable@vger.kernel.org>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
 <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com>
 <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
 <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com>
Content-Language: fr-FR, en-US
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
In-Reply-To: <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/02/2024 à 14:51, Raphaël Halimi a écrit :
> It can't be the third one (43527a0) since I clearly remember that I 
> experienced the regression before it was applied to the Debian kernel.
> 
> So I'll try applying only the first one (46a0a2c), and report.

I can confirm that the module compiled with 46a0a2c alone does produces 
spurious middle-clicks.

Maybe "ThinkPad Compact Keyboard with TrackPoint" should also be 
excluded, like "ThinkPad TrackPoint Keyboard II" was in commit 43527a0 ?

But then, would 46a0a2c still be relevant ?

Regards,

-- 
Raphaël Halimi

