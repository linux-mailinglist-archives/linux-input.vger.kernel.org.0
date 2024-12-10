Return-Path: <linux-input+bounces-8473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DBB9EA7B8
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 06:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DE4E165736
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 05:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573992248B6;
	Tue, 10 Dec 2024 05:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyrLzzFb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E523312A;
	Tue, 10 Dec 2024 05:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733808226; cv=none; b=gcV/xBifXOO2tdBeg0wMs01DoK4yMot99Z6P6a+SuWlr9rNhGkpVxN5VY+cZDtbObxhhw4e3IQ3S/s02haYwYcRU9IgcFSmXSr+h1hjCsYEksUSfp1lV7Bjq4VvjZ2FFyI7TaOREvwUVsQAr0IrsePhqWcs+Y/EluhERGKeSJZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733808226; c=relaxed/simple;
	bh=xqYv6QgBXA4t3Jg7VQbQP9HP/CtdPar1I9KrW8+WJg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nay3n8+vGnKImrPmzUGTB1YU57ZIVsQKS4C75qP7fPzlzH8hZ5/Tmd/56AXhVRPoL5+IuliAR4aNrAFn5G0gOP+Fh8SAIczqe/hJyP4MB9ozG0+NFzrs0+aXMwImlcSzxvBRa+P9VDqDRaQqq9zjWJrWleWmR2FUPP3NKZJnsWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyrLzzFb; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7258cf2975fso4450416b3a.0;
        Mon, 09 Dec 2024 21:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733808224; x=1734413024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBU1UAuy5MjYfrWbZjh4/sgnYH98b4q96SgJM7Z+66M=;
        b=RyrLzzFbhV0/PAuFe1KXkP49GhmrcgvYf2azs8f3u896SOn3fep1fEkpnRnQakhra6
         XAEyPjbBf2pPAR/Wqox59p2qyTQFcqenK+osRgtEBQ7UT3yBuQEdJC3JV+6ZC9DTSUUd
         fxpvhv1Y28uCAvFqP8wKfs8n3DfhYc0gq3y5eV/dichK5Q/BLBr7a8rWTzTRaT9PPV3N
         iuokewb7KBx2fwykyYgBk8qnlgcdQlv8pR8faP8QWY4DZitHRK8svMSRAyCOayl8PlP/
         lcU9c9bcxn5QGTSndPVh4/OSOICppc3kT4D+teaAhxvJtfedF44k10YRXgQ56M0ohbcw
         tpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733808224; x=1734413024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBU1UAuy5MjYfrWbZjh4/sgnYH98b4q96SgJM7Z+66M=;
        b=k3ZO42ydTOaIinVnuhJ+XmguzLgNxPLybpC98xJeOISG6k5t65QiST6PXP4op7ok7V
         E0FQu3u/xlgaM9RWNY+YlSr7vFmt+obHFppt4xB3vkasjLJ0+UiQZpq+fDxt2Cpr+/Dj
         6AOT46TWpUN6NrsxqkaVkUa/usmN5oKEjrrGw5S7SB+3QlnqaGa9Kx4vK6DZEyUaV7cD
         +Dv/lQf8CqLeT97WQc3Yn5X4lNldH7djw8FMRn3rciwV70kEIQoBkfJd4gLZm6h5eSau
         YxDyQif1/zTIl5QorknYu052vlA7ZKBSSgBgn5atylMA8DAr8jYN1PfTeK5tmPsmhNKI
         vO7w==
X-Forwarded-Encrypted: i=1; AJvYcCU4R/OgDgCeh/aIqs+NRANC4y81tL403ieP2X7KcW9jYHh0EriUUY7jy4ChUWSjgj3zoBGizYoA8kBj@vger.kernel.org, AJvYcCV8U/X35Jy8CbZ1CqwB2k8e+LS5BDJLY5vUZfpzhEgK6O77HdvT6QUiYgFwC6Kp1c/uJtNINqmQQIYAAfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE0yrrzL1eeA4Pl2vGdwMzWLkgb9JS3SHGAiK1BzBnE3/GTeN4
	2dEsCRURqPBkZ6LzxdH8uCSKuaAz2VdshS3slPtJ07rU2UAd8D6M
X-Gm-Gg: ASbGncs3demOJ5H+UdR+SLKRQOWXM8Zu7HMimxwwUO3QM0wLC0QCOQaM/Be6iFejegQ
	twuykLumEEejE/aY3wgT/M0AWpOqPEQbx0u6MO5NOXUoJu/Bh797RZsC6ljqgoef+IxHVdVYMPp
	PMo2sJIV4t+IFYq/fORu3yRIwdJ4tmsqqo2eyVc8+8ixxPIPLhFKVAZdH32JvxH1ib+rKgTvsOm
	lIGLRD58mx5+rcTIYoNC51d1U5B87N7W8S7/EsoOU6XNJ1bndMDNW8JwcCBIrQNmJWJ1FNsFHLH
	OqKOQATeLeB4siO7Cbx6Fx1BYZWd
X-Google-Smtp-Source: AGHT+IFRDtAZUHy67YBIFMjYuSZVAM9Ll94FWK+XfQgDXiw8IJ+uc/Rits4ApUB7XKhyFdVb7YNsBw==
X-Received: by 2002:a05:6a00:c8c:b0:725:f18a:da52 with SMTP id d2e1a72fcca58-7273c8f4d8cmr4767471b3a.4.1733808224007;
        Mon, 09 Dec 2024 21:23:44 -0800 (PST)
Received: from [172.19.1.43] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725cb065fbdsm5359995b3a.39.2024.12.09.21.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 21:23:43 -0800 (PST)
Message-ID: <274c7ba7-dd7a-4981-95a8-38ed953a7dbc@gmail.com>
Date: Tue, 10 Dec 2024 13:23:39 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sudeep.holla@arm.com, arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
References: <20241204021014.5083-1-mjchen0829@gmail.com>
 <20241204021014.5083-3-mjchen0829@gmail.com>
 <2a47hwrbl3r6h5umwikt7bd7rp3njj6wnlo5e67f5kl6zhaq7g@cnolynoswb37>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <2a47hwrbl3r6h5umwikt7bd7rp3njj6wnlo5e67f5kl6zhaq7g@cnolynoswb37>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2024/12/4 下午 03:49, Krzysztof Kozlowski wrote:
> On Wed, Dec 04, 2024 at 02:10:14AM +0000, Ming-Jen Chen wrote:
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
> 
> 
> Repeating same comment third or fourth time is a waste of my time.
> 
> NAK.
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
> 
> Best regards,
> Krzysztof
> 

I will carefully review the v3 discussion thread to ensure that all
feedback is properly implemented. Once I’ve addressed the issues, I’d
like to confirm the next steps with you:

1. Should I drop v4 entirely and submit a revised patch as v5?
2. Alternatively, would you prefer me to resend v4 with the necessary
corrections?

Please let me know your preference so I can proceed accordingly and
ensure a smoother review process.

Thank you again for your guidance and understanding.

Best regards,
Ming-Jen Chen





