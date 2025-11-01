Return-Path: <linux-input+bounces-15846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB50C2766F
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 04:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8ED9634AFF2
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 03:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D50632C8B;
	Sat,  1 Nov 2025 03:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3xmptez"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F055A41
	for <linux-input@vger.kernel.org>; Sat,  1 Nov 2025 03:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761967131; cv=none; b=DDJE60VnUNZEGzGNXN8BodmimtdByGwQDiFNhR1fE4Vfaqt0IvKWCk0EN8QDZJsZcfLW9yWug8MQjlpmNYtWLfS7hjhHYwZI8KY8Z8lj91Kxs67MdSaKWfJA307A9p5k0inpUD1A7uhungvOeJsFXs8fEWNr6uPLtpKITcO8Gnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761967131; c=relaxed/simple;
	bh=PoQ7J2AhtVET/S82iJ12xRzt890v0n8EStI4PS3cA8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKonYKDboufN6Gj6MgCqzCaxNXByxhN1SmEtA1IoPTQM4hOXt3xauJrmUbx3TPyFaftctcAEMmNohMg8dAi9JnNgw39h8/Ddw3VicvpzdM6HRTItguZMPePPohqzRP3S/uTNQuKWNHXA4xtRYcv9RYZrzZs1vwYkO2wmlH7egN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3xmptez; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33be037cf73so3180659a91.2
        for <linux-input@vger.kernel.org>; Fri, 31 Oct 2025 20:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761967129; x=1762571929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoQ7J2AhtVET/S82iJ12xRzt890v0n8EStI4PS3cA8s=;
        b=g3xmptez7PbcvFvVk1TdKmhf2yOe1dm6cEAaPTldTDsnNvg5VeVREIj5n41C3LohD/
         lfmfxfWQKu5oAgWTR59klDtH1+c4sSoMHy4KVqwB22SbQKjJ+eZFfK76qg4o9W2z/c3F
         wU1mQrU5wdnlJxqKqmwL67Tu5G2V3YinxxKOv27oW4x8uUs6Fy+Q5cAiWg2xJSeNpw5J
         EKfd8tc1ck67jaL/XBOvR2v4j/rvpY/y0e3k0JeO9P7QMF8kbuuKh8iyqASdQtawCdSe
         iXpYEtvY00Qd7pKrAwHZ/r+EZIkqHPctDEa0bHgH+Z2DCcLePxtn2ZYhn/GKH3kiAZ4L
         drPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761967129; x=1762571929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PoQ7J2AhtVET/S82iJ12xRzt890v0n8EStI4PS3cA8s=;
        b=TvMo8auqKhVSGJVpyv14LxrpYswwEjirwxpShyu8dVEx9fmBL4/cekqr4Fl/SAZ9M3
         NjCxgYgRM0cx74pQEm2WGGZpoX5aeheG6vW9B038KMAn1sMEJgZ63Uw/fOTGpHVDwUtx
         eQ+qzfe2dpMmguUrSezjhaGUD8PGilPsYN6ZVvTW3PC8GqYpuRe4osby52fZl7ElP/Bo
         EgBbhKBaujuTKgPAPa67eZ5TYTZvkv5dazGNkGdedAlhNYXXq1q4/YescAhRNegw6aa5
         /UgOYxJhBOOBLEzdz81mSbCCkEcnvRGFJOfDsLxpXEZV67g+kGoDiQVkUnmYw4DIwIyd
         wmgw==
X-Forwarded-Encrypted: i=1; AJvYcCUs5xE+YZM2Ne7/f6dbZo1gTU5nBRELbvHX19JlOgvOQkeqnAG+9as89IT1hQNRo45k52dAhnjUTJYR/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRKEyavLexqrHKLNFat58Rm52JvIr1NpraKl3M/jXGrv+9uf2v
	36vAxy2egOJKS0nybtDXoU4mMU24N3U53S2RwGlJCcRy4PbU8zGdYkaCKlOoAQODlqsD8nvqtRM
	FvOAc5ts2Cx35t42jruePpPe5ZPxgXMo=
X-Gm-Gg: ASbGncsRGeSBr22BAC9VjjHwyi1WJUdkoBsd1lewGPhtJ7Bf0UE4djUScP9e35qeApv
	CRIlIOaLn37Q5iIDKivqPCsGaN/QMNvxU0saRJ8Uj3KstN8t0DKzalHDLjXv2cskjzM9Ge0wsbR
	+JFoZ3FoFOsQIoPTirftpExgnSJm0Pf9YgwUJrcESgUsEWstMeJTcRewU4ae0K5GFJts4d6jBDe
	+EkFPn1IX7MkIsptEKOJBhRqF72WApO4fEtW0b94lWhr3YF4l4IV6HW1IOVjJ77Zo1u/Tl86SU/
	qj2drEnreAv5jvshLQ==
X-Google-Smtp-Source: AGHT+IEf2hMF5hc+0ZvrR2bZEb42VqQzDrJjh4fiePGk04SlLSDHNG/fPoslmFXjFImQZdUvQdSWGQqzQuYUD2ZQetw=
X-Received: by 2002:a17:90b:28c6:b0:340:48f2:5e2c with SMTP id
 98e67ed59e1d1-34082fc12f4mr6567493a91.10.1761967129195; Fri, 31 Oct 2025
 20:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702034740.124817-1-vi@endrift.com> <bwun7yd3uwp3cqicg2euq5swxespqjiizxlioohgdk43emzwue@hzyz7gn4vfqb>
In-Reply-To: <bwun7yd3uwp3cqicg2euq5swxespqjiizxlioohgdk43emzwue@hzyz7gn4vfqb>
From: Cameron Gutman <aicommander@gmail.com>
Date: Fri, 31 Oct 2025 22:18:37 -0500
X-Gm-Features: AWmQ_blNMq3W3kWvaUVLYqwPXzYI8xL4ouo-eV3fcxk0IPyWga2R301sJQXZw2U
Message-ID: <CAAfxzZ0p=2REL8fhnxe5HwpPK6U7Cat7euMcRnWvUnknrok3sA@mail.gmail.com>
Subject: Re: [PATCH] Input: xpad - Change buttons the D-Pad gets mapped as to BTN_DPAD_*
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Vicki Pfau <vi@endrift.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 3:23=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Jul 01, 2025 at 08:47:40PM -0700, Vicki Pfau wrote:
> > Since dance pads can have both up/down or left/right pressed at the sam=
e time,
> > by design, they are not suitable for mapping the buttons to axes. Histo=
rically,
> > this driver mapped the D-pad to BTN_TRIGGER_HAPPY1-4 in these cases, an=
d before
> > that as mouse buttons. However, BTN_DPAD_* exists for this and makes fa=
r more
> > sense than the arbitrary mapping it was before.
> >
> > Signed-off-by: Vicki Pfau <vi@endrift.com>
>
> This unfortunately changes existing mappings, but I guess new events are
> better than old ones...
>
> Applied, thank you.

Unfortunately this mapping change caused major userspace breakages.

I think it needs to be reverted.

[0]: https://blog.dwickham.me.uk/why-your-xbox-360-wireless-controllers-d-p=
ad-is-now-wrong-and-how-to-fix-it
[1]: https://github.com/libsdl-org/SDL/issues/14324
[2]: https://github.com/libsdl-org/SDL/pull/14339

>
> --
> Dmitry
>

