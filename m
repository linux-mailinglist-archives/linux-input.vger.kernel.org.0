Return-Path: <linux-input+bounces-1378-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E31A6835A2B
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 05:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 949E62830CF
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 04:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53234A39;
	Mon, 22 Jan 2024 04:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DixZGokX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66064A31
	for <linux-input@vger.kernel.org>; Mon, 22 Jan 2024 04:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705899457; cv=none; b=hBmMxMlJXhVEEcst2PxKsgO8oUg+L7ApKG57OP14Ulcr0HpqNWj7lZwsfG1eHrWlqRHMJ1tzPG4e4+275eg9dTaQaRU9a1OGPgBqJYkzM7g/fLIB/pKExlhJjWC/25VeMk8RSHHUG+XBfBDG9ELVhKduxGue3EZlYPt1auDFtdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705899457; c=relaxed/simple;
	bh=5YeLdYqk8xDHGUclfUDC+uN84dr7BzMUwPtW37X3OG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdMgmHaChOEVP+EiZesXUDUoV42hei0GlUjPP+5CiM2fzTg1BfCUvcyLK5jERjDAS7kQQnx5G4QEYByuLg+Bxe862rkN+qN/CobWK1ymFkeR1LtTsqzE3wX64ln0t0Tcq/fiiiZuQ7Xx9hfe1kNtaM0XVtHVozRpVFa3GK3MZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DixZGokX; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55c2cf644f3so779812a12.1
        for <linux-input@vger.kernel.org>; Sun, 21 Jan 2024 20:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705899453; x=1706504253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YeLdYqk8xDHGUclfUDC+uN84dr7BzMUwPtW37X3OG0=;
        b=DixZGokXW+zYXd9eASvZ8Am82OqnGAXMgymc4QjCRjkdp15JqiM8sQADTzBttaTzLd
         8CD/V1Mh5xZLPmtC+51P/DwXbaBKkT1q3tc+dE6AcODD/XeCdtfNIRbQVQ+3nvyVUEMt
         IybUq6D8NqWbrtF/SLbX3UfYvjw19t0VDlerE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705899453; x=1706504253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YeLdYqk8xDHGUclfUDC+uN84dr7BzMUwPtW37X3OG0=;
        b=UZJgF+CmkQs42YKpA2bWc8w/5IAshCjK0gejBUW12ToVCgXF/PCR+fjmDYV8N/D2R7
         4AbBit1YMU+Ygkq3f6EWg16NFzuI3lrDjwMGRZs/QyhzXtogXUeo7ItsD4+OQnPYHTGe
         ++xSxXbPwnQU4KPjx0pWrq0xIrczBEyi51VpO0pCNsXSi5FbJ6yfrkyR+juul71WUzqk
         pim8a4/zHkpq65jfAyw8MLwqvPCSsMnqbBsADcgGqr2jmh4mKwE8H/WCGNgeJkYRBzwr
         HMLtttrEm52++XzMBrRSf5s3MWuP8OgLc2wcmUzXjrA9+Z30qqgRgzRNwANU2IzqojYX
         zwCg==
X-Gm-Message-State: AOJu0YxonrODXJejxgdrcKofN9VuyaF/NCVSr4i+HNNX8RGoc29TD9GW
	7+tgyQe7AkunVt451TeSEjNHN4/Bwv9wz7zu2vCyzOJpUb02M1C3ZvuaXMQh9t7yAosfuyWy6fQ
	/sA==
X-Google-Smtp-Source: AGHT+IFdRtrAJ1DH37PavHx6ZjUQTJOFggZ6KSm2kbkX2QWBOCtjs4f01OyClTxVBkyPdyyizPuuOQ==
X-Received: by 2002:aa7:cfd7:0:b0:55a:5044:545b with SMTP id r23-20020aa7cfd7000000b0055a5044545bmr1860429edy.25.1705899453714;
        Sun, 21 Jan 2024 20:57:33 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id v13-20020aa7dbcd000000b0055b0ea6bc8bsm2279745edt.56.2024.01.21.20.57.32
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jan 2024 20:57:32 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-337d99f9cdfso2411180f8f.0
        for <linux-input@vger.kernel.org>; Sun, 21 Jan 2024 20:57:32 -0800 (PST)
X-Received: by 2002:adf:b343:0:b0:337:ca7a:313d with SMTP id
 k3-20020adfb343000000b00337ca7a313dmr2180046wrd.10.1705899452326; Sun, 21 Jan
 2024 20:57:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017091900.801989-1-tylor_yang@himax.corp-partner.google.com> <6c7d9c92-7616-4fad-806e-44302c33b63c@linaro.org>
In-Reply-To: <6c7d9c92-7616-4fad-806e-44302c33b63c@linaro.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 22 Jan 2024 13:57:15 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AN-1FTHZcE1Eja0Jd4iqpDocZSz19F44RxqtvKs6ikeQ@mail.gmail.com>
Message-ID: <CAAFQd5AN-1FTHZcE1Eja0Jd4iqpDocZSz19F44RxqtvKs6ikeQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] HID: touchscreen: add himax hid-over-spi driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tylor Yang <tylor_yang@himax.corp-partner.google.com>, 
	Doug Anderson <dianders@chromium.org>, jingyliang@chromium.org, 
	poyuan_chang@himax.corp-partner.google.com, hbarnor@chromium.org, 
	jikos@kernel.org, wuxy23@lenovo.com, conor+dt@kernel.org, luolm1@lenovo.com, 
	robh+dt@kernel.org, dmitry.torokhov@gmail.com, devicetree@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, poyu_hung@himax.corp-partner.google.com, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	benjamin.tissoires@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, Oct 18, 2023 at 2:08=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/10/2023 11:18, Tylor Yang wrote:
> > Hello,
> >
> > This patch series adds the driver for Himax HID-over-SPI touchscreen IC=
s.
> > This driver takes a position in [1], it intends to take advantage of SP=
I
> > transfer speed and HID interface.
> >
>
> Dear Google/Chromium folks,
>
> As a multi-billion company I am sure you can spare some small amount of
> time/effort/money for internal review before using community for this
> purpose. I mean reviewing trivial issues, like coding style, or just
> running checkpatch. You know, the obvious things.
>
> There is no need to use expensive time of community reviewers to review
> very simple mistakes, the ones which we fixed in Linux kernel years ago
> (also with automated tools). You can and you should do it, before
> submitting drivers for community review.
>
> Thanks in advance.

First of all, I can understand your sentiment towards some of the
patches being in a very rough shape. As a community we have large
volumes of patches to review and it would be really helpful if new
contributors followed some basic simple steps, as described in our
"Submitting patches" page...

That said, it's not a fair assumption that there are no steps taken to
offload the upstream reviewers community by the corporate
contributors. We usually do have basic internal pre-reviews for
patches coming from partners and even a pre-review bot (CoP) that can
automate some of the checks such as checkpatch or bisectability. But
as others said in this thread, we don't control our partners and they
are free to send the patches just directly to the mailing lists if
they want to do so. In a similar way, not everyone in ChromeOS is
super experienced with upstream submissions, so sometimes they may not
be aware of the best practices, etc.

I haven't seen the patch in question, but I'd assume it's more like an
exception rather than a usual pattern, so I'd appreciate it if we
could avoid aggressive responses like that and try to solve the
problems in a more productive way. Just a simple response with a link
to https://www.kernel.org/doc/html/latest/process/submitting-patches.html
wouldn't really cost you much, or actually even less than the entire
litany in this email.

Let's be nice to each other. Thanks.

Best regards,
Tomasz

