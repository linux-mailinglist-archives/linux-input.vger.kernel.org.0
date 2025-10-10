Return-Path: <linux-input+bounces-15364-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61DABCD5C5
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 15:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 689B242829D
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 13:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F731C5D44;
	Fri, 10 Oct 2025 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BH+cOTIT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0661F2F39BC
	for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 13:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760104493; cv=none; b=UvB7s8qioAj2Zj41t+qKuNzUdqS7Pb1X9LrTTadoqzDTZpDtL4xCr4qfWPGy1n+8zqhLvZF6oFfn3inLFfRpsPJP0M0/j3/P+CUZF6I736PTwMVfIaKunbnqiAFBlRK801wxw+CmQtfjLpvKxokdkPJ3UirG3W9cgc3ZGBk/TLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760104493; c=relaxed/simple;
	bh=PPK7TEQDYfFw0/nfl/MP3mtP6E7a735O1zcZZfARrCA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tRNvgkDZvRktYrIfBOXc57jn8vGlFiHnHP2tQxQ98bd6jJtKspKN+ikR08b0ux83ScHMlrytZ3qeu/rNUmzkvGJJU8swKOf1Ba04eRPmgHEvzuuO5bsqERPO2hmKIiTYbIaeFL5Q3kU14fGTpQXqYpXEBUd6jsUSoQ4pXAYtuWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BH+cOTIT; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8571a0947d1so249478885a.0
        for <linux-input@vger.kernel.org>; Fri, 10 Oct 2025 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760104491; x=1760709291; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPK7TEQDYfFw0/nfl/MP3mtP6E7a735O1zcZZfARrCA=;
        b=BH+cOTIT0/0t4+wuRj4tCP1fMJfcbtph9YA3/0+HMig00L0vvA4erEISAGeBs+cMXx
         sbK1D7WHIiOzEYSdHzmG6QDLjB1GWSyT/M5VUZltwgKUUpi9pDhH96rYkgUtuCM1dO+1
         6KUYeIAKDKHBMRtHrSd68yxLe69Xba2oizIAvtGb0eo/Ots/uI8PSYvi/GSonUAIT3nN
         xfia/kfc2WEiWP0Cbfz8j6jcMVveQKXBj2+UMjHEm9GvSht98kS4Y0wC0JdeNbgQWwvQ
         q5Xxb2tHfJLvnUNld2fcez9+FNW9GA642jVDABoeMi+AunWPNjwknab0fFUBZeLJcPOx
         DORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760104491; x=1760709291;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PPK7TEQDYfFw0/nfl/MP3mtP6E7a735O1zcZZfARrCA=;
        b=f+JXs9ifZFTlFvTRYpYwHYWTzwphW6xXVAdp5ise4iv9XWZ/7aTYF3R3mN4hGwLTJT
         bdeTSKrVFq8qmhpQp7FJEZMH2pgKqRyj/yB40RN/luk53EKdT22FgdAPQ6iOecvzGGX2
         4LTTabgkOsY4AObEDNLlJ+IEaBraz53o9cPtmkWCwuRpFSxG/8upv9SXjBMZ27mFxPyV
         8v6qD6AKaadKrO758wtZQXfjMR+rX3ml0XtS0GT6b96Sh031J+v1TShqkOQ724wiV1Lf
         Nh0fKTLT/AbCHefjPN8p4akytVUCXGg9qkkiCA7ghN/XI8aLnqGEKQLlBbNKzuKrIyIw
         QPxg==
X-Forwarded-Encrypted: i=1; AJvYcCWIEdVbzb4r5OLQNNDvAWLQHDJ70ViTC2jkdBV1EK5LEIf3azwgFar1PTc/gtqVODr3botFAbFYmO3m8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPYCXG4DE5VUEpcfkk/eeb/VZV93LudmR93IX9ly7UMY1Xidcj
	kOGKAE0ziMEQ1sK6ZVE4bqZNQGKIwB/K4ReBwFqDiLcV6MKchNkwj6GB
X-Gm-Gg: ASbGncukh2sTNxRqwukzf9lzYiAKk0wIabZ08hlhiyNj6IY24Cm/d1xYLycpuLYo7sk
	/tKJO8K7svEJKl2F/k80H/rWlN8Yslv0d78CA4byHWwogqsC+hMTyk498qdJp/eUEgvLL8j/vgE
	Tb+lk+BLairR3JiADQeGOtZlU7tZjnlYOgGiw+4L8zInmiT/vCu5cy/jTCSAzBTaZMzk6+Mfav8
	VPnDhdiTtiTMfrKX2pSt8kZ96OlI2EuPrBtreeU7/76keClakl06lbNO++FWeH24OIKw3G+mbeK
	bGHfVYphacRv1qq3InXxkYNQ7Yv4DWL1N1OoQrhmlB7/iNOdQv8aEOo/e5IUQiZJJCn6xZMgj3C
	sKIqec/056w5LlLRm0/XkRFE0WwFdhkurfbquU4BBkegcUJEl3qkyZNNflu/W4QBmZKZVZ2TdO3
	A+LTU5VgoJNA/a0qseuFKz0q3srIeaQBefybzrdqH3ow==
X-Google-Smtp-Source: AGHT+IEgxrke54HjalSwfztvMb1tCCD5P4ICxuAhsGxg2c8gYHUsCjGdNBRjZNJfEipJWPNjoYQ/TA==
X-Received: by 2002:a05:620a:410c:b0:829:d0e9:bc1b with SMTP id af79cd13be357-8836d74323amr1419606085a.7.1760104490701;
        Fri, 10 Oct 2025 06:54:50 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f3d8883sm412042385a.2.2025.10.10.06.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:54:50 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D944F40066;
	Fri, 10 Oct 2025 09:54:49 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-01.internal (MEProxy); Fri, 10 Oct 2025 09:54:49 -0400
X-ME-Sender: <xms:KRDpaBaqHqUHtAD5VfU3blrsekhnPWTM7fll5vDpWGy94QCEkGh3MA>
    <xme:KRDpaDMDtZbkAHjRNUm1yrS8-1laiYG_TP7Nn16S0DHrFQ601Ppg28RQSFHPEBdEl
    5s4VpGDOGgCrp24rtuMAvDRGdczCgA3_yQWpdBAYv3M65EvwUb8rNo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutdelvdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfuegvnhhj
    rghmihhnucfvihhsshhoihhrvghsfdcuoegsvghnjhgrmhhinhdrthhishhsohhirhgvsh
    esghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepveffveffvddtgeeikeeikeef
    tefhfffhuefhudfhhedvkeevgeelveekffffjefhnecuffhomhgrihhnpehkvghrnhgvlh
    drohhrghdpfhhrvggvuggvshhkthhophdrohhrghdptghrtgdrihgurdgruhenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsvghnjhgrmhhinh
    domhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudefjeeftddtfeeitddqvdel
    kedtjeejkeegqdgsvghnjhgrmhhinhdrthhishhsohhirhgvsheppehgmhgrihhlrdgtoh
    hmsegsrghnqhhuihhsvgdrvghupdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhp
    ohhuthdprhgtphhtthhopehnvghtfihiiiestghrtgdrihgurdgruhdprhgtphhtthhope
    gthhgrthhthiesvghnrggtrdhfrhdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhdrhhhuthhtvghrvg
    hrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:KRDpaECYDkg38zIfy3cWwJ0ZfxXjVdZeMyjol-meLjLzSUjyAMDtDw>
    <xmx:KRDpaB-hlvRQ0J1G3JB_B_ShSJFftHiT5GDbYImmhONUEa6aLbarzg>
    <xmx:KRDpaLGHY2vE5KaOmicCrjnJpXEQPYoGRTybrEf7wvvyCid_wKsFxw>
    <xmx:KRDpaPOyotVF2_3K_hMUfoiU-ApaiYoqc0CpBzEMuN7lqjF-LRUr8A>
    <xmx:KRDpaFcWI3hFAIj4WXLMWy-ZwXIR-UnuigxHJ6vIL1_ZywKEIy5nMQGp>
Feedback-ID: i3c514981:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3EB44C40054; Fri, 10 Oct 2025 09:54:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AuksZPTF120c
Date: Fri, 10 Oct 2025 15:54:28 +0200
From: "Benjamin Tissoires" <benjamin.tissoires@gmail.com>
To: "Steven Haigh" <netwiz@crc.id.au>
Cc: =?UTF-8?Q?St=C3=A9phane_Chatty?= <chatty@enac.fr>,
 "Peter Hutterer" <peter.hutterer@who-t.net>, linux-input@vger.kernel.org
Message-Id: <ed69f310-8a4d-4023-b1ce-72b78e512177@app.fastmail.com>
In-Reply-To: <26b03bc2-b824-4948-9803-5a0b5f08e394@crc.id.au>
References: <2a878c8a-0289-4378-9c32-6eaf57e7dbfc@crc.id.au>
 <d058871a-a2c6-4197-a77c-08edb0ce70b4@app.fastmail.com>
 <fd7e0577-a992-4761-823b-b5fe41a7ee74@crc.id.au>
 <8720ac11-2b1d-4b42-84c8-52407dbda7e7@app.fastmail.com>
 <26b03bc2-b824-4948-9803-5a0b5f08e394@crc.id.au>
Subject: Re: hid_multitouch - random non-responsive, multitouch, scrolling and zooming
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Fri, Oct 10, 2025, at 2:21 PM, Steven Haigh wrote:
> On 7/10/25 20:10, Benjamin Tissoires wrote:
>> On Tue, Oct 7, 2025, at 3:42 AM, Steven Haigh wrote:
>>> I ran `libinput record -o recording.yml /dev/event/input6` and have
>>> attached the compressed output. Annoyingly, it seems like the touchp=
ad
>>> is working fine at the moment - so it may confirm the hardware
>>> information, but not a recording of the problem right now.
>>=20
>> Yeah, same on one of the Dell laptops I have here. I know it has the =
bug, but whenever I try to reproduce it it never shows meaning I was nev=
er able to pin point the issue :(
>
> So, "good" news is that I managed to grab a recording today when the=20
> touchpad started to play up. When using two-fingers to scroll, I ended=20
> up zooming etc.

Unfortunately, this is a recording after the kernel processing, so all I=
 can do is check that we have ghost fingers (and even that is trciky bec=
ause I'm not sure if what we see are the expected events or not).

>
> I tried to make the recording as short as possible, but still include=20
> examples of clicking, scrolling etc.
>
> Attached for reference.
>
> As for which way to approach a fix - I'm happy for you to suggest what=20
> path we take - a BPF, kernel patch backport, or something else.

Great, thanks!

>
> You tell me which one gives the most value and is likely to help more=20
> people in the long run.

Right now the most valuable would be to test the series at
https://lore.kernel.org/linux-input/20251008-fix-sticky-fingers-v1-0-760=
f1f26fce3@kernel.org/T/#m0fba507cbd43acd36bef28151ecb90b7077606a4

If this work and you want a quick and dirty fix you can then return to t=
he default kernel, and use the BPF from https://gitlab.freedesktop.org/l=
ibevdev/udev-hid-bpf/-/merge_requests/204, the latest version should be =
compatible with your device, just re-download and install it again.

But definitely a tested-by on the kernel patch would be appreciated :)

Cheers,
Benjamin

>
> --=20
> Steven Haigh
>
> =F0=9F=93=A7 netwiz@crc.id.au
> =F0=9F=92=BB https://crc.id.au
> Attachments:
> * recording.yml.xz

