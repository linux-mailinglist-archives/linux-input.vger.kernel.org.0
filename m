Return-Path: <linux-input+bounces-2358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2B879369
	for <lists+linux-input@lfdr.de>; Tue, 12 Mar 2024 12:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FDB41F22563
	for <lists+linux-input@lfdr.de>; Tue, 12 Mar 2024 11:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654AD79DB7;
	Tue, 12 Mar 2024 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRKCQ0PS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D566979B98;
	Tue, 12 Mar 2024 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710244622; cv=none; b=Z/Nn3Cf+3YAEM9K9RSyPuGcjgRBWOXQUeTcjeMlEyLkTPXjVsPAyymgsLK4NLlBmz60/cpm9gZDWPAjFuktK3Ub/XT8YvKvkfodP2bB4DCipTPvrfsQiIDF4uzyCH87wj8vbCo3TNcmiMPH8H2BI3Fn5Flo+laa/aR7WrdkQDBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710244622; c=relaxed/simple;
	bh=wfW86cAWjuHv8tAgpmI7qyE2JitkFD6Ruc75dc3RV50=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z/1xxjJ6+lh/R9T6s8aEhndvd2PRKddqx95vSmyo8vJbYdJsgR1sc8VExqHv3vRPG5L48pCD+dphJNQiAWSxVnDfj9c+tyhhprXHhMIQ/qlrX5j6IsE0Is/O+IZkmp2EU+4jXHxuWUbZJV9ubkYfs3qUJ4TEcAnWmUHsAb+3NkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRKCQ0PS; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4affeacaff9so1099494e0c.3;
        Tue, 12 Mar 2024 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710244620; x=1710849420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn/VEXIH6lQ92zgU3vkBBRVaJjpWDSl6DhJmBBWjxpo=;
        b=nRKCQ0PSfy0s9DxaclK914pfd1xC54ju5Cr88u6VlR93z3YLc/Bp14OhQKUo5ZZuIo
         CDaQkCUVM/giCizqOSupafTb+QJmuap2Rkx8HWIywP7AhjaJCQ4FOkEi+oNOf75jWexI
         0fC6XzIJL15EaCqCwSnWNLDPvvzVijHc1rKXl7Q7VSKTV7Fy0MY5a/yubh8mgYa88yhm
         erbY0rO+TgYFSSRHSRc4x7+EwlMCvuCaZOaUY7NmhiHnkc1AOjx2zbHjNoh92f4wzjB5
         1eP3GD34X6DFMG8M+CHJydJkrhzzv8Jxqje0E31XWbXwWZ24MyR2nNhEUg2Xor/KXIFx
         zyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710244620; x=1710849420;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn/VEXIH6lQ92zgU3vkBBRVaJjpWDSl6DhJmBBWjxpo=;
        b=E8FilbTLp8uB2TdUW12fbVnLk8gerXCRJEgW//G74xPnHt/yw85y/uSyu3zM2PQqx1
         rCBEODL+8rOCA1+IU3NNCWR8ffzKRyZ74bRSLZ4hi696/dQ38IfYMgGMTZUs5zjbHj5l
         dxU34Zakg3i++yVIIRStf5ZsbL8SWFaoc21cvTOfvwFoe25NbQ1CmbQVctucU/N/PnRa
         tGc7fR0XWiSMUtVu2UVpYRLHm+KFhBMEJEDWwdaa826M6loVxfv1oWc3KtcsWZiXDeiu
         0BJN+sFr4czZf5QlwL5r7Ep0Xg71NSvAt6DsaeXL4xHQmKOAnkFMfosfhVgMZQQALqjf
         cRxw==
X-Forwarded-Encrypted: i=1; AJvYcCXFzjIReLA7aQCqklb33PG6m+sKcQ4suIfW6ji4zdlUwvnsbrH4xIhz1iZxpB9qaRudIi8wAW8Bf6/nQjJyom3QcMA9zRluf6VYrN4NrNyRFLqEPMeZSVzwtT0dPdAslM8xAs0=
X-Gm-Message-State: AOJu0YwUSL36RVpSvEXLB90hx6hm2lOUNk2jK1eMeMjcb8wNhe+E3qbe
	KDuv/kEMncava9J7KCaZssxmEalytuP3Tex3h0ME6p8ZwIDDn2kY
X-Google-Smtp-Source: AGHT+IFItdNRzQJR0nSD1zbVMjsWP4NZsO2D4yJ9dZIwUzfCUb6SFRA6bSjvBeegyLddddX5tUE0vg==
X-Received: by 2002:a05:6122:169f:b0:4d3:5eb3:f64f with SMTP id 31-20020a056122169f00b004d35eb3f64fmr6064767vkl.9.1710244619793;
        Tue, 12 Mar 2024 04:56:59 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec5f:c111:da0f:dec2:677b:7567? ([2a01:e34:ec5f:c111:da0f:dec2:677b:7567])
        by smtp.gmail.com with ESMTPSA id ef23-20020a056122481700b004c07cad31d5sm879739vkb.3.2024.03.12.04.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 04:56:59 -0700 (PDT)
Message-ID: <9a55659c-86a6-4d9a-ab4f-94fbfb72e7c4@gmail.com>
Date: Tue, 12 Mar 2024 12:56:56 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
To: Mikhail Khvoinitsky <me@khvoinitsky.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Jiri Kosina <jikos@jikos.cz>,
 Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Linux Stable Mailing List <stable@vger.kernel.org>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
 <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com>
 <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
 <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com>
 <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
 <3bb95fcd-65cf-45dd-8d81-1a41b1ae0288@leemhuis.info>
 <CAMMabwNo_yT4S3LaMV16Rmj6MiWL=TRYtB9wspfs_LWVgM=U8Q@mail.gmail.com>
 <b30dc4a1-57aa-4ff5-ae52-7a01203b8be9@gmail.com>
 <CAMMabwNVwapthrDkCLOQsWkObzvTKVzDMiod3KPVa1hoy0CzRA@mail.gmail.com>
 <0d2b0c46-4d84-4279-8964-589d77435e6a@gmail.com>
Content-Language: fr-FR, en-US
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
In-Reply-To: <0d2b0c46-4d84-4279-8964-589d77435e6a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/03/2024 à 17:09, Raphaël Halimi a écrit :
> Thanks, it's done. I'll test and report.

Nearly a week testing this patch (with kernels 6.6.15, 6.7.7 and 6.7.9, 
following Debian unstable updates) and it's working well so far.

Not a single spurious middle-click, which is not surprising since, if I 
understand correctly, this last patch just disables 46a0a2c and makes it 
optional, allowing to enable it on demand with a setting in sysfs.

And I have vertical and horizontal scrolling with the middle button 
working reliably (I'm not sure of what you mean by "hi-res scrolling", 
is it about 4K displays ?).

So as far as I'm concerned, this patch should be included ASAP in the 
next kernels releases (both latest and stable).

Regards,

-- 
Raphaël Halimi

