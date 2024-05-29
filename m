Return-Path: <linux-input+bounces-3952-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AF98D3ADA
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 17:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADD781C22241
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 15:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5F7746E;
	Wed, 29 May 2024 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXFnmRrq"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5B81802BC
	for <linux-input@vger.kernel.org>; Wed, 29 May 2024 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716996545; cv=none; b=kQRPVd0GV4GusXUawdQWLBXsZUXvSe38dDrhm5v5wl7O0Z7AzA1syVn8fPU/FiU+gkRPfEm3fteaoOguElellPn5rw7zuYNS53rwf/R7KFDC5hyhcMHd5dxhMv4yRoOG/gg+ID8X95ZGFpWkdCUchVfu3rQZrY4t7IY2Ik4GsJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716996545; c=relaxed/simple;
	bh=8TSpQpuVN6z+ZuZk68PMhyHU89nHlEi7bQ43I1w48bQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0OZADA1ATkkLKXZOVe+DIv/A+a5A0jJvBU8BgULMlMetlB0mJDhbrXeCh/92/Z/juTDvMjflqrAhDjDnplWIdAEe9MCQwKSBZSUPQmhR13K+C8t5cz2oconOhggYZOyZfd8zudyLOx17YJKgi6gb9cq68QJDFFS6BfkrCrgQQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VXFnmRrq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716996543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFHpztQhwU5HG7lA94/ryMM368oC6ZMtci9dOyduPBc=;
	b=VXFnmRrqBcYQeCj33Ko6o1M+blOOutoUFfHlt+GYHSh3Tn3uNDwZipRKXQqSq33FHLAUYN
	8U7doRgBydhGIq2gsKAbLEMdyDenw+VH/dQW/XU8VxpCbzGib1HQLOclqMzTwqCzRMIOAF
	k7f25tQjFRKdjc/fxtF8Lc7jKJgGui0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-LVRxFfTSPwWeKMZBd0_vtw-1; Wed, 29 May 2024 11:29:01 -0400
X-MC-Unique: LVRxFfTSPwWeKMZBd0_vtw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6266c77502so131938066b.1
        for <linux-input@vger.kernel.org>; Wed, 29 May 2024 08:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996539; x=1717601339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFHpztQhwU5HG7lA94/ryMM368oC6ZMtci9dOyduPBc=;
        b=PnikcXFKVoqcBtCpuJkj7rPfvfKJvYivvznpkfcmjfsZRJoFuvgduW9Aduv+ILFcIr
         PUHoMfPRqXir7/KsrIIG4r/EwHjWCOzv3oxNzw4GXGvWCXa4bksSqaEL68W74tfajXPv
         fGZGRgSaPE4SL2GGMRzDDXJPZ7tC7Akwd+WoAa3RJYclPPa3TKNsAPVpoJ+9PASZV1VN
         Fhjvs3/FtIPCGOoNFKMt/wqMfYmu2LIli6taxKyl2Vu2EirqvB6vc8GqOnzMrAVwUZDq
         UEP9kZsBkwz5TER9f/3XVR4fNntgpQUQqZ8OXsRG3v5+r9yoIZbIXiCYyTTqBWO3XJhS
         hxiA==
X-Forwarded-Encrypted: i=1; AJvYcCUuU8xJ2vWdegNw24HEGTFgyNLRnaHtiy1C17dlvrsFey+58o/i5SyjsUvj2p3I8zog3FHIEXb9LEy2P/W+wSbXdIZeQjSUpNyZrTc=
X-Gm-Message-State: AOJu0YxBNtTtERVwGMHbHt7ElcYXJ5XIMxYiB6Ab8069Ef127Wvzk8di
	VDxECZYbrCMrJS2lLn2CArWKClRWvXU9EVjL4TPpXswbXkhTVRe+mTfn+EW98el5y94xdxVhsjV
	Uyt9K9aqUKXJwt9PAydKcF3TWcaNRzhhgVyVXOZfb9nq27m47lXCeS1dwaFiR
X-Received: by 2002:a17:906:6d95:b0:a59:bbd6:bb39 with SMTP id a640c23a62f3a-a6264f0ebfamr1092763066b.55.1716996539681;
        Wed, 29 May 2024 08:28:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHMNDZWVKqgo3ZdTUnkxjQybulw1cBwoyxNnQ5p2eVfu24cekgVLMgE/SKbIjgInYFIJtxtA==
X-Received: by 2002:a17:906:6d95:b0:a59:bbd6:bb39 with SMTP id a640c23a62f3a-a6264f0ebfamr1092760466b.55.1716996539217;
        Wed, 29 May 2024 08:28:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c8182edsm734297466b.9.2024.05.29.08.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 08:28:58 -0700 (PDT)
Message-ID: <b0d8eebc-5abb-4ec0-898c-af7eedc730d9@redhat.com>
Date: Wed, 29 May 2024 17:28:57 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] asus wmi and hid: use HID LED for brightness
To: "Luke D. Jones" <luke@ljones.dev>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20240529012827.146005-1-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240529012827.146005-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 5/29/24 3:28 AM, Luke D. Jones wrote:
> Changelog:
> - v1
>   - Split the patch in two
>   - Move function body to asus-wmi and export
>   - Use array of names and for loops
> 
> History:
> - https://lore.kernel.org/linux-input/20240528013959.14661-1-luke@ljones.dev/T/#u
> 
> Luke D. Jones (2):
>   hid-asus: use hid for brightness control on keyboard
>   hid-asus: change the report_id used for HID LED control
> 
>  drivers/hid/hid-asus.c                     | 32 +++++++++++++++++++-
>  drivers/platform/x86/asus-wmi.c            | 35 +++++++++++++++++++++-
>  include/linux/platform_data/x86/asus-wmi.h | 10 +++++++
>  3 files changed, 75 insertions(+), 2 deletions(-)

Jiri, Benjamin since the first patch now also touches pdx86 files
we need to coordinate merging this.

There also is a long list of patches pending for
drivers/platform/x86/asus-wmi.c

So I would prefer to take this series (both patches) upstream through
the pdx86 tree to avoid conflicts.

May we have an ack from one of you for merging this through pdx86/for-next ?

Regards,

Hans





