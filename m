Return-Path: <linux-input+bounces-8117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 699D89CF5A0
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 21:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21AE51F227C9
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 20:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C1D1E2007;
	Fri, 15 Nov 2024 20:18:43 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2350B1D63FC
	for <linux-input@vger.kernel.org>; Fri, 15 Nov 2024 20:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731701923; cv=none; b=JPh7aqfTJyRMwUjhm4qi65ssWUAMpGHyS7pDTIdJH+tyomJr9Ha+0EhKHeX7VcqGo/y9sscuTG0SdxchI8Xe8POybW7uaH/FGvCSKfpKBL2B22iRZrJ8fPbQCLXgX0XhvoI1iZL44mYF2Bkh/cMPxjbl3bbgZ3iRbn41dpRc0N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731701923; c=relaxed/simple;
	bh=+2jEccC/XP2qEEg6qn9huLPVczWF28j+TSF5zTL3zNY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=T4v0Np67MKEkfK+e3cI0258vyI9uE5HSvBM0FI5SEycmQ2W018YJdkzO7h4Y1+klGZuQ6V78bNwhkucYIAX1+M+kCTs6RcBOcjZiOKPHU4KmWX6lMyP4++ZYCCBWraLB7yOYVfGPYKkAsPSkXcZKez26tjhyX5JzVFUYVpbq5n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dnsense.pub; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dnsense.pub
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d3f35b0482so12889136d6.0
        for <linux-input@vger.kernel.org>; Fri, 15 Nov 2024 12:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731701921; x=1732306721;
        h=content-transfer-encoding:in-reply-to:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gcpQTvMY8jt1HCqObusvCPCqD4We40MwXHaM2ZXvTlU=;
        b=DBsJhSE1k3NOLUiLXChKOvwtK/OrOZ39gnEuiZnuX6oMDJ+ZkSi82yIVeFqYXbmQjB
         yGsDcp3Joig2P6O9AnyyYfVU6bn0doSx+9nt2IadkBEWrOgD86G59SzYqw3MoczxIA9i
         xuBwKOjE2Rli/JzI5C3I71IT41tGNKZ/vrOX3zA0+SBxKFmOpq+RJjW4MJgPbUr9mAxI
         DbZ47zi/uu9afh39p685tccNNXuNl1c1qLkfSVNZTvJiDbO+sY8xrCnNCDmKA0rLU9Rm
         MiACjCX/YQQY67JWf0bKarj3xVTp8Srxg4YSxgA9+nIkPXke8CNGUJXVwXpWLeNJx0qk
         zpxw==
X-Gm-Message-State: AOJu0YzF0ksg3mjCViKyn/jlWEr2aTwiCJWCv6W43glXFejEwm5KFlSk
	cB1gWWpZXMAk9YR+nNqhxTc/cEa4FPXVOJE3sNFV9JcJ44fx2n3T5fHrfbIccZ4=
X-Google-Smtp-Source: AGHT+IE2RBgDJuY9ifp1Ol3iFhH+vMqhHuKElOD5TMyLD4ACY4A2XodDBIzhbIDE5HWNqQDWWO9jdQ==
X-Received: by 2002:a05:6214:5889:b0:6cb:edd7:ac32 with SMTP id 6a1803df08f44-6d3fb76bc49mr48254366d6.12.1731701920889;
        Fri, 15 Nov 2024 12:18:40 -0800 (PST)
Received: from [10.122.232.239] ([142.157.232.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40dbe1db2sm635406d6.17.2024.11.15.12.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 12:18:40 -0800 (PST)
Message-ID: <2d08e47f-ea9b-4d28-b345-36818eadf366@dnsense.pub>
Date: Fri, 15 Nov 2024 15:18:38 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: intel_ish_ipc: loader failure on Lunar Lake
From: melvyn <melvyn2@dnsense.pub>
To: linux-input@vger.kernel.org
References: <b74f8422-a7fb-4475-a1c8-383734449f91@dnsense.pub>
Content-Language: en-US
Cc: srinivas.pandruvada@linux.intel.com, jikos@kernel.org
In-Reply-To: <b74f8422-a7fb-4475-a1c8-383734449f91@dnsense.pub>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Totally missed to CC the maintainers, sorry!

-melvyn2

On 11/7/24 21:42, melvyn wrote:
> Hello,
>
> The intel_ish_ipc driver seems to fail on my machine. It's a 
> lunar-lake based convertible (samsung galaxy book5 ...) which should 
> provide accelerometer/gyroscope/lid tild HID inputs. These work on 
> Windows fully, but do not appear to work on 6.12rc5. All I have to go 
> on are the following kernel log lines:
>
> ...
> [    4.416718] intel_ish_ipc 0000:00:12.0: ISH loader: load firmware: 
> intel/ish/ish_lnlm.bin
> [    4.430675] intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10
> [    4.448263] intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10
> [    4.467844] intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10
> ...
>
> The kernel is very close to mainline (NixOS's linux-testing) and 
> doesn't seem to have any patches which would affect this driver 
> specifically.
>
> If there's any further information I can collect please let me know. 
> It's my first time trying to use a kernel mailing list, so apologies 
> if this is the wrong place or I'm missing something else.
>
> Thank you,
>
> melvyn2

