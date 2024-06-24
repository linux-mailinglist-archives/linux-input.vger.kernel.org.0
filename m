Return-Path: <linux-input+bounces-4598-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2405E9148DA
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 13:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBE322883DC
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 11:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9BC138495;
	Mon, 24 Jun 2024 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IG2uhkfG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009B13B2B0
	for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228852; cv=none; b=Z1eecMVj8e8pxe7ZJIVWHGf+TcI5i5j2Wzu+NYYVxHezbzup9dZjtTJ1fpzyTdNyom7BMOo0CtnW6Uufl9QIdfuLnZERjvI4Kx7XfAx209ClE9oR3GI97bBfEd9/PH8LM3Rryr0mAU60bpfveuZ0T3yyJOTGvsS1wfGKVL80GM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228852; c=relaxed/simple;
	bh=/R5v62rxRpq5wDTVHnRxA1Nb98uRg0f9j8o1HaA4ybo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OMPlJVS2lmYIgit1wypYL8Ye7GtfzFRzOArO3SlVjay5mrZpTP/MCJe6OC9lrKA8LwyOZCVpF27UQSd6lXsFitk7GK7q5RICoFYpEW5CP0X9ZpeAWZPppvMGm5DNmWHXzerCoUQuRRQdVl4fDrPzMHB1v0XCzjZwxvuttkcl96k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IG2uhkfG; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-642035f8c4eso15933067b3.0
        for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 04:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719228846; x=1719833646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=upAAWkKErsbFK09qz0Z6svT+EppDhxsUTeUV4G/KK1k=;
        b=IG2uhkfG2oc+X4a+J86ParFNW+Vf2HYV5/BIa+lu36YV9nEuxvxA4w70syTcjD/RWY
         W4IDPc7EFZZOhi3y2zdZkNN6uooJ985IFY5mPhteVHw53QF5pm6g2KOs2X3cfCxcWDpu
         EF2bypBcCphOpY3mKhWx8mUbOqp6MtQoe5xrPewPghlYezS9ofvFoFupbYixW7rJBo+D
         om5oCXxJgGWaiKlpWHo3JiNXtqogTvCNJ5D+n12JjsAAl3TrDGZly4BzondbixLEJqCt
         6aAbJLB1gIc8e7Dmoxw1Gp4il1wxSSz36/N0iScFXM73rUhoG7gAD/fvfWyjTSKu7BJC
         yIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228846; x=1719833646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upAAWkKErsbFK09qz0Z6svT+EppDhxsUTeUV4G/KK1k=;
        b=SGb0d6JpORDdvII23tVExQyWo2Jo8jxvcFwgvxqMF/fQP9UT1JOdjwnJM3aiRPQsf4
         r6OBtGk4PO7GN+9dsmAF1Oiu8aXJAJXkun3tKD5jN6jC9lHtKTdxCkZGeVR+xKGnCYTe
         8qp4PxntduREcQCNN6+RyF0juPbjCSQDJu9BStcBcsB0ZLppZryfUN3LeN2MsWzycJzs
         RqcXGkSoIsdIAJN/55frqTfHOXW6GUHO+pZmx9X7YaobTCI6qWO8yPG0Ywr/RqObtzar
         Z2KstWPIV/UcPa8rlLE5lP/tG9nCjzCCUSjovo5X+Qe05qIsgNSId3UJvfmnpF2/9WdU
         KSwA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Y9bHSFQxMMYiyPV/i7+H7CxD0nl80AUZ6av6DCWPopDIc0edzc9WnWq6Y0TrniuKgC7MR+9N+lPL64IUL8pOCJpa7QA3amMEiFU=
X-Gm-Message-State: AOJu0Yz/ZCXp445eE/rkL+kQWybcUc9MJmdi3f1KLeco25dxNO7huANu
	ypK36dKadhPRQm9DULhIjKo+odEDGQ8LfEAJrPvcfcQ6wi0g8ydsiTpFAVyaN9PNy0hSfU3HgRx
	MvahGZMSZXAxhEOb0uqS57SH5yO/b/kcGjJLBpw==
X-Google-Smtp-Source: AGHT+IH5Z8/tuCn40/rJtcdV8GxLSpREk/lqsQMXN8cW6J/sXP4inSC19be2plWZfK17N4VZno+uTzXn3dQ/uoLjDag=
X-Received: by 2002:a81:8387:0:b0:61a:d4ea:b856 with SMTP id
 00721157ae682-643ac323d0dmr37721917b3.40.1719228846022; Mon, 24 Jun 2024
 04:34:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <ufc7sq5s5nymjncp5w2446dq5xcmmqbmsuubhpo2fxtsz5dpgg@xtqtmmsio6sr> <722dab04-03f9-49ce-9c7c-4a3a9f898fc9@postmarketos.org>
In-Reply-To: <722dab04-03f9-49ce-9c7c-4a3a9f898fc9@postmarketos.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 14:33:54 +0300
Message-ID: <CAA8EJpqVjkRKWoDfJ=Ga19=gn7i9N-bym+O-TadE819ziJXhoA@mail.gmail.com>
Subject: Re: [PATCH 0/7] qcom: initial support for the OnePlus 8T
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, 
	Frieder Hannenheim <frieder.hannenheim@proton.me>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2024 at 14:33, Caleb Connolly <caleb@postmarketos.org> wrote:
>
>
>
> On 24/06/2024 07:18, Dmitry Baryshkov wrote:
> > On Mon, Jun 24, 2024 at 03:30:24AM GMT, Caleb Connolly wrote:
> >> Add bindings for the SM8250 OnePlus devices, a common devicetree,
> >> touchscreen and display drivers, and a dts for the OnePlus 8T (kebab).
> >>
> >> The OnePlus 8 series is made up of 3 flagship smartphones from 2019,
> >> featuring the Qualcomm X55 5G PCIe modem.
> >>
> >> This series introduces initial support for the 8T, adding drivers for
> >> the 1080x2400 120Hz DSC panel and the Synaptics TCM Oncell touchscreen.
> >>
> >> The panel driver suffers from similar limitations to the LG SW43408
> >> panel found on the Pixel 3, namely that after toggling the reset GPIO it
> >> is not possible to get the panel into a working state.
> >
> > Just to point it out: this is no longer true for SW43408. The panel
> > wakes up and works after toggling the reset. It seems, there is an issue
> > with one of the regulators, but not with the reset and/or panel startup.
>
> Hmm ok, I've heard mixed reports then, I should try it out myself again.

During MAD24 we have seen an issue with the regulators, when the panel
doesn't wake up. But resetting the panel works.

>
> I'll update the cover letter to reflect this. Thanks.
> >
> >> Given the apparent prevelance of this issue, particularly with DSC
> >> panels, I believe this is a bug in the core DSI code, and not a device
> >> or panel specific issue. I think it is still useful to accept these
> >> panel drivers into upstream since, from a users perspective, the panel
> >> is fully functional just by leaving the reset GPIO alone and keeping the
> >> regulator on. The only (theoretical) downside is worse battery life,
> >> which is a small price to pay for a working display.
> >>
> >



-- 
With best wishes
Dmitry

