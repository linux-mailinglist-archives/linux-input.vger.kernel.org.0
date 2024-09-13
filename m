Return-Path: <linux-input+bounces-6538-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D897894F
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 22:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9396B210C0
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 20:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEE4148317;
	Fri, 13 Sep 2024 20:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Was4XS5A"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BD126F2A;
	Fri, 13 Sep 2024 20:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726257993; cv=none; b=RDT4cJiylneThgBXBDxzW88vwoxXLrr2qwU4yTx/KwjqL97J2N/C6eTYsJmoqT7w6QwNucUKbGC6e844WGUIfmfOrmlEELhpG9PXCKrMS3KE2twTLLRmuEAAltOzOAQzpoucsApG81o1uojhUUTF9ziw2HjQVOlcf5AtS1hyf44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726257993; c=relaxed/simple;
	bh=VNcP/SM9mEveY0WGny4BGotpP90eCvtQLbHZzdWJDf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrix0bvm2y8ZZz274jAK8tvq7QTBzAXU1Kab8bWhYX7aK1tNHmw8SuEKNLZv9AAYKqx5d+P0/47wttUTby9QthAMbYsSTCC8sdAa0mLsHbXS2RapHZ6d+OMmtObbxU5w2guSrtzNEJkzR77PMwpGIEOECmdcFK6aPG3WlJaaQTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Was4XS5A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF72C4CEC7;
	Fri, 13 Sep 2024 20:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726257992;
	bh=VNcP/SM9mEveY0WGny4BGotpP90eCvtQLbHZzdWJDf0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Was4XS5ACwSXBJR4ea5itx2LOJu6K51b4qMtfwWOJW100ep1vGQ75aqw3vbs0RVlA
	 nrGLKpVtRDfWaJQRqOH//ETEFo7o526c3NM22V+ty1N0VmIRZs0e4a+MA9vPoN0E/U
	 6XHVSEFMsjfAG7uQoOffSL89YR9hSZFSWDZZ/dGxijGTOaUGaHz2Vfckh6z7BF1Q9s
	 ROw7sniAoII308q4dMn27YXQyzP12T0mUu+LSuqwGtMjVMolkLZOCKUn0MrM5Z5iEQ
	 wZCOCq/JS21MJjumfKxQdwpmqMrfyDJuQCcNW++rCwoPX6avd9WN1JJslXbl5iDfsO
	 RbLeuiENotYOA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5344ab30508so3209698e87.0;
        Fri, 13 Sep 2024 13:06:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6JiTEiNaLurrIuuxqA/JZPM2x+XQmGPQ0hEYmGk8sHTst4ici3qRuEMz+RNnm0v5L4BN9xFdnTP7w4Q==@vger.kernel.org, AJvYcCUhaGTB4vnLJiUMUXZHZOZmE4KI4Pw6Y9Erd95ShRcdk91nmAbKi18rQKJmkADTBIVf6wUD2ztvTcwM1r4/@vger.kernel.org, AJvYcCX2PEkOrObItN3gfCFhQTx/78Qae/QL2wgjOMemQlYd5S8rNlPI8SVZfh2pj1cWFPCv+W/RFxxAXTtpRiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3aUjxrDTwVVVG0fr7VNquhdoo90joveOW2ogTV6BwJXJ+ntg0
	yg+JVmUoyfnEEjyA8YWaOZ/2wsOPkJTBZ/silSf06RfgL0oI9ba6b9Dzqk31YSMz/Q8Ey/cv/in
	MJHW7+E0Gtc85VbUQiAE60uuGgg==
X-Google-Smtp-Source: AGHT+IHoDm/RYAHzg2R3qx1uUxPgPCMm66X79nciIv9Z8mCTp19ezV/FTyyV0LEECtTdeNTgOyS6d6V1JJVny1fnBDw=
X-Received: by 2002:a05:6512:12cb:b0:52f:27e:a82e with SMTP id
 2adb3069b0e04-5367909dca5mr2345514e87.21.1726257990890; Fri, 13 Sep 2024
 13:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731201407.1838385-6-robh@kernel.org> <zyzygwdfncus7nhnu6sgbc2wzjpih3dntgdogorg3it4vc7r6v@aufrf6kwqun3>
 <Zs3yfc1pJDkAwhzc@google.com> <Zs4SovPgLmlrVOJr@google.com> <ZtqULBqqDXydmnaL@google.com>
In-Reply-To: <ZtqULBqqDXydmnaL@google.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 13 Sep 2024 15:06:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK0XH6nfTQoUymiHWF0H1L-eMm6WM3SU1aPPNkdgCkiUQ@mail.gmail.com>
Message-ID: <CAL_JsqK0XH6nfTQoUymiHWF0H1L-eMm6WM3SU1aPPNkdgCkiUQ@mail.gmail.com>
Subject: Re: [PATCH] input: tegra: Use of_property_read_variable_u32_array()
 and of_property_present()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 12:33=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Aug 27, 2024 at 10:53:38AM -0700, Dmitry Torokhov wrote:
> > >
> > > Applied, thank you.
> >
> > Oh, wait, can I get your SOB please?
>
> Rob, I am still waiting on your SOB please.

Oh, missed this. That's weird it is missing. New patch coming.

Rob

