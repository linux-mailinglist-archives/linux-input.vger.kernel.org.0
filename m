Return-Path: <linux-input+bounces-1384-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B08364E5
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 14:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10A3828E454
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 13:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95933D38D;
	Mon, 22 Jan 2024 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q/D2792M"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048C83D386
	for <linux-input@vger.kernel.org>; Mon, 22 Jan 2024 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705931846; cv=none; b=eG/Nr8/hvSpLRzQ5C4usw6u3RDAA6EpQpR5p6UJQMPxrIXP5MDkxwj666h5L8YUQOFy/oqpSB11HCuscRkJ7w6lcG940PfGWzps2+c/FXUgKs11blBZOb5pjU8yfJsQzTkttk5001E/SV+h550Tw5tSoyNfbQ+GlEXlVsXcF+Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705931846; c=relaxed/simple;
	bh=nnowXkzWgF0Pq5XJ2qngf9wrDF2pzAyVfo5CQNtWqpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRjLi4qXBzW7XoXceimcI+3o97IT/VmXYo544lX8P0vBaiUy4ekQK2Xiw0o2awcYCGYQ+uHPUsVA7dql+DVQjXYOgg68YvMSsy6Gdh0/Yf1DQdoTpBxgm/3RRTBoLxbpipL9CtkV0BPwyCsxNplSVdNO4rtS+3Yshlej/8Cmw2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q/D2792M; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cca5d81826so37019611fa.2
        for <linux-input@vger.kernel.org>; Mon, 22 Jan 2024 05:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705931842; x=1706536642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnowXkzWgF0Pq5XJ2qngf9wrDF2pzAyVfo5CQNtWqpY=;
        b=Q/D2792MPeW7Jg1Dzkv/D0Uha62rrlEx2+FOpwUWOQw0wTc7UiJDL3hwucrm5TSTzW
         hMiMSzAS901QxRwHa0Em6OtHNlbJgfB1ffc8hVrC7SoFMFriTBHVgviRYhPGyFvVSQNE
         IXoD1DSvxfTInr1s17BPQh282NY67yttBXpBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931842; x=1706536642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnowXkzWgF0Pq5XJ2qngf9wrDF2pzAyVfo5CQNtWqpY=;
        b=v1kYMESR50q6hyvMoMagjryTMYwmRTj7vPN4s8l0VgPRzWmepsxra/8Ir7Vkyc6jdk
         jEKS57JunPj8wOYuO6dXA1bS9RhV6Zzt/qFfrQEYdaVIjGBnUuOIcycM57nEubUXwDW9
         a3HuW8K8+ulqpsc2tHo8BUdwIsB/+fDP8z6pofc5EsI7IJDSSPwGYDuBob7tOTpayLrT
         9ENFr7DylLjMcc3trRjed8YoFWv2uO3i4/B9PCVKepWbIzpgIPg6OSCk21rsFu5UqRQu
         hmyOjtwKSaenShU21PiU4xytdnJNdmtuvgDo2HWPFwjMjsw9KNDOhV2rOhTyTlTjBaQs
         MzdQ==
X-Gm-Message-State: AOJu0Yyvr/A1Ua2VhRegxc8xurmI56faVnKz/7Kzjk6aL61a59bEEc2/
	uSlJjTkDmjT5eFgNwvwHWFFYAiWYwV/W6SQa1x+fnSRzcUKGgYL8+RFclsSDS1Wbzlb6xFkEuQt
	emNDQ
X-Google-Smtp-Source: AGHT+IEUKatfTe8b1oFB1myZvqkFrlL/KHcUSe9Q6+q4iNUgvE/I6I2fjTVB4tpfq2AbpbYVnrcJcA==
X-Received: by 2002:a2e:bcc4:0:b0:2ce:4e9:d930 with SMTP id z4-20020a2ebcc4000000b002ce04e9d930mr2498391ljp.45.1705931842111;
        Mon, 22 Jan 2024 05:57:22 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id t4-20020a056402020400b0055c26f9275dsm1658866edv.42.2024.01.22.05.57.21
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 05:57:21 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so3189133f8f.1
        for <linux-input@vger.kernel.org>; Mon, 22 Jan 2024 05:57:21 -0800 (PST)
X-Received: by 2002:a5d:5f53:0:b0:337:c288:2595 with SMTP id
 cm19-20020a5d5f53000000b00337c2882595mr2749142wrb.78.1705931841164; Mon, 22
 Jan 2024 05:57:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017091900.801989-1-tylor_yang@himax.corp-partner.google.com>
 <6c7d9c92-7616-4fad-806e-44302c33b63c@linaro.org> <CAAFQd5AN-1FTHZcE1Eja0Jd4iqpDocZSz19F44RxqtvKs6ikeQ@mail.gmail.com>
 <5a2f292d-efdf-4647-89ce-e4f5d28c7192@linaro.org>
In-Reply-To: <5a2f292d-efdf-4647-89ce-e4f5d28c7192@linaro.org>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 22 Jan 2024 22:57:00 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D49SLYS8WJBFOyY7G6fPYR_scDj6aUsPbnk0jet9E_rQ@mail.gmail.com>
Message-ID: <CAAFQd5D49SLYS8WJBFOyY7G6fPYR_scDj6aUsPbnk0jet9E_rQ@mail.gmail.com>
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

On Mon, Jan 22, 2024 at 5:08=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/01/2024 05:57, Tomasz Figa wrote:
> > Hi Krzysztof,
> >
> > On Wed, Oct 18, 2023 at 2:08=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 17/10/2023 11:18, Tylor Yang wrote:
> >>> Hello,
> >>>
> >>> This patch series adds the driver for Himax HID-over-SPI touchscreen =
ICs.
> >>> This driver takes a position in [1], it intends to take advantage of =
SPI
> >>> transfer speed and HID interface.
> >>>
> >>
> >> Dear Google/Chromium folks,
> >>
> >> As a multi-billion company I am sure you can spare some small amount o=
f
> >> time/effort/money for internal review before using community for this
> >> purpose. I mean reviewing trivial issues, like coding style, or just
> >> running checkpatch. You know, the obvious things.
> >>
> >> There is no need to use expensive time of community reviewers to revie=
w
> >> very simple mistakes, the ones which we fixed in Linux kernel years ag=
o
> >> (also with automated tools). You can and you should do it, before
> >> submitting drivers for community review.
> >>
> >> Thanks in advance.
> >
> > First of all, I can understand your sentiment towards some of the
> > patches being in a very rough shape. As a community we have large
> > volumes of patches to review and it would be really helpful if new
> > contributors followed some basic simple steps, as described in our
> > "Submitting patches" page...
>
> I don't really understand why responding to something which is three
> months old.

Uh, I got the reply from Dmitry 3 days ago and didn't realize it was that o=
ld.

> Anyway, I talked with Doug on Plumbers about it so things
> are more or less clarified, however since two Google folks responded,
> let me continue.
>
> >
> > That said, it's not a fair assumption that there are no steps taken to
> > offload the upstream reviewers community by the corporate
> > contributors. We usually do have basic internal pre-reviews for
> > patches coming from partners and even a pre-review bot (CoP) that can
>
> Good to know.
>
> > automate some of the checks such as checkpatch or bisectability. But
> > as others said in this thread, we don't control our partners and they
> > are free to send the patches just directly to the mailing lists if
> > they want to do so. In a similar way, not everyone in ChromeOS is
> > super experienced with upstream submissions, so sometimes they may not
> > be aware of the best practices, etc.
> >
> > I haven't seen the patch in question, but I'd assume it's more like an
> > exception rather than a usual pattern, so I'd appreciate it if we
>
> Unfortunately that's the pattern. I was complaining few times about very
> poor quality of some patches from some partners before writing that email=
.
>
> Just to clarify: all the complains are about missing basic stuff, like
> running basic tools. They don't even require internal review by humans.
>

Hmm, that's sad then, but then also as I said, we don't control our
partners, so we can't really guarantee that every single patch goes
through some kind of internal review. Hopefully this has improved by
now and continues to improve as the tooling I mentioned gets more
widely used.

> > could avoid aggressive responses like that and try to solve the
> > problems in a more productive way. Just a simple response with a link
> > to https://www.kernel.org/doc/html/latest/process/submitting-patches.ht=
ml
> > wouldn't really cost you much, or actually even less than the entire
> > litany in this email.
>
> Simple response to docs don't work. Docs are quite long and contributors
> questioned here just don't read them in details.

If asking someone to read a doc doesn't lead to that person reading
the doc, then that's another story. My personal experience is
different, though... But well, again, we're talking about humans, so
we're going to end up with a wide range of extreme cases, regardless
of what we do.

Tbh. I (as a kernel maintainer too) would really imagine we also have
some more automated tooling for the upstream kernel workflows. I don't
see anything preventing some kind of checkpatch (or whatnot) bots,
responding to patches automatically. (Actually we're working on
something like this for the Media subsystem...)

Best regards,
Tomasz

