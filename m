Return-Path: <linux-input+bounces-1530-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA70840AD4
	for <lists+linux-input@lfdr.de>; Mon, 29 Jan 2024 17:09:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A514284237
	for <lists+linux-input@lfdr.de>; Mon, 29 Jan 2024 16:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF9E15530D;
	Mon, 29 Jan 2024 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RLixhlyd"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC31D1552E9
	for <linux-input@vger.kernel.org>; Mon, 29 Jan 2024 16:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706544544; cv=none; b=n9qUUH/qMrQ3Ns30KaSmNNh/+kdypOWuEjCcWMIUUsueIi5DeRP6acmW32x0jpErq7L1cD0juebBDJ/xKPL9+QrW6zFcetcPJeNbBgHTfZLcNdbA+qTUSvu5LUcY/fqukGbR2uRoDSwxp5PQqSy1WlSv3r+6JSuzpU5y60dtdNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706544544; c=relaxed/simple;
	bh=brNShbY1URR80bnYQB5chJ2H/a+e1UzLa9Lt+2tAP7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvehZWAiAZSXHxvwRDhzaEHKhE1ktBpM3PBHPh6sLXh29cA/2JvGc5rU8FtdZrnawtAjRxjzjJ1rq69C7fBDfuuys7Rpmh7ZoOkKtlKxpK3pJ17P1qAGBLBRCkLivEtVz+C3vWb8jE8sjrZ+EaFEiyeBpjIcenRl/VvgtB5rI/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RLixhlyd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706544541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X5W1qbZBNKXcGMEWcUwU6tCp2DojQquTsGFStiKEOGg=;
	b=RLixhlydkCjQymKIYisuH26BC/qQ4HwUPq5IzjrePDLe3nCzRxazNwNySDBFKAkkIRe1wQ
	UqaxWpMhXw+byg/1zlRbJFjxDar4YjdGD3PLUYNF7FfUD5i2WVKt47OoSds/liBz6Qv2tZ
	edJzv7EZUL81nZ/4SMkCkRaR6jUiSHk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-GhgpA67yNieVWeFfzSobXg-1; Mon, 29 Jan 2024 11:08:59 -0500
X-MC-Unique: GhgpA67yNieVWeFfzSobXg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a35118e98caso193748966b.0
        for <linux-input@vger.kernel.org>; Mon, 29 Jan 2024 08:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706544538; x=1707149338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5W1qbZBNKXcGMEWcUwU6tCp2DojQquTsGFStiKEOGg=;
        b=YoLQK6GuIjnDcGXjJZszlJJq1V5bH+0ORBo3BSDFKJ1NMWw4MV/tIegUIpJsEMlBFh
         gidLXr++b7h/y/plIOWB3Wq2EnPN8mCENimUPDBEaddtpQz+mOYpCfNWtmustoO/4NmU
         NR0Zk/l5/fO92euNmWSHlGwHvwC8rh9p3u0uFzIPkt1uk5CGaFr+b6g6WQSdLEEX9DHu
         UF9yuhY2OrPGJbg+spnCIY59T8xtSyMX8thb7HAgbWoSa3O7GDTlDC1EEn8PvNQfLbx3
         Xwe/z1U9/FPR9Ot+Y+RskKCHX32765mr+5nwdb77bTQ/euyyTLFQxSakWkAk8ZMS7bMh
         JPtA==
X-Gm-Message-State: AOJu0Yx1LQuTAk9Tdj8JNQE7QEeDjcsIYKsL3XsTj1o0PvsbDCPv9GK2
	fAMSKbQf/+w6ElcM0Kmcv2Jrha8RvJ/eacnqZjplARw3JqFCWPNKY1tMK1tclDFn1vWu7aZrdzP
	6x1bouGTBzw0raVmHJdz7NLCwX9CMPHmUzsp3PF15u8CsZnyGJMjR70yxBVyO
X-Received: by 2002:a17:906:454d:b0:a31:29fc:6ef2 with SMTP id s13-20020a170906454d00b00a3129fc6ef2mr5414501ejq.41.1706544538772;
        Mon, 29 Jan 2024 08:08:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkIHRlvL3buruk+ngVpL4Wj2pJau+nBMDRcpkE7IrDFhAt5CI+tBrL4Hw9MtiFz2S9ga2IDQ==
X-Received: by 2002:a17:906:454d:b0:a31:29fc:6ef2 with SMTP id s13-20020a170906454d00b00a3129fc6ef2mr5414485ejq.41.1706544538460;
        Mon, 29 Jan 2024 08:08:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ti7-20020a170907c20700b00a3294cafba6sm4072499ejc.109.2024.01.29.08.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 08:08:57 -0800 (PST)
Message-ID: <489d6c71-73eb-4605-8293-5cfea385cf08@redhat.com>
Date: Mon, 29 Jan 2024 17:08:56 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Flood of logitech-hidpp-device messages in v6.7
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, =?UTF-8?Q?Filipe_La=C3=ADns?=
 <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <3277085.44csPzL39Z@natalenko.name>
 <824573bb-ae01-41b9-8f97-a760ae8f3f18@redhat.com>
 <12371430.O9o76ZdvQC@natalenko.name>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <12371430.O9o76ZdvQC@natalenko.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/29/24 16:58, Oleksandr Natalenko wrote:
> Hello.
> 
> On úterý 9. ledna 2024 12:58:10 CET Hans de Goede wrote:
>> Hi Oleksandr,
>>
>> On 1/9/24 12:45, Oleksandr Natalenko wrote:
>>> Hello Hans et al.
>>>
>>> Starting from v6.7 release I get the following messages repeating in `dmesg` regularly:
>>>
>>> ```
>>> Jan 09 10:05:06 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: Disconnected
>>> Jan 09 10:07:15 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: Disconnected
>>> Jan 09 10:16:51 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
>>> Jan 09 10:16:55 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
>>> Jan 09 10:16:55 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
>>> Jan 09 10:36:31 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: Disconnected
>>> Jan 09 10:37:07 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
>>> Jan 09 10:46:21 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: Disconnected
>>> Jan 09 10:48:23 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: Disconnected
>>> Jan 09 11:12:27 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
>>> Jan 09 11:12:47 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
>>> Jan 09 11:12:47 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
>>> Jan 09 11:38:32 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: Disconnected
>>> Jan 09 11:43:32 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: Disconnected
>>> Jan 09 11:45:10 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
>>> Jan 09 11:45:11 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
>>> Jan 09 11:45:11 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
>>> Jan 09 12:31:48 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: Disconnected
>>> Jan 09 12:33:21 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
>>> ```
>>>
>>> I've got the following hardware:
>>>
>>> * Bus 006 Device 004: ID 046d:c52b Logitech, Inc. Unifying Receiver
>>> * Logitech MX Keys
>>> * Logitech M510v2
>>>
>>> With v6.6 I do not get those messages.
>>>
>>> I think this is related to 680ee411a98e ("HID: logitech-hidpp: Fix connect event race").
>>>
>>> My speculation is that some of the devices enter powersaving state after being idle for some time (5 mins?), and then wake up and reconnect once I touch either keyboard or mouse. I should highlight that everything works just fine, it is the flood of messages that worries me.
>>>
>>> Is it expected?
>>
>> Yes this is expected, looking at your logs I see about 10 messages per
>> hour which IMHO is not that bad.
>>
>> I guess we could change things to track we have logged the connect
>> message once and if yes then log future connect messages (and all
>> disconnect messages) at debug level.
> 
> How granular such a tracking should be? Per-`struct hidpp_device`?

Yes per struct hidpp_device we want to log the connect message once
per device since it gives info which might be useful for troubleshooting.

> Should there be something like `hid_info_once_then_dbg()` macro, or open-code it in each place instead?

Since we want something like e.g. a "first_connect" (initialized
to true if you use that name) flag per struct hidpp_device this needs
to be open coded.

Regards,

Hans





