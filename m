Return-Path: <linux-input+bounces-2592-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF8788E6D0
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 15:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AA3A2E1FC0
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 14:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1B913C3C6;
	Wed, 27 Mar 2024 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WJ3RnOI8"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7732213BC2E
	for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 13:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711546251; cv=none; b=YqTAKkrtFLjIxzGCvJdPWwPRWhQ7Sqzk149qqGmMxvWWJKBux5LjCqb83IBAgfcqv0/J03JG1GS0AAUCj/+IURo9hK5TdxfjSFaQ3xRu7hnIv+S8tfH/7SumcO8acgYV4p+AoLTU1k7V0oy4mEZ5bUo9V9MkxyNgsLjt/fUQ1yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711546251; c=relaxed/simple;
	bh=0XY9//HMaNHTRAMknvvS4g417tWnY3ABPrd/afaOHBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cKAfhSOMupYDD8OYnmdR5Tv2dkVc/wJU3KCcPddYN1T1UqpAd9gDvTyb0AvXsfG4BwRqvXmvcdsjxb3gCuIhxi9+0xOxwahFkB0f3/LFv0mgsfrL0XEcI/3lkKS1t6SHu59f0lpB6DK4/7tLKoOJatk2jBz34NAXNJcVmyHUqQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WJ3RnOI8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711546248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLg38MFVhLXh0D5Ryy6sGfzcGNzaaaxhoktXDmAvMEQ=;
	b=WJ3RnOI86/sAHWAMgdQqLrMelD/t6XEAckeoelj8QBm91qy5NU+vsN7633SgriEFzcAgpu
	49OLRrd0n6XN7OqyRfFxgkebOUIRlojOjbNIfOpmnbNqVnIFEuO6YhEdmTBiQ+m7rZJ7Pb
	sDPoociN0YtKSPkXDCc/x+PAqojvRJ4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-iUIZ92xZMNW49xykteLIEQ-1; Wed, 27 Mar 2024 09:30:46 -0400
X-MC-Unique: iUIZ92xZMNW49xykteLIEQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a46bae02169so82229566b.1
        for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 06:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711546245; x=1712151045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLg38MFVhLXh0D5Ryy6sGfzcGNzaaaxhoktXDmAvMEQ=;
        b=NnzoEnfAK+4H6Z6+yLD5qx8Tz/I4OOyDhq2+GNkErh2F2IY4vjsy35ARsaE+Qk0PNG
         GGN6ne2yn9QVRVMLcAFIzSZn+vNrTIzkGpXNQQuLzatDX1NrMseORLfmAqeYkz+Q1zFI
         VLXlwELasvR0IbkOBYeGRzxgFVCL4lmH5MjZWxCBDvyhrpVEXEgYQO012nU7V/vqwiFi
         d+3w/QrHIoyFyyPFWZ0mHOosNzuzARZP3HcOsh7mP8Ylq0QrBC7SExjYcryWrSgYemT3
         nyh9f021WeO0eaGZK3V5uQs4tBaKrEN/4S9Yt3yWMtmsUaLsLRWmJXf1EQ8zmlt/3N7U
         n9/A==
X-Forwarded-Encrypted: i=1; AJvYcCU0w3+EoXEdQdw+q/rYIPb8ireHdBji14lyMjt/xMMaASdyehV5+y6Wy6xZI3FEZHuBLrmQB2i00uUKYMtDsECX6FPSsFu5xT+hINQ=
X-Gm-Message-State: AOJu0YwgSsYCqTPOhD12HX6q7xNi9qlp1SV5waEFrELP5eCAaomWnCox
	x9XJ62XWwPcHiRQRd6bKXujTf5RO9cZzy/50nuIOqDfPG94b+s2TnlngFRQiJ0Unsr/Abblo8/R
	xrxR/0hgJg/zE9SKQnTP5Q1wsC7om3knYYwFPw2lRxOHZGRC2E8AJ0hatY5Rf
X-Received: by 2002:a17:906:4552:b0:a4e:ca2:f597 with SMTP id s18-20020a170906455200b00a4e0ca2f597mr464560ejq.30.1711546245269;
        Wed, 27 Mar 2024 06:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxMNQa6I7wHwsl8AheMWybiN2BzRa3S3xpZTZlv2r8DjsDL3nA8c8TtS4ntqPeWCUGEfcy9w==
X-Received: by 2002:a17:906:4552:b0:a4e:ca2:f597 with SMTP id s18-20020a170906455200b00a4e0ca2f597mr464548ejq.30.1711546244934;
        Wed, 27 Mar 2024 06:30:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q2-20020a1709060e4200b00a4674ad8ab9sm5383406eji.211.2024.03.27.06.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 06:30:44 -0700 (PDT)
Message-ID: <7a7d7216-ae22-4908-af63-6b1dd96359dd@redhat.com>
Date: Wed, 27 Mar 2024 14:30:43 +0100
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


> 
> Thanks!
> 


