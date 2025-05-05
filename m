Return-Path: <linux-input+bounces-12142-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C405DAA8C7D
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 08:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB6DD7A1CA4
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 06:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6ADC1A4F0A;
	Mon,  5 May 2025 06:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsF+tJ7e"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A968156236
	for <linux-input@vger.kernel.org>; Mon,  5 May 2025 06:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746428021; cv=none; b=mnBSGqDIbEx6wBQjudixqZ9o92fj5IXak6bi2SuWbsGAEr2RTeScCRFFBYB21P6QIEiVsZLlSbm5FIEd0BQoweSlr2dmVlCOSsF608i9czj5V2iKKXLfepNA+j+bUb/DCpfAsqP9XoUXWCiVDxWFHZOlSFc3SM3HfLhpkQABX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746428021; c=relaxed/simple;
	bh=DJDKcs4cDnWBb3rJpgNUeF8vDpWm0TkUnu/VB4vrr14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R2fGCW+AbI4iqv47yaX3CeTJ6HZXCit/p2LyEvOvRslnyERp92D5SzjhT17hlRJBFJJ8RiY/SBxoIGTUMzbC3WE75MdiH2ZqErsIMtmCvjiYRatwENR5ZZ8sQjrdP4iUw5jop4E/Nc3dqqT40M5Kg0ssiXXBTZs/vIn3JhgZyCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsF+tJ7e; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so3376884a91.1
        for <linux-input@vger.kernel.org>; Sun, 04 May 2025 23:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746428019; x=1747032819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmVLFk6YlopqYlnS5nj14fbzoIBpHQEXcksbfeSjY0A=;
        b=lsF+tJ7eu60KuMMcyJtvl8ckd6AYAloawt29rHlHZ2Shmu0jFcro9aw6IIucjqpelW
         JIW/vY4DAZL2fUtBGnTUpOXUVkALAtfhBAuGQXcb5uOIzK8AGF5lN1tOS6hfEBPnLx8t
         0kQypwPban7lPgyndswxmuINQEZl7Z3K2skFwfDGx092ucq6AFLpIwz4/QSABNHyMzeX
         mWKFHQX31PtAjX4nkh8zzIUNhNLAM5P6tW0i9xLK7kKzBxkohPVO+SPGdARrIm59euFT
         76W+Zlee/0Is8i3FdAP8JJuWn2rupBJdahz6XXvPHXib1k903T/bUfQcL6Rn2Ze3FZwp
         LuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746428019; x=1747032819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BmVLFk6YlopqYlnS5nj14fbzoIBpHQEXcksbfeSjY0A=;
        b=XqkJuSxr2n22c3NIQgxbgWtuSpD1RaCSc2Yuj1yMJl3AHyZbfn9UPkRbbSgTSOxQBr
         54qO9IGyNAw1RblM2WEL/OfJfon2Rn/0JqoaQgtBChhZNnIxKTVWijj+F6JLu8MqvcZn
         t3Pm55VaC/WGNjChD3D4kA8gLY2CyUy8U77vKkMuA8JCd8+72fdGEVAlk5ttsOhUFHmp
         70s9WA5okeiFchYxSxJDBU3b32HeQp5sCq7kcKrTCLjsQKw1xt4Orz/8ywNC2j1w8lSv
         WzlCoVfSpEk8f1ZVz6b721gWPXiRC6FyQgxfioHIPO3Sw9j0ltG/dpRdeZGIWqFeZ/xs
         ZTWA==
X-Gm-Message-State: AOJu0Yy50E8SarxMuwcc0NunwTCREXiajL+RMs6c4x2Do5GS1ZzKjYNk
	ccYG642a/TmOWoQUGjsirr5hN3XLw7Khdozqc0UlF2RWDEvhB2Ham7fziMTp
X-Gm-Gg: ASbGnctiSBfk/HreistUpn7PdcrEl7+mnPM93vJyJoOvb69eGPqRSoF69n7eCjwbu0t
	tr5awQ1yXfmjX2yMfrjNSiGuz/aAUZqmW6KhE3uOYyvfE6YyKPSZ7GhKs6QSLHbjDkBblmu30Rr
	gc9gzPJJGeD2ZzJwDhPajZXxCBl7oEjM2WCZwO5xigr6HKujtChL7/9UaQJqdFWikgdu1l37Sar
	PuXot0xlfCA5RTRqV1mR0PJIfHRTFnSeV7v6zEgsknruhrLn1Mrwph2h5lN4jxQL0O6oHjoDdCX
	kIYDxHUDoWyJgchyX36gNnYZjPRXxmPdlgHElPUSlJeDGdyKo9bRQg9AqzRBqdRH5w==
X-Google-Smtp-Source: AGHT+IF3zLdTPy91rCgolJjVZVVKjs8ZsYkGVvVpWfOXDa9oJD2knFmpxt4PEPTeegl2fXQfUw+uxw==
X-Received: by 2002:a17:90b:5190:b0:2fe:9783:afd3 with SMTP id 98e67ed59e1d1-30a61958113mr10474277a91.2.1746428018609;
        Sun, 04 May 2025 23:53:38 -0700 (PDT)
Received: from [127.0.0.1] ([185.220.238.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3476f4c1sm10756825a91.23.2025.05.04.23.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 23:53:38 -0700 (PDT)
Message-ID: <32a3a855-fa1c-4258-9f2c-902fd29df9ce@gmail.com>
Date: Mon, 5 May 2025 14:53:25 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: Touchpad (PNP: TOS01f6 PNP0f13) not working under PS/2,
 requires psmouse.synaptics_intertouch=1 to function via SMBus
To: Aditya Garg <gargaditya08@live.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <c596f96b-035f-44df-952d-6b4c43bd69df@gmail.com>
 <5AD8B559-C74D-4CA2-8145-7CEADA09AD36@live.com>
Content-Language: en-US
From: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
In-Reply-To: <5AD8B559-C74D-4CA2-8145-7CEADA09AD36@live.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Aditya,

Thanks for looking into this and for the patch. Sorry if I sent this 
message twice due to incorrect mail format.

On 5/4/25 14:40, Aditya Garg wrote:
 > For your device, can you please test this patch and see if it works?

Yes, I can confirm the patch fixes the problem!

 > Also, please share your laptop’s model (Eg: HP Envy 13-ad105ng)

It's a Dynabook Portege X30L-G.  (It might be marketed as Dynabook 
G83/FR in some regions).

 > If you want to be credited for your report when I submit a fix, 
please share your full legal name and email as well.

My name is Xuntao Chi, and my email address is chotaotao1qaz2wsx@gmail.com.

Cheers
Xuntao

