Return-Path: <linux-input+bounces-3979-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C19278D5A83
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 08:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61E191F24A09
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 06:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF5D7E101;
	Fri, 31 May 2024 06:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zwpx9V1s"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55FD7F466
	for <linux-input@vger.kernel.org>; Fri, 31 May 2024 06:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717136756; cv=none; b=sa8B1TR8soKIun+2Tiu07dLkJ+UpuyxH5QhkaDYKxDmT7lY67omAmB6yyH0Ev9qHnRF4MbCVR4B0jTFn5MxI4KNUM3SGHstObjSUk/Ocfj+sNHaXjmYFzQMrRZzr6nXg8ZlP8ijLv8zk+agYSZUI7G7dsedYdhPL0+auOWbkjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717136756; c=relaxed/simple;
	bh=LPn7pI3TB6DjADObvz3zF7wOMCMrEV65Mx1A5wlKOSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TzXiLlioqS9aSLmYW7Knj2gfcNXLqHCGInrDGaDgIiADLXqcHvg7tuRqGQhwBRTtS3fC6U9aVgREMJFvOMCws2EDliuqgNqUFfeBxYrVB/mlmwHQ2LrYbO0iFzCL0jbUcO7XjHJg9Wkw8IYPkAqVJMglUWic02+b2GGCbQAFFf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zwpx9V1s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717136753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+l7LmyUwwTZBpj4C4ev00SpK5zOV8Opc7l/5TGxNhU=;
	b=Zwpx9V1s72LLg/68vkDg1DGukF7yuFyNvGaD05BaxqSacjQzoEvWA8sRGBgidBMtKDZzhR
	qM2zSB5RP7lJjJ8c32SLcDPXQPT16CMntPGqL1YjugF7qwHWnvjgEVzQOWRkaXIsLeN0fg
	jtEgPqjHfC+HoL0j7mwCb5vHgEQvxsQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-g-fPKOgNMZ6O0kfekoBjSg-1; Fri, 31 May 2024 02:25:51 -0400
X-MC-Unique: g-fPKOgNMZ6O0kfekoBjSg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a629e32f5fdso63931966b.2
        for <linux-input@vger.kernel.org>; Thu, 30 May 2024 23:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717136750; x=1717741550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+l7LmyUwwTZBpj4C4ev00SpK5zOV8Opc7l/5TGxNhU=;
        b=dXTB9Sx1puHn6eD8zp0cKKSMSUl5wMWnruFFEkCIkyYXerGo4txxSwbEi+xtZGXH6b
         cPQaSjnnIjJsUEh/s1ii8tRPFVgL3XJzs2ZoOKzjMq1MluxBI1iVXtGa5uK5bM27SrTS
         pMnmvyFOpIYPnhjnMRjz7ehbSBZ2QNrh8sJwlLdXk9KMNDitXRUZipKYsjRt/r1cGoWC
         Y5XCVXiG6VuMA1OjvcZ5TLHc/CheKeBpnb8nsy2i+uLFDui1SenPIQGHjb6uq8nyZctQ
         3SRBs+A++Nu87wXB93Ixj0R8Ow0QfCEN3LPs3XAFRJIslF/6KQqImsmKCNWDi/zQn13a
         zRzg==
X-Forwarded-Encrypted: i=1; AJvYcCURtmuQezfhMNNyDEM9NAgHWJUaP8rTE1WrV+YZai725Nm2LmRZBWxFMMeZ7q89UkBplY5uAbjms6CPGj3MG3w7W+cUGgtKuCcMmBw=
X-Gm-Message-State: AOJu0YxvwsF+nKJL+cr4nrkrTF9no1DgliulT/EWh7ogmoTfxoJJjF5N
	oAtumebSeiK9KN0P/Fw/bkIL69IHXUmBNKzxHJ8ZLMh117plPWMc81h7zUlr7arcevsD2XDM5aB
	6EeXRy2pqreIIIwJebGRoJaptunk5bO3w/sMXELB6Kx8UQZdr/Mb28gH+j38S
X-Received: by 2002:a17:907:b96:b0:a68:2bf0:91 with SMTP id a640c23a62f3a-a682bf001c3mr46431366b.31.1717136749990;
        Thu, 30 May 2024 23:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxNCOep59GnmgfXZDzgXlozMP0mdaEajrH8u0WgMFInneMlj0iwoHjCVoi7d5d2UYQjVPg8A==
X-Received: by 2002:a17:907:b96:b0:a68:2bf0:91 with SMTP id a640c23a62f3a-a682bf001c3mr46430166b.31.1717136749485;
        Thu, 30 May 2024 23:25:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eab85c65sm51030166b.160.2024.05.30.23.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 23:25:49 -0700 (PDT)
Message-ID: <1762dac4-184f-4c50-9577-62eb3408e4d4@redhat.com>
Date: Fri, 31 May 2024 08:25:48 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Input: silead - Always support 10 fingers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20240525193854.39130-1-hdegoede@redhat.com>
 <ZlK4ar5rnqW7F_4e@google.com>
 <9103e7ae-70f4-4ca0-a18d-322bdedbbdba@redhat.com>
 <ZlkRzbF_T8vgzxcr@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZlkRzbF_T8vgzxcr@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/31/24 1:54 AM, Dmitry Torokhov wrote:
> On Mon, May 27, 2024 at 09:46:54AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 5/26/24 6:19 AM, Dmitry Torokhov wrote:
>>> On Sat, May 25, 2024 at 09:38:52PM +0200, Hans de Goede wrote:
>>>> Hi all,
>>>>
>>>> The first patch in this series stops making the maximum number of supported
>>>> fingers in silead_ts configurable, replacing this with simply hardcoding it
>>>> to 10.
>>>>
>>>> The main reason for doing so is to avoid the need to have a boiler-plate
>>>> "silead,max-fingers=10" property in each silead touchscreen config.
>>>> The second patch removes this boilerplate from all silead touchscreen
>>>> configs in touchscreen_dmi.c .
>>>>
>>>> Dmitry, since touchscreen_dmi.c sees regular updates I believe it is
>>>> best to merge the 2 patches separately. As long as I know that patch 1/2
>>>> is queued for merging for say 6.11 then I can merge patch 2/2 independently
>>>> for the same cycle.
>>>
>>> Why don't you merge both of them with my ack for the silead.c?
>>
>> That works for me too, thanks.
>>
>> One challenge here is that I typically send out new touchscreen_dmi
>> entries as fixes. Are you ok with merging the silead change as a fix
>> too ?
> 
> Sorry, I am not sure what you mean here. Do you mean you do not want to
> wait for the next merge window and send it earlier?

Yes that is what I meant, sorry for not being clear.

> If so I'm fine with it.

Thank you.

Regards,

Hans


