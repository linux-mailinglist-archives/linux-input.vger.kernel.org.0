Return-Path: <linux-input+bounces-3076-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD428A6635
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 10:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A02D281680
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 08:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA433B78D;
	Tue, 16 Apr 2024 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GeZbOWaa"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5323B205E10
	for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713256528; cv=none; b=pgZJXfHQcnEGBXRupcEZGsoiPl3b0cgM8s1wmVV+T52w4G2WQXP2jw4SP6gdKSOsR9W7oi8skZPn31aeJTyjCHnRObQZFF7aATfpD1DhhmaN/c5IfT91a5muxejBDOTyJWpmtSNSYq3seDNYf/0UnkHIvzAO977UlrYRttz8Whs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713256528; c=relaxed/simple;
	bh=t96Grci89Hj3Fv+275ZZvzDuX9j3ZzLEJyheAvKRgig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYCRcMZd+AT8lkN7lomToftggJey0U1PZQt/iZ62QRMnejIY4D+q52lXKxzKrGOvPzTRWGw0QFC6aW6Jlk2v2wERLoo8R52XD+FPX4BLzVxQ39TG9sgCeKilozvlGaZVbXyEWS1Sl4qE2yOJgt/q/tP5GvuKCjVUgutXPlvJKLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GeZbOWaa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713256526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mqB42b0Dt4aCzlHrsBwMSNL2dlraPP0p7qf/q2hbpaA=;
	b=GeZbOWaa0OuiTv3Jw4PYOGGnKZ/TNW3kSosIDhVz1ujFU9i3wjQf0c079+HopAxgZkYZDa
	0vaqgUEhP+W4uDyd9QctRi2p6Hj9oHezSAv2Ftxu8sgY5BM6hYW3M/5fZJ76AP/G8ITxKB
	x+c2NdVetUpf++Z7eOiNaj7r130cFlo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-q5jQNqMxP8Gm0lwZrY2VBw-1; Tue, 16 Apr 2024 04:35:25 -0400
X-MC-Unique: q5jQNqMxP8Gm0lwZrY2VBw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5685d83ec51so2168911a12.3
        for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 01:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713256524; x=1713861324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqB42b0Dt4aCzlHrsBwMSNL2dlraPP0p7qf/q2hbpaA=;
        b=lndh32yK/apkaHebXWoXKlSk8LOXisfw+QzekNXfZvyqX/0txo9//r4FH+IuzppDVT
         jUqlcFbMCakxuqTlrSjKDQGy0vVQbLiNE4eBfCJRVvzJw3IZmYROnttfchhGDrwz2TyN
         0nTuwDHuGhXpxAWHTEMvDQfUl+RfryXgT5qfVPPYLiA8UNfOVvmlRkM8bJ1TES4KRik1
         Rik6zBjASEklclJHzRb/JYMEbsJbL+SKTtPJe88yILCdjhlmC5thvazqk1NuMyQ9ztBV
         g0PI87Uy/FIHaXu3M/jKjtdwwyYwcFgIrg/ueYKn0aG915isbatbGCD/lnCiTuOWjxe/
         0CjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCsSO6SGSEbEtIWsrVaO2fK0ocRXdDolzdiEFyeJIfuK6TKN5mtfGRXZY5MoqdVpP2vVGyijznZ8FgDO7OUKHIVxEymEzYGA66Sds=
X-Gm-Message-State: AOJu0YxcChxKkJPJXybJ9XkTv1docZiuCJYb+b5G8gDuL2U43Y7QWkx4
	/MqHd9trAR92hsvqCDMALuT7sNrAeJtrJ7c3ocUYUk+6DXdVBNzNN1Ps6XuR3bi7lgdlWjaa3/0
	aJ2mJroI7U2mggnBrvUcq5/r03HsGPvk0lM9TXJ1X7CJybn36ar/+56UmHXNB
X-Received: by 2002:a50:cd04:0:b0:56d:f637:451c with SMTP id z4-20020a50cd04000000b0056df637451cmr7419242edi.32.1713256523860;
        Tue, 16 Apr 2024 01:35:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH09YFiUxZaU1utW3PoJytxXwlh9BUF5b0iDmnwb9dAZxMMtiyt2VQVzkI0t44Hn5rRN+kOdQ==
X-Received: by 2002:a50:cd04:0:b0:56d:f637:451c with SMTP id z4-20020a50cd04000000b0056df637451cmr7419225edi.32.1713256523511;
        Tue, 16 Apr 2024 01:35:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n7-20020a056402434700b0056e66f1fe9bsm5766826edc.23.2024.04.16.01.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 01:35:23 -0700 (PDT)
Message-ID: <ab98ff25-2ab3-4ab6-ae46-84aef6369c3c@redhat.com>
Date: Tue, 16 Apr 2024 10:35:22 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Input: Add trackpoint doubletap and system debug info
 keycodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Peter Hutterer <peter.hutterer@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nitin Joshi1 <njoshi1@lenovo.com>, Vishnu Sankar <vsankar@lenovo.com>
References: <20240324210817.192033-2-mpearson-lenovo@squebb.ca>
 <ZhR-WPx7dgKxziMb@google.com>
 <f3342c0b-fb31-4323-aede-7fb02192cf44@redhat.com>
 <ZhW3Wbn4YSGFBgfS@google.com> <ZhXpZe1Gm5e4xP6r@google.com>
 <92ee5cb2-565e-413c-b968-81393a9211c4@app.fastmail.com>
 <ZhcogDESvZmUPEEf@google.com>
 <91593303-4a6a-49c9-87a0-bb6f72f512a1@app.fastmail.com>
 <Zh2CtKy1NfKfojzS@google.com>
 <484638e2-1565-454b-97f8-4fcc6514a69c@redhat.com>
 <Zh2G85df29tPP6OK@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zh2G85df29tPP6OK@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/15/24 9:58 PM, Dmitry Torokhov wrote:
> On Mon, Apr 15, 2024 at 09:50:37PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 4/15/24 9:40 PM, Dmitry Torokhov wrote:
>>> On Wed, Apr 10, 2024 at 10:48:10PM -0400, Mark Pearson wrote:
>>>>
>>>> I have a stronger preference to keep the KEY_DOUBLECLICK - that one seems less controversial as a genuine new input event.
>>>
>>> Please see my response to Peter's letter. I think it very much depends
>>> on how it will be used (associated with the pointer or standalone as it
>>> is now).
>>>
>>> For standalone application, recalling your statement that on Win you
>>> have this gesture invoke configuration utility I would argue for
>>> KEY_CONFIG for it.
>>
>> KEY_CONFIG is already generated by Fn + F# on some ThinkPads to launch
>> the GNOME/KDE control center/panel and I believe that at least GNOME
>> comes with a default binding to map KEY_CONFIG to the control-center.
> 
> Not KEY_CONTROLPANEL?

No when this was added most distros were still using X11 not Wayland so
it was preferable to use KEY_foo symbols with codes below 240.

> Are there devices that use both Fn+# and the doubleclick? Would it be an
> acceptable behavior for the users to have them behave the same?

That is a good question, at least my current ThinkPad does not have
the Fn + F## combo for the control center anymore. So I guess we could
indeed re-use KEY_CONFIG for the double-tap.

Regards,

Hans



