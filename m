Return-Path: <linux-input+bounces-8270-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CAB9DA5A1
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 11:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53DC9286941
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 10:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF0C195F22;
	Wed, 27 Nov 2024 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N167uaep"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D59A194C9D;
	Wed, 27 Nov 2024 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732702931; cv=none; b=tE1IW6kN9g7F5hhAXwqHDd8k5caTaByfDrYWdZGcc9niwchNFMWBdwuDJ4lpAWR8Yp14q/NBXCr3JOvpg4WfzSAKpuLNuA8sX2dzZE/HqAbtDTHyHZ8nI/GqDoCjpFqYr46R8UY+AnsS8Yuw8/61GiKQFYKxt03FKalaQgELJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732702931; c=relaxed/simple;
	bh=dbxHNcjzVTHw711B1AE2wdX8JT/Jj/hcNUXzErfxU7E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=R0ZVvkIkyN3qxaAHH1hE01SxYoMmfJZB8juc/waxVkBXmnL1r4ZPccrGHfVWWNZFy3HgvNmE/S+JCmTlLNgOa5tVdo3N+PInrbyQfK7FoH2XgYYIncvxFrG+8sYp5Kgd38d7AjQtBAERSWRkeLiUjKoATeLXg1x9BarnKCIw2ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N167uaep; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-211fd6a0a9cso48190945ad.3;
        Wed, 27 Nov 2024 02:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732702929; x=1733307729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qz+EP+l7Qi3fy38Fu3GsKedJkFdI7GfNaCEpN7e8AWQ=;
        b=N167uaepldLPHvVFRA0Mrnw3z42bNVt7KyLu9ODGKlSD52gzZ+Y0T6Si6KKAiueT4L
         p+sA7yulHbzJcLQQbO/IOe8brwk4282rtqwbvHCmasYrVZ2L6Pswqzt/+6+z2ttVCCVS
         PJKigZURJE6OMI5eVwZIYQbpIdDj6aeQskVX61ymtISBzvt9rX/Lhx+RP1ZMy0QTGekj
         P/fdZxrO7On2Tc8SWfZTP13Hl8nTzRBicYiKasLuI2FOFztwk413k9fxYz63GchI/EOY
         +Z4cEKh2xzaVtVDVJ5jEk0By6Oox3Ox3vMer7ZXmEh6OLr8m6spyuuv70CIPRsatnBQb
         zNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702929; x=1733307729;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qz+EP+l7Qi3fy38Fu3GsKedJkFdI7GfNaCEpN7e8AWQ=;
        b=jE/DDQ9WY3qujhyKRb5ECujmJIefiPulLf/f7+DYo+bVOrtM3W3ziNPSz6L2upnAzI
         oPVAlVFnW4Wja3/cXkvfKdhchtCyqerbl+9ohna6rNN9q/aa0hTQyovoepfhQlu4DmJC
         TUBlKgZe5iylJVTxXa22kpNFeGrskDIphRZf/udVtWauo871ozGXWLGs4FZFDURPLjH8
         ibFkesH4wD1rykJGPx7fPCZBPzVA43WhzG2tgB+QtCidTvfZWHIWsjnHF3uCr0eBTm76
         z+dsIjCNnYQyCl/q30RXnNcXnQZd7CvQntaynP/fd0r38fmrY8ARL5TzmqZ9MsgVT6ON
         kzFg==
X-Forwarded-Encrypted: i=1; AJvYcCVv6CdDnx/OgyvnUrn+mlLwJwzYJZjOzMl7osCJXjmjcd9DRYlDkwI8w0mIfH6CuejNdAgx0lKkQ8af@vger.kernel.org, AJvYcCWJndSc11T3G8ljU6XxMzGfFzGd8RPaxviKqG1EL+xy79/J1QyX5aanNvCOKHv6q+X1yzP1ziv7qfY9P8Q=@vger.kernel.org, AJvYcCWt0orC3TBdyEN6ZA1oyc7CUbM5mPVnThLcS96c5+Z3C/s4FCjfvyW8svHoP/GqYzh0zOV2I83J+AFblVXk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+sN1/CBWeXPU9PmOo36wm/ST5R/hP9IcpcPrWeAP/9QmCjXed
	Sbd5t1RmlQIXdxT0JjRlDK9BeWdA5diYgbHb4tP/5uw1Kqq7KyXK
X-Gm-Gg: ASbGncubswYp3D6sOXojcaQJKqPdUC9L64b7MMSZYvMCZimTccVr44atc/kaO1/zlBd
	paEH2Zm4QGn/PyiFkyu3lE/DaCQZ2XM5uNpAtmZiFNksusky/eto5j5x+ZQ3QzDu76VUmG2js+n
	zfkuLj6JBeKeNOt4Ja7de1UON2RPlaQVkYpwESHFIFrINUAhA1i5RM6r8KEN51cX3FrMU+NC0Wb
	ZNm58z5BGRHJGgQLj1cnxltqSs70FXENYYs23+Rtq78Wzo3eoPj/0If
X-Google-Smtp-Source: AGHT+IGjRx2ovLJ/PK1xeg/mE4q6TiXnbUVeTxirN9MONHEAnthNoTHl5RsWr+Fkoonsn8w1pCxhfw==
X-Received: by 2002:a17:902:ec84:b0:211:9316:da12 with SMTP id d9443c01a7336-21501381d49mr27610445ad.22.1732702929243;
        Wed, 27 Nov 2024 02:22:09 -0800 (PST)
Received: from ?IPv6:::1? ([2601:647:5e00:4acd:e351:853:196c:a120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba3588sm99445525ad.86.2024.11.27.02.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 02:22:08 -0800 (PST)
Date: Wed, 27 Nov 2024 02:22:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
CC: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/4=5D_input=3A_apple=5Fz2=3A_Ad?=
 =?US-ASCII?Q?d_a_driver_for_Apple_Z2_touchscreens?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMT+MTRTzPwo7QveP5Zt_4Zycu1qohe5g8srC8O8Jo+O+-wLJw@mail.gmail.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-2-c43c4cc6200d@gmail.com> <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43> <CAMT+MTRTzPwo7QveP5Zt_4Zycu1qohe5g8srC8O8Jo+O+-wLJw@mail.gmail.com>
Message-ID: <3FA9FD56-ECF4-4E2C-A300-7E552F60987D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 27, 2024 2:19:38 AM PST, Sasha Finkelstein <fnkl=2Ekernel@gmail=
=2Ecom> wrote:
>On Wed, 27 Nov 2024 at 10:00, Krzysztof Kozlowski <krzk@kernel=2Eorg> wro=
te:
>> > +             dev_err(dev, "unable to get reset");
>>
>> Syntax is: return dev_err_probe, almost everywhere here=2E
>
>Per discussion on previous version of this series, input asks
>dev_err_probe to not be used=2E

They twisted my arm=2E It's ok to use now=2E=20

Thanks=2E


--=20
Dmitry

