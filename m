Return-Path: <linux-input+bounces-16819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15165CFDD32
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 14:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FA0F302C4DD
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 13:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20E53195E5;
	Wed,  7 Jan 2026 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ewe8+fR5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329CC318133
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790810; cv=none; b=VhxImneUdYir/otNcQGXcKu5IBQKBDVLVN7piwtGDkTdWnlXdR7TzqGdP9nHKp2agXwYEzEm1yRvtWZoVK1dUxrGK1FEXUyi8RcxZLDU4qliOzgZ9uVJCyFL5PFWynI7JdJT/OGFgoq1BkVJecZxf4GG8Jtb+RLAtbx5Qh6dX5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790810; c=relaxed/simple;
	bh=IDSArho4nKzg/OJTAM8ZeRGtacC4FNBPKO4CVFeAOFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEfhb6ve0mtJ0TjZ/3uLN+RxjeDVR94z7naaXFgKLR4AnJ4cD24ex6hy6gC0RUtXkNE8ZGNFW3M2qtLKzXonFLIMsuqg9G+EP8oVWiMq7anW6fpyDXpu/4mm7ERS/qESOr+M/hL+vTfBgA31+Xg939JVwbKmX4FzvJvGEPoU0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ewe8+fR5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4775895d69cso10080285e9.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 05:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767790807; x=1768395607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UWXvVApdU9vT8fvqDa78OT3d0qIAcGQARkde2N2gSPE=;
        b=Ewe8+fR5xiU/T7pPH69s4DiwMdYK5RPOpimsZ/HZRNIx/d+xD2KAmVyZoF2we27+iN
         I7Ynj3T18QW++XiTg2mc5nRy+631bPyMNed6lvETRnKWWgCUc3EOOLzAt6CRIqYonWQc
         ObZuyCrrmfRj+snh524MFoa82Gc8g/vNEe3RpLojlX2/8woWQbRqTbOD9OAal4WWYUwO
         ClEA4GG4MW/im452cxE+jjC4iLzSDC8GstjGfMnfrMZk2vVeLINbQAPRzV0sZFdkuUG3
         QhFAiKNtCsZjbXpMz2acQWbk4lLBWRR8bcIfe9yt5b2pjLvWDQzhGYw/E3YDadDJnfMy
         TZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767790807; x=1768395607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWXvVApdU9vT8fvqDa78OT3d0qIAcGQARkde2N2gSPE=;
        b=IaMA5mH86tUf8F+3HMGKANbw0P3Sxp0hDAsBomKmOXBjBPnU4ydLjgWTE2MfA/4Ein
         kC2iZRU43KUkpXNz3FoTsjACXOPauDfMVJSBLNAeyVD0FCqsFS3tXb9EcqnbsaJtuJjk
         xsO9RSLHqntIlg/tMy/L9wu3qOAEtX9MHm4WpVXYy529iNfQJ9xVfQC0hxuBXbHjBJxS
         SYO2Eg+C0f3XE7PHahV9bNWtGxlOXccR8E7FSkUxqZ2ixFANWWF//xTQPkR74dUfC0Os
         i6GbO0s0CHMFGDcPa5XYV2w7iXoddHT2YYNcNH1IVhbymeY7ZDfPWUDK5DqAq/IlWWKs
         QGJg==
X-Forwarded-Encrypted: i=1; AJvYcCWxZj4UNCCqlDvm3s24K7Pf/ZYt7c8oJ3F3fcRLZCzwMvNBaJsGRC/kzZgidIDkYmOyE6Qb5+MlvpKJ1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWoMuzBKKsLKnQyjX++GLfVU2y4RhWtEI5DHoOvZRhoBEpz0R+
	4XCRklpVfY5dbU3FLs2SuATDBn1iFVdxXurBcgncgHpjKAjo7xUSTNZT
X-Gm-Gg: AY/fxX7/qbf0vJsaNkyP7ZJrAzDv3O6g8qP6L/DG0qED+DzUijWN4+Ltt0kRQA0KOxB
	D9Fdy0mGSP9wXDBI+UjzpwCwrpe7XxQ39AaVMtKWqkTiF8CyULQSbtRvwvtLqgZU14SaKV2x8F7
	luvQzlLakUCjRskoBx/j638idgsgWewJ0dvjHWsMpAe5YJdMBZ1z24JsWGZyyEBorI+EXl7Dvua
	oTo7zwfIif4mmQ0iJyAhi+KFfL6/6yBJzd1ivxvPElhH4bsLHCbi4NBpbrsQR7855rM5kCq0VwC
	qMGTFcbeg3q9NLQ7j5BA5m017nPcjgCS+HYKmac/ZDNmJTch+3WAOf3CIG6+vMRJquyB5Ku35bX
	H1OTdmqr9yJKEwjXSsNanpjgsUAgAipcfAJALnYTnG0Ky3hHmxm2evIgL44iYEpMevNSIHeHfns
	yq0cXB2XkbFa+UjTAa0EUJpZ8=
X-Google-Smtp-Source: AGHT+IFxRPSQ6ZYq6QGovcyEH5hBqdoM8tqeZCW3NZRPCHLey6PtOVG1WNKAMOMBQiNyMFhS+AhleQ==
X-Received: by 2002:a05:600c:3556:b0:479:33be:b23e with SMTP id 5b1f17b1804b1-47d84b3b4eamr31382505e9.17.1767790807454;
        Wed, 07 Jan 2026 05:00:07 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f390a69sm98953485e9.0.2026.01.07.05.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:00:07 -0800 (PST)
Message-ID: <f3f737f3-05de-4f41-8093-b73f5f3de4b8@gmail.com>
Date: Wed, 7 Jan 2026 14:00:06 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] HID: asus: Filter HID codes and add WMI fan
 control for ROG laptops
To: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: superm1@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, ionut_n2001@yahoo.com
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260107111945.48018-2-sunlightlinux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 1/7/26 12:19, Ionut Nechita (Sunlight Linux) wrote:
> From: Ionut Nechita <ionut_n2001@yahoo.com>
>
> Hi Mario and maintainers,
Hi!

Maintainer of asus-wmi here, thanks a lot for your help!

Thanks Mario for including me too to the party!

A note for the future: from my email client it appears as if you sent
v2 in reply to the previous patch, I have done that on the iio subsystem
and I have been discouraged from doing so because the mail ends up
far from the latest received ones and maintainers are more likely to miss
it. 
> Thank you for the review feedback on v1. I've addressed all the issues:
>
> Changes in v2:
> - Split the monolithic patch into 4 logical patches as requested
> - Fixed include order (linux/acpi.h now before linux/dmi.h)
> - Added #define ASUS_FAN_CTRL_KEY_CODE for 0xae instead of magic number
> - Added #defines for the filtered spurious codes as well for clarity
>
> The patch series now:
> 1. Replaces magic number with existing HID_UP_ASUSVENDOR constant
> 2. Filters spurious HID vendor codes (with proper #defines)
> 3. Adds WMI communication infrastructure
> 4. Implements Fn+F5 fan control key handler (using #define)
>
> This eliminates kernel log spam from unmapped HID codes and enables
> proper fan control functionality on Asus ROG G14/G15 laptops.
From my notes those unmapped codepages is the embedded controller
echoing out settings for the Windows application armoury-crate to
check if it is still in sync.
> Tested on Asus ROG G14/G15 series laptops.
>
> Ionut Nechita (4):
>   HID: asus: Replace magic number with HID_UP_ASUSVENDOR constant
>   HID: asus: Filter spurious HID vendor codes on ROG laptops
>   HID: asus: Add WMI communication infrastructure
>   HID: asus: Implement Fn+F5 fan control key handler
>
>  drivers/hid/hid-asus.c                     | 60 +++++++++++++++++++++-
>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>  2 files changed, 60 insertions(+), 1 deletion(-)
>

