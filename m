Return-Path: <linux-input+bounces-1188-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3CE82859F
	for <lists+linux-input@lfdr.de>; Tue,  9 Jan 2024 12:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 225951F256E5
	for <lists+linux-input@lfdr.de>; Tue,  9 Jan 2024 11:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBAC381D0;
	Tue,  9 Jan 2024 11:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFqIMeLf"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280CD374DA
	for <linux-input@vger.kernel.org>; Tue,  9 Jan 2024 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704801495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A46ZABusnuPby4jfDWsq1H+YiDfFZvDkeQGqnfkjvNE=;
	b=UFqIMeLfPr2WV5wJHEvTDG34eGhnDFY0XYniDsYYf3FoQifnBxhScnyVv3qTQks1RQVwRH
	vj5yd9p0o0vZLIEFp7fI4pHlJ4oarK7r/InMFcsNu/d4YDuXGybKiB5r+hMh3oVDm4Hfu6
	jRIAKxdLWagIFlHYMAZzIRg/3c/jOYI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-lO8LdvsLNX2dc3SnAavJJg-1; Tue, 09 Jan 2024 06:58:13 -0500
X-MC-Unique: lO8LdvsLNX2dc3SnAavJJg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a28f0137fd9so137812966b.2
        for <linux-input@vger.kernel.org>; Tue, 09 Jan 2024 03:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704801492; x=1705406292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A46ZABusnuPby4jfDWsq1H+YiDfFZvDkeQGqnfkjvNE=;
        b=o5XUdiAKkCjIKEb8FzT+hXleJGftUL1U6ACxAGB3VzEBEuRmktc6zhUNN+Fj2xsPce
         zcAh2oODdRpOVCQEYxDHVWbCJPX6B5pZ8JPm8olFOVHO5p/F2dXP7iHa1mj2MHries5v
         dV3TH6dQnVkHj5GhKJMCd90RmJiAAbOn9djWauTzzqp1TBQxxg4QuFHpsiMuaEG5ouVD
         9H1aFZXMA4UIIlhBlGa7zfkpR7F/x8uIRXBjO09GAerI02HQQCbL7UW/niJa0966KAsp
         myZBhif5rP3f/3oag0mRcondb78ASAuI4KkosU1gvH3oLeu2J/st15ROrJVnJ2RFFLSw
         UbMg==
X-Gm-Message-State: AOJu0YzGy9vq0c8lbRgYsBntHIM2z8XcFs7hK9pjA0HdLuAQYX3D/pLp
	EkYrNnin3FNIqufrYOINEl5xGKBP5Htk0sDI9J2jUH+m6wm6IGrjj6xEXo1lR5kmi9iw8TJORBC
	dQu4xfKp5AqsO2KucL0mFfg+pn8hE5vQBT1W9Mp4=
X-Received: by 2002:a17:906:2318:b0:a26:84d8:9411 with SMTP id l24-20020a170906231800b00a2684d89411mr397725eja.128.1704801492357;
        Tue, 09 Jan 2024 03:58:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUPUo3Hf8NYwcxCCtWDmcKKsI+mhttPHlNo0mn1ibzA/uXwyGd+oIvo4cIgDpDnrlGV35e5Q==
X-Received: by 2002:a17:906:2318:b0:a26:84d8:9411 with SMTP id l24-20020a170906231800b00a2684d89411mr397712eja.128.1704801492005;
        Tue, 09 Jan 2024 03:58:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lf8-20020a170907174800b00a2a360d719fsm959961ejc.221.2024.01.09.03.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 03:58:11 -0800 (PST)
Message-ID: <824573bb-ae01-41b9-8f97-a760ae8f3f18@redhat.com>
Date: Tue, 9 Jan 2024 12:58:10 +0100
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3277085.44csPzL39Z@natalenko.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 1/9/24 12:45, Oleksandr Natalenko wrote:
> Hello Hans et al.
> 
> Starting from v6.7 release I get the following messages repeating in `dmesg` regularly:
> 
> ```
> Jan 09 10:05:06 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: Disconnected
> Jan 09 10:07:15 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: Disconnected
> Jan 09 10:16:51 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
> Jan 09 10:16:55 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
> Jan 09 10:16:55 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
> Jan 09 10:36:31 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: Disconnected
> Jan 09 10:37:07 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
> Jan 09 10:46:21 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: Disconnected
> Jan 09 10:48:23 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: Disconnected
> Jan 09 11:12:27 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
> Jan 09 11:12:47 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
> Jan 09 11:12:47 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
> Jan 09 11:38:32 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: Disconnected
> Jan 09 11:43:32 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: Disconnected
> Jan 09 11:45:10 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
> Jan 09 11:45:11 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
> Jan 09 11:45:11 spock kernel: logitech-hidpp-device 0003:046D:408A.0005: HID++ 4.5 device connected.
> Jan 09 12:31:48 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: Disconnected
> Jan 09 12:33:21 spock kernel: logitech-hidpp-device 0003:046D:4051.0006: HID++ 4.5 device connected.
> ```
> 
> I've got the following hardware:
> 
> * Bus 006 Device 004: ID 046d:c52b Logitech, Inc. Unifying Receiver
> * Logitech MX Keys
> * Logitech M510v2
> 
> With v6.6 I do not get those messages.
> 
> I think this is related to 680ee411a98e ("HID: logitech-hidpp: Fix connect event race").
> 
> My speculation is that some of the devices enter powersaving state after being idle for some time (5 mins?), and then wake up and reconnect once I touch either keyboard or mouse. I should highlight that everything works just fine, it is the flood of messages that worries me.
> 
> Is it expected?

Yes this is expected, looking at your logs I see about 10 messages per
hour which IMHO is not that bad.

I guess we could change things to track we have logged the connect
message once and if yes then log future connect messages (and all
disconnect messages) at debug level.

Jiri, Benjamin, do you have any opinion on this ?

Regards,

Hans




