Return-Path: <linux-input+bounces-9173-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 752E4A0B5C6
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87E173A9D86
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 11:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC4A22CF11;
	Mon, 13 Jan 2025 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/OgW5fx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383F022CF09;
	Mon, 13 Jan 2025 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767888; cv=none; b=TvovZ3WZKj3pzA2+582jNOr5zz3pj/aB+rO7E9+bMXt2jiRgondMw4lJBDU7PQkHO+oYEu0kEIvgHMP3/2wNFNNYHn+YoyUc1RWVJKEarANe4NrsEa+jfsMNY1ivcEfXo/e8b4ZoOukqzNpkBmPgJLk5u0biRIcjlSyLWIHSbfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767888; c=relaxed/simple;
	bh=BkLxFxgWLAyDmawpQ5UpqvhnWjJ0+20QI4q/mYcdA1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gT9apiiRA9i9XpD3L3irJTG0Yig7p1+5Qb9dBrIY2XKIUyGj8Eo3k2hEphxo+ZchDrw7bZ/KH8nvM8z5Sx7b1xMCQuDJI+LtNtC34I8/95w0jurcT8bofoUj7afS5flbGSFLGW6BHSSuhm+SlAWGlp59sKExTy+DUE9x19g2xhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/OgW5fx; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so6959400a91.3;
        Mon, 13 Jan 2025 03:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767885; x=1737372685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROCfT0DseIK3PgQHMLfZqVsbKmhvNrby4ms3ROLlCXI=;
        b=k/OgW5fxzqYUk1NwJcwYxA0qssA6h0QwsiPAGZOhXwdVPLJLM82cghMEFFT7fI0phx
         pAPJ0Xsxqe3/ib+Yophi0MMznB3cST143dpnfbEg2HJq8FPxzxsEHLq+4z9byJubba/E
         TkdSFdvOFKX4DCjuG1jlFObH6Zmnpys/YgP6BO3GSHLLak1lERsE0ucLrPdELlH/gBSJ
         o5mGwygwM03FHT2nFV1URwH3NU4WRuXM2snpBEuUJQk9v+Z9XNNvdx4TIG6ZHEcdw/LV
         jZEi1ZIOkQTLo1w5gKOcpdqiEEN5gGVJiN/pwqY7KncbCZTX/6j7zsCjgKhTv+5ViVbK
         4N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767885; x=1737372685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROCfT0DseIK3PgQHMLfZqVsbKmhvNrby4ms3ROLlCXI=;
        b=dJ7LTPCmI+ojYP0RWvQFSSSe0owHrDPE7YnGqa79H3zGwTgVhYtACtKgKUGhjFei6u
         AGOHdIou5ZWRHlhervUoBCEQYduyZmWnUphCAZcF9+HlfsfoebV04CvsUAi71mnfPyDQ
         gAVJE4Vw+AMIkAWEIIQxYk/cn9mPPjUZbMU3+lpPIKioUeNeUBMQ5HZmnfR85LoKO5Ag
         n1VNDDgl9qj+6alwIhu3hYh9Ynn7EdXfg6VqJGTcnXK1YEERbhXld2JUb3GwoBA6ov+L
         LWwXWJS77Xp0mHGB090W4HOgkuBe6ld9fqjOIOjenoX7T9WTIqTOUWj4VVlWyzuj5/Py
         9ZdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhcvvGCfxzGDFkB6+eAUkwTsLT86MbTaw3yELwd+x6YfpFI9QSzLBuc4FxyGu46D+BL4Jq0OQuw3cpHA==@vger.kernel.org, AJvYcCXiEpQF2lovA0gA8f3P9n+sfeQKN1lwf2UAetaI7JXwxF0S6m5eMxSY7uiGLuLjytmmAf29dHKnu6TPC12M@vger.kernel.org
X-Gm-Message-State: AOJu0YzFlTN0QmSEXWWkpVmF7YxcBGtY2p+Bx/9dIopr+6ZBvnoO+ogj
	qeyc4zd2iwV5tL8bnAbC0DvO7+nDizKuxxAUqy2fEZCggLctXF/DLlH+RixYReneknbkmd+4g9Y
	GPkf2iYr/TvFWqHOr/iXsWiuceh5mymHFeYg=
X-Gm-Gg: ASbGncvl93f7rX9WlVNoybta824fzo38oOQIdlxRRKuFx3JeYea8K2oChVT1RDj3psp
	o97WLz/sTz5OpC8kBJka+yX44fTeQJliwXG8NIun+87PytPBkYUPCUH4ksxdV9BFVi/qiTi2w
X-Google-Smtp-Source: AGHT+IE/hYJQVs5Tp+0nWfiz0QYkQ33st9G6om9oDAcm53zPDCpt1dd1edItba9ie6a/7a9jUpUIsj67BWDn0HazqLA=
X-Received: by 2002:a17:90b:548f:b0:2ee:7870:8835 with SMTP id
 98e67ed59e1d1-2f548f80206mr31535135a91.33.1736767885440; Mon, 13 Jan 2025
 03:31:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110141409.96959-1-vishnuocv@gmail.com> <p6s4s47q-15ss-ps35-6387-n2nsqn05o335@xreary.bet>
In-Reply-To: <p6s4s47q-15ss-ps35-6387-n2nsqn05o335@xreary.bet>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 13 Jan 2025 20:30:43 +0900
X-Gm-Features: AbW1kvb_jYG6xEvyAYJFYMZgxhjFSbYjhcwfwWubJ2MM3ViVdms7hxvj9cTGS74
Message-ID: <CABxCQKsOG12rp0ysDESNJEXa2AewLusHFTmtj--FNN-ucVgO=g@mail.gmail.com>
Subject: Re: [PATCH] HID: lenovo: Fix undefined platform_profile_cycle in
 ThinkPad X12 keyboard patch
To: Jiri Kosina <jikos@kernel.org>
Cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpearson-lenovo@squebb.ca, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jiri,
Thanks a lot.

On Sat, Jan 11, 2025 at 12:05=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wro=
te:
>
> On Fri, 10 Jan 2025, Vishnu Sankar wrote:
>
> > The commit "HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys"
> > introduced an issue where the CI failed with the following error:
> > ERROR: modpost: "platform_profile_cycle" [drivers/hid/hid-lenovo.ko] un=
defined!
> >
> > This issue occurs because platform_profile_cycle is used without ensuri=
ng
> > the kernel is configured with CONFIG_ACPI_PLATFORM_PROFILE.
> > To address this, this patch adds conditional support for platform profi=
le
> > management to the Fn+F8 key handling.
> > The functionality for platform_profile_cycle is now included only when
> > CONFIG_ACPI_PLATFORM_PROFILE is enabled in the kernel configuration.
> >
> > This ensures compatibility with kernels that do not include the ACPI
> > platform profile feature, resolving the CI build issue.
>
> Applied, thanks.
>
> --
> Jiri Kosina
> SUSE Labs
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

