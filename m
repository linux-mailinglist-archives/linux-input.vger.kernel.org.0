Return-Path: <linux-input+bounces-2593-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7483C88E6D7
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 15:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15B791F2EBDB
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 14:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FC5157E9E;
	Wed, 27 Mar 2024 13:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="df/7DgX4"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6013BC3A
	for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711546334; cv=none; b=hvs0vpRkodXk7f9G2MZBDBXcl4cs+nwM/ftsExvQj4kil7+HlumBgn8uZP7dZnWaT5cOwWnJsDn9XjRCugEX2jc/CtntGcj88SF/gh0i743D6GL/vK0kbZCe0HWirkAF1il7cM829KLBZb6tBomEHUEGcOLN/ZuGGBIYvM9jxyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711546334; c=relaxed/simple;
	bh=K0UVZINUhSSLxdNU4wwBE/T+FEz46ODAQKkZL3ADYrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ut9r2z1nYAbCC8p36AAwf8QgtJ2xomZU53Ci9werKmx2TzAE192fk2wrAo1+PwPF0Vhv/djNbCR/gqaLOMrXwy452vbCqJkl6fd3llOVGOy/kaJEOfiSadK+S6gUdv+c47ngkNmVgJsSartDASfQW7g5pXvzfckSKcnvTxhO3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=df/7DgX4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711546331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jD3Utmle+bis7mmdPw9AquqAmC1o8mQyHmUQiw/WEzk=;
	b=df/7DgX4aTiAuA+JAj2tG6lVWAV68slnmgNzVKrmQG6jhUh5Mx53DO1djxuzUqoIoJpRdZ
	DVmQJYFXTw/OSV//gs0x/8prhF6ZiHRlt3C6ylvTQRvk+SEmlP8UhagE6HY5f5PDqyBj04
	DKQLnAFR3HLLDoNeoNE6D0kI3MuMWrk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-ugYl10N3OmupQprXlUYryg-1; Wed, 27 Mar 2024 09:32:10 -0400
X-MC-Unique: ugYl10N3OmupQprXlUYryg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a45acc7f07cso375502966b.2
        for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 06:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546329; x=1712151129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jD3Utmle+bis7mmdPw9AquqAmC1o8mQyHmUQiw/WEzk=;
        b=fbVb14ZJK/XTduJrjbCl9E4zgG0VxQ/vEESN4ydpK2ACtxM3oYCLMm2+OlfA/T48o6
         sUUcyeJj0F4qGvafeTmkCxc5kNgt8hSfG+dtAE+vDWzkdxnJKXjn9c8RMS9IOAS/oTy3
         d8DZjR4Q43Qu71VX6fPAUBDCkuEGmVONgcy3Mk/OUXVJ73/OI2D8BQQoLbz+hhinhtK6
         VvaThbNzrN7xdy+VSz8H9gZFIWYdOs148C5vBZ3QIC0UT4NTrO7FIAAa8Mx3jh5C+C7z
         lTclzFu4NRPqN6uHDKdDGmWt1uHA4tpwSns2kMfGYn7ZYlqToqooIYaXXEcmVFe28q4H
         LEnA==
X-Forwarded-Encrypted: i=1; AJvYcCVDeUlyOYpKBIPaqO/6Mukt4soMcLL0lRS7cXgvN0kGSfIAbbrQoYzkNkS0sAmvbG8dJGiUJ52uoVjYZsY6/yFzQEKfaUa8kWOoBrw=
X-Gm-Message-State: AOJu0Yzbc3YBBcjYAVWrimQoJvY+QpRNyC0J89QsFN6nqtDDFr2Nz4qp
	Ml8r93XrALlORqFtOZ4DQ385LkRwhutjrSwNkwwkaxc1Mg2q0W2uOHw5F9R1w76ZbX8WpJah+5/
	om9s7ZihSpv0fxopgtLrhQW2G/MnS3UYvsyCK1hz2dIpXP1glybkwFGd/lv0V
X-Received: by 2002:a17:907:7206:b0:a4d:fe2f:a70b with SMTP id dr6-20020a170907720600b00a4dfe2fa70bmr2448985ejc.41.1711546329067;
        Wed, 27 Mar 2024 06:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGdhqFLAf1gKN0Y/NZQvk+kIH5rUrJ00j88K5l/PrX7PEX8pYP+EIH8Lg2tXiyjUb+BEqFQQ==
X-Received: by 2002:a17:907:7206:b0:a4d:fe2f:a70b with SMTP id dr6-20020a170907720600b00a4dfe2fa70bmr2448827ejc.41.1711546326567;
        Wed, 27 Mar 2024 06:32:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q2-20020a1709060e4200b00a4674ad8ab9sm5383406eji.211.2024.03.27.06.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 06:32:06 -0700 (PDT)
Message-ID: <cbd6cf18-cdfe-409f-82f0-de46d2fe08ca@redhat.com>
Date: Wed, 27 Mar 2024 14:32:05 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] ACPI: store owner from modules with
 acpi_bus_register_driver()
Content-Language: en-US, nl
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
 Daniel Oliveira Nascimento <don@syst.com.br>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Matan Ziv-Av <matan@svgalib.org>,
 Mattia Dongili <malattia@linux.it>, Azael Avalos <coproscefalo@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>,
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev,
 platform-driver-x86@vger.kernel.org
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
 <CAJZ5v0hEiKJJWn-TVoyL6DEbCcMpL39_q+HLG_YZyjf9g29CXA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0hEiKJJWn-TVoyL6DEbCcMpL39_q+HLG_YZyjf9g29CXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

<sorry for the empty previous reply, my bad>

On 3/27/24 2:16 PM, Rafael J. Wysocki wrote:
> On Wed, Mar 27, 2024 at 8:44 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> Merging
>> =======
>> All further patches depend on the first amba patch, therefore please ack
>> and this should go via one tree: ACPI?
>>
>> Description
>> ===========
>> Modules registering driver with acpi_bus_register_driver() often forget to
>> set .owner field.
>>
>> Solve the problem by moving this task away from the drivers to the core
>> amba bus code, just like we did for platform_driver in commit
>> 9447057eaff8 ("platform_device: use a macro instead of
>> platform_driver_register").
>>
>> Best regards,
>> Krzysztof
>>
>> ---
>> Krzysztof Kozlowski (19):
>>       ACPI: store owner from modules with acpi_bus_register_driver()
>>       Input: atlas: - drop owner assignment
>>       net: fjes: drop owner assignment
>>       platform: chrome: drop owner assignment
>>       platform: asus-laptop: drop owner assignment
>>       platform: classmate-laptop: drop owner assignment
>>       platform/x86/dell: drop owner assignment
>>       platform/x86/eeepc: drop owner assignment
>>       platform/x86/intel/rst: drop owner assignment
>>       platform/x86/intel/smartconnect: drop owner assignment
>>       platform/x86/lg-laptop: drop owner assignment
>>       platform/x86/sony-laptop: drop owner assignment
>>       platform/x86/toshiba_acpi: drop owner assignment
>>       platform/x86/toshiba_bluetooth: drop owner assignment
>>       platform/x86/toshiba_haps: drop owner assignment
>>       platform/x86/wireless-hotkey: drop owner assignment
>>       ptp: vmw: drop owner assignment
>>       virt: vmgenid: drop owner assignment
>>       ACPI: drop redundant owner from acpi_driver
> 
> I definitely like this, so
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> for the series and I can pick it up if people agree.

Thanks all the drivers/platform/x86/* change look good
to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

And I'm fine with merging these through the linux-pm /
ACPI tree.

Regards,

Hans




