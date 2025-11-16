Return-Path: <linux-input+bounces-16135-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA300C6172F
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 16:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 489303B8623
	for <lists+linux-input@lfdr.de>; Sun, 16 Nov 2025 15:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E283B226CFD;
	Sun, 16 Nov 2025 15:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oc6KKPtq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230EB21B91D
	for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763305748; cv=none; b=fD+4ZZbO8oYwwfkTrrxGJZW6r64uVPcu0qrKxysx7xk9TQk5MYAaq/HrNassv5HsmnYsfy5ojHJVZFv0gecyGZKJYVnQArAykHabb+AXOhNJJNzoM8yFhEI0lyCssUJQ4lbEg5cgG/dXtIk6nN0ALPXI+VcARvRTAXuFJD6lHcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763305748; c=relaxed/simple;
	bh=xq8xTEaVyip20qvmaObDd4dfH1b/XchZRVgFrwvraHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKP0e8D8+aj3KXi1ZDLXX9mEnrn3MJw+oSM+o+h5XQd3GPo/eILIqtc15hpEgMagq4GHK0+EdUilvyoqiH3NvfP0ZWlI2eF7m52xxlXGT8DKZkfk3GDR+TlrxzsMMaZqiRkaaO75DrJFvebLqvkEZFUef5uzTDlA6uKltVjG5Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oc6KKPtq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a1c28778so3014285e9.3
        for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 07:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763305745; x=1763910545; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EvODb/e7qLsRFrmDWJkGdxSLjYJZj6/4elRLF1YEXuE=;
        b=Oc6KKPtqtYazDKDP0bX02uTJWmEUPOW6uAMkZTKj7Vpbs4AU7lWm09tFd9fgIPys9G
         itXJh6/j4rVJvnFALAQ2u3TuPdKSaolZeNtkjSwYj5H2xpQKMmjOnfeYC156eyxqRFJi
         OObe9pXTH1FMSBxhKhK0qZ+DSE+rAo6hlcDPVSBAWJlEvsJI7KkkXpBCM5xSBwR6l/9s
         MmlxI2DXX9kw0ToFDc1GEksUJDJ8pDOIl+WpaWm5vwyKMeBAqbnw2k8nRF/LuyvKmYR+
         pRhSCtin20ITF03WWZaQuPJpWXQBTvWKp4igxWfrT3yC9RCzcRnNcp3xzqoEHxojkU6/
         WGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763305745; x=1763910545;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvODb/e7qLsRFrmDWJkGdxSLjYJZj6/4elRLF1YEXuE=;
        b=biDTTjLLKFiD60hwS5XTPXMR2HqMzL3g8hTq4GwXc5jqQvjEpNqbWzuVinTjx5syBK
         NKuHx5GF+r+MUYE2zw3NGU9CugklTsipS5WIm39vB3uONkW6nClOKbUx173+0hRHB30v
         ilyQ4MP6CYgChff/b8viMyAZRIJCv71J07ZslZdUOTFe7CKi1OqPria96EKMEf17rvcG
         pEGysAY4oKIg8syScG8cP0w4G2DIFDzgjdSfgjTcO0QD04SViAxr7JclQReaqj+69Zfh
         TEXqQecXQkFYMT0iq7bHJeWaHHLaTaBR4z8s+UJDJXstN3J5a23sarHfeqmJJG0y2ymG
         CWAg==
X-Gm-Message-State: AOJu0YydIe2Gwz8KgbxA8J8ikAEkmHnYLJpEJ7i9YnLDg4pzBMnaw3ZZ
	LQkVc2u0yut2mFXgY5PTd3zoifJsLtkXXfjFWGRp6UAlQJ3hJy0iHhQd
X-Gm-Gg: ASbGncshz0U0TMRtbRn0iBhsLidM8mP5+sSYHSIs8QeqVzGkM4PacNwghNBmzXxS/jI
	vZpEhm5xUPwqYfUDN6QBQan7WSJzORDOS/+QaOh5HXZimGD82cKWxmzZR+OlgXgUDzID9ji1S/R
	ac9qzMy3rwyLW9ISqf3OyUqhQzLyEk4M2NXM13zhYh90snD/1mHrcMWym59I0NfT0P2PPAwQccF
	FkPIsd/ghZowtIIYGn0EoN5+MMR1RVd8ZRpUrYUKPkv98VBsbQCVkp0jzVq4NPTI+RfR/x2hxvP
	eFXhWDyuLM+wFGh8tNk5Ag0FZyyQmywUWIFIs5GTaP8Pxph0dQAYVjsXvMuOww/E69XBMP5Kn0a
	0S1jumoKr38Wm/iwRcPNWaeqwqUTmIuBgR23OL7/Hh1SYp37kTvGYAb7UqG+KsF1geb9+W3H8B5
	Z8fdeDAjKxFnNmMsWfT258
X-Google-Smtp-Source: AGHT+IGMp5GTuzD+R9g6gkfd5sPc9gSs2a2eVt8uvtcAe/vzEoodhAs9XilhHcDZOUcO+nPtbyO15Q==
X-Received: by 2002:a05:600c:1d20:b0:477:7a1a:4b79 with SMTP id 5b1f17b1804b1-4778feaaeb3mr87055775e9.37.1763305745160;
        Sun, 16 Nov 2025 07:09:05 -0800 (PST)
Received: from [192.168.1.12] ([197.46.78.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779973ddcfsm83154645e9.15.2025.11.16.07.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 07:09:04 -0800 (PST)
Message-ID: <a3d10075-3ff3-419e-8231-0a1558195d0f@gmail.com>
Date: Sun, 16 Nov 2025 17:09:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: memory leak in dualshock4_get_calibration_data
To: Max Staudt <max@enpas.org>, roderick.colenbrander@sony.com,
 jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
References: <20251116022723.29857-1-eslam.medhat1993@gmail.com>
 <ddb16ea8-7588-4c0a-9e34-6bd8babd598f@enpas.org>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <ddb16ea8-7588-4c0a-9e34-6bd8babd598f@enpas.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/16/25 06:34, Max Staudt wrote:
> On 11/16/25 11:27 AM, Eslam Khafagy wrote:
>> function dualshock4_get_calibration_data allocates memory to pointer
>> buf. however the function may exit prematurely due to transfer_failure
>> in this case it does not handle freeing memory.
>>
>> this patch handles memory deallocation at exit.
>
> Reviewed-by: Max Staudt <max@enpas.org>
>
>
> One minor thing that I forgot: I see that the commit message is all 
> lower case. Proper capitalisation helps readability and matches the 
> kernel style. No need to resend this time, but in case you're sending 
> a v3 for any other reason, it'd be great if you picked this up as well :)
>
Oh, ok. but, no plans for v3 for now.
> Thanks for your patch!
>
welcome
> Max
>

