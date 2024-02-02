Return-Path: <linux-input+bounces-1631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1318469EE
	for <lists+linux-input@lfdr.de>; Fri,  2 Feb 2024 08:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D84641F27FA4
	for <lists+linux-input@lfdr.de>; Fri,  2 Feb 2024 07:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16673182A1;
	Fri,  2 Feb 2024 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SBTzQKR4"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F09317C6C
	for <linux-input@vger.kernel.org>; Fri,  2 Feb 2024 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860745; cv=none; b=PLYgXX/GbtEvRKD7a12Cbk7+HSjJ8oybhtLDPPlQcx6LrpYJ0qwX8ub5CHqVMwjMVCZOaWtLROwf+BbQMih2jE7Z4qG9RnmCtD3XZ8zoxEz1nvnjMTh9MPTFBc+jlrnDZuNp30Z0n12K0+6b4fwvJJHlnlxTRf6wKeIedVnccRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860745; c=relaxed/simple;
	bh=w8tCpbQ0A1YgNYhQKFY3Za+PAmrvcXk8Bry4ghhpDI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/nQ2Rk4yUicqRizTlrSm407vXqX59qrZQlj8n0Mk4jDkBCLhzYDysqbe/71ol7hnCRWWwItpKvYpUh/Bdw5tmvQgbmP5GFnzdigbFMvTw5H5c1N5obXnW9S1Wjumjwd1uEE49AKYoVMksZwIBsVwfzi+Vbg+g2t9e0a4SoJtww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SBTzQKR4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706860743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ptzZ7yZPPFvC3T/6Mypo9JQzCvFLU0tUQ8aX8kCb+bg=;
	b=SBTzQKR44ZH/rU6++eJcQHW9vi9yNcgo0VTqyJnQ86neikg+lnJ8rAREPa5c+JIZtecJQK
	9ld2r/2TOObqc8mjxTwUh23RuQBXbz7EqfJf72TeaRlbtXTPQ/GflC0l2+SZ1/BYAAwCmW
	kDt7IFecc9WZUB8QobGjIdfzjdWUTRQ=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-j9d_HYA4O8qfuC325nFBaQ-1; Fri, 02 Feb 2024 02:59:01 -0500
X-MC-Unique: j9d_HYA4O8qfuC325nFBaQ-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3610073a306so16174295ab.0
        for <linux-input@vger.kernel.org>; Thu, 01 Feb 2024 23:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860741; x=1707465541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptzZ7yZPPFvC3T/6Mypo9JQzCvFLU0tUQ8aX8kCb+bg=;
        b=NDHdthKZVWzIInzVd9IMB6lQ9EfWtTV4l5Isx4DsE1T4+u7otlM3RiIhQ2wZet1c/i
         cYD7MwsTt6pQMv7Zqxj+UnwdB5SYwVIqrtoZlqmttdgopHomGM6eziWoIOFigk8UnHFo
         MLfgqqZ9SDkRlSOgJ1CTGiCknlY9RSdPpGOryZ302cLxeq0Ylp/5dGc82jnmnV9p9idY
         P/nBMJRTemUdekPrZUPnXLAOCLjnpg6paqzciSxMukOTtnTzKkY2DpGP2IWTXNvJptn8
         6ZTPCfrjsIUYwNnM7euvm0QZrb72ex2zHvHhcQ5wzUQjdc7H90tnMMkUAQgKs7zu1Hsp
         V+ew==
X-Gm-Message-State: AOJu0Yw9basj1OaL+81QLe8Jd2VXmUCf5BgLua4sP9IMixsNPJAns/qy
	izDlL4V3DuDavY8qdthH3ZBFwALPfKzXWs4OE6ZvweTUqxfXlNMUKp7TLIXZq9qrFDZfXdKIqFA
	rQspyaXoKR9rzq49UHHdzjCckXxdHNj2y6ymCZrWkrJFqSbe86J72bH+iJvl2
X-Received: by 2002:a92:d981:0:b0:363:7bc5:727b with SMTP id r1-20020a92d981000000b003637bc5727bmr8120780iln.26.1706860740846;
        Thu, 01 Feb 2024 23:59:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYmI/5H4LFMJxHc+cmVKY/ZzxbWqy6c1sOkkghhT3cKQ2oxAsfpKcBtUe/6o18bUqG6ORurQ==
X-Received: by 2002:a92:d981:0:b0:363:7bc5:727b with SMTP id r1-20020a92d981000000b003637bc5727bmr8120774iln.26.1706860740609;
        Thu, 01 Feb 2024 23:59:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXn7psG7leaijQtxb5Ad/407m+3IhWCYuJ/F0Pmrw5yhB+1NtIQ7FJF57VQC2eJBwpwcM8UymrQVTogscfpcPvN7Z+v+Kr5Z4Fi632OcvdnLDyh2Nlo90g7N6nB21W6FAQ9+Z+8GxhJMXnktz5NRuFMm9PKlRMb54KyOf++QxulJQ==
Received: from [192.168.43.127] ([109.36.129.188])
        by smtp.gmail.com with ESMTPSA id db5-20020a056e023d0500b0036299f401b6sm430941ilb.71.2024.02.01.23.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 23:59:00 -0800 (PST)
Message-ID: <3b18ecca-c6ed-4685-a45a-71c3ffac4f96@redhat.com>
Date: Fri, 2 Feb 2024 08:58:55 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH regression fix 2/2] Input: atkbd - Do not skip
 atkbd_deactivate() when skipping ATKBD_CMD_GETID
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-input@vger.kernel.org
References: <20240126160724.13278-1-hdegoede@redhat.com>
 <20240126160724.13278-3-hdegoede@redhat.com> <Zbx2Cuhfy-rpcvCE@google.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zbx2Cuhfy-rpcvCE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Thank you for picking up these fixes and
sorry about the breakage.

On 2/2/24 05:56, Dmitry Torokhov wrote:
> On Fri, Jan 26, 2024 at 05:07:24PM +0100, Hans de Goede wrote:
>> After commit 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in
>> translated mode") not only the getid command is skipped, but also
>> the de-activating of the keyboard at the end of atkbd_probe(), potentially
>> re-introducing the problem fixed by commit be2d7e4233a4 ("Input: atkbd -
>> fix multi-byte scancode handling on reconnect").
>>
>> Make sure multi-byte scancode handling on reconnect is still handled
>> correctly by not skipping the atkbd_deactivate() call.
>>
>> Fixes: 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
>> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/input/keyboard/atkbd.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>> index c229bd6b3f7f..7f67f9f2946b 100644
>> --- a/drivers/input/keyboard/atkbd.c
>> +++ b/drivers/input/keyboard/atkbd.c
>> @@ -826,7 +826,7 @@ static int atkbd_probe(struct atkbd *atkbd)
>>  
>>  	if (atkbd_skip_getid(atkbd)) {
>>  		atkbd->id = 0xab83;
>> -		return 0;
>> +		goto deactivate_kbd;
>>  	}
>>  
>>  /*
>> @@ -863,6 +863,7 @@ static int atkbd_probe(struct atkbd *atkbd)
>>  		return -1;
>>  	}
>>  
>> +deactivate_kbd:
>>  /*
>>   * Make sure nothing is coming from the keyboard and disturbs our
>>   * internal state.
> 
> I wonder if we need to do the same for the case when we go into SET LEDS
> branch... This can be done in a separate patch though.

Right my goal with this series was to make the behavior change from
936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
as small as possible (just skip ATKBD_CMD_GETID and no other behavior
change like calling SET_LEDS).

I'm not sure about doing the same as this patch for the SET_LEDS
path. We only hit that path if GETID fails which means we are
already dealing with quirky hardware and we already have quirks
to skip the deactivate command for some keyboards which don't
like it...

Let me know if you still want to give making the SET_LEDS
path consistent with the others a go and have it call deactive
too. IMHO that would only be something for -next though,
so that it gets the maximum amount of testing time.

Regards,

Hans


