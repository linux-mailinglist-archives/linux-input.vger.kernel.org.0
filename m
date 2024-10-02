Return-Path: <linux-input+bounces-7022-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 612C798D9EC
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 16:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22F06285BDC
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 14:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9191D0E39;
	Wed,  2 Oct 2024 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hr1p/5NM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B791D0F59
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727878304; cv=none; b=H4QPrusQNnbHhmpO5xMjD5R6n4vqmTUd2TEGZDjie1uAYL/uJ/tqeE77+H2NBvPO6oWw1zpoIYBXVTRU/BlU0bfL8cEIKGCa8FvwPHl6OxXLQZcuQT9iHbusmIAH7XMvWSdeMxyyoOq1xlpNjp66eX8YmeR9rQhxvjo0LsjEFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727878304; c=relaxed/simple;
	bh=HpoHbYd+LqDp6hDnrb0w96cXSjnRiJuI3NN5woCmLrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCph3Gu/sZOvnCF0/2+E8LivHH4qzlcshT2s9oX0lfnvkCa4vEHX98IbUR0Z0JNVADhYy213cweIxrPzBTke7lwzxZyKI8etn2csoG6Zt4srcIIbpec2O9SbrrfYjOsrM7u5fC+8tVK4GX3K2VXHa+UEZfgbbWIAeobDZe97VUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hr1p/5NM; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e262e36df27so720258276.0
        for <linux-input@vger.kernel.org>; Wed, 02 Oct 2024 07:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727878302; x=1728483102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpoHbYd+LqDp6hDnrb0w96cXSjnRiJuI3NN5woCmLrk=;
        b=Hr1p/5NMikhkjaKFXZB14N3EOAEMkQDNUselow/dlsYAaoGOuzwDXDX66NoZ+z+roS
         mGOVX8HzJ8v/rXcxD3kHSHrlPlxip5xqeB4Mg6vfejrhGjgASKZnw/Qs73FjYNYU+lRk
         jrO/K6jlDIX6K25XoUGjqsldLcnHxyBV7QTD50tx5ibcwH8KTPrA2dyQ97Y9TdXTPiVy
         zy1Sku1xlrAFLn30erbewL9oneRbMOfhWCqBbFZEYtFJKFhDaBkCb7VEjeucAT3sZv+q
         uxguUvfQnLCAUvvq0AyYvKJ8iMKZAdk9VXccFNcznmEv70JzzWKGEPdEH9bhpmhi1ftp
         2wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727878302; x=1728483102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpoHbYd+LqDp6hDnrb0w96cXSjnRiJuI3NN5woCmLrk=;
        b=g2S5scZoAXvURDVfDqR8y1Q/w8xEryl5Stv7TAiRyzbbAcSxRuCNz5JA5iHyj4Q+FU
         hqpAnmayup45xWiwZrhJX00DeSJwaXcDP9RNhvpz1qRSPErRQ4J3XHZAVr5NKgfXFFrh
         +VOt3y65qJLOOuMjpKVMUpzNiEl408Q0fwVqepKiZdNJbNMsK9/RQkElX0W07WeJgOnz
         ukKexfAQ5Ghfe5WS3LMOkyrq/1XKT84xyCjdg91hEMtlBD1+LXRpUk0OCiSSMaSBzbrj
         oqopsj0Jmtr/kq9hDpTBK2NpjYKKzFH3HargXwu06s6qh0Uq9CT6kJAnD2YF1HZ0a60E
         m6nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgzieIueRyXEXfPkaljpDro/lIWj/CwTauzf1uw6AWH5LQBaiwOV06It+q2jlkh0SKZ3xT6z4nBbA90w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt80D5svSeAvQnpVUGajPeQ9moKNnsUESOgXLLVXaoOLEz/PWo
	25U5r6kV8ajlWsdGdZb3KwMfvjHk1hE7gdT4eOB4Xt4V9kXlqCHaKuLzuZEz+GMl1B2ZuFOG5Lc
	uEo/ChXlVasJ0orV6o6na1xrEdtJz8SU/63NheA==
X-Google-Smtp-Source: AGHT+IFyT3mY7nqsxwBi8vvgPC7AZtwmzr26AhZnRnemS+haNm+hqWU236jZHlNpT8HykqZbFa9zqzQ4LidNo9cvJeQ=
X-Received: by 2002:a05:690c:2911:b0:6e2:1c94:41f8 with SMTP id
 00721157ae682-6e2a33b439dmr20006417b3.10.1727878302231; Wed, 02 Oct 2024
 07:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru>
In-Reply-To: <20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 16:11:20 +0200
Message-ID: <CACRpkdZj57_jGDJiXgeatntUMKLdUV-GWCN=crkDRD2sUgQ95w@mail.gmail.com>
Subject: Re: [PATCH] Input: zinitix - Don't fail if linux,keycodes prop is absent
To: Nikita Travkin <nikita@trvn.ru>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jakob Hauser <jahau@rocketmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 3:02=E2=80=AFPM Nikita Travkin <nikita@trvn.ru> wrot=
e:

> When initially adding the touchkey support, a mistake was made in the
> property parsing code. The possible negative errno from
> device_property_count_u32() was never checked, which was an oversight
> left from converting to it from the of_property as part of the review
> fixes.
>
> Re-add the correct handling of the absent property, in which case zero
> touchkeys should be assumed, which would disable the feature.
>
> Reported-by: Jakob Hauser <jahau@rocketmail.com>
> Tested-by: Jakob Hauser <jahau@rocketmail.com>
> Fixes: 075d9b22c8fe ("Input: zinitix - add touchkey support")
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

BTW: Nikita have you noticed and weird offsets in your Zinitix
touchscreens? Mine seem to be off and I need to put my
fingers a bit below the actual target on the screen, consistently.
I was thinking maybe calibration support is necessary.

Yours,
Linus Walleij

