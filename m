Return-Path: <linux-input+bounces-4632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAD1918121
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 14:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EA9D1C21937
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 12:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9039D53B;
	Wed, 26 Jun 2024 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fjuYe1uk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0B21474D4
	for <linux-input@vger.kernel.org>; Wed, 26 Jun 2024 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719405615; cv=none; b=dS8VER/Y1Jlod2FOoDSnKjje9l5Z849GQGm2z+FGylrO7t1BdA9LahbGuImCbQD9kwx3tiEniY4dlecBg5QS4NZYhkGCEiugmuzWj/X/vGKZCfCQfzqba4KFzZEcIJW2xz7Hi5IMtiqzFNXj3uzrPQz4cjqmgk8LXZxW8NCBbIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719405615; c=relaxed/simple;
	bh=Bgg6OU0ZDX5EPyb7G4lD7fk8ehJWpHM+uLJp1CPeCGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSq4geLtJZok8IRJt76MOv7gtZlzO6CpBgEWy3is9Vc+polR5BtphX+fhMey21afTPqjVvh9tAXhbO47z9wuwbVi4UrtYQKqAaJVJweG9m7ZbbihoozUckWm/288onOXQek6z/9iGFehsvg0qL+ouCbU9sUn69mRMJd+Pb6X9wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fjuYe1uk; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ce674da85so3532100e87.2
        for <linux-input@vger.kernel.org>; Wed, 26 Jun 2024 05:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719405612; x=1720010412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bgg6OU0ZDX5EPyb7G4lD7fk8ehJWpHM+uLJp1CPeCGA=;
        b=fjuYe1ukPSaWliNl1Bq5AyEUWF6pn7DP9LMTcgeGM0RZthHplal4qliUHTbPYC/YEs
         dhJUMHHMuInaPtibRldjqC37o7JOKVh3DE2SoJRJAZld8379pBdDCdLTH6llo7tAY9e0
         +RPQCnzfhkJuEcOxi+RthP3tMrBNExp58s1vCEtVr52FrQgRH1HzTCXrACWxPg+LjjzD
         1Xpr7Jwy/vLWcG/lM9SKl95+I5I1Xw0NdONfVHKpZHyOxC0yDwzlxclCTDoF+6b2iMbR
         5SLvdc/YcxG37PwulXqSJ3ZlZS90CPiPGrlhMnZ6SBTkq0WaFuycW6M71IV6lIH+9MaV
         DaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719405612; x=1720010412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bgg6OU0ZDX5EPyb7G4lD7fk8ehJWpHM+uLJp1CPeCGA=;
        b=K09HVn8wKC1DN4q81HrdAmN2ZeSHj1g1dm5gm2l7s8ZukWCIfTmVATN57rsncARyLs
         /A6s7j78PlcgS2CicifhF6XDR3yu5qTbqEylxLTZnrfNwcJIe8T7McXND0RnySDaqf+z
         exD/3SkcehzV7Rya1ZVjvdb3SrFJBt8aydv0ZllTITenJa6//cMpnXNBf1l/c/s+pfx/
         tFcq4RvUMK7zOzFHf1l3QLoPrO6fAVxRCVWogOIkTpeEDl1qOE13R3lx2ihqllZIj0z1
         AugTd2laPkeQBnugjVYHkQQ56UkHQqT/em/Nxucn7QFkiPOw1w5iWkIJKHYZFeFHj7vu
         OPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWytCnn5N6UGncsioYplDAxwUAHLsKgyd9FxtVhUgdaQOaz+T3NcwShjr7+sfeGQM+N6xXO/P7iXCzad2+SGHTzTLYWC6VglBrNJcA=
X-Gm-Message-State: AOJu0YwlcIhglc7GQxoPlToasyGWhYe9fcphKN8G4UgDmc8O8ZhgRz2t
	1lII2bFt+8d1YPuuqn/DbRra12oIl/4weKB3NuMu0N6UoPx6pjfuZgPysva9WkgJ4RBhvpmy/jP
	57cCn+KtIgW8rA/tn8YVBHKmDwoM8cjZgUxG6EQ==
X-Google-Smtp-Source: AGHT+IE6G96G6EVrsIreMTezmK+cGOq8ifme1cHZyKOsQUlVRBZqXVmC/fMQy8QmcbaaTJt8Bu69GJG3JCzDZEIN4NQ=
X-Received: by 2002:a05:6512:358b:b0:52c:e086:7953 with SMTP id
 2adb3069b0e04-52ce18325e8mr7682235e87.4.1719405611883; Wed, 26 Jun 2024
 05:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240320072533.170029-1-marex@denx.de> <dfc1b846-24ea-42c4-adfe-2b762e2f8851@denx.de>
 <Znstp_l5l2PUgIfP@google.com>
In-Reply-To: <Znstp_l5l2PUgIfP@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 14:40:00 +0200
Message-ID: <CACRpkdaC79-UPDg17cnanBFbsnOrzgwks7HCLxfrn_eBwNuXxA@mail.gmail.com>
Subject: Re: [PATCH] Input: ads7846 - add dummy command register clearing cycle
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@dh-electronics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 10:50=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I am concerned that we are putting workaroud for a single controller
> into common function. Can we quirk it based on compatible? If not then I
> would like someone to run tests on other controllers. Unfortunately I do
> not have such hardware.
>
> Linus, do you have devices with ads7846 or tsc2046 by chance? Spitz?

Sadly I do not, but it is inside the Nokia770 so maybe Aaro can test it?
(Not sure if Aaro has the 770 though...)

Yours,
Linus Walleij

