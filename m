Return-Path: <linux-input+bounces-12516-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE1BABFF16
	for <lists+linux-input@lfdr.de>; Wed, 21 May 2025 23:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799071BA5BE9
	for <lists+linux-input@lfdr.de>; Wed, 21 May 2025 21:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D24A8633F;
	Wed, 21 May 2025 21:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdXe1x3C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F897184;
	Wed, 21 May 2025 21:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863961; cv=none; b=L/ZNc0YhGdebDszC0faTTjFqXXVjuXjvShs9HeuHwHM0z9s0Rze0xaqjimK934SFBIphGdNFCCkMave3CJuXQ0UrwKqnUT1Pgmqh4ofAVKq2R3WoEr5WnKwHRl/bPuMNMb4CDhhUfHHML1GxP724kaFB+eMWHEBiP1GDBTf8vd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863961; c=relaxed/simple;
	bh=dSot4tq/1fn2N5PS2olD24aSA77F0AHNMa2LLzKmI+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwD4UVSJftcFjlXfkowSaRrTWjSHiphUYV736HxkxJt8OBDQG800p0rEaDW2k7EWcjcon0B3c5zxVplbKY0YlBAZ3090Wk00DZ9Vx6LeaN6NtFV4t11+tlKJ61oycwu4NpFoigYOdayOxB6JSlYPqdAXSveU7pMwyXAfyUKrdRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdXe1x3C; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c5f720c717so978261385a.0;
        Wed, 21 May 2025 14:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747863959; x=1748468759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RbQ0bw97LqXPRFQbGkmic8OcupiLMtaUApD5+Mskf4=;
        b=LdXe1x3Ck0SuDrHgRyNJZ9kLG60w0t0J/yqG52PUoDmra11lEPR7rz/AgZgh0Iw809
         VMGMHqI+r2sPciSjswlzOZ+eQyXIXLqgiEqJbu+eUwgrpb16iaiWgFf+3cHfgEOyA3LF
         1PvrbgxgBwVPdZb+R2aMeWpKdGA+IVwxq0VngqKx1SSO39lwY41kBXEHe8EHPpfJh3i3
         fgpSdAz80n2Du/gpjJUYHdsdTuAwJTLmANiRckpd7AdhlReVkSvPy4ThS//YXWTa5out
         EC/inRxP1yFoDc9J0pe0IHQ/SUIc1Bu7rBHjqycMfqQpw5M8RdW5dnPecLksfEvoXAtq
         3OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747863959; x=1748468759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RbQ0bw97LqXPRFQbGkmic8OcupiLMtaUApD5+Mskf4=;
        b=E7z3T1N2woMU+w57+/0g6s9xG+buxKixphRXMfQAOygZIizaWKtrlF9/8GBwxhzDQX
         CIQjh1UvAyWvm4VW4bSwY42KKfAc6NpVi3TojG18aGZmTtGJ9kJ0zo0O3R3LnyB5id4j
         2nquFRV7ioJ1C0QK5Ph6Q7GGgdDALhpCzMxV7+4PsxuQxNZt3KTEIGkD0XQ5/YBapBUm
         j/uVpJDEvvPuYvd/G436XGvg3Pq7bKNLWg2qM0aPnYCsGa/2yayhDwR2ZIgYO/iev9pR
         7wvJNQYziU0PKV7gexHV6U+sDiTh+6PnC6FqRdl2Hie+JaRqrc/mZxk+Le9nWCcLFS5P
         jzhw==
X-Forwarded-Encrypted: i=1; AJvYcCUW53b9S4MBpgb5zndAaX93kQharYwN9xuBw/wU8RPMyfC9S9hZ/0vrklOvB5ZFScluhGxZ44NQHC+TWg==@vger.kernel.org, AJvYcCVPzvGVU6HL+FTYOZ58QoHPeEupK9Jo7WnL4n4Af+8ESrWfWr9NKe6Jra/3REGZilwG91tJrwg6RoD9wiTd@vger.kernel.org
X-Gm-Message-State: AOJu0YyL0HIyZRN1lJGLq9o8C5RRx5OY5fJAYGyq97WJdGB1Fi23tm9b
	rhpddyH3k4TT2dI9ciEnS42ifJnFvFWOKTItMQUbPtCcfuBWAirSUzSEjeKFc8yoCqJybwZnf08
	ZHMTsIwLHNovrbr9aNpeG7v2rxC42HWE=
X-Gm-Gg: ASbGncvmrAe3inCJ0vFAtkqhsLpUw7XpAJ8sQtE/I6C/BmKIztVw3VsvPN/qqoe2ES8
	uMMu1ioGr0exuKnRFyEmKugMI4sqRMt16blKNFl4goNaIHzbGvXzWc9kdChcG4o3HaFgM4KkZD+
	c2+/UekChuUDZvPLHo95115yvRC/syRsHAIg==
X-Google-Smtp-Source: AGHT+IHKrqvGTp5B3iILNzwWeRXbZ+qaaV2MFonH6ti3dxckN/8BqA70IxxjmFitrdq8qNS0DCGJSV/xOIz4q8nSWhw=
X-Received: by 2002:a05:620a:2725:b0:7c2:f39d:d0e0 with SMTP id
 af79cd13be357-7cd39db8db5mr4548423085a.3.1747863958952; Wed, 21 May 2025
 14:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517105045.70998-1-apparle@gmail.com> <naxnt42hmvorqkif3pu4x36tpo44ugo2oiblrbtlrauucm5di2@tr2yobgoywmm>
 <CAB7A79ysZ2-kxKPyiM1+5keSrsbVwNZti4FzXGUbjx4OONzrDw@mail.gmail.com>
 <ogmv67n3rdia67ttj6whj4wnr2humhl2fjpo56phghqf67bpjx@bbdmdsmbp4kk>
 <CAB7A79x5zviCqjO_LY34v53YpDgpc3Lck5n725bn_sYTkL8EEg@mail.gmail.com> <65636077-FB55-4E20-80CA-419EF9A071B8@progandy.de>
In-Reply-To: <65636077-FB55-4E20-80CA-419EF9A071B8@progandy.de>
From: Apoorv Parle <apparle@gmail.com>
Date: Wed, 21 May 2025 14:45:22 -0700
X-Gm-Features: AX0GCFt9vm5vlsJqjgLhvGreL8zCghUzvhzkPcMdfWJf8GMv1_SL9yH6e4HzIII
Message-ID: <CAB7A79yzSq0n9cdbQFZfzzZ+J=iub+vo6j3FkRRty-e0vTsvLw@mail.gmail.com>
Subject: Re: [PATCH 0/1] Input: xpad - add disable_xboxone module parameter
To: "A. Bosch" <progandy@progandy.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From what I've read on udev rules so far, I'm not sure if there's a
clean deterministic way of unbinding one driver and binding it to
another.
As I understand, I'll have to write a script to run for either the
"add" action or the "bind" action. The "add" script runs asynchronous
to kernel's binding, so it could happen before or after xpad binding
is done; and even if I unbind it, kernel can re-bind it again while
scanning the USB bus, which again creates a race with the script. If I
use the "bind" action instead of "add" action, the script can recurse
depending on timing of kernel's attempt to rebind. I tried to look for
similar examples but couldn't find any -- just a few very high cpu
usage bugs due to similar recursion.
Other similar scenarios (like graphics drivers) that I tried to find,
just blacklist whole kernel modules or used some module param.

Though I'll admit, my knowledge of udev rules is somewhat limited.


On Mon, May 19, 2025 at 11:23=E2=80=AFPM A. Bosch <progandy@progandy.de> wr=
ote:
>
> Hi,
>
> could you not create udev rules to perform these actions?
>
> - Andreas
>
>
> Am 20. Mai 2025 06:04:36 MESZ schrieb Apoorv Parle <apparle@gmail.com>:
>>
>> Ah, yes, that's possible. But it's too hard to generally use -
>> requires manual command line intervention each time the xbox dongle is
>> plugged-in and/or computer reboots.There's no easy way to robustly
>> automate this especially for layperson linux gamers.
>> A stripped-down and hand-compiled version of xpad is at least fully
>> automated, but only until the linux kernel is updated by the distro.
>>
>> On Mon, May 19, 2025 at 2:36=E2=80=AFPM Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> wrote:
>>>
>>>
>>>  I understand. However you can unbind and bind individual devices to
>>>  individual drivers via sysfs by writing into
>>>  /sys/bus/usb/drivers/{xpad|xone}/{un}bind.
>>>
>>>  Thanks.
>>>
>>>  --
>>>  Dmitry
>>
>>

