Return-Path: <linux-input+bounces-10713-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4844A5CD39
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 19:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82133189CE68
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 18:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8D8262D12;
	Tue, 11 Mar 2025 18:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ZVS8cKzE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD827262D21;
	Tue, 11 Mar 2025 18:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716435; cv=none; b=WZGOU0PY+hP8/eWIwEzO3xGn9T9Xqh3UoR3zQbMQRZIm6mlyv4S/l9lHFs1mcket0xiAvcCHuqF6M4uE+eRyi4EHAv+bC1GIlV36zGK5rEzEuzeBYdEj8QCkoXaI4jZRajSIGMW8298ChlCxUd23ySgEx6yVpYJKst5xl3HoQJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716435; c=relaxed/simple;
	bh=m/lRig3w+g70JqbXPDLefDtmuRMiLADNZMsuvhaR6l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8IA6EKfSB+ykTgIwyJeOVMFcAIfke56No8QWDynign9V29Kfv6dsp3sG3NNXYMF6Ovr5d76Y/vYLjQtr+KwlQfZcUwezylb4nr+Qi0OvpYc+1dSmVXc5LwrSRJPh8mWQqQGJveUvwsgeu1Aw1fZtF/fPgEFOVALFUn6y0+UkLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ZVS8cKzE; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id EA0532FC0187;
	Tue, 11 Mar 2025 19:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741716431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRuQGf1Og/A/ngCjmN5P3iJBCiHsYweTSw2TtPKcbyc=;
	b=ZVS8cKzE5atFrXaAJpuhq3ScvWNBd+Ou6xJNOdRLSJIls3wWS+8lh5XTNJtttIbWIm8s5Q
	vqGiju1J1KlYNDZAsO7OoA9Zi/6n1RPowqAI4A5DQQS8jtfoUOJYEqv+C6ZtnhnxVSkmOl
	WNyQ0602Vnuo/rwpyggauKK1R4FYmos=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <c2be887d-3dc2-44dc-b1c4-af74ce77adea@tuxedocomputers.com>
Date: Tue, 11 Mar 2025 19:07:10 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Input: atkbd - Map FN-key for TongFang barebones
To: hdegoede@redhat.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250311180643.1107430-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 11.03.25 um 19:06 schrieb Werner Sembach:
> TongFangs firmware sends scancode 0xe0 0x78 upon pressing the FN key.
>
> This patch maps this scancode to avoid a dmesg warning printed every FN-keypress
> and to enable userspace to use they key in other shortcuts than the firmware
> builtin ones.
v2: fixed typo
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/input/keyboard/atkbd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index adf0f311996c9..3598a21d9d014 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -98,7 +98,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>   	173,114,  0,113,  0,  0,  0,126,128,  0,  0,140,  0,  0,  0,127,
>   	159,  0,115,  0,164,  0,  0,116,158,  0,172,166,  0,  0,  0,142,
>   	157,  0,  0,  0,  0,  0,  0,  0,155,  0, 98,  0,  0,163,  0,  0,
> -	226,  0,  0,  0,  0,  0,  0,  0,  0,255, 96,  0,  0,  0,143,  0,
> +	226,  0,  0,464,  0,  0,  0,  0,  0,255, 96,  0,  0,  0,143,  0,
>   	  0,  0,  0,  0,  0,  0,  0,  0,  0,107,  0,105,102,  0,  0,112,
>   	110,111,108,112,106,103,  0,119,  0,118,109,  0, 99,104,119,  0,
>   

