Return-Path: <linux-input+bounces-6903-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A91C989E2C
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 11:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7D35B23ED4
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 09:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAA2188587;
	Mon, 30 Sep 2024 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhVGf7oj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182FC14E2E8;
	Mon, 30 Sep 2024 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727688551; cv=none; b=iCU29dvdHs1/O1H1HLKwW/nAq+l2EiXv2Mt/qXcz/1jswu5c7IuD1lp1V/A89yCiLELNVwzUr7MIdpYEhobZeo0p+i6H7FyhU7vXddh5ONXlN9TfM5/WxLsDBKKRvhRv3xt8ny4OUnKeBKwPNcU1dYgr78euB37utNf06gXfXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727688551; c=relaxed/simple;
	bh=RXUtGAHXcO0wXEAI0WJ+RI9nPgGIftP9AK5xim27KUM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cfo9i5hmICgKvnk1jDTD2AC2HfesnccgKbhW/IGFMl4f0CSdZ0w4CDF9Tiu6AxFnayHVwZRSd/BQANv8D6qesiqfqwUVoiftDlBLkONABSuOGjkDvIx/+5lF/2oDzrONsVa5d1oB9hdvT5ECQ6hmHLlwAT6j3FpLHbs2700Q7Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhVGf7oj; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso764609566b.1;
        Mon, 30 Sep 2024 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727688548; x=1728293348; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RXUtGAHXcO0wXEAI0WJ+RI9nPgGIftP9AK5xim27KUM=;
        b=RhVGf7ojiABF18udgptw+9J5yY1uOW0IjrfK4NHry9Iu/Q+lM5mxNkNRhcKVV4W64m
         Id28wjI9yUE67O1vI2eFIESPEPxdhKLImTOTeu6rNQLRMS8tI8gGCWPHDs1Fc2L1Q/jU
         a4DF09nxIYO5n8K5ZnOfMWiiMmJBzRp2xd46Kk3tBiY5rS8d2MJGMupIofTrV5jP3EI6
         P160b1DHLayufuQa3SWwsA1YBZumv+6ilvjZq2BHmffnDEsxKafyempn/yFpIbRGkcxL
         Fbr8iC5Qa5MGWkyEY9UyVo2N65Mm/6fAIsCacQd4VAkoqJsJ8+yLuvYoMlEUaPRh+MYM
         rtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727688548; x=1728293348;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RXUtGAHXcO0wXEAI0WJ+RI9nPgGIftP9AK5xim27KUM=;
        b=KioIKUOS533CLPKnVOtJCNlS9GpXdvLqCkwoVbtcu6bwsCe30+uL8I75TQzGPCPg0L
         JOX9wWJdMnz/FR54laMO2rEGaLG4iskqKCRbv0+4BF0kNDjmEEw2/pESTrFJ5Exp5lB0
         HpwWpjsT+Fp9O5UZDKXttX6GJwUervXdWBQSD2/qkHLqVrUklP/ROjFhNGTJcbIS10XF
         E4ec2rOJkIJPLjBThDnrAwyZ2fs3ma8Lx1ZqqqVkwQ+KOtbcnCJMyo/y7nys8dxNIEht
         Ub/pHUBN1tDeozm1yBJ1StyR+WDuZEc4RodhUyXNPmsMZXoEXuSUJxJ2bAfAJRJGjV2f
         23pg==
X-Forwarded-Encrypted: i=1; AJvYcCU90C7iVqE0WoQ+fVEfky2IU5rylhzsejJ6qO509Dp+xggqz3kepj/HTqoLHD92jmgLOZp3RqxQXTZtFKUl@vger.kernel.org, AJvYcCU932iVL1yDigwGPGcJIDpCIyw2q2cJflCHoswnqH3ig3EIaPwv7TJ5PUn4LdWa5JuRQHJYalOX@vger.kernel.org, AJvYcCVKHLRirmN7ZgPUekVAKrsewk5JzuP9H4xBn5XDaAvBw2JV6SAws4UEeIDxw+OFLapRNd4Hklr2BUngMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS0H7ocpBHK7GZiC7jFydYIhI1U4N4b9rCO5NujVf/fkdhqFgT
	+ZZlE+B7+8rR4I9SmNnQZ0Yi/yH0Sf8AC6+bpLz957PD4MA2Abubcnva3SurWPg=
X-Google-Smtp-Source: AGHT+IEcdrzhftO2MhbSvmp7ttVFjiBUQmBlYYAiPtxN0Lo+quCOgeiDypXbVJwG4xMfLWOX6LK0lA==
X-Received: by 2002:a17:907:6e8c:b0:a8a:6bd8:b671 with SMTP id a640c23a62f3a-a93b157ee03mr1511190166b.5.1727688548172;
        Mon, 30 Sep 2024 02:29:08 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef02:2700:7684:3ff1:6790:3866? (p200300f6ef02270076843ff167903866.dip0.t-ipconnect.de. [2003:f6:ef02:2700:7684:3ff1:6790:3866])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299861bsm500796866b.192.2024.09.30.02.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 02:29:07 -0700 (PDT)
Message-ID: <526e885abc278a2d369de82d80ebc21d56c7f7ba.camel@gmail.com>
Subject: Re: [PATCH] Input: adp5588-keys - Added checking of key and key_val
 variables
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Denis Arefev <arefev@swemel.ru>, Michael Hennerich
	 <michael.hennerich@analog.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, 	stable@vger.kernel.org
Date: Mon, 30 Sep 2024 11:33:20 +0200
In-Reply-To: <20240930083649.4703-1-arefev@swemel.ru>
References: <20240930083649.4703-1-arefev@swemel.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-09-30 at 11:36 +0300, Denis Arefev wrote:
> If the adp5588_read function returns 0, then there will be an
> overflow of the kpad->keycode buffer.
>=20
> If the adp5588_read function returns a negative value, then the
> logic is broken - the wrong value is used as an index of
> the kpad->keycode array.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Cc: stable@vger.kernel.org=C2=A0# v5.10+
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---

Hi Denis,

Thanks for the patch. However, I'm working on a more complete rework of thi=
s as
suggested in [1]. I should be sending patches for it today or tomorrow.

[1]: https://lore.kernel.org/linux-input/Zu0vq0ogr2HzXWv7@google.com/
- Nuno S=C3=A1


