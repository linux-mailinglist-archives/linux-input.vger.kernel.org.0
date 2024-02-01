Return-Path: <linux-input+bounces-1613-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E19D845669
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 12:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE813288CF4
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 11:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A9215A4A1;
	Thu,  1 Feb 2024 11:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWxaVwRH"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCA315B970
	for <linux-input@vger.kernel.org>; Thu,  1 Feb 2024 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706787724; cv=none; b=nAEXdP+Q9L7OZsAlyb+RTLuWl0/N+4ROox1fwe7NRdPyiwKR+fXboM2o76nWDkvcsv6J2QPBHgrJ302buSnqFKrvnmaH/RPKMl/xil99x0w8ywk4tUYlf2hb8Z1ODw9tOGJCEvTHTrIwlpsqy2wqWUjNC0HhU9KO3hfgP+DNf/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706787724; c=relaxed/simple;
	bh=urHbrS1cllbFOsHLucuq+fokSSEAJOkVktHa/rCN26o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/qXP7Dyht1ZJ6FNfdvShQZD6vyjIhjCoRSX8iSZh5uTxAkYyKQcffgK/00MjSLLSMIXAgHbZrDRkiiHP8szqxUyVxUmVKlGNbHc0R9JRhQE462kmqfbJHfLtfKtIAKaGsFny7MJPix1bUBuDlOPT2ZLWeqf79nApcff6LOdle4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWxaVwRH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706787721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i3GUNiFWMLKOvtORWj8ClGeTDULPNTU+aWgtkbxkUxo=;
	b=EWxaVwRHPUTxzQrY9KGk3bvEdoM+41sKUCcpXvMv45nqLP7rLY77a26yrRF4mll0SSa/r5
	CypBccfTapjswfkjBbUsPLz0aggm1MKUtwKmZr9lV/YH5y+3vZJjXtX+k7ZxOC0otxKgYm
	V2IJy/RSksw0JCemobgl9M6DIPGHPuU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-aIP4UtvIPxqBfNWxVAKuHQ-1; Thu, 01 Feb 2024 06:42:00 -0500
X-MC-Unique: aIP4UtvIPxqBfNWxVAKuHQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5113135b9dfso456669e87.1
        for <linux-input@vger.kernel.org>; Thu, 01 Feb 2024 03:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706787719; x=1707392519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3GUNiFWMLKOvtORWj8ClGeTDULPNTU+aWgtkbxkUxo=;
        b=k7/iD4giepmt90JX3ST8c3s8PcqepPpeuG6/SsCSx61QK+zykG+VbAK3KmaOOylS6i
         wcXUMf6Tm/PofmNylWyFKtIai1ASm9Z1TgsaayxJWMFvz1qWXBghEPG6dtBV+JY68LER
         kUjzvpiGhTpy/JXlBVPy845xk7LiB9/w752FUxE/8gUP0hMCRV76igUWFMz++h07VoS6
         0n5Peh8LPAMVeWNpdvYYSasqM/yRbWP4fjEpNuqISVo1EutQFuOrGz6kIcFCi9t///EP
         c78i/YNIo43vpFmrOAhLxn8TOhdC5eRlXrG2oCzRdVeLigLhSPWiqAbwx328Yq2R7f8j
         r5EA==
X-Gm-Message-State: AOJu0YxdoQxOMLzVwMt14UWMJQa8riTWhlIDEOlyx0Ucnt5tGnrLfplw
	6SXZd4SZBGAXXK8MGIAjvlmahmMK8z8eNKzZN4zWyNKEtZZvD5HXnova2wB265Z89pTbF+qf0vJ
	Axra3hESo6+mFbVU/6ygTplVroMp8fxzb3+W/XeVeJMDwlrYgnnX/QQ0UxIo8W9NIgBlA
X-Received: by 2002:a05:6512:2024:b0:511:20e3:e456 with SMTP id s4-20020a056512202400b0051120e3e456mr1628981lfs.49.1706787719231;
        Thu, 01 Feb 2024 03:41:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUM3ER/05K0P1SDSf9zUPrHLuhKoPYv86HIb2Qagavucs7NxIAB8te311dkA8fybttpWEZyw==
X-Received: by 2002:a05:6512:2024:b0:511:20e3:e456 with SMTP id s4-20020a056512202400b0051120e3e456mr1628968lfs.49.1706787718870;
        Thu, 01 Feb 2024 03:41:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUho0hfWGG9Q87RkUtWX3clrr2/kKc89RIbutx2CAwhhsLVNMpjzTA16a4UBEtoP8Yg56qPffnCU/MC4rDvillSXJDxVlACMmDh9a4q+7xOjCnx7tuJsJ8Kz7NRdK0hRbZSSBfnJL1th9BTl2Pz0VI+LtIajFby46LfHMeCCdk=
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id en26-20020a056402529a00b0055823c2ae17sm6604840edb.64.2024.02.01.03.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 03:41:58 -0800 (PST)
Message-ID: <99c7d1c7-4f0d-4a2e-9715-98425ce7c182@redhat.com>
Date: Thu, 1 Feb 2024 12:41:57 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH regression fix 0/2] Input: atkbd - Fix Dell XPS 13 line
 suspend/resume regression
Content-Language: en-US, nl
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, stable@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20240126160724.13278-1-hdegoede@redhat.com>
 <dcb4cfe6-1a50-43cb-ad92-76905c05dde3@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <dcb4cfe6-1a50-43cb-ad92-76905c05dde3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/1/24 12:12, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 26.01.24 17:07, Hans de Goede wrote:
>> Hi Dmitry,
>>
>> There have been multiple reports that the keyboard on
>> Dell XPS 13 9350 / 9360 / 9370 models has stopped working after
>> a suspend/resume after the merging of commit 936e4d49ecbc ("Input:
>> atkbd - skip ATKBD_CMD_GETID in translated mode").
>>
>> See the 4 closes tags in the first patch for 4 reports of this.
>>
>> I have been working with the first reporter on resolving this
>> and testing on his Dell XPS 13 9360 confirms that these patches
>> fix things.
>>
>> Unfortunately the commit causing the issue has also been picked
>> up by multiple stable kernel series now. Can you please send
>> these fixes to Linus ASAP, so that they can also be backported
>> to the stable series ASAP ?
> 
> Dmitry,  Hans, what's the status here? I wonder if there is still a
> chance to get this into -rc3 so that Greg can fix the affected stable
> trees as well next week or so.

From my pov these are ready to go. I'm waiting for feedback
from Dmitry on these.

Regards,

Hans




