Return-Path: <linux-input+bounces-80-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9FD7EE565
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 17:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BDE11F25122
	for <lists+linux-input@lfdr.de>; Thu, 16 Nov 2023 16:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FB934574;
	Thu, 16 Nov 2023 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eYo1zzPJ"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9948EB7
	for <linux-input@vger.kernel.org>; Thu, 16 Nov 2023 08:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700153209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzI8Lj1/9iT+PCxe2faEIlZsP1wHe9N89YPTOooiVwM=;
	b=eYo1zzPJ85wMVjVKUKAVeGMO7jyVfv57si2ndCQWAs7lXotxmgzlxeVrKDxy9mujeYRQsF
	9UBEx3fb74u5MGnqw8s8AAfdmDnaL9OoxPNmfyi7sBwREtjJxJOYCYkxD5ft9suKJn5hAJ
	TkDDhqeJCun+5iMMqKLKe+llq9HyRLM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-XDyRnAWxMimuxrFoz-O1MQ-1; Thu, 16 Nov 2023 11:46:48 -0500
X-MC-Unique: XDyRnAWxMimuxrFoz-O1MQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2c503af866dso8599681fa.2
        for <linux-input@vger.kernel.org>; Thu, 16 Nov 2023 08:46:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700153207; x=1700758007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzI8Lj1/9iT+PCxe2faEIlZsP1wHe9N89YPTOooiVwM=;
        b=WK1UqcSVCM+D2KytHGWN4pvGv/24zFM9ZjTyCtblybcjplzpSDBnI0Xd8RhDaXSYPW
         kLfdwyUbEEiwrlVjFBfkbgiicNKyYHzQyUT8BdpIqOw29eCMfMcIBxzGFd5OLCqAUQ4Z
         5ZSujf0dbuyao2S6EbSlh8Xru9wd8D277OSjLOBLcZY0EqByA53kSEXw1+9SnIm3wEDj
         b7aunytW39eoKweMrqpIPnuaU7vVyuJyZ4fx6ZNKeNS2hmx6if/8A6gZCtAmJjT9UFmX
         i7T1hg7EpDEm9F0OQU4z7ff42sb1G+W5Zxz67JzLBnNVWTM1GTmPfbXRoMDZp5x99Rf0
         H3yA==
X-Gm-Message-State: AOJu0YyEf0an4aDA7zr5p/3r22HF9+V+kMbOL/728kRYXZiIqNXndOoC
	qXNICgD7+3V/P/1Py4BKbDrtqbxdFbdGcdY0GQagdgdPf8KNtJ/vWXqpd61CEKVHYsQ2XNn+F70
	FUMk8NgcXQ81D1wZI+VVUptg=
X-Received: by 2002:a05:6512:3da6:b0:50a:7868:d3c0 with SMTP id k38-20020a0565123da600b0050a7868d3c0mr2734831lfv.23.1700153206934;
        Thu, 16 Nov 2023 08:46:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDN4P4yLZBOiQTKcK27l5+Y7ob2sSec+bl+8jxs7M0/XhR1+sNxMl6znkDvh238ypXRjyzUA==
X-Received: by 2002:a05:6512:3da6:b0:50a:7868:d3c0 with SMTP id k38-20020a0565123da600b0050a7868d3c0mr2734810lfv.23.1700153206617;
        Thu, 16 Nov 2023 08:46:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id la7-20020a170906ad8700b009e67122edd6sm8594104ejb.79.2023.11.16.08.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 08:46:45 -0800 (PST)
Message-ID: <ece62b22-189f-4e33-89c0-9bff503940ed@redhat.com>
Date: Thu, 16 Nov 2023 17:46:44 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] HID: i2c-hid: Rework wait for reset to match Windows
To: Julian Sax <jsbc@gmx.de>
Cc: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Douglas Anderson <dianders@chromium.org>, ahormann@gmx.net,
 Bruno Jesus <bruno.fl.jesus@gmail.com>, Dietrich <enaut.w@googlemail.com>,
 kloxdami@yahoo.com, Tim Aldridge <taldridge@mac.com>,
 Rene Wagner <redhatbugzilla@callerid.de>,
 Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org
References: <20231104111743.14668-1-hdegoede@redhat.com>
 <94818595-be2d-4cba-bd82-1585b8d11fed@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <94818595-be2d-4cba-bd82-1585b8d11fed@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/8/23 21:41, Julian Sax wrote:
> 
> Am 04.11.23 um 12:17 schrieb Hans de Goede:
>> Julian, I've added you to the Cc because you developed the code
>> for touchpads where the HID report descriptors are missing and are
>> provided by the kernel through a DMI quirk. The behavior for these
>> touchpads should be unchanged, but if you can test on a laptop
>> with such a touchpad that would be great.
>>
> 
> Hi Hans,
> 
> I just tested the touchpad with these patches, everything still works fine.

That is good to hear, thank you for testing.

Regards,

Hans



