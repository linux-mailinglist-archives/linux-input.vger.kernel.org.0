Return-Path: <linux-input+bounces-3075-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FB18A662B
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 10:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E523B1C20BE0
	for <lists+linux-input@lfdr.de>; Tue, 16 Apr 2024 08:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C310F84A3E;
	Tue, 16 Apr 2024 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i7TisAt0"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA5E83CCD
	for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713256387; cv=none; b=rl6RlZXJNzEmAsOphLIoRSL8KCgnCHyE3ljqtuPh/aZskOYA3GneXu+doiTF0PHlC0XQe85hWPVhC0Yi0MhME+QkVr8dJthtIvwaMsbA2nb4t0QXQSY9XmkSJj9T8qUti+0sRCIFDq2Hpnd8g3XLjzWM2lcfYU2h7sBJNQJzgPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713256387; c=relaxed/simple;
	bh=E61E8H16GakIaEmE/TXSR6XZKZtY7a81hn578ZQMSOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1CvN8eFH84dBdmJC7Dggx1+wRZlGX3tR1WQE0zhDR05nAeM1COupf9RFV/YQ6ckCaExiwf03WUXnOr5xUZd+qaePoVCZK0V4+PIAOqUc2dx7HRuwCSuC2pkrhPjOkZsSGnqkbG5oYvVWhgrUtLlpx4bJ0Gs0Bfm7RB/XER9EiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i7TisAt0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713256385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bzpK2jyxFnbS3uykXAlBWfyvSN7g3DKEoILwHz1vuj8=;
	b=i7TisAt0sYOwy3NWXB+rsDk+5mls8A1o3zbSKiBSfrVxNS0WjDkjsVcB0Ax8cTCZWk9E73
	xfvCpyGpDdExN3idFkt2S1SraTqJ5CNXb4h5jlBFSak+GSjrPIqM8xtVR/iPyDc3xMiqQ3
	aJYpP59sqwkKhmETKg8Tp6Rj29RkBlw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-EmpMQMD0MXOUhI5-L6zQug-1; Tue, 16 Apr 2024 04:33:03 -0400
X-MC-Unique: EmpMQMD0MXOUhI5-L6zQug-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56bf2d59fceso3601230a12.3
        for <linux-input@vger.kernel.org>; Tue, 16 Apr 2024 01:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713256382; x=1713861182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzpK2jyxFnbS3uykXAlBWfyvSN7g3DKEoILwHz1vuj8=;
        b=WlQcKA4ow5bNXXSB1dAUUDIoyGpDroSezVuProEwHplXFfXHry0buB9WhTA6Z4Ttkz
         uR0xe+dZXlyzNNV8H2kEmbu+vu20N4CbS7RbCuk84UThEas5Xvf6KNBfYcZKC9jBFVdW
         +TIH7xFnhA8SBkTXksVp8xIkrI5xh0TfEdXHOHyKKkPKcMs0Q+I+hixjGoYyHd0M6okl
         AP5P8LJEX4OIvX+xqgsVo0fhs3O+/0GiQ80yHL/r9h8awZ43zRSUNZeCDVzgT5RjFnxe
         4OFzJHtWJvhynlXLqLM9skMz/Bbd0QcfV+I/xSrG4kLXNwsXaFJMJX1HkUEXGth0KzL6
         lfaA==
X-Forwarded-Encrypted: i=1; AJvYcCVKbHuDDszfm3UWGp7KvYrOiPVgHfD5DBv3iPhh5orDGu92FkdVO8wpQKYZgRqQkmKbmX2bt3qk7eN50rAiEQxnovS+4CyLtGpLGWY=
X-Gm-Message-State: AOJu0YyVyGhLuTqAhHWHaZgTW9HGHZ+K+DdO0BeFgA3FTUy7K6TW971R
	futXbxjwesmRj69KAOXGTLLxI3CyaQDAi0Hwe+dtFx5q2JNn6fTAQD0tI0u4zsec11XcwqagAVA
	gMmGDim/IRmqX0sDwMCv2j0SNWHs2YWXWalLhHbEgu9g5ulavNR98jjEutQMD
X-Received: by 2002:a50:d716:0:b0:56e:63d3:cb3e with SMTP id t22-20020a50d716000000b0056e63d3cb3emr8580024edi.41.1713256382586;
        Tue, 16 Apr 2024 01:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmGRIbPaa1zBElQ+wLeSk/BgoY6QqwrgiNVIehp0etno1auNVqL5G4D3OtM6pxepLqXW5HPA==
X-Received: by 2002:a50:d716:0:b0:56e:63d3:cb3e with SMTP id t22-20020a50d716000000b0056e63d3cb3emr8580010edi.41.1713256382220;
        Tue, 16 Apr 2024 01:33:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l3-20020a056402124300b00570229afc16sm2671144edw.7.2024.04.16.01.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 01:33:01 -0700 (PDT)
Message-ID: <27b1b6cf-759c-4778-a53c-5d01442120b7@redhat.com>
Date: Tue, 16 Apr 2024 10:33:00 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Input: Add trackpoint doubletap and system debug info
 keycodes
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peter Hutterer <peter.hutterer@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nitin Joshi1 <njoshi1@lenovo.com>, Vishnu Sankar <vsankar@lenovo.com>
References: <f3342c0b-fb31-4323-aede-7fb02192cf44@redhat.com>
 <ZhW3Wbn4YSGFBgfS@google.com> <ZhXpZe1Gm5e4xP6r@google.com>
 <92ee5cb2-565e-413c-b968-81393a9211c4@app.fastmail.com>
 <ZhcogDESvZmUPEEf@google.com>
 <91593303-4a6a-49c9-87a0-bb6f72f512a1@app.fastmail.com>
 <Zh2CtKy1NfKfojzS@google.com>
 <484638e2-1565-454b-97f8-4fcc6514a69c@redhat.com>
 <Zh2G85df29tPP6OK@google.com>
 <539776c5-6243-464b-99ae-5b1b1fb40e4b@app.fastmail.com>
 <Zh2wO0Bnyr8vFSpc@google.com>
 <7de52ec3-86f3-4a1d-ac87-a106ae1acb5d@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <7de52ec3-86f3-4a1d-ac87-a106ae1acb5d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

On 4/16/24 1:57 AM, Mark Pearson wrote:
> Hi Dmitry,
> 
> On Mon, Apr 15, 2024, at 6:54 PM, Dmitry Torokhov wrote:
>> On Mon, Apr 15, 2024 at 04:28:19PM -0400, Mark Pearson wrote:
>>> Hi
>>>
>>> On Mon, Apr 15, 2024, at 3:58 PM, Dmitry Torokhov wrote:
>>>> On Mon, Apr 15, 2024 at 09:50:37PM +0200, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 4/15/24 9:40 PM, Dmitry Torokhov wrote:
>>>>>> On Wed, Apr 10, 2024 at 10:48:10PM -0400, Mark Pearson wrote:
>>>>>>>
>>>>>>> I have a stronger preference to keep the KEY_DOUBLECLICK - that one seems less controversial as a genuine new input event.
>>>>>>
>>>>>> Please see my response to Peter's letter. I think it very much depends
>>>>>> on how it will be used (associated with the pointer or standalone as it
>>>>>> is now).
>>>>>>
>>>>>> For standalone application, recalling your statement that on Win you
>>>>>> have this gesture invoke configuration utility I would argue for
>>>>>> KEY_CONFIG for it.
>>>>>
>>>>> KEY_CONFIG is already generated by Fn + F# on some ThinkPads to launch
>>>>> the GNOME/KDE control center/panel and I believe that at least GNOME
>>>>> comes with a default binding to map KEY_CONFIG to the control-center.
>>>>
>>>> Not KEY_CONTROLPANEL?
>>>>
>>>> Are there devices that use both Fn+# and the doubleclick? Would it be an
>>>> acceptable behavior for the users to have them behave the same?
>>>>
>>> Catching up with the thread, thanks for all the comments.
>>>
>>> For FN+N (originally KEY_DEBUG_SYS_INFO) the proposal was to now use
>>> KEY_VENDOR there. My conclusion was that this is targeting vendor
>>> specific functionality, and that was the closest fit, if a new keycode
>>> was not preferred.
>>
>> Fn+N -> KEY_VENDOR mapping sounds good to me.
>>
>>>
>>> For the doubletap (which is a unique input event - not related to the
>>> pointer) I would like to keep it as a new unique event. 
>>>
>>> I think it's most likely use would be for control panel, but I don't
>>> think it should be limited to that. I can see it being useful if users
>>> are able to reconfigure it to launch something different (browser or
>>> music player maybe?), hence it would be best if it did not conflict
>>> with an existing keycode function. I also can't confirm it doesn't
>>> clash on existing or future systems - it's possible.
>>
>> So here is the problem. Keycodes in linux input are not mere
>> placeholders for something that will be decided later how it is to be
>> used, they are supposed to communicate intent and userspace ideally does
>> not need to have any additional knowledge about where the event is
>> coming from. A keyboard either internal or external sends KEY_SCREENLOCK
>> and the system should lock the screen. It should not be aware that one
>> device was a generic USB external keyboard while another had an internal
>> sensor that recognized hovering palm making swiping motion to the right
>> because a vendor decided to make it. Otherwise you have millions of
>> input devices all generating unique codes and you need userspace to
>> decide how to interpret data coming from each device individually.
>>
>> If you truly do not have a defined use case for it you have a couple
>> options:
>>
>> - assign it KEY_RESERVED, ensure your driver allows remapping to an
>>   arbitrary keycode, let user or distro assign desired keycode to it
>>
>> - assign KEY_PROG1 .. KEY_PROG4 - pretty much the same - leave it in the
>>   hand of the user to define a shortcut in their DE to make it useful
>>
>>>
>>> FWIW - I wouldn't be surprised with some of the new gaming systems
>>> we're seeing (Steamdeck, Legion-Go, etc), that a doubletap event on a
>>> joystick might be useful to have, if the HW supports it?
>>
>> What would it do exactly? Once we have this answer we can define key or
>> button code (although I do agree that game controller buttons are
>> different from "normal" keys because they map to the geometry of the
>> controller which in turn defines their commonly understood function).
>>
>> But in any case you would not reuse the same keycode for something that
>> is supposed to invoke a configuration utility and also to let's say
>> drop a flash grenade in a game.
>>
> 
> Understood.
> 
> I don't see a path forward within your stated parameters. I did not realise that there were such limitations, so my apologies for wasting everybody's time, and thank you for your patience and guidance.
> 
> I will drop this patch from the series and proceed using existing defined codes only.
> 
> Hans, I'll need to rejig things a bits but I have some ideas and I think I can make it work and stay within the pdx86 tree, which will make it simpler.

Ok this sounds good to me. For Fn + N using KEY_VENDOR sounds good for
me and for the doubletap any one of KEY_CONFIG/KEY_CONTROLPANEL/KEY_INFO/KEY_PROG1
or some other suitable KEY_foo define works for me.

Regards,

Hans




