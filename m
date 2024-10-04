Return-Path: <linux-input+bounces-7056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D4C98FC98
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 05:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6A652839AA
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 03:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A064965B;
	Fri,  4 Oct 2024 03:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="muhJ49DD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310632E646
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 03:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728014286; cv=none; b=kNnYq1t6q3dQO3xBrB/vXrJILGOo4Ki54dEUIoHRfZgkTTcdtGN70wkGL9dgzcGHwSwoH+1Yiwogkchya56mtoaacnzUH6b9ebEKUV0LHR5QJrakI8xNJ72+qX3dnYRjyhFgO6gdguIYPScPybkZyLyy9mJT/eZIel0voRxeVXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728014286; c=relaxed/simple;
	bh=kjYW+QziEcVJXhaCqljSKWk/0TU8L4We7FSabEho0l8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqrVP/Swh7QXRRVNig+EnlPUSM1w3H2gouOfW1TmVv5D56Wx5Lcdcvu/oRHPeIecXlQMYqKCw4kVBjNGy1+tyxeGM6tDJyx0cRVfjrVlW3K790WaOsVeKoAda6WSm8jY2I1tcpoUtDzShBq0U55FaLY2rKcBYgTWxmLmz2B3FHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=muhJ49DD; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53993c115cfso2199863e87.2
        for <linux-input@vger.kernel.org>; Thu, 03 Oct 2024 20:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728014283; x=1728619083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjYW+QziEcVJXhaCqljSKWk/0TU8L4We7FSabEho0l8=;
        b=muhJ49DDdDv70KFp+KUb7EQGohzret80q3sPOsidq508tJGnblLU8S7/GQ5NbBnKyl
         5ogCjedh0afteJm1S5fHanT2vem3iVTht+kAac0o4+CSlTrevaF4Njf4l9yZL7WFtZ+I
         Iz7Oldrytx8OqpccbVXGxoF+6GNgNQFh9vcVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728014283; x=1728619083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjYW+QziEcVJXhaCqljSKWk/0TU8L4We7FSabEho0l8=;
        b=sTiP/PrXfvZgjXHy8pdw3mzjpbN+T4GO42GxvZRztv0hiCVRAOkY3WM9X1gKWRvG3g
         9MI7Ms31mCTNPwzfx1c8dEif+dXl+Czc00gP1sCAEqMbqUvlKmf4KiEW33ssOIjwVZis
         /XFx8JdxpJANVKJl6bS3d5A+rsLwJLx/m+MC08Ys1az60Kn9g3E7j0IIDEom7Q064SyJ
         vaJM/OrZ140OcKXV0MOSHVuRTyPvQl7GijZrHV/j/RBEOjWVb1KJlAA81mmGU/bMCFB9
         EdMvaAejWiim2S47rV2dGRFtrkDp30+SWSFabZt9C7dFByL5+RqSLQY9yBFTc+nFM/11
         CgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0QDGKzaeT2GhtlPYV5XXShCNqDcZdI87JTC8+1JIGG9c2OVRQGOrDqo35BO34nziZSVAn+ajmbiLTKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXrHtL0xaUnMzV6oS60CcAo0iVos52dg6ga8+1C4kgOCsodzSc
	M19vDEa+7JwDFtR3ETftCk79JUR2XnjwySyrIk5sfqLNaS878l7XfybDc42/iwZrJkDdFj0MAZ9
	gPprrFonzEd3GYkhH17dmJxMgMiPyq8/qU6CC
X-Google-Smtp-Source: AGHT+IGCSauXsJLec2oJrPfkYs9NEcva9UvjTHFkP+w1oM/AcTWaw9QXjbewWHBIo/wx6d90jb2ssOchDoJfghPpNZY=
X-Received: by 2002:a05:6512:282b:b0:539:8b1d:80b2 with SMTP id
 2adb3069b0e04-539ab88c3e8mr685562e87.33.1728014283144; Thu, 03 Oct 2024
 20:58:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001093815.2481899-1-wenst@chromium.org> <ZvvHdlD6E5bzsWwV@google.com>
 <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk> <ZvvyEux8f2ylRQOn@google.com>
 <7db1299f-f925-4689-806f-f1ea4191fd4c@sirena.org.uk> <Zvv1FuXBZpjDefb8@google.com>
 <6626b1f3-7c3a-4531-b006-9e29155025f0@sirena.org.uk>
In-Reply-To: <6626b1f3-7c3a-4531-b006-9e29155025f0@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 4 Oct 2024 11:57:51 +0800
Message-ID: <CAGXv+5HYv3v3MMknjPvOf_hKEHM_UEmz7R3ATmpindebcK_FKQ@mail.gmail.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 9:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Oct 01, 2024 at 06:11:50AM -0700, Dmitry Torokhov wrote:
> > On Tue, Oct 01, 2024 at 02:06:19PM +0100, Mark Brown wrote:
>
> > > Yeah, but that's got to get washed through the individual system
> > > firmwares to get deployed and my confidence in vendors is not high.
>
> > I think native Elan is only used in Chromebooks where firmware is
> > decent, the rest are I2C-HID.
>
> Ah, OK - in that case I agree there should be no problems with ACPI.

FWIW all the users on ARM (at least in kernel) are also Chromebooks,
and all their supplies are either missing or marked as always on.

So I suppose to avoid affecting the power sequencing time, we should delay
this until there is proper support to handle wait times with the regulator
API.

I might find time to work on that but I make no promises at the moment.


ChenYu

