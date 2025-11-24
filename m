Return-Path: <linux-input+bounces-16306-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E12CC80E87
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 15:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8FEAB343553
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 14:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C0130C61D;
	Mon, 24 Nov 2025 14:06:52 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (lighthouse.enpas.org [46.38.232.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2D41A9F8C;
	Mon, 24 Nov 2025 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.232.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763993212; cv=none; b=Ftz00KxEczAajG032l2mKex5auqNsZKk3HwLItAMhA+HLt45D38IK3ROcivhyw19XB2WeJM9Oi25UMIot1pFTSh8k3Fyv2nKyc+XyMt/yBRq6bQFxzY6XBYPs4Du0MhLhvdCfIGTSevKkhlG2f3lFOmDac+AwRHDwuAZ0hpwgF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763993212; c=relaxed/simple;
	bh=asYYgSgDrLSW6a3py31OtB8R0yZkQcsuQGr3kWlmtdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dxn29xPfLUlToYoDd6xKN0HtsKiMEBvR0CL9IZHeWzf+6an+SQe3IXGQuYnKWR06PoCr4jmDazMlxqFoL+88f2YSumhXEnRTBWPP/B2LeN/dj7uLqcgtblsQ3k9TiheNvazKdQHNA+CSJuJBgFwZEaIP6LMWQlpiauTp0BZAPY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.232.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id DBBC410403A;
	Mon, 24 Nov 2025 14:06:37 +0000 (UTC)
Message-ID: <44eb6401-e021-4c69-96af-0554f4f31e57@enpas.org>
Date: Mon, 24 Nov 2025 23:06:33 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: memory leak in dualshock4_get_calibration_data
To: Jiri Slaby <jirislaby@kernel.org>,
 Eslam Khafagy <eslam.medhat1993@gmail.com>, roderick.colenbrander@sony.com,
 jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20251122173712.76397-1-eslam.medhat1993@gmail.com>
 <6251f6df-d4ac-4681-8e8b-6df2514e655b@kernel.org>
Content-Language: en-US
From: Max Staudt <max@enpas.org>
Autocrypt: addr=max@enpas.org; keydata=
 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
 1Nk4wgjdif6n69chAwuDQyOfWdz/dQ==
In-Reply-To: <6251f6df-d4ac-4681-8e8b-6df2514e655b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/25 3:32 PM, Jiri Slaby wrote:
> Isn't this fixed already by:
> commit 8513c154f8ad7097653dd9bf43d6155e5aad4ab3
> Author: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> Date:   Mon Nov 10 22:45:50 2025 +0530
> 
>      HID: playstation: Fix memory leak in dualshock4_get_calibration_data()
> ?

As far as I can see, that patch does indeed fix the same issue, and it 
is already upstream.

Thanks for the hint - Abdun's patch has been upstreamed quite recently, 
hence I guess Eslam missed it by accident. But maybe I'm wrong and Eslam 
can chime in himself?


> Anyway, this is a typical use-case for __free(). Why not to use that?

Wow, there's been a lot of interesting stuff happening around cleanup.h. 
I've been out of the kernel for too long, this looks like fun. Thanks 
for pointing it out :)


Max


