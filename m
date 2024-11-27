Return-Path: <linux-input+bounces-8264-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7272D9DA3EA
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 09:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 210FD16477C
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 08:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DBB188014;
	Wed, 27 Nov 2024 08:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSnPyxVr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D649C1865E2;
	Wed, 27 Nov 2024 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696173; cv=none; b=gpCBTN+BI7PLIlvr38KlMhsrRxZfNlnQsYhVtyomLNsEffVbjiDZwYKuJeqX9xnupzyJ6apljZ0/AzLLKstUDpakU+96/U6B7Om/chNLNtOCT3H9uo4hGisyn9fIdpANj3Vc6cwWIuPU+a9xHbhu9rW6/OPLolDyp7zWiWSl0ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696173; c=relaxed/simple;
	bh=njd05bArOgKjbgLgjHcusDaTScXAtClI9n8o3C7sop4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmBhRFX9Y/juQWwxY+0qXpTAygBxbZ/+UdLagxexfjyqRlyW21RZycri5xx5pI3fwL00anr5A0rJyn2/13SRphDwhS252a4PG2OZgFLDaLnXFumGDtdgHYkh0oWRU8dUGlZPbG+X59t9SmN8LeSi7c5ax+pwSML3+b6XAi+YM+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSnPyxVr; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e382e549918so5565001276.2;
        Wed, 27 Nov 2024 00:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732696171; x=1733300971; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=njd05bArOgKjbgLgjHcusDaTScXAtClI9n8o3C7sop4=;
        b=CSnPyxVrSYCj62DiJclJrKD4fvJA1+8+jzcrLSaUOVdF64mhDi/ch46KXeGGXFIGRS
         cOMfAZL+C5yrPYHh+WYgLqil6osJPqWhqSUul1KOve/Hix0MOiyJZIG4ay8cn33p0ELP
         phSPrLhWCbzrOJ9YCFVLlaWPrAbpYd855cDgDvfwe2BzLuBzn9a6fLphasTOnZIjYY3b
         fo0P3i8MMlxFEEy8p2JvIQMe7fUME+UWIFzLr2iGstfTUe7cWocymah0yCtSsYJCZoj2
         sIX3ZGCB3yu7AS3dvs4+xJXYFrDqKi43t0t+NuFN769HEjboMyL5hex0Dkfkf9wpwthA
         v+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732696171; x=1733300971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njd05bArOgKjbgLgjHcusDaTScXAtClI9n8o3C7sop4=;
        b=cjR4p6xF3S8Ne//ErfX1YNhRI+LnzHkdYjoaQGYQDTlxddAa/kojyJAaW88odU38FK
         CcdSmvvwwFB+1+YLTD2zy9fSmSPlsVOebMv/YBMCXewBVOa0eSfc79rBp7f+YHWoPc4V
         IHp1K+0pPTvbhMtKR7518HqlSOzTQkh7T53v59jbmmoT1t1PQ+td+FypOwh1Mj0GKpNC
         cwWa9sAv/oE6G3P47SgKtAZQLJeu6YjgfJH4P+9qncJuKYYYAs3fb/BwvbBWaBUhziRl
         MoU+WFx2JObC9E+2yQyQZBySawoGX6dThBUbPesTG6nAQYhFaPMa1nFZT6/CGN6gNaEM
         mceQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeaqyNjF/A2oS2QOwoTaxVD+4ZP+VtEigVXga4cirlA4OndiA/4CnhMUvc1SREXDoWKZ//PRlL1A/KHhk=@vger.kernel.org, AJvYcCWVZ0G1KeVuG/HHurqzk3IoLL4XD/kyO+a1+Hu8IyLvsxH4RPCHFZbKDGwlo+FWI1VXdMmjotWr32MG@vger.kernel.org, AJvYcCXHDLQ+GMiQANQ22cti54bPrGA+T5B+k0q1JH5VtnfBp/G3vPFx9+mwvekgof2DXEQa3TahcyPzvhk56NPv@vger.kernel.org
X-Gm-Message-State: AOJu0YxBT93MPnOsp6QfbQzAOm97LBH8MKeYeAvZFQhogQ9EOwu7O7GQ
	zav2Wkde+z8vP6vIrQZvtos9zhMJP+wRLXlPZJzTSazG9zPD0twtW4zHF9m2+Ftk4oHYGXx3Hci
	13PzRMArvMcsaK5jW+3UqKthfvg0=
X-Gm-Gg: ASbGnctujgsA93+QM5ekH6I9J+vulsXvY6Q3BzkMT2Y6xLii7c2pRLt3YbKJ0jo21yS
	h6Gbck8uIgmPMaJKqYI9l5zhJvTZ5jdMN
X-Google-Smtp-Source: AGHT+IG4T6iCfTuQRbFcDR8g+9gj9vnb1SF11d4ey59iqSnin7GgRZc6RSmnNx6SkL9tm182e4/IfH05c5ENgkbSLA0=
X-Received: by 2002:a05:6902:a07:b0:e2b:df40:2588 with SMTP id
 3f1490d57ef6-e395b8a1b09mr2315229276.21.1732696170745; Wed, 27 Nov 2024
 00:29:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <Z0Z7Lrv3rBfzac_e@google.com>
In-Reply-To: <Z0Z7Lrv3rBfzac_e@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 09:29:19 +0100
Message-ID: <CAMT+MTThJoYLYhtYAHwh6F3LTApid9Em+eP2AZYc3JChC2b9ig@mail.gmail.com>
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 02:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> I believe this needs to be done at the SPI controller level. See
> "cs-gpiods" property in
> Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
> as I understand, allows overriding controller's native CS handling with
> a GPIO when needed.

I have already tried doing that (adding the relevant gpio as cs-gpios
on the controller)
and for some reason none of my attempts worked. Since there is no hardware
documentation, I can't really tell why, could be possible that we need both
native CS and that gpio, could be memory barrier issues somewhere in
the driver core,
but the method above is the only one i could get to work.

