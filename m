Return-Path: <linux-input+bounces-5766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D6095D20B
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 17:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31B46282391
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 15:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E46A188903;
	Fri, 23 Aug 2024 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XtsX8aow"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CAB1885AF
	for <linux-input@vger.kernel.org>; Fri, 23 Aug 2024 15:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724428305; cv=none; b=cKKdIgpQvRi289GWXfoqAilmrOtgucdEHzr0rnlNPRikfAXISDcV5KmARPg50FOPhoxBe7/VMLbu+klAqtskTE+vdmzfl9iFFJtkrrkHGKgmvEa84zUOf2sXrR8nsUrt+e2osKsjVR/TTTlOdomUqU+GwA5a8IJknOfXQnZwygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724428305; c=relaxed/simple;
	bh=ems5Yuh3jeXb/TrU83+Z84W4Dg/l4S5Z1gzeQy+U0XE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzT9pijll3b8kBCEWlc0XBK1aHjUhXud6EMyk9/vzV2oE6JOHX2N8KGPqmUxEz8Y15sjxvVz98802sV9H0zcbybYAyvDrWsBCUX8LiyeYXFQDMM+Y8K+vI+lv8r08AHWSxFxUc95/QDpP0WC6SdHVZexC4jTNY6FwYS3m3ZTjoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XtsX8aow; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso3455586e87.0
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2024 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428302; x=1725033102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ems5Yuh3jeXb/TrU83+Z84W4Dg/l4S5Z1gzeQy+U0XE=;
        b=XtsX8aow/fx7ogdaZkBDwSQXISD/DiagGXXcqboUz52273yDRUV6krqqVwO3MBeEhs
         yZwDBN2Pg9BIlDKzLwyx8sSzcGE9O2l2/IAG9N3pMg3IGCEjlufEi1UpZnWqh5TUYVGt
         RySqlA+818jsawq0W06BR4y/49Na8tKBJfetfZU63iW296zD2urQDy88yZVa8GroBUD+
         6CTOfS8Ez6JP85dntfxpR+LB9R81dC0NswMAN8dYmx5eWoRiMoM2qLL09Y8+OkVk9QnQ
         KcqBtcisb1Skz/PppXXgNtV6E8Qgk0f31y/vqJWDDLYTDfUFdHjum2/Qa/JNVK2thIqy
         B7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428302; x=1725033102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ems5Yuh3jeXb/TrU83+Z84W4Dg/l4S5Z1gzeQy+U0XE=;
        b=u/RpQKgz8nvIHkZqaDho/1KfNx7tjjT3sWp4PizMsvDbg1jZx4z8aBY3riHv7FrWqB
         yn7lWm7ysR390biDwg75sPJfH8PpxNrBB1QgHxOi8ebxbDv673cTiRi7vME4dxRpKSrN
         /Fnan5HwAhSPChIKwtj02GsF0A6y/Q7mWHt2PY3aVzfXyBWkq4FkI5+RSG2iQBD+hEpi
         s2nB8TD+hymR6RsKO4v3McDsBdpQBR/aB3ze3Cc1JrdBT8HHnYa5qdGqR2x6x8YHy2vr
         RavyvWw+w/2hb4IPMIB82ivL4fnjbDO6AI6Y8WiiT+mAH9sp3YPO6ufvVCQ2lJ6c5QgF
         bt5A==
X-Forwarded-Encrypted: i=1; AJvYcCXm9bvLohAPK6lKAmqplfV1LG6TpkE/pl32Eemi4VdHllHafBv4L49gw4iK4ld7SAQo6JYe6+HdxByzEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLHucFGaGR2V07B0YJubhHX3MiLukBdOGlPof9LCzoYelVR5AI
	JSb7A8/KiJ1Ssp3rW82ynxHDv/FRSPBE10MfeCaDR5CbJodlYRrNACfj7oALA8qcT5dfdBJtKIv
	JqrT/ikeqw0ngCMH95/KxFnfTblM8EQaQ6QWn7A==
X-Google-Smtp-Source: AGHT+IGvS1m3SwVCUZI5gnVQXJAs13Rd9dcYnhQeTub9j2B6KWYvXRtdAKKxqsWhnDiaK1fwjiJmwMVrg93543EtDjo=
X-Received: by 2002:a05:6512:10cd:b0:52e:fa6b:e54a with SMTP id
 2adb3069b0e04-53438785b05mr1938698e87.30.1724428301706; Fri, 23 Aug 2024
 08:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 17:51:30 +0200
Message-ID: <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com>
Subject: Re: [PATCH 0/5] Remove support for platform data from matrix keypad driver
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 3:47=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This series attempts to remove support for platform data from
> matrix_keypad driver, and have it use generic device properties only
> for the keypad configuration. Spitz is the only board [left] that
> uses platform data.
>
> As part of the migration I am also dropping support for "clustered"
> interrupt mode, as it was only available through platform data and there
> are no users of it in the mainline kernel.
>
> Additionally gpio-keys device used by Spitz converted to use device
> properties instead of platform data.
>
> I would prefer not to have the song and dance of merging first 2 patches
> through the input tree, waiting, merging the spitz patches through SoC
> tree, waiting, and finally merging the last patch to matrix keypad
> through input again, so maybe we could merge it all through SoC?
> Alternatively, I could merge everything through input. What do you
> think?

Sounds like a plan. The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

