Return-Path: <linux-input+bounces-1647-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E06C847FB7
	for <lists+linux-input@lfdr.de>; Sat,  3 Feb 2024 03:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59FA428164D
	for <lists+linux-input@lfdr.de>; Sat,  3 Feb 2024 02:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9519AF9C1;
	Sat,  3 Feb 2024 02:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jvhmreDY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65BDF9D8
	for <linux-input@vger.kernel.org>; Sat,  3 Feb 2024 02:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706928346; cv=none; b=QSg/COLz4y+RL4iB578TITpEpUZmCilTUVZ1h9hnZHo02SiN0CutU0ZQpf5ALXRXT4eHoNSoglKY8LXHMKribXNWK2F4om5sclAsdd7KZAahK56Ug5Ub7ubj/DBasan21F9bGZsIoUVZsV4dcFDxKTukv7DqWetudGUPVJHLc+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706928346; c=relaxed/simple;
	bh=eMmpm9D1VRMDoOm2C9Wcj2Rh4lvyUqgntAlB+T7UHe0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=DVxfszyCiZHepVaU0EbtvVI0+yjrad9BV+L7kJeZP/V61F52OH+CkzvH3t089ggmDIzNjsoltY7ls6Tde5kiUjxfQ5s+bkQlF+aQ2RDUdrrNKitqn01GZNPh/QBxp+S8fPMgTDXwZ6Iw39SMCqtQ95U5CqLfemeegBJOeQs8MPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jvhmreDY; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-595b3644acbso1816238eaf.1
        for <linux-input@vger.kernel.org>; Fri, 02 Feb 2024 18:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706928344; x=1707533144; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiCf+vXw/vrQdA5jqpkianEwZDzpLmx6VygCFzNFFyU=;
        b=jvhmreDYtDUfmYBZxEtN1HrO9sQnsJB7D5U32VxT1yfgqlb6omk1NJahPOfphgIEO8
         Y++g/N7HFY5CEi2X2vdkBwjvCsVxmzNaFSyXAhZr/hS2QVVKNqrR7NNIKUxgAWQytRvv
         fr3j0HHRiWqJgosd/02Fp0b5yzEpxFVM9SNrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706928344; x=1707533144;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TiCf+vXw/vrQdA5jqpkianEwZDzpLmx6VygCFzNFFyU=;
        b=ScOkvr9lk6pbHFhECp3kz3af/M3OtRgTdzw9IEUyHC5Ww4Ieh/6CcF0p293VlNJd7B
         VcQGaIer8rDPxVTV/E45wZEdsZX2FQTrwumnthJn7U16c1FbaMFLiLD1kgI0mt0CqFyb
         ynTjM9bdvqVQ83u4273nuQVppQUcNL43syC/8bCQculagzUyrfmLrlw4i6qBnXH76/uv
         ZC4ZsfEC7ecfRDUG8ut+Mx1jfE8XulwDmSW6ha0Otv8TmvL2emJMJN0VofSvkKoF039b
         KFNaLQ83uokyPrRJM20hh3IFdJpofALwOZuq9F+D+OEwcndCVMFhhadxnhl4yfoeiqoc
         ThfA==
X-Gm-Message-State: AOJu0Yww2MU8sJVTmvXHAQjpqZDXedZiS1BOvZDGCTTIYN8td5/hkrte
	SmN1SuC6opFbUHWIJqekiPOnFni5DbGMPeigo8HWUwiH1P6kzNh6bOdHcn+5QTP8uq60XwK6/1w
	otQnxNWw=
X-Google-Smtp-Source: AGHT+IGyzGoq31C1MkEL9BBu+gtt2B7T9u1AfwrDp8NYtrLuFNeUM78slwISaHked/S30J27Eaaaeg==
X-Received: by 2002:a05:6808:d5:b0:3bf:c445:7827 with SMTP id t21-20020a05680800d500b003bfc4457827mr182687oic.3.1706928343833;
        Fri, 02 Feb 2024 18:45:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUl9LBg4+16GDNvnn+LU85BXpWpNrDbl6O71E8gDtDHI594Cdt+xcYEyq/wqqI7gi0tK4SnHiVPUg1ystMo+fDxof8IMFS19iv1qUUkkh/KbpQYd+aYMeStVM3pyuMNE0aNa585Gh+1qL78
Received: from [192.168.68.60] (076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id dd7-20020a056808604700b003bd4ef0c871sm585792oib.41.2024.02.02.18.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 18:45:43 -0800 (PST)
Message-ID: <3b82d3d8-c0c3-49e1-ae68-966f02fe5429@chromium.org>
Date: Fri, 2 Feb 2024 20:45:40 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: stable@vger.kernel.org
Cc: jikos@kernel.org, benjamin.tissoires@redhat.com,
 linux-input@vger.kernel.org
From: Aseda Aboagye <aaboagye@chromium.org>
Subject: Requesting 3 patches for Apple Magic Keyboard 2021 to be merged to
 LTS kernels
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear stable kernel maintainers,

I am writing to request that 3 related patches be merged to various LTS kernels. I'm not sure if it would have
been preferable for me to send 3 separate emails, so please forgive me if I chose wrongly. (This is my first foray
into interacting with the kernel community) :)

The patches are as follows:

    1. 0cd3be51733f (HID: apple: Add support for the 2021 Magic Keyboard, 2021-10-08)
    2. 346338ef00d3 (HID: apple: Swap the Fn and Left Control keys on Apple keyboards, 2020-05-15)
    3. 531cb56972f2 (HID: apple: Add 2021 magic keyboard FN key mapping, 2021-11-08)

These patches have all been merged to mainline, but I believe when they were submitted, backporting may not have been considered. The Apple Magic Keyboard 2021 (Model # A2450) seems to be a popular keyboard, and without these
patches, for users on certain LTS kernels that use this keyboard, the function keys do not behave as expected. e.g. Pressing the brightness down or brightness up key didn't work, and bizarrely pressing the globe/Fn key alone caused the brightness to decrease. None of the top row keys worked as expected.

I checked to see where the patches were missing and figured that it would be good to have those patches in those
kernels.

I would ask that patches 1 & 3 be merged to v4.19, v5.4, v5.10, and v5.15.
I would ask that patch 2 be merged to: v5.4 and v4.19.

For patch 3 to apply cleanly, it needed patch 2 to be present in the tree.


Thanks,

--
Aseda Aboagye


