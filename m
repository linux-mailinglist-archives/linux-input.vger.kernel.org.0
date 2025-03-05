Return-Path: <linux-input+bounces-10563-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB5A4FF0F
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 13:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B62D6188FE80
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 12:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D852451F3;
	Wed,  5 Mar 2025 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QmBPsZUy"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87C2441A0
	for <linux-input@vger.kernel.org>; Wed,  5 Mar 2025 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741179318; cv=none; b=a7tVr1ee4drMvmq9EOysu/NPzHJWcBNi4nvj5RDd2KXdFHxpCLHxFbBD2JkmA4g2//quGJGQP134d3O4yyEUKOCFQdlwuncF7FvjOYWhW5KoSRIK+x8snBtlTCMzA2YxtJZcA9cNEiM+udaeNA2qfn31itfsWeIiFw27cCsdhtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741179318; c=relaxed/simple;
	bh=YNboN6HasUd8fdaZmn76+5CG2qlIfABQ284AytGS6lo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JwgxKOxh37ui2nvFS/dSyuWVsMXnXiffy3Wq/RAyKiUfuPRut9dd5tVma3BNeeponaikxyk9VC9nzhoU44Mwh4PTc3uzArsmeuoq2l4UZzgkMutVisl/w/ZiD2R9S6NyunjLdoDnsMBZ1VSWFXJMVtcin81x6LhkD/LWfx/yMJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QmBPsZUy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741179314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R+I52jkpTGKKh5i8x7etc2AkECbsYxHYCuFAnAyZIoQ=;
	b=QmBPsZUy2CxTrRMPSP0NuV5rC4BTcohs/ujq6EWLFrWfLX5eXX5yevEFnhrYYe2EeDIeNF
	SsJ+EQhqNXnYDiBrnUykfXvuiJiq6CfvenX48SncWAZ9UQpobCmB1bU5fHa9lFKmdUpb7Q
	gXjFug2VDZVXFZVGLGY2PNRuipDCVcI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-8t-HMtXVPVeVmV7s2-5Z0A-1; Wed, 05 Mar 2025 07:55:13 -0500
X-MC-Unique: 8t-HMtXVPVeVmV7s2-5Z0A-1
X-Mimecast-MFC-AGG-ID: 8t-HMtXVPVeVmV7s2-5Z0A_1741179312
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e5810f84cbso3436399a12.3
        for <linux-input@vger.kernel.org>; Wed, 05 Mar 2025 04:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741179311; x=1741784111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+I52jkpTGKKh5i8x7etc2AkECbsYxHYCuFAnAyZIoQ=;
        b=rS0toAzBO4KXgsa/yRFWXgrTx+bnraBwxkgjimlHX5fbLpqvdnC9CPaAFALJ8Isvci
         w0RNtsoNUbLF8zXCccggA+BGnvoku1OSJFUuWfwkGWOWSpzpJag9DLXEJ3OoYWMkKAUY
         +yab9Md1bRyaYDOgI/M8dGfUNKCbG3RSPRZ8R8MOwu1ago0kwf11hHA9/Ufzd5KD59N2
         JFbttnurMx9gXzfO/Y/xU2emD+z3mUWcrlUh7OA2GB//oXTJ766Z17e4tDX5v1ohgYTI
         T2Jmm4eiLJAanqvFmQWXBPOl6cnt+oV3AZ5R1QlcFCGPEWB8NfHf7bUmI4cXtoei1oNn
         7W6g==
X-Forwarded-Encrypted: i=1; AJvYcCVzpkc+7MFobeBn9fVgQ6VENkN99ONWUuGD45HHBBU+5mtMA1udnvM0JlLK7Kalm8aCyhHyTZH5WGK+dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywIu1O0jhjMc8mG0rwilnOB3G2pa4Bk0NfunmZ01Ahft28NbP6
	Niek/PW4MVIZy6FxK+hBAQVJ3f42jufoVeChA/hcIgBsu7vxqPJbY/PTv+627d1EOgMF+LD62jJ
	0UGnn5pkCagkxfUJ9U5NoUpOYjuj+06vSJqehAW0RzobVqHwBPNEJ+vowg8WsPSoRMNjF
X-Gm-Gg: ASbGncv4/bDIsBQvq1XXQWrgKpVqcuN9E9FLKREwe3G/JIMirACb91WmY1hFmnCASAj
	fESo/RYSsdRFgblcAXqPwOtzNaIlfgtsTGqy9Z7isU/fTIvrSublmVacKP8t1IgQ4JgWcdBIuQP
	jweTUzCXmwMRMNuAle1cRuOP0MLsyNpFUHCkAfJCBIe5zh5gjV0xSwq6tZrFLgh+8spk5wUJ4Kl
	hI+6GDMCTTSov6Tpayiq8zWg01JXbJHVB+BnMYsuUqQQqwvtF7bRldazZFt4cKxNfxSA87McEUm
	hiFfjgB4YkXCHIeGtb93xrdJ1lwQzAW2kJ8qgPjMlu33ScFTPfiOSqP0jTRNpjnjF9eEUL+d0E6
	o1lUxwPq5CHIoslThvLSfrwvH3WiSCRaSSsVO5wXJReruhKveQ2HvvS92rcCb1RUsdQ==
X-Received: by 2002:a05:6402:5109:b0:5e5:2d8c:7fa8 with SMTP id 4fb4d7f45d1cf-5e59f4a48eemr2821280a12.31.1741179311432;
        Wed, 05 Mar 2025 04:55:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNhQ4Yxbj6HpL5AMkaYg0O4lq4C1AslkF+2EMDH6GYW4hEnJ3ulGuOIG+oOC0bGtzW+rS94w==
X-Received: by 2002:a05:6402:5109:b0:5e5:2d8c:7fa8 with SMTP id 4fb4d7f45d1cf-5e59f4a48eemr2821253a12.31.1741179311069;
        Wed, 05 Mar 2025 04:55:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3bc80b1sm9739558a12.47.2025.03.05.04.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 04:55:10 -0800 (PST)
Message-ID: <18da2efb-c0c2-4417-8c99-623f6ecb2b21@redhat.com>
Date: Wed, 5 Mar 2025 13:55:09 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Input: atkbd - map F21 key to support touchpad
 toggle keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Werner Sembach <wse@tuxedocomputers.com>
Cc: mario.limonciello@amd.com, ilpo.jarvinen@linux.intel.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250303190442.551961-1-wse@tuxedocomputers.com>
 <Z8f1EzASdCfa2h_7@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z8f1EzASdCfa2h_7@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5-Mar-25 7:54 AM, Dmitry Torokhov wrote:
> Hi Werner,
> 
> On Mon, Mar 03, 2025 at 08:04:34PM +0100, Werner Sembach wrote:
>> In the default xkeyboard-config used by both X11 and wayland touchpad
>> toggle is assigned to F21.
> 
> We have dedicated KEY_TOUCHPAD_TOGGLE that is being used by several
> platform drivers:

Ah right that is a good point.

Werner, we were using F21 in the past because we could not use evdev
keycodes >= 248 (256 - 8 modifier keys) because of Xorg limitations.

But recently the mapping of things like KEY_TOUCHPAD_TOGGLE /
KEY_TOUCHPAD_ON / KEY_TOUCHPAD_OFF to F2x keys has been moved to
xorg-x11-drv-libinput which gets the full range key-codes from
libinput and can then do this mapping before passing the keys
to the X-server.

So it is no longer necessary to use KEY_F21 and even in the past
we used to do the mapping in udev / hwdb rules not in the kernel
in the kernel we've always (with a few exceptions which are my
fault) used KEY_TOUCHPAD_TOGGLE as that is the correct keycode.

Regards,

Hans


