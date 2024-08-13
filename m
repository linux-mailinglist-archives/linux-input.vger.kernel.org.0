Return-Path: <linux-input+bounces-5554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D03950B6F
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 19:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F1951F2412F
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 17:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B531A2C26;
	Tue, 13 Aug 2024 17:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cBAWJHMM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21971A2C09
	for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723570077; cv=none; b=BU9Yjy2K+qRe00vDsYMnWPukwFlBs/c4GOjuXvfg9NaZHJp95M2WsWuc5Q651j1B3f4J5n5JCqlmyC+NwUJUe4RWNlpGP0kPP9dtW/Pp5x/EsMXkg223eEmIbvsbyUuVjBWwJnKI3PVVxbdQTxfBh40QidB2cw/WjAnEP/RB8E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723570077; c=relaxed/simple;
	bh=fVPQXHdsqHUwi9VIGaY64omTQpZNyJFY9/T1nVkDXzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7p6lsrjg3QToWgQbxyPegFFmvPHkQYCEvHZtvuaEawMxYWvSjzUfZkxaq82vkqi2YjhIdKQ+HmNOj0VArc62Y+1VbtPXdzNwP2tjCDZjM6sJfQe9uyif5otjhp5iyjPV26yEo661q8XxPb+60VpvtM1YyDRBVRQ7msMLnXOnAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cBAWJHMM; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-44ff99fcd42so31129801cf.0
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723570072; x=1724174872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxBfeskCK9StEbhEGdoE9N+4iMSwlDDr96ExPJPkhg0=;
        b=cBAWJHMMMGqG0SwxBkMwGyr7v2TgnDa0FcV4IjxH1RlbFCZfaX6cIIJzJ7PmAS2hwQ
         /ULG3W/WoVrAG8TvXGh1L1h2yOiNMyBBqnQFuaJqYqGoICyyLnxr+kOTk7qq/3y40QJa
         XO+j7XDS2HnFFw225Eycr2tDa5Oxyqt+GoCls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723570072; x=1724174872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxBfeskCK9StEbhEGdoE9N+4iMSwlDDr96ExPJPkhg0=;
        b=U/CB4Dseqr6S+SGAqQYis9P2wyEry6NURS4HCQAQ2o8d5lXNqN/GENWUWjdW31zUBi
         QdqFKqM5LVQhw0oO1eBIHEnvL68kfqWCmANqqGpZernbso4d+ADVmk0Y9YPWDtLQTUYM
         94/Ts8nLY5qEN4ASbnVNbjO5FgNkLDJQqPQBFxThjLW/YoYj1HkI4vQ+N2BkhtZIndIi
         +SWM6htGm1layQhVfh5+2rMCKr6FhzooaEPJoGFJmrTpofzJcvy5UmVOugIA4gSGSlzi
         9v16m+edxLbEHKOiHX+E5r48oia7sf8f0MVzfbCrJNVCQrIIm8z0NqU46utFF53nBYal
         6hpA==
X-Forwarded-Encrypted: i=1; AJvYcCW4tKgva9FZ8LAmVt12gEZlrwiuXhNBwC2ftSjXebR850ADIPrwL4QE5SXKLcLv0i0BW4wTWFiJggKv3WiBR8/ilcN8+QlaZGQvn8E=
X-Gm-Message-State: AOJu0YwKkt/0Z27zgapq6zbIpXt8S/zu8o2tRE+dKwNk3rGYA/eouukp
	9Foty+2spgTIfEA1mV7938ggrfLQgNgZKp1J1FjobQ/FolSiaJkNoHbDao9TifvmjndKOC/jFis
	=
X-Google-Smtp-Source: AGHT+IHLq5reJerBmL8BYyLVIV3zqMHUssCp7Ckt41uSZdpMFu5QMRoU3YUXMyuFPt+CyYRtTIdn8Q==
X-Received: by 2002:a05:622a:5814:b0:44e:3784:7d79 with SMTP id d75a77b69052e-4535ba6c36cmr244901cf.4.1723570072449;
        Tue, 13 Aug 2024 10:27:52 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4531c1dc4bdsm33965491cf.51.2024.08.13.10.27.51
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 10:27:51 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a1d0dc869bso345612685a.2
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2024 10:27:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNQhSTPTKIbaCM4Z9pOeRQcQGBG4oQ/4S4Kiv0QyTWvq0O2hobMCRLzl2ODNZI7WHCna+hch0B3zMFyVaMe9yN0W9i7fo5D0ru7gI=
X-Received: by 2002:a05:6214:3d02:b0:6b7:b197:c825 with SMTP id
 6a1803df08f44-6bf5d17293cmr1654126d6.14.1723570070823; Tue, 13 Aug 2024
 10:27:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813133612.49095-1-charles.goodix@gmail.com> <20240813133612.49095-3-charles.goodix@gmail.com>
In-Reply-To: <20240813133612.49095-3-charles.goodix@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Aug 2024 10:27:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WLse_tiiMr8t7Kq0EguzJtt4iqhr6cPUvuDcy8MT0k7Q@mail.gmail.com>
Message-ID: <CAD=FV=WLse_tiiMr8t7Kq0EguzJtt4iqhr6cPUvuDcy8MT0k7Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org, conor@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org, 
	hbarnor@chromium.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 13, 2024 at 6:37=E2=80=AFAM Charles Wang <charles.goodix@gmail.=
com> wrote:
>
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
>
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986=
u.yaml

As a point of reference, in v5 Conor gave you his "Reviewed-by" tag
[1] despite having some nits. It's usually expected that you could fix
the nits and carry the Reviewed-by tag on the next version unless you
did something other than what was requested in review feedback.

[1] https://lore.kernel.org/all/20240618-affluent-unroasted-e6d5d34d1ea2@sp=
ud/

