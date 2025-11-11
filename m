Return-Path: <linux-input+bounces-15999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F4C4C990
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 10:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40E8C1882D31
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 09:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB29253B58;
	Tue, 11 Nov 2025 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DBvI1/9C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E0B27FD5A
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852575; cv=none; b=ElzIVSAotQlB4rVbWMP7zl85lVkUgPnX4N1sRwVJZMIN6eCbWzEWrlF2L8O0P/caOhqSEwgxTe8Q6VMq4+TNPVw4qCBM3I+ucnMZ1FbizFhcemJv6lP+i9rIiEzrhwJ40Tr2CeeefmstPbPZPizhWHj3aHm0aGwnik6BbB8pz9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852575; c=relaxed/simple;
	bh=hnP6MvOjehHku2Mba8SR807PCuY5/tHtJ5RDALFOZKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=froI1KZCQ/AFOLa8pnr+kDbXikO7RaIV3ruImER4C4n5f2CiI6y48qZ/OZ0gvVHwzDBO7BwLh5AdoqGX/UOvAog8MU4LVrB6z2+5NRbZzMD2C+2jYDlTk0ySj9hNXqp5abTodR1St3RYnNp9MCx4FDvIiqaAGAiE+ta+n4OMeis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DBvI1/9C; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b729a941e35so509628666b.3
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762852572; x=1763457372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWPP6QWzDSQG2koCI4Uqgz32StVhYVJIJ4zaGLtn5t8=;
        b=DBvI1/9Cy/Xuo1tGlbGlyjwRNz4devwwNzyXWJciRnnEbqbrLe5vcTd21Xy1XdI8Bu
         RHDcT7W01ks4xNszoI0cv70IqdezTFruyOxzgoEIZyFF9GarzzSjoS6K9DUOYwwkfIbp
         6k3ycOs+p2NH80Irorxuvk7WIGgz8TU+H/tL4ZKfG52GgEMb7aOQ/CKVT1bFPkxAmump
         RPv1zqxxCBefUdx27KqeN7qCv8v23oncF6jqlJvb6fhRMdE0MqgCGDWL06RFn8+mRG3U
         EkOIEAb8eE0SDX0B0SD4BzPZHFivRjaEjo84o3LZn1kXQFavcFwHpBOxFSbnWjRcasaE
         nbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852572; x=1763457372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWPP6QWzDSQG2koCI4Uqgz32StVhYVJIJ4zaGLtn5t8=;
        b=c/lAOKxUCZhtPPyeqh0ipaCsFGQUhs9s9PsYlUcnyjJ09awR/Z9wQSMwd9n1+j9UIE
         +XdF6jwQSt5NcRoCdWdtNdAOkKqdvZv1cnWhjsoaPZWWWMrbXpHOGLbRJDTHsNUyVp1r
         +2zA+PudThHDtgWZeRYOYh2jCEWhwtp4nP1jPTNXdcah1+slfxa8jxzaS3LJs/wAynUn
         x2rtqZwQkbRDyJVW8hvqcaM9w5at1/o6C/dFpUpL/4+C6bLz38QNyxb2ECE6KWCO0KXp
         scPQPUnBBwjmecoSvJZ4csB7Xet1/9HPPXxYQp1GgWLGXTu1l8yf8jGeFBrJAsBMeqat
         YvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbtkFyFfPOUrax8BjvV1gh0nDsblbfzrwHSPGzLCtJP6XeylsN68wIm4E3YyoWf8K7U62Fzi8Y1tSung==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYMaemej8fkNtlwxGlkYGd2x454U/XhcYdGCrzZpkN+z+XGFPT
	UC+L3pmn0V9LIR3NdxxNTpsgDswtYf3bGv8hEgKArQceTOFNyUn7gjo5Eno9IOzvuNBYEAeFGSv
	d0E01
X-Gm-Gg: ASbGncsspUWGRLzqQaZGth5q4YjWJte6x1GcxsOWZCjEYYZ6fEMInf2FBbOoRgwX/84
	Yhy5iuEqr0RrBI3ZqqT6cNrM48hdJEqzjHNgZDNKiR7N8NrTWghfHpnfxBTATmnEL/u01T8m2Dl
	mlFTeqOOwUFbU9lVfYv5WtR81E22flNIO+ahGAWJWqSkInrmAmdmilYatDX+li48Ny7ah3JJu+x
	0gif0Iz7+WdsY2QjgxEiWCuRmcZyeWqCglpa343nWZ9RKxJkH3bhli3zQ7dgwd4THNOh8Rd4C9W
	so6giXFWGIQ7RTd5lURlnSFYeE/jftVnRfg7pdZYPLGPK6X6wlV3QAW03wdJjK7tGSNhHv/v704
	x0MfocIP3mvw/iEnuev/pjtD5Z9e9qPynKXwtRa8iI1v+S2G8vtZM+FL/2zESp3htFUyWJUVCN0
	l7a3+drZafPa9lmcqGGnUuiBvUo3WDF7XyQzNTCg==
X-Google-Smtp-Source: AGHT+IH930mFApbAim+hsItNZIanFSAxgWzf+l4tHBB1/03gGvYojtijguoMFNaE7u/zdx8GkYVgoQ==
X-Received: by 2002:a17:907:7ea4:b0:b6d:7859:61eb with SMTP id a640c23a62f3a-b72e0328ebemr1045116366b.29.1762852571028;
        Tue, 11 Nov 2025 01:16:11 -0800 (PST)
Received: from ?IPV6:2001:a61:1328:3001:f150:c1:f1a3:b448? ([2001:a61:1328:3001:f150:c1:f1a3:b448])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf31286esm1299966766b.21.2025.11.11.01.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 01:16:10 -0800 (PST)
Message-ID: <2a6b4d25-e963-4019-857e-28eaba53a69a@suse.com>
Date: Tue, 11 Nov 2025 10:16:09 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: Terry Junge <linuxhid@cosmicgizmosystems.com>,
 The-Luga <lugathe2@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Michal Pecio <michal.pecio@gmail.com>,
 Terry Junge <linuxsound@cosmicgizmosystems.com>,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
References: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
 <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
 <CALvgqED5NCNjrtv_YSfg9rzerK-xWAE5TaJjZtMBMcY=8MSk3g@mail.gmail.com>
 <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.11.25 06:11, Terry Junge wrote:

> Polling for input reports is handled by the hardware at the interval
> requested by the device during enumeration. There is no intervention by
> the kernel to poll for an input report. The only way the kernel can stop
> polling a device for input reports is to suspend it.
> 
> So ALWAYS_POLL means never suspend.

Hi,

that is not exactly correct. ALWAYS_POLL, means that

a) the device is always polled _while_ it is active
b) if the device is suspended remote wakeup is always requested

	Regards
		Oliver


