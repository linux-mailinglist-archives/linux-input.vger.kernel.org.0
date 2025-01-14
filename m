Return-Path: <linux-input+bounces-9223-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39985A10672
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 13:17:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9D0B3A654B
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 12:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792DD234CEC;
	Tue, 14 Jan 2025 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qdHQrtqe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980E20F995
	for <linux-input@vger.kernel.org>; Tue, 14 Jan 2025 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736857038; cv=none; b=W2eH0aLM3lb38WH1nYyVqCGuJVoAK0elDJzj4XD2/z2QLG+6Dn06TwMpx+C+NwkJxQiopkZSk9UlKrac57jKuJekl2ThbZkHoJj8rqVUbag2XUzupC24spJ2UVZW8HB+zqfXaKGmuA0TLdw06CISRnJBaXXWQ00IV9//Z5iWZa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736857038; c=relaxed/simple;
	bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvxwxnaLgmspj63rob7e4/1orxV2eNOMA7nS1JR3hMfe9ivNkWMzY2RXwa+ps7ZSDUMFLNpubm1Ce1UolUgSjpq5vq98dYitWGi26HAQDPRUDe4CFNFBcnMUznKcfWmGHoaetzkWB+Ybg5nBqDiOJRlJT2V3qlSJvy5+4PGkMXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qdHQrtqe; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401c68b89eso5851171e87.0
        for <linux-input@vger.kernel.org>; Tue, 14 Jan 2025 04:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736857035; x=1737461835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
        b=qdHQrtqeqnAhe09KLETFGSkDMQv5jTwlECLYrdCpML+BDUAu4hv3V+dz2s/C/dTQm/
         qRrExopeKyFBXre2BxAocM+XqmLaXrOr07YAyA3ZfuqJAwaO66u8evVZHlTCb8xKNToO
         oX0yPj/t7D1IPRTc9zj2ymBwzwpDYx5f/C2OAGQRtVrmmgG5Oy/lkvFnQHDIMrSiEeOp
         G7rqcuTLmWDEI/aD2ABQdlC11DiJfjWMgZtZmhJny/LWeP+ODbTdNm5O7a9xc5KyyN+L
         c2Xo5Z6b07WciVrpxCXaR0eQwW5HymUGzIoLN1iG4E5NSaZ1uaoChd8j4w7xhx2MMmRY
         gcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736857035; x=1737461835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ie4b99Xwh0aEWRWBEX58b0bMixe8tSP3T+iPjUb6uc=;
        b=l0M5jAZhu8N48sE9CBNilc15bV0A2i7wuakLmcr/u9/MVdJ8sTCfw3nGLjhcRKdfRO
         sRmTsizCoD4NT9AVdqhKiC41aimVNrttpD+6gzX1NNrcNLC4fmsNfSod5DSgLMGJysQx
         uQPJC0JS8NaieeEvH7Veq2s32/nnSo57hnfvVOOhkCO8gKqP+wTyWtYEWsLqgaDvU3Qh
         pLGG6y8NcPivmpGUKK59yV1tESU3AeX+CmKcQoBiS+zMKU0z+CkIlEUnIl5N1DayDZ5g
         wA2P42VSygvZYxYhbC2Pz9H0WRAZX3nrRud4NAMOfxrMuJSrNZ/6wDtT/oOv0m6G+A74
         0aPg==
X-Forwarded-Encrypted: i=1; AJvYcCVX5qAZhlbB2kzvR7yFewxQsTuFNl1gE2Jco/IT4J0h9UzD1X6v0i3yRId9LrqImY43V+XhL9p80QBZqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlViQWdjQTYe8X8cQ8z0hVTTFoIaWFv5Hgcu0PbLEUkqwhtK32
	PMPRI9fVG3Qs+sPwKmoJTrqWxAmsdI8DyFAYXN/RaZ1udBiTwcj0SyFhLc5r01Zy5B+u8VWHSoI
	QczaBcC3+vA357y4B4t4BYrzz/ql9lx6dU7yRew==
X-Gm-Gg: ASbGncuMGmlF6MnZKtJ4oPSt/jqKsYR1FjNNZuRiQlC4glJYr9ZsjH8ajZk+iGUd/iq
	yTLVF1WqkKbj90R4wuzaNFXF7hmIbO6C4NdGk
X-Google-Smtp-Source: AGHT+IG/nVzJ4usllSB7WeL3esJ0/+hz1rQx2YNWDFn17mueoKalfz6Uj0tzGOzfhZRqk49pDpDqslNG3Jdx7c4EaqI=
X-Received: by 2002:a05:6512:b97:b0:542:986b:de08 with SMTP id
 2adb3069b0e04-542986be0a1mr3961478e87.26.1736857034594; Tue, 14 Jan 2025
 04:17:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com> <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-9-e3aeff5e9966@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 13:17:03 +0100
X-Gm-Features: AbW1kvYSSgagqOIiggVP1rEX84eySXcyOvS8Yel1NcZ50o6oIQlw1NaD7KnQIZM
Message-ID: <CACRpkdbFtLhGXwSbCF+v54eEdm0w=sDsseUPiRfc=xmak-DbhQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] rtc: pm8xxx: Use devm_pm_set_wake_irq
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 9:42=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use devm_pm_set_wake_irq, then the 'driver.remove()' could be cleaned up.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

