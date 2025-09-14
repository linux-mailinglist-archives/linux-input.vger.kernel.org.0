Return-Path: <linux-input+bounces-14702-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF1AB569D7
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 16:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D1621899B39
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 14:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAC62522B5;
	Sun, 14 Sep 2025 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dh7Vtmgp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E12F2494F8
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 14:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757861598; cv=none; b=OCu/fgX+GRmmJQ+71Ef6fg9/M+gb5DLHkmdFS4f1cx9+1vu46Qvx1zJhh150Gb3DEWhS80hOj9yahlMxha+dcMpsQHN8PwGOPxNqM5s+4hZIH5Y5GE7/z+Ox6JWnnN4/net3YYtxu/5NIWfY/8jlzUy6f+3Ystkmu82U8mdHgsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757861598; c=relaxed/simple;
	bh=tL6wlBCFB4vOJw5IWTJwcLT6dkp65j1Nm3PGC1bWiPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDtS7d+48Dx2ZsSrymSeMqXOTvEOzxJfCppWZYrYKSyySXkn6YnD2RDERHOj6LTJRe8/VDUPqA9bVlQvUrXOvVvtqn+yi2jdz4aS1VpK/Jzf33vO/s9ht/JRKGj2HrBGGYni5xf8+8WKcXaPHCfltEF9eRkgYaw8cCKF99+zYuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dh7Vtmgp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso20557325e9.3
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757861595; x=1758466395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tL6wlBCFB4vOJw5IWTJwcLT6dkp65j1Nm3PGC1bWiPI=;
        b=dh7Vtmgp+nK4i/tMWmjBis28r4+GBo2spOyzcwtoKwcGthF+Dzix6hBNf1dUrjxopn
         daM9b+0ElFf68roOn9qQOSjMvpQXWS3s4n1p7FUSdPFglgZky9XHPhbeZexaNf8NWIi1
         z3aPGS2Fu8o9WEgHjAsOaawP7glfwVzG1NBlcLt77RQ7InmkWaI+jeeZg4TL5Wc3fEER
         Z20f7+iKJBKWCFxBvcz8zQg+7qTItXU4/qHodU7sgcexnNlcDnvBsjY4+xKy7VBC+Mzd
         jw8HcpX43Cb2gYJ8Xglyi6Ojw9g2D6R3FYIkHX63/N4EswKwcwFbqF9kkCqPrz1pT1hI
         jnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757861595; x=1758466395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tL6wlBCFB4vOJw5IWTJwcLT6dkp65j1Nm3PGC1bWiPI=;
        b=rUpqPY6XNTmbpwY+SGCPq3i/DWYCuL7408QbKlhJXq2JSn8h3JIZqiD00jZzchUE6y
         SjEKBdz8w4+LXIQo/6ve8J0WwmpCi3yo6lUXGXI7ifTr7YcfaxuCBPNsMuR7VKGZaeqP
         f2RfJlKMvqloDWPiKviGDZzTRnmgYd12yFzdWiB7rwr+a09azJz/cNXCxPJrcfsvlk7r
         Qgck1AODc3CP97EDLkoxQU/mF1y1YyhsGb692BmmCsLNuHXaS9KfGR4QmCAbnxKR3eIh
         k8dGMAuzJYrLTzBnd3A7+nIowF/VCpWeMgmaoPg+lRuZjd4AJDUrtbGW/2c8i1dIVNFf
         62hw==
X-Gm-Message-State: AOJu0YwEowA0J3Chkv+gmPnGk7XFZkiicXylreqRXeOcYFx/TqEQNoCd
	4dVrrDDQJvtHBUcCfSNnddfEbok17M+4bF+pDIaTPnc0IXdbCFYKW6wk
X-Gm-Gg: ASbGnct7ewtiaQSAS4gQ3xavQkzg7+aguUq2Tw18KuFp6rvHV0iQhN/hkzRzMjh1fGI
	0Md2HPPIeokqy3XzCfAGYkiNc1tOMcnyQEWvFmRBkOP/c+S5gxcCJiWJMfguTCYi1Y59qG9DnKO
	uyeDRPTVjS/ZtxvOy4mJBYlQeUFjCrUVdADyNvkOvSKqw03nTvXhGrH5ibCblS4Ile3Z6jrIyK9
	iwhzDA3tZq2cDmHnd9Ru5GZMYUYi9wTXuV3W5eYT8HQ9lRfSznmV/H4LUr5mUAy6qsb6nZ+GnsJ
	Os5Vr1OXipdTLNqfGddWJolIWfEE34hxM74EBhC6mc08OXiSRZ++ZjDfuIm5iDBoFgJKb2ZSNh+
	iUmpd9NKOPq31U2c/NK27o9F9Jp7y5QEMEr2JXsAuxRRRNMUQsFx5hYJVpS114CXDFJIuf9ulbl
	MSlnaLfUaovbo=
X-Google-Smtp-Source: AGHT+IHu+SHSikTbZPFSm6HoLGcMUpOh+jIhu5e1VvPHaiwyPzzxrrYzsmlOktlqxwgi0m1GZNbZug==
X-Received: by 2002:a05:600c:a45:b0:45b:47e1:ef72 with SMTP id 5b1f17b1804b1-45f21221d5bmr84887375e9.37.1757861595203;
        Sun, 14 Sep 2025 07:53:15 -0700 (PDT)
Received: from [192.168.1.103] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e03719235sm137436685e9.1.2025.09.14.07.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 07:53:14 -0700 (PDT)
Message-ID: <a7d4d219-9f10-4c46-bf89-f0105fcb4bcf@gmail.com>
Date: Sun, 14 Sep 2025 17:53:13 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Input: add fts2ba61y touchscreen driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Henrik Rydberg <rydberg@bitmath.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250911211910.45903-1-ghatto404@gmail.com>
 <a700b0c4-cfaa-42a5-ac87-c2bec8d9bf2a@kernel.org>
Content-Language: en-US
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <a700b0c4-cfaa-42a5-ac87-c2bec8d9bf2a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/14/25 17:47, Krzysztof Kozlowski wrote:
> On 11/09/2025 23:19, Eric Gonçalves wrote:
>> This patchset adds support for the ST-Microelectronics FTS2BA61Y,
>> a capacitive multi-touch touchscreen controller. this touchscreen
>> is used in many mobile devices, like ones from the Galaxy S22 series
>> and the Z Fold 5. Ivaylo Ivanov wrote the driver originally,
>> and I'm upstreaming it on his behalf.
>>
> RFC means patchset is not ready, so please always mention why it is not
> ready or what you expect here.

I'm not sure if naming the compatible as it is currently is correct.
The specific thing about this IC seems to be that it's flashed with
samsung-made firmware, so I need to confirm that:
- we don't want to match compatible with the IC name (the same IC may
be shipped with different fw on other devices)
- maintainers wouldn't want us to merge it with some other driver

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof


