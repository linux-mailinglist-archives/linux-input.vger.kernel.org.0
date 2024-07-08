Return-Path: <linux-input+bounces-4909-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E825292AB5D
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 23:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE179B21043
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 21:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB7F14EC53;
	Mon,  8 Jul 2024 21:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TW/BEIa6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D23B14EC43
	for <linux-input@vger.kernel.org>; Mon,  8 Jul 2024 21:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720474754; cv=none; b=Xm75I5doB+SP8wL6OCdO9kRCm1G7cTmBoVeutI0Ndawi1xuYwci1NQb7RUPRKiE/oSEs3jUOns8Zd+5EE2PDtxWdQiqvFcM7ncX9ahkGC7MoousTUrci5TSVZKBdyMMq1JV0OfxoFEVaX1fxEAzA9c3mcEWmKgfDeNpLESABiqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720474754; c=relaxed/simple;
	bh=7/1EU0mhU3YEkT+rBvTVwycGb+IDEYe4xvLMubJptmc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=EFghancPm00j5Vsa6cH12iieYA1V7PRqWAq1OpBoihqoLHMqEykA/BAIofSAMjxmLk5KnWiV3NbzVGs2LDrtOKQ53VE5jsTHs3rRnPV472kQ5bEt7UhUtoLvU3U0rmdZUnU+tPgJ4/rGVi2CVJJ2Qg4Z+IAUFHjDWEo+LNGJf+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TW/BEIa6; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25e3bc751daso2422089fac.3
        for <linux-input@vger.kernel.org>; Mon, 08 Jul 2024 14:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720474752; x=1721079552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7/1EU0mhU3YEkT+rBvTVwycGb+IDEYe4xvLMubJptmc=;
        b=TW/BEIa6UxJ/I9/+ZUluCryWy2p3lnLb5mldr1YM5e39Wn7K7ycOr0p8HNLSaesMSv
         rtroAv1kVZu1VFKxNQa8rM2R/Un9AVAm7grwqKee0zgyB2XNs7DPvhEzhyaNKDyS8ui8
         KYNRl9gUNVCfTXGgoLa8St/l2iCcsXRcA9loYVuCUewK0L4Hhf9P7x0JsPTVmWxOeOIa
         T/HbY7ShQdwHPcxqzFhW7P+5MoDSEx6bB4zpb8uP/UxwRH9hXooayvZPj/s+K70s156M
         j3FScvxv7dnNw9lrGqlUPgHNKCNR8RVbT3WP3V1IynlyCzYZxmiv+veRuGjrNFn5eDco
         nu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720474752; x=1721079552;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/1EU0mhU3YEkT+rBvTVwycGb+IDEYe4xvLMubJptmc=;
        b=iG3QkcGb8VBhQbtC7FJ0VSkckE00XJtj29KPzB6oGrCzSkHMaHGC8+ovReG7BSNtDe
         T6QuWpF3Nnz9603daCweXVxRVZ1q/F/nopjG6y5fZf5N8WTt3C91WE6UEZCD6HTcHoMR
         MyFo9mv6YUqsbzzHxXkSo0Xmxy1lcE/6X1HyHe8TDXpgtEm70nrAhFiUzg8ddzFdOuYM
         KidcdlAFFUkvFdbLcJJw/lYlrf35p7mvNxD2mmcRMCGmDfMxUgPxyqUtZdf3OTKyaHhm
         6gTL2FkmHcXJAp+yw+GvdJhZINy2asK4iF7Is18CIYKPXDOugFOjsitlTXNwFIoTbHip
         GlQA==
X-Forwarded-Encrypted: i=1; AJvYcCVqjU9sTv9+eFTnYh9ss0dxNr1VzjhNsuUFSSBoOvPa00tlip85A5a8+/n1u3Xs954xvleIHkcXLpMYJI2ClYHXZx7p+D7eo2VJNwE=
X-Gm-Message-State: AOJu0Ywyy1HHu2aZTw+Tvf3VceLBpsRgQe7bM3X8VLmwx7qED7bl1zjF
	gO55QEp/krZZdMz+HksXKgYttLdQdUbwfu7XgWKoZPGgK3aMjS6y
X-Google-Smtp-Source: AGHT+IEDeIytBtgPH24VYCHyU9ge+ZhW4ClXGZgr/cSrwA9v5ofxzpFwWrOhJwqbLmL7EZa8DR3dSQ==
X-Received: by 2002:a05:6870:5253:b0:25e:20e2:fddd with SMTP id 586e51a60fabf-25eae7f6096mr555761fac.23.1720474752160;
        Mon, 08 Jul 2024 14:39:12 -0700 (PDT)
Received: from ?IPv6:::1? ([2601:647:5e00:4acd:a644:10aa:e7d1:9d6b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b4396c2a7sm345163b3a.139.2024.07.08.14.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 14:39:11 -0700 (PDT)
Date: Mon, 08 Jul 2024 14:39:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org
CC: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com
Subject: Re: [PATCH] Input: ads7846 - ratelimit the spi_sync error message
User-Agent: K-9 Mail for Android
In-Reply-To: <20240708211913.171243-1-marex@denx.de>
References: <20240708211913.171243-1-marex@denx.de>
Message-ID: <8AA709E7-9739-4CC9-B6EE-77D152B35984@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 8, 2024 2:18:57 PM PDT, Marek Vasut <marex@denx=2Ede> wrote:
>In case the touch controller is not connected, this message keeps scrolli=
ng
>on the console indefinitelly=2E Ratelimit it to avoid filling kernel logs=
=2E

Instead of ratelimiting, maybe we should try reading touchscreen state whe=
n
probing and abort if the device dies not respond?

Thanks=2E
Hi Marek,
--=20
Dmitry

