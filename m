Return-Path: <linux-input+bounces-5527-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB8194F802
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 22:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3ED283F0D
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 20:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C64F186E5C;
	Mon, 12 Aug 2024 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kod0WXaY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54C361FFC;
	Mon, 12 Aug 2024 20:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723493672; cv=none; b=c+xLzxUgqojCpXJhn2LWFC5xbqyJE4kwgDycxPH/76ZZ0lpq1LT61O7D7OMgq7YoSiRxKqUNrmZhD8oJ6L00CET+Md5GPu1PbcxRLiejffzJSNCaUpe4pAX8fB0MoF+rMwvc11wSIWzFn6/5SGmNKVkNHPVM0gTpt2tbmejIan4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723493672; c=relaxed/simple;
	bh=CGlvoF2IaOy5iNGBKS8l1uRRC2nmhoV8scV0V8UbCI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RW+7q8+MWT+iavmwZ+9R2rNFCM111AI8s6Yk1WucgvBHMOOv1vEaDVdeFeEK/nvlyFcDfZAzOMUWIPchX30Ch7Nw3QaG/TK7wsNRMdDf9oeJyys6fw7sZlDs89//AsdrbIC21Zp6TZTVmQY6VhH7zLcd0R06yfhZHp1pRbphnjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kod0WXaY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc4fcbb131so35986035ad.3;
        Mon, 12 Aug 2024 13:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723493670; x=1724098470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlLLEz/lGtjtk2D8ppPzr5S99NccdFJC755Ti0pZlOY=;
        b=Kod0WXaYx6kCgIXrb4C8f8PTPScX0kbFPnSBlleFgam/P9+VO8bs5REXHl+y9bP9EA
         /jbA3DsUBmYC2odjBJTwRN2DOq47s2RLMN+cV+GhM3kWFL0JLYpQuuH2m5ThPBuQg1dX
         2H2vpMJyliScHDd5KcXtIQs87Mg8XyOL+slTAMBVmDzL4UeqcQgvSiRu8oVEvFr9+4El
         qDQ+Gs3/Tovwn5dReKb9yTu1EECY2qyVwbUATa3fhU/Cbi2BSW/cUx0C1qqiKkhNEKZI
         BVSyYN+V93ULO/AKLXMUWVZHRMTU6g7DvtpPN7nngK0wC1geo6iw2alxlWk33rKLSqcT
         9kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723493670; x=1724098470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlLLEz/lGtjtk2D8ppPzr5S99NccdFJC755Ti0pZlOY=;
        b=wPdyjnHt7KwlDxazkxt/huzV+cJeHSrd9GYUwkkgCz293nzZYbyfGAP9lD+9ZA0PrF
         Ovpj15u6BF4wlTPNrNZBEVQQ3LexWt05C5lZTXj30q1ukrtjojmUY5NV91pSPYIE5ECw
         V/OAePaxsoZ2aOSzCUvukFbMhgqk1l5kFum2qd7srPma+LDsVBJUJ+DuGupyGgK9BaBQ
         cmBC80ApxLXg38u0DfeljbDZV+uagYofyIzdBvfq3p2k9BqrGnuqKPUPz2k/e33qNwws
         +gua2bZfeRWXWtqg6fOnKXJZddu2mssuSdkjV9k/27m2hfEiaPuY3SmmNMmU7dhv2D7c
         kBow==
X-Forwarded-Encrypted: i=1; AJvYcCULXPDcLPmUOgVc65wndPHjUSdiAtDK6SScK7T+Go/4K9JSAe4C6hzBCOzLn7dzmkrwiHIOQnvSGH0dThQAKeYORLBAYqb2diU7ldRzKoHu9ikJPv8WBzus50j/bnRiAKpuI7S7DNNjcVc=
X-Gm-Message-State: AOJu0Yx1KsvlMZNd7ltaSwFBB5joU5otXd1zSRtNU8jihGlTE9vnD/WS
	zfR9OD9n6kuoGgKM/FxcyF+9Bn0HmKStSxmn0FpLTlKc1K2VD/lQr5NXA3Nn
X-Google-Smtp-Source: AGHT+IEBqQoMmtaL7YWmcrOUrXjl8QnXospiZk0mOSzFQYMRIh5wRKRCx2jU7LQpt9mkOHWa+mIbkg==
X-Received: by 2002:a17:902:c94d:b0:1ff:4a11:5f72 with SMTP id d9443c01a7336-201ca139f97mr19370025ad.23.1723493669709;
        Mon, 12 Aug 2024 13:14:29 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-201cd14ac10sm808335ad.102.2024.08.12.13.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 13:14:29 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: luke@ljones.dev,
	bentiss@kernel.org,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Derek J . Clark" <derekjohn.clark@gmail.com>
Subject: Re: Re: Re: [PATCH] hid-asus-ally: Add full gamepad support
Date: Mon, 12 Aug 2024 13:12:08 -0700
Message-ID: <20240812201404.15484-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <CAGwozwFN6neJf2RGOR_e916KvpPWpsyKJd5pMcE+WoOS+M5o=Q@mail.gmail.com>
References: <CAGwozwFN6neJf2RGOR_e916KvpPWpsyKJd5pMcE+WoOS+M5o=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Hi Derek and Denis,
> 
> Let us be civil. If I could have bug reported you I would have bug reported
> you. However, for some weird coincidence, I do not have access to the
> ShadowBlip bug tracker or the relevant communities. Nevertheless, this is
> not relevant public discussion. Let us refrain from this discussion further,
> including e.g., name-calling.

I haven't called you any names or levied any personal attacks, so I will
continue not to. I'll also help you, here is the resource for reporting kernel
bugs. You will find the ShadowBlip GitHub is notably absent from it, so I'm not
sure why you brought that up.

https://www.kernel.org/doc/html/v4.19/admin-guide/reporting-bugs.html

> The MCU of the Ally is the embedded microcontroller that runs the RGB and the
> controller of the Ally. Therefore, the discussion of the MCU powersave and
> wake is relevant here. What is not proper is that I should also have replied
> to the original patch. I admitted that much in my original email. However,
> since you are now aware of it, I trust that you can block the patch for
> merging until you review it.
>
> If the patch does not function under normal operation, this is relevant here.
> It means this extended patchset is built on reliance of the broken patch,
> which raises questions. Nevertheless, calling the patchset "experimental"
> is hearsay. Therefore, I will refer to it as ambitious from now on :).

It is not relevant to the functionality provided by this patch, and the bug
exists with or without this patch. The bug cannot be resolved with this patch,
and it is not exacerbated by this patch. Therefore it follows that there is
no reason to block this patch because of the mcu_powersave issue. See above
for how to report the issue properly.

> > This is 100% an issue with your software. I just completed an exhaustive
> > battery of testing at 8w STAPM/FPPT/SPPT on Quiet power profile with only
> > 2 cores active. The tests included using Steam by itself and the kernel
> > implementation, as well as running InputPlumber (which also has an
> > 80ms delay).
> 
> Please refrain from name-calling. I was very specific to say that the issue
> here is that under load when in a game, Steam will either let A leak through
> to the game or not respond, sporadically. While in Steam UI the combination
> always works, regardless of TDP. Since you did not test while in a game,
> this renders your test invalid.
>
> To save you some additional invalid testing for the other issues: using
> ryzenadj on the Ally causes misbehavior, especially after suspend, where the
> TDP will reset. In addition, modifying SMP and core parking can freeze the
> Ally during suspend. Therefore, for further testing, I expect you to disable
> your "PowerStation" application and instead use the low-power platform
> profile, which is provided by asus-wmi, and is the vendor specific way for
> setting TDP on the Ally. Or use asusctl, which does the same.

I should have been more clear about my testing as you have made a lot of
assumptions about how they were conducted. All of my tests were done multiple
times in different games. I chose not to list them all for brevity in the LKML.
PowerStation was disabled for all of tests and I used the sysfs devnodes at
/sys/class/firmware-attributes/asus-armoury/attributes/ to set STAPM/FPPT/SPPT
and asusctl to set the "quiet" power profile. ryzenadj -i was used only to
verify current setting of each PPT before and after sleep to ensure it did not
reset. Also, I only disabled cores to provide a “worst-case” scenario to ensure 
that the test was as comprehensive as possible. These tests meet all of the 
criteria you have specified so thank you for providing a second validation of my 
methodology.

I will point out that the issue of Steam passing events through to a game can
occur when a user has their settings too low to run the game at a reasonable
framerate. In such cases it is recommended they lower their settings or adjust
their power profile to increase performance. Kernel drivers do not need to
account for misbehavior in userspace, especially when those issues are
driven by misconfiguration. In any case, this is a bug in Steam so you should
report it to Valve directly using their SteamForLinux GitHub, rather than on
unrelated kernel patches.

Furthermore, we both know you won't be using the default button combination
and will instead use the included configuration attributes to set the buttons
to the F14-F16 keys you already support so you can determine the discrete
events, just as InputPlumber is doing. This patch will not affect your ability
to use your multiple fallback methods and only provides a usable default
without the use of any userspace tools. Within the scope of the patch and its
purpose there is no issue here as it functions as intended.

> As for using direct HID commands to program RGB, asusctl does the same,
> including many other userspace apps, and prior to this patchset there was
> no way to do different, so I do not see the problem here.
>
> Best,
> Antheas

R/
Derek J. Clark

