Return-Path: <linux-input+bounces-12455-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF526ABC8A2
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 22:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2FF91B619A4
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 20:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716A421858D;
	Mon, 19 May 2025 20:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RC1yFotM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC12321170D;
	Mon, 19 May 2025 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747687927; cv=none; b=GanLsN4KBQsn2XOsH/cbgXvHzD2i/NEGh7P9CaYvYec4bLvPv/nDHr+fn4F7jmHgzOgaW7BcOSBZIR35O4RRxv0eIiola1x3Zx1iunobRRalYb6k2c9z4BN1eo9CplsHzFs/xVigo54zH/G9jxhHH4YDynV1k25dMPFhc2iWyw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747687927; c=relaxed/simple;
	bh=yeXQv+7gwkoDQHnYBen8Z0DUDkFqP6apoaoLd8IDDi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKRoBDeQBwHB80tMJ8NH30U2GKzgkGNTH9eASbxY38I1vxdnAU3PDwA9KUeP+M2fW+qUyNUzIVp1fECJ4R1++Vi2z3hTQK6Nyl/kS//QZOmlFGGkAVk8W03aNPex2cI/IulQcNgRbIHs81yZCDm2/M7s62ia3gGexfbPpYilYFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RC1yFotM; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4766631a6a4so51964601cf.2;
        Mon, 19 May 2025 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747687924; x=1748292724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIjWVDrb+AeHPrnU5wepYHaZFaqsE7VtLlqzlYhHa4Q=;
        b=RC1yFotMKvQ+2snDBXe6K0fXUzqdbivm1Q6Yc7XQ9JUvHI1HE6f5MVPdjU8O8bUT76
         U7wccBoncuy2QVIHo5g178pot9NHHyW6LzMfexbLlHA/b0Hh8nT6TT7X86m3HMCkJsXf
         hpQezOZN2HRhGCyzu5kU52tJcpDfpkV8IApdgFbNDLv4h2930soXa+Tzcwc9aEjZGXTD
         bnMRmTVuNEDaw9XWkgJFCDI/jy3diakKCrsZLgLyu/21NAmZRJv3wzca241IKMYTxf6h
         WCzo8/4lBLp8hsIBwtyhkHYCQ9+RuvldBm4j+TwKLNNRQYHABxhsOZ0TjURC6wkLcXXb
         1gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747687924; x=1748292724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIjWVDrb+AeHPrnU5wepYHaZFaqsE7VtLlqzlYhHa4Q=;
        b=RyQf0o2Cq5/x7gmonBk0JDiu8Jhg81bOzdVu1ItknUUjByeOud6qC/9ovm9uLMJn7V
         VsivuTuW4U31z1rwh8+XIHJh43ejAdO4y6d8tJDaihbT7NeS3ao6YLEYSndi7zdAv9Cc
         XD8eSCRini8kIHdycM/6QpSxoDgfldshGmfjVdTkevFbzCaiVyWpv7u02piUZXQOCxms
         l49R0dCMu6o8aZvx2tWalJ6aWHD2Q2SgPYvW5pMOiKyu782gBSbsFm7WiztvOiBwfwZl
         tYiPD3hQKRumrHcKcp9KjSvg2HGSZNLQWG5XTsFrs2Gih+aiGqeusyBlstZSodHfCMYN
         7/KA==
X-Forwarded-Encrypted: i=1; AJvYcCUyC7hbeDRRicgtIuUg0+B3LA3BQprCTKd9bqcmAXgLGQAqqR1AHKEduyYgfbk/CRntajcTzt6VMfQeghk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxnqiw8RcW+qNWEKRrC9wIH00Wpi/hmukVVbzP53U8YcqHe0X4
	m1uDvmHWVSK0O0FRR+cQwgKEy2WfCCPCt3rKmADhQXDWLv4RrcSr5IEDatWTeedlkjxg/oKllZo
	Yq6PpwpZBR3VxgUGuxBECP8ubARxfY4mlKKfc
X-Gm-Gg: ASbGnct7rJvYsXCCPw1eA7aAZFoDi9ypvTwatQf9aBxeeW+IJARL6VnlVsWnb4VIInM
	xvSddAq6KhC6RD2EINhAiHVUQ9eE65mM+Yrjd18rLFP+gpt735jbhPE2Ey2aVlM1E2ucVmnFmt1
	fUbOYSOGGbajeRBg4bWI3yRodYgijSJNLYaQ==
X-Google-Smtp-Source: AGHT+IHtnzz5+3gvpn1QVH+OgYv1fIzGODhG3XmW5jjH/DA5MVKq5zRwylHhuirlITRWIBgQNv6iH82/OHFHzYH7Vtc=
X-Received: by 2002:a05:622a:4008:b0:494:a2e6:2a6 with SMTP id
 d75a77b69052e-494ae400d5dmr271326361cf.35.1747687924484; Mon, 19 May 2025
 13:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517105045.70998-1-apparle@gmail.com> <naxnt42hmvorqkif3pu4x36tpo44ugo2oiblrbtlrauucm5di2@tr2yobgoywmm>
In-Reply-To: <naxnt42hmvorqkif3pu4x36tpo44ugo2oiblrbtlrauucm5di2@tr2yobgoywmm>
From: Apoorv Parle <apparle@gmail.com>
Date: Mon, 19 May 2025 13:51:27 -0700
X-Gm-Features: AX0GCFs_OYz5BVZrvn1RUPpUDGNKA2gAjvRYOj1MbujXpyNSsKs6ki4eHJCbaeA
Message-ID: <CAB7A79zio-_vqCtQnnNUxYTJtTDmzdW9DbW1PoO8oa+vVPu_iA@mail.gmail.com>
Subject: Re: [PATCH 0/1] Input: xpad - add disable_xboxone module parameter
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The goal is to not blacklist the xpad driver completely, because I
still need that driver for other controllers (older Xbox 360
controller or 3rd party controllers) when using multiple controllers
(couch multiplayer) on the same machine.

Today I'm forced to blacklist xpad altogether to get xone up because
they conflict on the device IDs, and then I can only use 1 controller,
not both.
Or I have to create a copy of xpad with Xbox-One device IDs stripped
out (i.e. xpad-noone) to keep both drivers active side-by-side, so my
new XboxOne can use xone and my old Xbox 360 can use the xpad driver.
This patch is trying to make that seamless. And it'll have the added
benefit of making distro packaging easier as xpad can just stay
upstream with no separate builds needed, and xone driver can be a
non-free opt-in installation with this module param enabled.

On Mon, May 19, 2025 at 9:32=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Apoorv,
>
> On Sat, May 17, 2025 at 03:50:44AM -0700, Apoorv Parle wrote:
> > Hi,
> >
> > This patch adds a `disable_xboxone` module parameter to the xpad driver=
,
> > allowing users to prevent xpad from binding to Xbox One and Series X|S
> > devices (XTYPE_XBOXONE). This is especially useful for users who wish t=
o
> > use the out-of-tree `xone` driver (https://github.com/dlundqvist/xone) =
.
> >
> > Currently, there is no in-tree driver that supports Xbox wireless dongl=
es;
> > the only option is the out-of-tree `xone` project which implements the =
GIP
> > protocol. The `xone` project itself, or similar functionality  cannot b=
e
> > easily upstreamed due to the unclear legality of redistributing the
> > required Microsoft firmware. This patch lets users avoid device conflic=
ts
> > and run both drivers side by side, without having to patch or fork xpad
> > (eg: https://github.com/medusalix/xpad-noone) for each kernel update.
>
> I believe this can be achieved from userspace by unbinding the original
> xbox driver and binding the alternative driver via sysfs, no kernel
> changes needed.
>
> Thanks.
>
> --
> Dmitry

