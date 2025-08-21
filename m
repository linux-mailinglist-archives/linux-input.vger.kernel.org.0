Return-Path: <linux-input+bounces-14242-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F711B2FF9C
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 18:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A42E17BE026
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 16:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73E72D29B7;
	Thu, 21 Aug 2025 16:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L09ve3g5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6432D3745;
	Thu, 21 Aug 2025 16:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792394; cv=none; b=shI5NQXpLc0ewb4bMhYrJkuB4RQ2nQB+CPa1L60Z9wgpsa2Vb2SmkukbtGwmJM5aDVOo6uHvzgtNMjeouGrftjnhEDHjSZyB6/6iFnJaeTPiDnW+xP01a0vxlNCxKjZjNm2Lq7drm/biAsA4W52eJ1ZWKIbjh1UtXedHwSC34N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792394; c=relaxed/simple;
	bh=wcbuo+3AyQiSAOlwL37GqZNp7kSPC8hi55kPJHMirsU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Rqtq1/8hRG+tbMKObMVB7hEcLZ2PVwoEIMUl5/IpT26ySgoyg27yE1z5PubQCYzwHTEFN4cv2zo/4u5yH0nX33mDrx2Sm5aHVpj+HyTR3HUoQMSsrHF03HegJLS6Fut26NpjnMJQE9ARyYr560c98cgGoiK/JiVzWpm+y4WJLcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L09ve3g5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7a16441so173160966b.2;
        Thu, 21 Aug 2025 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755792391; x=1756397191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9dk1yp1rV4JBOFv12CvKzNbPaa/5Em4ZRaChGbcovk=;
        b=L09ve3g5WC0zBlbxQ1/QCPQLQpnNbfrsH5A26+i5sZbURpR0OJ7ewCuAGbTUR728s6
         zX00FrduE4DSzk0+RNNIZZiRqVQblDu7e5LzQL4mQdObXu/4IcPRnlOkD0JhgE3YxNC3
         u43zz1zH924VdRhrMBVm7rkpGP6bRMUOOI5+AAzZ+fUAnzVTogDVxEu/Zs9jxK60amvV
         0lPvytHir1Q/J6P6UkntOE8qMbmQyz+9H4XEI1RBG21ZpbJ6WFz49J9FUu6MFei3hFpN
         uxZ6h/v58OffmTHGFJUXcOcBm4LXnoxZ6/HwThk8QOn2d2Cy1EKwo2XQrPUAWvRJ7Lwe
         xuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755792391; x=1756397191;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q9dk1yp1rV4JBOFv12CvKzNbPaa/5Em4ZRaChGbcovk=;
        b=lzxim12W9X83z1d9RfWZt6h1IUqhWB0ZztW74DJHEkZdUTUevT2nTqBOBuFmkv6Ecf
         bHoRjAFnZAQBMLbA0YrxlNTNQXmHU2TeSOxwfnYNEY8T+5FtlYg85DQ7KHuQWZajbd3Q
         1gzl/tC4rb8J+cOtPikpuZOI4H2M71bT85R1xvDnNuiq//XWtMSLW4wnedwrcFrWbibr
         /Guwr4oyAIi/KFXVTajBhcGVaFahOCvwEFkESPGnlYB1a6Sv3/MJdOFfk3lQhrlObTwF
         f8NykjlTVvfoJfq+El+yz/2RsxAwzck73zaNJe4ewUsuvh94RlY25covGXBsl+d3Pqh3
         GREw==
X-Forwarded-Encrypted: i=1; AJvYcCWmotBR/5CK296cjBlQJzZKp0QjjwXYSNAT9pOHis4WMKTm7FaLkcacbdd1dGFfjweaG2aYIhb+jUkOei0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzASfy/oOlIu7K7TeQ2d0/1MMrzYLh163+D1vh6QhGBrI1pRJLv
	XKXqaMs6YUVoy05b3ohd86wjjepO3yROM2mOLpb970noq1ZeYwYACpiPNn8RbfhN
X-Gm-Gg: ASbGncskNTjOOuckXiutL7wYFyF6QVcUHjQyuavtrk7MW65B75FsfU831I7VaS3jH2D
	1nymVT53BLV4A2b5rqI0+/vOvwdSt3CSdBb/k1Gm2E7zN5lu5X5NbOzVnuHoUJa1qcNblAZjWl/
	il7qi+l1r5Ycn1Hk2h94vv9vycLeo/BXcCDDv2a66DeBjojwJiXFl0kKxcq39DJsuXHJVJuIPN6
	LHMeuNi6XYatW3SRlVEnPcM/AJs6uDi53m0TR1qsk9Gwu27p63Gzf4tG3YC9Dk9mJdJQ0wMz+0e
	knoq0uq6tSTpxgCnXIjpiP+lqJfqmjJdJEk6XdC3DZlDyBUL3eSjv4xal8AuPF6rrW7J9zOKmiv
	el/62lK1RyBykwMWADzTDQ3SKshGkIVUPc+bYj++MXcb4QPZ2VPvXm0jb9ybupTNbDw94aZyuOL
	3/t8ltHCaLJQ==
X-Google-Smtp-Source: AGHT+IGKXeMeNQVsD7I3Q41pa0/1sqAvoMwsxsmgB21YXcBn7EBXZ6SIqmeKxjoEvA32/r19jYIiAQ==
X-Received: by 2002:a17:907:3f90:b0:afd:d9e3:9541 with SMTP id a640c23a62f3a-afe07d7f373mr291307466b.65.1755792390777;
        Thu, 21 Aug 2025 09:06:30 -0700 (PDT)
Received: from [192.168.1.171] (host-95-252-189-221.retail.telecomitalia.it. [95.252.189.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2badd9sm408882466b.20.2025.08.21.09.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 09:06:30 -0700 (PDT)
Message-ID: <7514c681-1020-4b31-b195-ebbc3e4a611f@gmail.com>
Date: Thu, 21 Aug 2025 18:06:29 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, it
From: Massimo Giambona <massimo.giambona@gmail.com>
Subject: [HID][asus] Fn+Esc not handled on ASUS ProArt P16
To: jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

on ASUS ProArt P16 laptops the Fn+Esc key is not handled by the hid-asus
driver.

When pressing Fn+Esc, dmesg shows:

   [21348.413951] asus 0003:0B05:19B6.0002: Unmapped Asus vendor 
usagepage code 0x4e
   [21348.498405] asus 0003:0B05:19B6.0002: Unmapped Asus vendor 
usagepage code 0x4e

One message is for press, the other for release.

According to USB PCap traces (see 
https://gitlab.com/asus-linux/asusctl/-/issues/585),
Fn+Esc sends:

   - 0x5ad04e01 (enable)
   - 0x5ad04e00 (disable)

It would be useful to map this to KEY_FN_ESC (or another appropriate 
keycode)
in drivers/hid/hid-asus.c so that it becomes available to userspace.

System information:
- Model: ASUS ProArt P16 H7606 (BIOS 319)
- Kernel version: Linux 6.15.10-200.fc42.x86_64
- evtest: no event generated
- dmesg: "Unmapped Asus vendor usagepage code 0x4e"
- Distribution: Fedora 42 Workstation

Additional notes:
- I tested a local modification of hid-asus.c:

     case 0x4e:
         asus_map_key_clear(KEY_FN_ESC);

   With this, Fn+Esc is mapped correctly.
- I also tried sending the raw reports to enable/disable the FnLock feature
   from the driver, but hit an error:
     "BUG: scheduling while atomic"
- I wrote a small tool: https://github.com/m4ss1m0g/proart_p16_fnlock

Could you please consider adding support for this key to the driver?

Thanks for your work,

Massimo

P.S. Other unmapped vendor codes were also observed on this machine:
- Fn+F8  (emoji): dmesg code 0x7e
- Fn+F12 (ProArt): dmesg code 0x8b
- Fn+F10 (Camera toggle): dmesg codes 0x85, 0x01 (but work)
These may also deserve mapping, but Fn+Esc is the most important one.

