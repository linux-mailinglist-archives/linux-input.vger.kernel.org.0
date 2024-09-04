Return-Path: <linux-input+bounces-6140-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA56396B005
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8DF61C23AE7
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B7B823A9;
	Wed,  4 Sep 2024 04:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLu0w+eN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD581ACA;
	Wed,  4 Sep 2024 04:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425012; cv=none; b=GtnUiFPJ7mVxaRl354PrBHy4dcU6M5zyZdITsAnt0/z085ZOGIOsHeFIS6mcXmT6KPDdo19m7VBV6lzaAFdnnbKdFCI+bbqXt9+XgQheiSG6HPAhsU5UdoGxmbiqTHtlpv9HzQ7aIDIXQq3OPunRAJ3gvqIqwCzjlalhfefDTxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425012; c=relaxed/simple;
	bh=lQo8UuYVKeypxt0h+9zPefOkOb6aNpNdIsGxFfZ2lZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iz2zzNvd3uD8URmCVQaM0aqF97kdVyB1Yn6cu/lsWjK4dnFWiddyPShsa1gZVX8tX9EvTNP3k43qcRmCk28Nq0MTXkRTIUFX+yomKE8E5sq0FcdXHrfkhI4FuJl4dRVi7nQYjD/rJ/NLGCpuZfWZyBd08Dgsqy7EpGDCvrIikmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLu0w+eN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2054feabfc3so29919755ad.1;
        Tue, 03 Sep 2024 21:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425011; x=1726029811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C5l7vs9Sal8XJ9lbY9pP8zexx3pIyL7rpekEloigTqE=;
        b=PLu0w+eNoycq1L75J3z42rAQrj64reyn3A8/5DWEUHKtAs7tusu9RRKumb4wA8fHgF
         FEvWSGBZzk0fiPSsMuhknUjxzn94LkT2/oBKflrrxti8hHHeiN2KuXHSMoiAP2BISeTy
         RTxd+iN8+k17KOK83kzCXQkczm4zi8YtgrzAeMfZhB0fyKnAd0LNPjArprr4awkZc21O
         CwAVrZ+86UEXqkC9q7P7I64mcG1TKzjY12FhbIcZFdSuWWrzNiTZUIO7rclyJBBErqL0
         fFvEgGjeHPK98ySvRhj4n8bBA9C9I+eXcxrS0kol/qAxPFNfzsXLwWkTxwWw2I6Ydki9
         btmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425011; x=1726029811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5l7vs9Sal8XJ9lbY9pP8zexx3pIyL7rpekEloigTqE=;
        b=b8S13tSPIKI5D5n6bec+Ais/ScXUxS4HBcFhdBhNA0weiNpu/vHqTDc6pqY1u12LKY
         BwqztzvffttbSwWaqwRIbHvbHMlNPjmWh9B6JkjMYMRZr+FQZXJPVjVsAo3J3+9kfzTZ
         eCYIErZt/1YvrPLNt0bH78YRn1p0YxtIlkMY/bxznDVkILeO+JOa8YCxcYIOl6iF3ebL
         aPDC1XMasG4Czol57Wm5namNgE2JhXo061AwiYeldI6aNtRmrW0WBpBL82UtOJyhUY79
         j2k1D+vDXe4A8myhRc2R4Y88MpsNstjfJQVB5AIyVyHtKvZQgORazDto5YDwSTpOxs/k
         gFXw==
X-Forwarded-Encrypted: i=1; AJvYcCWiv4xGIjGseNjnMggNCYJ2u3psN8qRENpVN5DpyJJ+el3G/vOhySy5GLVu+dfTlJvzZXEPib3XokwvlYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ2bVwKPbANUv2NOQI2ehcn4EylBr83IRd6cSCYn4BJX14VHRq
	WO++BgWVyocD/o0+aThzYKoFPtBRJQ6QyOUnpVfAu+gF/2PiTs4NmfmozA==
X-Google-Smtp-Source: AGHT+IH76VZFwCwNsWcuJuJL5NBJqWbGk9nvunzyntQLfUNJS/enUrk2MGECvIUwpS1HwB+Iaj1PIg==
X-Received: by 2002:a17:902:ccce:b0:205:56e8:4a4b with SMTP id d9443c01a7336-20556e84f14mr130995895ad.2.1725425010602;
        Tue, 03 Sep 2024 21:43:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea531b3sm5599355ad.216.2024.09.03.21.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:43:30 -0700 (PDT)
Date: Tue, 3 Sep 2024 21:43:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Convert joystick drivers to use new cleanup
 facilities
Message-ID: <Ztflb-14xrnxr11p@google.com>
References: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>

On Tue, Sep 03, 2024 at 09:30:57PM -0700, Dmitry Torokhov wrote:
> Hi,
> 
> This series converts drivers found in drivers/input/keyboard to use new

This should have read drivers/input/joystick obviously...

> __free() and guard() cleanup facilities that simplify the code and
> ensure that all resources are released appropriately.
> 
> Thanks!
> 
> Dmitry Torokhov (6):
>   Input: db9 - use guard notation when acquiring mutex
>   Input: gamecon - use guard notation when acquiring mutex
>   Input: iforce - use guard notation when acquiring mutex and spinlock
>   Input: n64joy - use guard notation when acquiring mutex
>   Input: turbografx - use guard notation when acquiring mutex
>   Input: xpad - use guard notation when acquiring mutex and spinlock
> 
>  drivers/input/joystick/db9.c                  | 30 +++---
>  drivers/input/joystick/gamecon.c              | 22 ++---
>  drivers/input/joystick/iforce/iforce-ff.c     | 48 +++++----
>  .../input/joystick/iforce/iforce-packets.c    | 57 +++++------
>  drivers/input/joystick/iforce/iforce-serio.c  | 36 +++----
>  drivers/input/joystick/iforce/iforce-usb.c    | 13 ++-
>  drivers/input/joystick/n64joy.c               | 35 +++----
>  drivers/input/joystick/turbografx.c           | 22 ++---
>  drivers/input/joystick/xpad.c                 | 99 +++++++------------
>  9 files changed, 152 insertions(+), 210 deletions(-)
> 
> -- 
> Dmitry

-- 
Dmitry

