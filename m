Return-Path: <linux-input+bounces-12583-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F33BAC40C3
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 15:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2D573A7E47
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 13:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41C120B813;
	Mon, 26 May 2025 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RC8s3gIZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C7B1FE470;
	Mon, 26 May 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748267799; cv=none; b=CDSH/tbXDi49MU6JHvHDWt4qNRW30GAc5wNp3F6ykossaDNAAAQXCwQjvDNZnrBDpx3DtW+1FXgA4+A5WFEQOXC0SMq+IwWejv2qiSVKG+erxbQwkfenbLYeud/JPHZA3fAi+OJzt2MJF1/d0Y4wAJuhpX2foPXwdVrHGz+sbaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748267799; c=relaxed/simple;
	bh=hAq26EsJwp1YiANWFZYO6JlZ573De3v+gpFr0luZpQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tHl0WfNf+xg8efY31zdDPD89IaB91eJtOklhF/FUH7vw30HXXD7aL+vlWKXMcD3XXchgo0pl0wNPphC8xtTSHx6TSJmyAvR1HrNa++lkIvJAzsmF9eqCrEQEnZyUDMyxtLHmqwHt4/3ELR8+1WqJAKzznWg9JhZpYe4IMzHatKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RC8s3gIZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so1978801b3a.1;
        Mon, 26 May 2025 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748267797; x=1748872597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=859cJo9TYvq1IzsoVeN/+jTfHc2/ejVYnyyvhCL0W0c=;
        b=RC8s3gIZppzp4AUDr3t59F2FWOfKFWT2uulf/a1CJNVs4ruvlFhj1F9l23Wft12aIA
         0+108iFAQZMuSQ1FpRyNO0CaWxaHYBLrhPnWV5s5LR7w43Gm7bJ/bKWR3AesvqhzysCG
         urRBWRkVOSfg3085pZznfgIfM9hNaNWIsWckDHA4LP2Ifighj6Oc1yuLaGKaDLHAdCDQ
         7i9KJxRR+6YUCJikzDaKzfdE7M7n+lHHm2oJ/u4yU9NE0Mx57OLZPc8QW1s6A9tlvtET
         Y+MApIn1/ZnGuqi+xPh/Wm4hJACgmC6HG/nxMaU5TC9fPqNSEfnx3ebQhrZ2+O64/DaX
         M3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748267797; x=1748872597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=859cJo9TYvq1IzsoVeN/+jTfHc2/ejVYnyyvhCL0W0c=;
        b=fmzVjAuhTIOyIpIKTkdj/ghaRYbx6xVbf6FIJKMaHP6fQebQt8vbbN/ox6t+P+I14F
         TwSl3t/Z6Jazp9tcirEu7vA/DunEtsKOZovXW+w4Cit54GN8KPVzxX8I//IbTKnpFhRK
         LLVFUc34hO0yEyt04n91yoZa+TsDYWa1p2YBYvs1DK3eU6as6J1u1jz2pB8Nkoey4ykG
         WMRP//7fWzWYNQDHq2kLi/lSgw5d7V5O+shu2Sl9HMTwbDZ16syFtS7d8q651KOUMCoS
         PHW+3/XSZVnuqRFmalnOkJeqKoKsBUL32xnSGQbcPdABxC33dJFyx9RwziN9+JGmkM9C
         mkzA==
X-Forwarded-Encrypted: i=1; AJvYcCWy0FjUwf6c199JwAlFdHFRatk2ZmK0qBxKRpvRYzt28s8WUqO64HY2bttnRS3cvFOHoytrRD+Dn69ZYfb9@vger.kernel.org, AJvYcCXqVIAGrFh8zW1sr+I950YtKZXv+B/2tjnSvxqA1KpbSfjnqt6dzFaso9gRuDoZfnY2CQEk0uEdj+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPFQPW7yNCJblFGyob10CDXAByxxYw+pqr6jNDm9rbu5pZzHRb
	BvdG1D/9m9wooO+sTke87xtzyPKIUfh30uDxRRYFkpluLb2DNGs90Enr
X-Gm-Gg: ASbGncs3viBd5Ayofr8QVwwHlHb/rolR+P4zD+bNYprKHkAwNXHonLuziGyK4x4nQbM
	1hVepXfUFGlXw/NtHCPbBuA3bu5JwTC3AyAAGV+kcbDicQseaqHR4wEy9xleAsFWLvopNPKo9P3
	omewGjLjsYuprXVwaLNyWCV9U+HQ1EyiFsxD7aMdHqiYFwpfn90fdSAfByxdHS1BdVMtpTVLa8M
	K21G8hqtxGJxCD4dbK9/KkSEZWD0BC7C2kxYgXZYsEXWf1U1TDbX46nY84pfE5xh7F1otM3j9G8
	YE6Lmw0LRVDOpifHNC39mbnjYpkyFUlnBD3TOg98cnOLr+LK0mKEXO7joNF6o4huu8ac0w==
X-Google-Smtp-Source: AGHT+IGBWkRiRhCMFT1Pq44qUq2nocKyMI0en1mClBadLXgI7beC+Fngu6Pzn97BlO70EBYQ1uO4Dw==
X-Received: by 2002:a05:6a21:6d87:b0:1f5:6e71:e55 with SMTP id adf61e73a8af0-2188c1e8722mr15780731637.6.1748267797278;
        Mon, 26 May 2025 06:56:37 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e5f74sm17019095b3a.26.2025.05.26.06.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:56:36 -0700 (PDT)
Message-ID: <cb2d5cbd-d1e5-4a71-a24d-d02604c4016a@gmail.com>
Date: Mon, 26 May 2025 20:56:32 +0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] input: docs: Fix Amiga joysticks grammar & formatting
To: Jonathan Corbet <corbet@lwn.net>,
 George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
 skhan@kernel.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250526011443.136804-1-contact@gvernon.com>
 <20250526011443.136804-4-contact@gvernon.com> <aDPVOlBIpnqc7Tez@archie.me>
 <87a56za67l.fsf@trenco.lwn.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87a56za67l.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/26/25 19:48, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> 
>> On Mon, May 26, 2025 at 02:14:43AM +0100, George Anthony Vernon wrote:
>>> Make small grammar fixes to Amiga joystick documentation.
>>>
>>> Also make heading adornments compliant with the guidelines to improve
>>> organisation of the page.
>>
>> Split up these two changes into separate patches.
> 
> The word "also" in a changelog is indeed a hint that a patch is doing
> too many things.
> 
> For a simple patch like this, though, I would not force a resend just
> for that.
> 

Do you mean keeping the patch as-is?

>>> -~~~~~~~~~~~~~~~~~~~~~~~~~
>>> -Amiga joystick extensions
>>> -~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +===============
>>> +Amiga joysticks
>>> +===============
>>
>> I would prefer to keep section adornments in this doc as-is, though.
> 
> ...and why...?  We have a standard progression, why not use it?
> 

I'm leaning towards following doc-specific convention (i.e. on this
doc). I could adapt to it, but some time later when I re-read the
source I might be semantically confused.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

