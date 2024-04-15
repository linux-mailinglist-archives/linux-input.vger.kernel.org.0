Return-Path: <linux-input+bounces-3050-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7158A5B9D
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 21:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A07431F248D0
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 19:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AC515E7E8;
	Mon, 15 Apr 2024 19:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2LAOe0c"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0705315E5B7
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 19:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713210437; cv=none; b=rc1AAlq31iEZj19o8cE9M8l1fvCCwzHOwpc8yeG4i9jDMTYHJCqUqxvwF2pD0cqyBa2/w0WnLRLU4tw1vMWRoCIH45Gnl4y4wfLXe8w30V2tVcdW5/5p2hp4jmVvCKy56A7DEfn9uo0g40Bvg3QEEitSjkhhetcUH48FjaRhDDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713210437; c=relaxed/simple;
	bh=zyecQNa3ROhvJFy5hmNzvTxC0BcQbh3484pUPgoAsDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vBQC21+V1ldkYWZZw9eMY0BVRpQ462l9RMhs6686BiVXdk2jluiv++0dHFLJCC7wd5BhH/xB6FzUXOfr+cfo0EiUVWJAMRhskBTgetIF4FtDm0trhpVGkcLJ3gp/hZYqYESQAdJ+T2DNeyjFB3j4omgAbKHvMUKMcqgzDNNBkQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D2LAOe0c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713210434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l+auaIR8KnfST7jWNI6APpY7sl3sBclpIuI6WlLR8ts=;
	b=D2LAOe0ceZDFQbML4/1f10B+Oc9s5yJKf9eCiuWLmHRlqd5DrvgS4zI+Hgoi2wE/d7yFit
	yHQZSUo6Ard+OWvKCVpX0oL4SFByvjMOD6SD2bvgXRN6r5dGTKG6w9cT0O2rDfdnCt4S5c
	z1KB/iLldrWX98hGrflqdVeAs+ypWhI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-OS8MD5_9OLSlxfz9_GdXcQ-1; Mon, 15 Apr 2024 15:47:13 -0400
X-MC-Unique: OS8MD5_9OLSlxfz9_GdXcQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-343d02b62ddso2318593f8f.1
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713210432; x=1713815232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+auaIR8KnfST7jWNI6APpY7sl3sBclpIuI6WlLR8ts=;
        b=wH3v7JQjd2g9rtwzxGwBqNxXl4qMC+79oE+CVYLtYf5MOKFAC7N1yN2WSwbtyN5Y8j
         +6t8uX/DMqxsFFuMD7044fZc13MCfMA7EzjcrxJh6an+VG+hTvnx/qCn81aox/ElnxH6
         5L+PqcUNPv3ilBcosOkqCg0kWWI+qDZOSH1pNRPYMHBQqK4vycQnozF94BmY5q2TAOgS
         JLASF+dRyidpBuQiqCSfXLilLTA+TqksMb+wP+ytiNWxR6KcCshPzqIdAWGqyf3San5F
         fn6XsFXa1ZcFF+eqHpK2ixwebiFOJnSQD4vabm+GFkD+yOkc+jZO14HBp9ztE/ugo4wi
         qjTw==
X-Forwarded-Encrypted: i=1; AJvYcCX5w62vZWw+LbCJdIv64SlqOUSkNORRunGGrMGBPEHfsRQaBu1Kqph/htR6i95VjibqtcVWaPhl6vAoQH/uu4oW/FfW6IKrMXQLnv0=
X-Gm-Message-State: AOJu0YxFSWvJnjb+0ebZKv/PsiKvaYJKZJCt8q3ePGoJAM5z0PUsvaEE
	ISNY2p7LdBqG6+T9nBhLd8PJYXRslq8H3ucNDxv52v/Q7nadMsTxVRGaMYmlqJ1fUF48GsMrLWc
	FynCgsqWOkRJhTiD28j7Yii8mTYS+pQ0nuLx0CBtoBqGXgloSuyiGXTLgYS7N
X-Received: by 2002:adf:ec47:0:b0:346:addc:18aa with SMTP id w7-20020adfec47000000b00346addc18aamr6227040wrn.25.1713210431956;
        Mon, 15 Apr 2024 12:47:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSiegi5oWZeNbSL8UnLpfTuvyZ4kklxtAsgUvoQ3OWmjNBGLVquT2kX+rNRJrVhftTZ5265Q==
X-Received: by 2002:adf:ec47:0:b0:346:addc:18aa with SMTP id w7-20020adfec47000000b00346addc18aamr6227026wrn.25.1713210431562;
        Mon, 15 Apr 2024 12:47:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o17-20020a1709061b1100b00a525492801dsm3168309ejg.119.2024.04.15.12.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 12:47:11 -0700 (PDT)
Message-ID: <15507b66-723d-443c-aaae-c0097d16ef0a@redhat.com>
Date: Mon, 15 Apr 2024 21:47:10 +0200
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
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-2-mpearson-lenovo@squebb.ca>
 <ZhR-WPx7dgKxziMb@google.com>
 <f3342c0b-fb31-4323-aede-7fb02192cf44@redhat.com>
 <ZhW3Wbn4YSGFBgfS@google.com> <ZhXpZe1Gm5e4xP6r@google.com>
 <92ee5cb2-565e-413c-b968-81393a9211c4@app.fastmail.com>
 <ZhcogDESvZmUPEEf@google.com>
 <411e6353-16ef-455b-98fa-2d38bb7bf9bd@redhat.com>
 <Zh2BiqQdM7_n-Ih4@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zh2BiqQdM7_n-Ih4@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/15/24 9:35 PM, Dmitry Torokhov wrote:
> On Thu, Apr 11, 2024 at 02:30:35PM +0200, Hans de Goede wrote:
>> Hi Dmitry,
>>
>> On 4/11/24 2:02 AM, Dmitry Torokhov wrote:
>>> On Tue, Apr 09, 2024 at 10:17:05PM -0400, Mark Pearson wrote:
>>>> Hi Dmitry
>>>>
>>>> On Tue, Apr 9, 2024, at 9:20 PM, Dmitry Torokhov wrote:
>>>>> On Tue, Apr 09, 2024 at 02:47:05PM -0700, Dmitry Torokhov wrote:
>>>>>> On Tue, Apr 09, 2024 at 03:23:52PM +1000, Peter Hutterer wrote:
>>>>>>> On 09/04/2024 09:31, Dmitry Torokhov wrote:
>>>>>>>> Hi Mark,
>>>>>>>>
>>>>>>>> On Sun, Mar 24, 2024 at 05:07:58PM -0400, Mark Pearson wrote:
>>>>>>>>> Add support for new input events on Lenovo laptops that need exporting to
>>>>>>>>> user space.
>>>>>>>>>
>>>>>>>>> Lenovo trackpoints are adding the ability to generate a doubletap event.
>>>>>>>>> Add a new keycode to allow this to be used by userspace.
>>>>>>>>
>>>>>>>> What is the intended meaning of this keycode? How does it differ from
>>>>>>>> the driver sending BTN_LEFT press/release twice?
>>>>>>>>>
>>>>>>>>> Lenovo support is using FN+N with Windows to collect needed details for
>>>>>>>>> support cases. Add a keycode so that we'll be able to provide similar
>>>>>>>>> support on Linux.
>>>>>>>>
>>>>>>>> Is there a userspace consumer for this?
>>>>>>>
>>>>>>> Funnily enough XKB has had a keysym for this for decades but it's not
>>>>>>> hooked up anywhere due to the way it's pointer keys accessibility
>>>>>>> feature was implemented. Theory is that most of userspace just needs
>>>>>>> to patch the various pieces together for the new evdev code + keysym,
>>>>>>> it's not really any different to handling a volume key (except this
>>>>>>> one needs to be assignable).
>>>>>>
>>>>>> What is the keysym? If we can make them relatable to each other that
>>>>>> would be good. Or maybe we could find a matching usage from HID usage
>>>>>> tables...
>>>>>
>>>>> I was looking through the existing codes and I see:
>>>>>
>>>>> #define KEY_INFO		0x166	/* AL OEM Features/Tips/Tutorial */
>>>>>
>>>>> We also have KEY_VENDOR used in a few drivers/plafrom/x86, including
>>>>> thinkkpad_acpi.c and I wonder if it would be suitable for this vendor
>>>>> specific debug info collection application (which I honestly doubt will
>>>>> materialize).
>>>>>
>>>>
>>>> That's a somewhat disappointing note on your doubts, is that based on
>>>> anything? Just wondering what we've done to deserve that criticism.
>>>
>>> Sorry, this was not meant as a criticism really, but you mentioned
>>> yourself that there isn't anything in the works yet, you just have some
>>> plans.
>>>
>>> For such a project to succeed Lenovo needs to invest into selling
>>> devices with Linux as a primary operating system, and it has to be
>>> consumer segment (or small business, because for corporate they
>>> typically roll their own support channels). The case of retrofitting
>>> Linux onto a that device originally came with Windows OS rarely gets
>>> much if any response from the normal support channels.
>>>
>>> Is this something that is actually happening?
>>
>> Yes, Lenovo is actually offering Fedora as an OS choice when
>> ordering ThinkPads directly from their website in many countries
>> including when ordering as a consumer.
> 
> Ah, very nice, I was not aware of this.
> 
>>
>> And unlike other vendor's Linux preloads which often use a kernel
>> with downstream laptop specific changes these laptops are running
>> unmodified Fedora kernels, which themselves are almost pristine
>> upstream kernels.
>>
>> Lenovo (Mark) has been really good the last couple of years in
>> making sure that their hw just works with mainline kernels without
>> any downstream vendor specific patches.
>>
>>>> That aside, I guess KEY_INFO or KEY_VENDOR could be a good fit (I
>>>> personally don't think KEY_CONFIG matches well), but I would be
>>>> worried about clashing with existing functionality.
>>
>> Using KEY_INFO / KEY_VENDOR works for me too. So maybe we should
>> just go with one of those 2 ?
> 
> It looks like Mark's preference is KEY_VENDOR, so let's go with it?

Ack KEY_VENDOR sounds good to me for the doubletap on the trackpoint event.

What about the new Fn + N keycombo which also generates a WMI
event which we want to translate to a key code to launch a
(to be written) debug-info collecting app for when the customer
calls Lenovo support.

Mark suggested a new KEY_SYS_DEBUG_INFO for that. So do we use:

#define KEY_INFO                0x166   /* AL OEM Features/Tips/Tutorial */

for this, or do we define a new keycode ?

Mark would using KEY_INFO for this work for you.

Dmitry any opinion on this ?

Regards,

Hans



