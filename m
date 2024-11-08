Return-Path: <linux-input+bounces-7966-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0455E9C1445
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 03:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFAB51F21CA4
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 02:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF287462;
	Fri,  8 Nov 2024 02:42:47 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651F51BD9FF
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 02:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731033767; cv=none; b=c1ZUL7q1lUzlGz2j2z5OsUEzwj0waXRQyV0Uc4lwfFoUcvUTgHo3pM2JT0+fjaDwY4KSWSsG+n6lJj5UwSqQo5encSeIzx2wdCmqA+fclwbFgu4ukXV4H28bhdkXX+By4aqbhH7glsIL2IQBv66XZmbyCJpfBCpWyeu9Afk7FBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731033767; c=relaxed/simple;
	bh=E+5XgrB+nnAs2pwgveG7uUPOcxGryWzURdYleYU9lXg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=gLgTatQZEAGRiqdyDpvovalfo/FddOAszfkYjqn9hZx2d6jSBZCY7gGf6RE/ptkUg1p87kOtWMpDtWZvBo47VHY68Qxb6pfLQQFEbB1gX9Yt0uug7F0R7MogUT6qEl6mO3+NzOB7ZNmEyef13FP70KPaa/pcSNRnE+sj2mIbECQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dnsense.pub; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dnsense.pub
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b1488fde46so98880485a.2
        for <linux-input@vger.kernel.org>; Thu, 07 Nov 2024 18:42:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731033764; x=1731638564;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LhKC5Uyu2gNryKU0O4avbXv7FrxTPuaSO3wEflvnHr4=;
        b=iK6+L3oVu3LkSD/gB+VlKA06IyPlPRNb9aPvPJ2XKF3AdsyHFyaAJFygAoUyGA789J
         6QmIxA4FneXwU2Q9GPozJ8/sT8Qjis9FQjBCqVJFRahRCzSc3eiw6wML0F2d6w+BjYz9
         1PoiYqi0uBaBfn95YCA7L56te1hBZIaUBD7kyKMYuWTMzrNkl2kZ5U8c6PozwkI1zsSn
         yk3oSxIbLpgZNcOBs26dvVSASip1udE2hpalMAaLweufurVf5fEyiJh2bJkBPo6GxjKk
         iOzlDj+1YPv1y464SoWhd56c50poLVvZjazSyJDQ9Y4YcKXDjkpSEL4wykVbdYPUByF+
         Qvbg==
X-Gm-Message-State: AOJu0YzftsMcC6N1cJeV0R9JU9vOSviPLCTB1FTunjF1L1gw/NxI1Xsf
	2AM1U+ZflFqKWRAo8pe58KejuuFUbKB2IBFfGTYEu8g90Pe9jG51O3AOigAh
X-Google-Smtp-Source: AGHT+IGu8c/PvOZoab9aczFZreyVJ8i9zayHbehAzRaCbd0qYiQlhvXwCHcaRellDPCSx/wyIHh0+A==
X-Received: by 2002:a05:620a:2990:b0:7a9:c964:b358 with SMTP id af79cd13be357-7b331e88cdfmr172860385a.6.1731033763791;
        Thu, 07 Nov 2024 18:42:43 -0800 (PST)
Received: from [10.122.232.239] ([142.157.232.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac7babdsm116857785a.63.2024.11.07.18.42.41
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 18:42:42 -0800 (PST)
Message-ID: <b74f8422-a7fb-4475-a1c8-383734449f91@dnsense.pub>
Date: Thu, 7 Nov 2024 21:42:40 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-input@vger.kernel.org
From: melvyn <melvyn2@dnsense.pub>
Subject: intel_ish_ipc: loader failure on Lunar Lake
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

The intel_ish_ipc driver seems to fail on my machine. It's a lunar-lake 
based convertible (samsung galaxy book5 ...) which should provide 
accelerometer/gyroscope/lid tild HID inputs. These work on Windows 
fully, but do not appear to work on 6.12rc5. All I have to go on are the 
following kernel log lines:

...
[    4.416718] intel_ish_ipc 0000:00:12.0: ISH loader: load firmware: 
intel/ish/ish_lnlm.bin
[    4.430675] intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10
[    4.448263] intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10
[    4.467844] intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10
...

The kernel is very close to mainline (NixOS's linux-testing) and doesn't 
seem to have any patches which would affect this driver specifically.

If there's any further information I can collect please let me know. 
It's my first time trying to use a kernel mailing list, so apologies if 
this is the wrong place or I'm missing something else.

Thank you,

melvyn2

