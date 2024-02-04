Return-Path: <linux-input+bounces-1654-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1DB848BD3
	for <lists+linux-input@lfdr.de>; Sun,  4 Feb 2024 08:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F5BF284F34
	for <lists+linux-input@lfdr.de>; Sun,  4 Feb 2024 07:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B5B8F47;
	Sun,  4 Feb 2024 07:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VeKjXkch"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278FB654
	for <linux-input@vger.kernel.org>; Sun,  4 Feb 2024 07:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707031458; cv=none; b=hvkBMxyLoKzK2Oc4hvNSv+Nb+DNcdt2fqfFkNDc/xE7pCcVHFwZT+nJ5aB0Qf8f7nvSkxu4mD/gOWzd/immNkDmXMVJ15deIaiE1MeHzuWP041dxjW3WWCLwh9XCcZTZklJAnynQE+GFd62CNg69WvVXQaDA/rANR92BvpWEMgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707031458; c=relaxed/simple;
	bh=PpXmBZu/ttOrrnuRCVGr3y72VEUBIDGQLIInsAyMWEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3imbpigYXkLrL0K9OkKiMNLIdQgpCuFpwU48U7nPkRZNrj9CgAA4R3N6i9j6RpTv/G8YnZG0nHyVywF3bY3b6h9WtcC2zOYDi2L85RUV8yNTeg0Q1C9OMBK/HtCWICKWOrBZU0Nenc4r5Xo0Ek2gvFafNi5Cp63VOAKVmmpu1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VeKjXkch; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707031455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mLETy/iNSKfFzyXqJhNJJwR2MY8g0ACyfE+gPoZ7mPo=;
	b=VeKjXkchSyqeR8Uk0kKugr6DiZGLnfGIUwpVD6SbFcbL6L+oqOlrn9D267s19bBMz23QjJ
	mpfyCRaACwcCW9J7Rqfy9jPLSHsB5S29pMbRBfMg0YBqwGWHIcWyEtrMfF/JTAS7QbjZyV
	9KI+prDktkQkcXU9fpaJNiw1G07aOZ0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-Hec19e-7NFyObFVGF2Y_cw-1; Sun, 04 Feb 2024 02:24:13 -0500
X-MC-Unique: Hec19e-7NFyObFVGF2Y_cw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33b250a4bd7so792488f8f.3
        for <linux-input@vger.kernel.org>; Sat, 03 Feb 2024 23:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707031452; x=1707636252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLETy/iNSKfFzyXqJhNJJwR2MY8g0ACyfE+gPoZ7mPo=;
        b=ub28Q75+/TKr0htMk+jY/SYbaaCnaC28hGRaSocPHiA1CVB+5bIGX3/UTSRoROEwUR
         1p//u3ldsgki+D+8ft9R3NdwKbiAfNmNlWu9D7R3dzv4tLRKZlNHY+x9Yj8rL13gSmr7
         +OZwZRg9BiMdHeXdEdR02io3iv17s9RRcHqI+T/w55c2qd2NwtptzswDrVJz8LijAc2s
         WOZ4EtezOh9OXF9P5+DQ8xpu39Aen4/Q1xBNi40S/GwXKTWv2xtTHeALyIRlJT+YBNGI
         kXTdfYNLs+x4vbNVJkUnZrXScIJ4fzuZWi3aZgUPadPcrRmSd/zYcbm0yOfU0E3GAny4
         Oi2g==
X-Gm-Message-State: AOJu0YxNv2ZfNKeyFlA6jg8ZBCIjSkRSuuquox+OL7oWMzqoAgQBxqUr
	jjyHNkK8C5s80pw4GQCYJbc43c3PypG7W1uj2EZRF4wgPI/xb5zby9o3jyMawZhWelLChDHU5qm
	6hQwsmT2+Ae7EVrEx9+mf3c+Db1BI3Wpbi6Vz/XYIsSQmggh+AChLEFOJs5Ql
X-Received: by 2002:adf:e985:0:b0:33b:2471:9ff5 with SMTP id h5-20020adfe985000000b0033b24719ff5mr3256119wrm.46.1707031451979;
        Sat, 03 Feb 2024 23:24:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMw5edd8lPXARt8A2JFbHjrwLPmBc12RNW0e5ysvLp152+mHyQquq7fCBabJATf0C76BdENA==
X-Received: by 2002:adf:e985:0:b0:33b:2471:9ff5 with SMTP id h5-20020adfe985000000b0033b24719ff5mr3256107wrm.46.1707031451643;
        Sat, 03 Feb 2024 23:24:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXYrNuqjyi5br+xZFq0OWe3dCqS9NovmmPjW6l/DKHV/zC0AYf+MMsBbowh7c60uXqe7pA3mWSNfg7qpg/VCOARIebqG8UH5NF+cMb75FCo5B7KV0QmBpr05KpZiF6N8N9Npi8VsUHmftypKEE2phJwkpeqwHU+G4h69RUxHqJ20WCMNIOuG4B8lWgq+fe9DdMDR8AFr6rxqSNxVX9FM2ZFROG66MzZPbw2t4v2Ov+nHQMEVrXaSPK+cXECpZPbq3f0OKK04z7xF35K6uPfECTJ
Received: from [192.168.1.149] ([212.76.254.34])
        by smtp.gmail.com with ESMTPSA id q11-20020a5d574b000000b0033ae4a3b285sm5440377wrw.36.2024.02.03.23.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 23:24:11 -0800 (PST)
Message-ID: <a6093a70-29bf-458d-b981-bcd95af7b472@redhat.com>
Date: Sun, 4 Feb 2024 08:24:10 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: + XPS 13 9343
Content-Language: en-US
To: Antoine <debian@r2rien.net>
Cc: Dell.Client.Kernel@dell.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 pmenzel@molgen.mpg.de, regressions@lists.linux.dev, 1061521@bugs.debian.org
References: <0aa4a61f-c939-46fe-a572-08022e8931c7@molgen.mpg.de>
 <f27b491c-2f1c-4e68-804c-24eeaa8d10de@redhat.com>
 <bc166c19-8da3-cd42-b749-e35eaebe7822@r2rien.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bc166c19-8da3-cd42-b749-e35eaebe7822@r2rien.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Antoine,

On 2/3/24 17:16, Antoine wrote:
> On 1/20/24 21:26, Hans de Goede wrote:
>> Can you try adding "i8042.dumbkbd=1" to your kernel commandline?
>>
>> The next question is if the keyboard will still actually
>> work after suspend/resume with "i8042.dumbkbd=1". If it
>> stays in the list, but no longer works
> 
> Hi, thanks a lot for taking into account our hardware,
> just a supplementary feedback:
> 
> In my case (Dell XPS 13 9343/i5-5200U):
> - Dell Inc. XPS 13 9343/0TM99H, BIOS A19 12/24/2018
> - Linux version 6.6.13-1 (2024-01-20)
> 
> commandline with `i8042.dumbkbd=1` fixes the issue,
> with capslock functional but without led
> + as a side note, hibernate doesn't trigger any issue
> 
> (before getting informed of and testing `i8042.dumbkbd=1`)
> I had attached logs before/after suspend against 6.6.11 and 6.6.13 :
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1061521#30
> 
> I remain at your disposal for any further infos/testing

The issue of the kbd on some Dell XPS models no longer
working after a suspend/resume cycle should be fixed by
these 2 patches which are on their way to Linus' tree:

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=683cd8259a9b883a51973511f860976db2550a6e
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=9cf6e24c9fbf17e52de9fff07f12be7565ea6d61

Regards,

Hans


