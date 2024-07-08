Return-Path: <linux-input+bounces-4901-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C9892A6D5
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 18:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3B7280DDE
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 16:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80471145340;
	Mon,  8 Jul 2024 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np9I2hyF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1807145323;
	Mon,  8 Jul 2024 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454892; cv=none; b=OC/I3G98GbHUo8jasIGF4fN9MNodPvJ5EaCzogJj/hTwl6bf7TTfX6/AC7R2U2kCOrBQsXl+awY6dKuX5fR2ELIQckHVKOsF1do/tShhu6xnQayE7nOdd47GgZXOOyRmAOfOYqaHXGa/AuMCmjRmrIu84uGy3gPEx/+j18slNRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454892; c=relaxed/simple;
	bh=Ohz5ZdQ+jbe/FZ9CBFSI5OQgynmaRZyJo1WPETgWsmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3AP7/1HL3S2HHV7pD3AP/MELwZ6dGZ46/RcRKPHCZpOXD3tnUn12+AfPFKjjquSW3TdZVegMASIwZtGth5uym0PaWn2ALRqKn406WO4VY8cW4xoY401MURAwYtMgxWnTfjI3stroSvvhBZcLn0FS+vHwKUGkTwGfrt2bZtD6TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np9I2hyF; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-58b966b4166so4933169a12.1;
        Mon, 08 Jul 2024 09:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720454889; x=1721059689; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aavLayNlXjLJf72+lQ0+sff2DIyRHzLorFjyS57FhqE=;
        b=Np9I2hyF6GQgh6PdkiailXjbjucth7OUAGXrlTCgjFx+3SjOklMZwFnp7GMIlbLxXZ
         Z0YeQ0upj2eNPK6t+ppMbKvsQ4o20dN9B84iLYl46gt8yfpVEGKtZLqYWrXgKw4LxKjt
         XGjY4/b8AYSR6xOZiSlKAGtGUUWXM61/WOOlgE1N69VRMp3ir41vX1YTFFSKQZIJh7r1
         9qAeAzYQnp5aJjYGFzViGNb1BBiJYjKTsX1ImsBR6ZpkNSJgrzxIGbw5cYNpqVo6yYq1
         MKRsiCVNhS4L4h0CJSdEW+wa+42PRQh+QjyIi7QPQyWZd7OqGcncTmDIjxIVjku5dv5v
         wdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720454889; x=1721059689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aavLayNlXjLJf72+lQ0+sff2DIyRHzLorFjyS57FhqE=;
        b=c8pv87nAhrJtqbs6DQXvargdzY7yPQ0RXBqVJh4IPXkz+p2EsvBLAgsrmuSV6yqLHT
         unJD8/MjPP1joa9smkf7V9bLdc3rAyu7FFYU1NVlFu2/gf7byNYjHjo1FcYsLuyx7oes
         EWbcqsn0MVXPKgiLy+pjWHrvGsho9c2zIDC4TaKVG3nNwW/ROcxf+5rKXzqFlRUhj480
         aJ4jvrn3AtYqXuZXVbr1OUQSZaK7kzAyUor6VYCQiFKP4yfTYsw1JTwggb67TPWOhHd2
         bxISxdyUIWncPfl9GOTAslTKodtwHhn5h27zPoxyaknLT+/vzvKrAmI+LTf5mAeR1u8s
         e6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXt42mn0NeITPBeuDTWKm7NiZyrQtXFZyXDqhFg+gNNRZfntQIL/1o907SM5hktKhUXoGbsPtSaSMSHLGcR02bgJ1aPh84NrE7fM9+O5yDRSenLIBM+TbIlylReOPYcT41EWp6hvcL8iUg=
X-Gm-Message-State: AOJu0YxAVeyGftE18eK8TC33fVgVi8oz1o0aeM6yhcFXTmDSApVutC6F
	zrrkH6rMreHpsD3hM9KawlLTnE1mcusdyHyl3r/otmUr2+D9/XgZlT5lLSurFILHZVtHo9Wud+U
	sHXFtKpBbHB6GspvERMNa7OYUDpU=
X-Google-Smtp-Source: AGHT+IGBuBsw5Er0D3slVAnl7KNp4MNQfixvpP3uu91ADW0Oceb8a3AAsW8EYYftAq8wcuShcWo9fj1p/2VVRmbJBlA=
X-Received: by 2002:a05:6402:3551:b0:58d:b529:7db8 with SMTP id
 4fb4d7f45d1cf-594baa8bd1fmr43107a12.9.1720454888764; Mon, 08 Jul 2024
 09:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240616163055.75174-1-max@enpas.org> <CAEc3jaCkH5JwNTpHRZYsekbwX+G6T5tMTLD0+O6E7Q2hqcAFHw@mail.gmail.com>
 <dedb2c39-fc28-4cba-802f-5d56f23db722@enpas.org>
In-Reply-To: <dedb2c39-fc28-4cba-802f-5d56f23db722@enpas.org>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Mon, 8 Jul 2024 09:07:56 -0700
Message-ID: <CAEc3jaC-Tmd2XtK9H2sipBJAhCf16dMWx46r8Hs4p9At3LC_Jg@mail.gmail.com>
Subject: Re: [PATCH v1] hid-playstation: DS4: Update rumble and lightbar together
To: Max Staudt <max@enpas.org>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Max,

See my comments inline.

Thanks,
Roderick

On Thu, Jun 20, 2024 at 12:26=E2=80=AFPM Max Staudt <max@enpas.org> wrote:
>
> Hi Roderick,
>
> So as far as I understand, my suggested driver behaviour is sound, becaus=
e both the console's own behaviour as well as other drivers show that flags=
 =3D=3D 0x03 is working perfectly fine with original controllers. Is my und=
erstanding correct?
>

The console behavior (I checked the code) does use the flags as well
like I do. The architecture there between usermode/kernel is a bit
different, so in some cases flags do get set when not needed.

Various devices tried to capture bit patterns and see what kind of
worked even though not really right. (Officially licensed controllers
are a different story they use different hid reports.) We didn't know
other devices did this wrong.

> In fact, hid-sony used to send these updates at the same time (it had fla=
gs =3D=3D 0x07), so for some 3rd party controllers, the move to hid-playsta=
tion has already been a regression in the FF/lightbar department.
>
Kind of a regression, but not entirely. Many devices didn't work prior
in hid-sony, because sensor coefficients were 0 or they didn't handle
some reports (e.g. the one to get mac address, which was changed to a
more compatible one in hid-playstation).

> Do you see a way to move forward with this patch and get it merged, even =
if it is with some delay? Is there something that I can improve?
>
>
> As for downstream users' regression tests, this argument confuses me. Cou=
ld you please give me a bit of help here?
>
> My understanding, so far, is as follows:
>
> Tests checking the FF bit should not fail if, say, the lightbar bit is al=
so set. If they fail, then that means that the test is too sensitive. After=
 all, the patch does not change anything from userspace's point of view, no=
r from the actual human user's point of view. The DualShock 4 behaves all t=
he same, and it's just the wire protocol that changes.
>
> So if a downstream user wishes to do a full end-to-end integration test, =
technically they would need to connect a real DualShock 4 and test that. Bu=
t I can see that this is not easily automatable ;) so they may test at the =
HID level instead. The result is that, depending on how they structure thei=
r tests, they might no longer be testing end-to-end, but rather testing an =
implementation and its quirks. This bears the risk that the test will fail =
because of a legitimate change in the driver, or elsewhere in the kernel.

Correct the validation tests are all uhid based, which is the best
which can be done. There is the hid-tools one, but the one which we
help out with, but the key one is the Android ones. We have so many
problems with these. Mostly because of vendors not enabling e.g. FF
support or LED support other things. The kernel landscape for Android
was very fragmented and has been getting better in the last few years
(binary kernels instead of vendors hacking up their own kernel builds
based on e.g. a fork from Qualcomm forked from Android kernel forked
from upstream).

> I suppose this is what you want to avoid, but... isn't avoiding such chan=
ges the reason why LTS kernels exist?
>
> And there is only one LTS kernel with this driver, v6.6, released 8 month=
s ago. How did it become necessary to ossify the driver's wire behaviour in=
 this time frame?

The main new Android kernel (public knowledge) is now 6.6 and many new
devices due later this year/early next year will use it.  The eco
system is a lot wider now and the drivers are used a lot on non-mobile
devices (cars, televisions, chromecast,..). Occassionally driver
patches are also backported from upstream to older Android kernels
(patches have to be merged upstream first).

> Hence I'm confused why changing the wire protocol upstream, without break=
ing any functionality on the original controller or backporting to LTS kern=
els, creates problems. Either the tests are correctly written in a way to n=
ot be affected by this change, mimicking the original gamepad which is unaf=
fected. Or the tests are protected from breaking by using LTS kernels. In t=
he latter case, the tests will break on a kernel version bump - legitimatel=
y so, and fixing them should be easy.
>
>
> Am I missing something?
>
>
> Do you see a way to get this patch in?
>
> Would it help you to have some time for warning your downstream contacts =
to stabilise their tests, and I could re-send this patch in 6 months from n=
ow?

Not that I wouldn't want these kind of patches, but I have to weigh
both sides. The pain on addressing things downstream and in Android
conformance tests is quite painful. We would also have both code paths
used in the wild forever, because existing 6.6 devices wouldn't change
behavior. (The official Android tests are kind of kernel version
agnostic as they work across multiple kernel and Android versions.

>
> Hopeful greetings,
> Max
>

