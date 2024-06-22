Return-Path: <linux-input+bounces-4559-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B759132AA
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 10:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E11B828434D
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 08:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC05C14B081;
	Sat, 22 Jun 2024 08:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGyoeWGF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BCE8C1E;
	Sat, 22 Jun 2024 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719043218; cv=none; b=rFzySLtNgFYozYpM4I2jR/Z+UQFzeDpQ6joBet0aLdIEzV5Ug0iA6XjfCQDFOiT4vFMymjiL1dyY2wx/nCOnWo9JEN9ZuebbZLe8j61CzdM/EyHrnNrAHMWE2MXJR6RSZzMWPA4u0z7ahzHg+KR7bQ0lG0Sgmgh7mjs5f5gYKuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719043218; c=relaxed/simple;
	bh=cd3riKQbSVvZIDGK6cFLZWO9vlD/GEJs/5iKK9Vh+Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnKNo5Pme6gqWZtZV64XGSeCalnQ8O63v4xYOGBC6yiZKAUKN6bjHnrRId9dn08JftxWjcUULATUfPLFlObDaByJIUlMIRbCL7eFnhzN+ZHtQFyJgUpiXjWU5C+woA6g6OYRvsi/Lxnh9lfVcRJJ5//lPghyOHUY6Q1WfKU4LCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGyoeWGF; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f9b364faddso23879245ad.3;
        Sat, 22 Jun 2024 01:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719043217; x=1719648017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zi7qYJ+Cc9L08AGcw5CWS0ONWqZOSTdwApkjkkQiLSs=;
        b=XGyoeWGFJsDyNDbv/oFnpx7z+avxx10MNkK8HjP9X/LplZ2E+2F8R2LbzyFuGsD/l5
         GyleR0KuNSjH76WvNd2Xp9Zhqn+u18PGrn2sZ7GV6P7vFIZQGvn611lZXdwFwuROvTrK
         6XAFzs4Ri3WQZg/VETTvO/o2Ufxj+L/R5h8xUMabbPgjmcTQlxu9H1zwPfGmq3vt5Fkc
         kpEkPFKHww13w6G4amN3/lzC2HkNscFWGvNYZ79ZDPRio+MWvr/+CSZYPdeZrFLi8YCz
         MK+atvZj74Mm6dcsgw1zQq5RPahhVAX69MVAR+YgYjh5mts5xrYCs3o7h7T1mI1sbQ+h
         vftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719043217; x=1719648017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zi7qYJ+Cc9L08AGcw5CWS0ONWqZOSTdwApkjkkQiLSs=;
        b=cKZVr9XjnR82vRLZncGi5Im0SQXfjvIxdvZOI8bz+ZtukL37cH6y+6fTncru9JV5Ah
         SaLxa04wzYZTFwY2gYlLcxQHAV6jvC1pFJtUnD4mGN3NjExNESooAOhWeLh8KSgXRwQ9
         50ia1ZNwQDrMaVxeWXpXGywMeDHPQEaeBOgTdLfF50VhSOk2CzCLkkxxM7U1A5wqQ9Aj
         9OkIhHIjD28uu9gms9HWdp8lAMDne0RXZyt1chBruBgLHVxaGzo7JjkDBPMzbqLRW5pn
         RFGu5/SPNXnOpXN7v0Jy0qxeXD+X9QDBxYJ0d+8o3hUk/cNyiC3bv+dBoGuh2piMraQL
         LkVg==
X-Forwarded-Encrypted: i=1; AJvYcCW1WkhKLuiq7m2NXeeieIz6DAc+YQJNEXYBRZ3j7kbpgpsOnwjno8pAv3HOYD4uWsMS2qVyKo9j/SbSpQX71PkyFGocahUGq9X2C/ooGBZBm4+acaaAhkOhWIqL2eTzr3JqQswCJ+TDlIfnuAOu1lyylz6XsLBP5mIRirHujQUmP3OTeVU4
X-Gm-Message-State: AOJu0YzJK68ObCKB8nBw3lij1Hb+zSpQ1fDIVvhBMB5OuG66+LmlZUm+
	rqBeYM2LwbQgm2XpUc4lnrSfzgbudZtl3v8KKHvYlybItQiefvzz
X-Google-Smtp-Source: AGHT+IG+TBV+6TAldW0qxMbdLhVk2Innkjd6us0xd6aUe1L94M9eLU9khvx/qEhjH9KNWS4ofY545g==
X-Received: by 2002:a17:902:d484:b0:1f6:eb56:7831 with SMTP id d9443c01a7336-1f9aa47c414mr124576955ad.63.1719043216450;
        Sat, 22 Jun 2024 01:00:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d2ec:59a0:2c5f:4460])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbb29c6sm25579255ad.263.2024.06.22.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 01:00:16 -0700 (PDT)
Date: Sat, 22 Jun 2024 01:00:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	hdegoede@redhat.com, andy.shevchenko@gmail.com,
	u.kleine-koenig@pengutronix.de, siebren.vroegindeweij@hotmail.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/3] Input: Add ektf2232 support
Message-ID: <ZnaEjahUtNZGJ7iR@google.com>
References: <20240621224022.1620897-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621224022.1620897-1-andreas@kemnade.info>

On Sat, Jun 22, 2024 at 12:40:19AM +0200, Andreas Kemnade wrote:
> Add support for the EKTF2232 to the ektf2127 driver which
> contains support for similar chips.
> 
> Add the needed compatible to bindings and convert them.
> 
> Changes in v3:
> - use dev_err_probe
> - use i2c_get_match_data
> 
> Changes in v2:
> - separate patch for adding compatible
> - use match data for selecting status shift
> 
> Andreas Kemnade (3):
>   dt-bindings: touchscreen: convert elan,ektf2127 to json-schema
>   dt-bindings: touchscreen: elan,ektf2127: Add EKTF2232
>   Input: ektf2127 - add ektf2232 support

Applied the lot, thank you.

-- 
Dmitry

