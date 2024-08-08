Return-Path: <linux-input+bounces-5458-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA8794C738
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 01:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7F3A1F275A3
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 23:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C5615F32E;
	Thu,  8 Aug 2024 23:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyudVsov"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE64F15EFB6;
	Thu,  8 Aug 2024 23:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723158710; cv=none; b=uM22mjQTA/mSt2gecrarF7npGD/zNuX+hSkz9MWuebAf3vwSr+zwjdR5PN8eg/Eq6/Tl682fBGyk2zN0L63quCkcvS6n1FlNyt5Ax7A3AaEhryi3SPP2/Enz2H+ds39FuEaLgMG7PCWku4e1xPO/bWq8+D1FuujTA6kbSLtZZ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723158710; c=relaxed/simple;
	bh=QzKhyPe14h+xTaNGHujCXgpo07qtS6ZBmgHJXGPpT9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKHopUxDKtRQSQyXGze+4Twv8BmDebXdZnW20xp0dI1vfEE3bg9ifHIonEFf44u180sny2tWgYSvOWgLxryxkpr3t4kSBGD2sKN4kKiMQuf6mvtD/NSch8ycT9JSWNqrqcs8fMMej+km90aQHKyGRp/c+t2xrr3WHM1LpT1WZVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyudVsov; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a8caef11fso178062266b.0;
        Thu, 08 Aug 2024 16:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723158707; x=1723763507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzKhyPe14h+xTaNGHujCXgpo07qtS6ZBmgHJXGPpT9Q=;
        b=MyudVsovMEjiWlrDd9Zv++6b+or2lpCMbqRNiKgZnDLlokd7T9KpgoQqWX/MCG8blB
         y78THO64KZ9t92YRaklnmy16+742QzNTreo4wK9I274ne+/iH1L8roh10k/8EG8Pa1lR
         8ECtq/suKK//hP6BHdINer/OHA7wF0pR2DIfA6scTelA/0BZWUIMop+dcKfIPaKlaumL
         kArwajAODwNJ5EpsCx5DBs6tfWG8HePcobcawWNIkbeY7WqaRkv69TboVW7uHD7s7XVC
         hCIf5J4492UMR9eEH6SH3SD5hkq+hmiJIlAjUd5ugIYnn7T32UjEfX+3UZLXoLsepSyO
         5F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723158707; x=1723763507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzKhyPe14h+xTaNGHujCXgpo07qtS6ZBmgHJXGPpT9Q=;
        b=tt33L1596Z7P4xSLp4JpqCkM/V3g1xAWJK8bw5Kcu4djomLbz6SaZXyAAt95OhCVQT
         x7ZaOoN6kJCzWMaQ5KIeToazkZdw7GcN44xiR3OAQ0H3avaCcRTnSa0q1iutcWyzSgTU
         bYW5aNvVWnMPVbiOup204npsgM+kivreOKq+FjiUy/IOTXrIAYJHzkDle9pYOpadH2Ys
         wPCxBmCrNYG7g4R0XeAtum+tmEJOXO0LzEAPMgHrKaNx+wf3+8fh+NaQHoXrsAFQkJrf
         SXHC+5sRiB4Gww0AylTCFZ1HXb/1N78jOHcpG7DjvqFYWl0jwY4Lif3kGhJyJ/o3or4g
         TPMA==
X-Forwarded-Encrypted: i=1; AJvYcCWYW3vxfg6QmRE1ckAQjarSj2TavX9/sFaee4PXucozXpkwdOTTfskkctipAmlGcaK3m7oysP0vEjVonbV9XmORS0FvGHovPNih2mDCexqNk56R7+2NBM6+KqoMY+AsuPe+U53RsqHN9Us=
X-Gm-Message-State: AOJu0YwQFmttru+TYa6LbPZGUnRVHO35anrQ8khxzExHCjG3MnTfJiNn
	0P73NsG+REnF7siYYgmaASKwtZyk/xzkTHuqRnxQ+2SkV7dc32r5KkVa0edtN8ajFoaIUIS2gnR
	gHEPRyxZ5ioht0XAcUAmJVCIMLDo=
X-Google-Smtp-Source: AGHT+IEZ2mPTSt8Cd6agvxFpioGrtvMggA1ekdh8FHzUpIES/hJWVqYYR71ztdrO1o/0/tsLcQ/9f+093ztH/t169f8=
X-Received: by 2002:a17:907:1b27:b0:a7a:9447:3e8b with SMTP id
 a640c23a62f3a-a8090c82a6amr252374966b.25.1723158707109; Thu, 08 Aug 2024
 16:11:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240616163055.75174-1-max@enpas.org> <CAEc3jaCkH5JwNTpHRZYsekbwX+G6T5tMTLD0+O6E7Q2hqcAFHw@mail.gmail.com>
 <dedb2c39-fc28-4cba-802f-5d56f23db722@enpas.org> <CAEc3jaC-Tmd2XtK9H2sipBJAhCf16dMWx46r8Hs4p9At3LC_Jg@mail.gmail.com>
 <afda41dc-7b36-4ddd-abfc-c9430d8c9503@enpas.org> <CAEc3jaB7ijeXCUKOhpORx4Omf8edSmc1HKe9bk22V1mz=cLa+g@mail.gmail.com>
 <5b42961b-8ca6-4245-b16c-d703255e5aea@enpas.org> <bf096319-c44d-4bbf-bbcb-374d3cce0ca7@enpas.org>
 <rktgvill7zgcggiir54ixh3ele4zeqatoxwshamebtvvcnz4z5@nmmh5wgwnqmf> <cde0bcf3-eb31-48ae-93a6-e630ba80a068@enpas.org>
In-Reply-To: <cde0bcf3-eb31-48ae-93a6-e630ba80a068@enpas.org>
From: Roderick Colenbrander <thunderbird2k@gmail.com>
Date: Thu, 8 Aug 2024 16:11:34 -0700
Message-ID: <CAEc3jaDzvus5ZDCupDzpy1HWRAwaKHQZLpDU4gO1=jTmPUzeKA@mail.gmail.com>
Subject: Re: [PATCH v1] hid-playstation: DS4: Update rumble and lightbar together
To: Max Staudt <max@enpas.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Roderick Colenbrander <roderick.colenbrander@sony.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 12:31=E2=80=AFPM Max Staudt <max@enpas.org> wrote:
>
> On 7/23/24 01:49, Benjamin Tissoires wrote:
> > Is there anyway to detect that the device can not support the current
> > behavior? And if so then dynamically switch to the new behaviour?
>
> Sadly, no, otherwise I would have used that already :(
>
>
> Also, the change that my patch makes is in the "dialect" of the wire
> protocol. This seemingly changes zero in the original Sony device's
> behaviour, both from what my tests have shown, and from what I gather
> from Roderick's emails. HID traces on the web confirm that the PS4 may
> output such or similar reports as well. Hence I don't understand why we
> would want to make a distinction at all, if the driver can simply only
> speak the "dialect" that works on most devices.
>
>
>
> Max
>

Sorry for my late reply. I just got back from vacation. Just catching
up on emails.

In general as Max also mentioned it is not a true regression as
various of these devices didn't work before. I have been thinking
about how to handle things. Preferably it would be some type of quirk.
Just changing the patterns is not a good idea also in case
hypothetically other features were get added (volume control for the
speaker, microphone settings,..) and other features which work through
the same output report and various of these devices probably won't
handle (or it is hard to predict).

I have been trying to think of ways to realize a quirk. I think we
need to search it in the HID reports. Either do some tests on reports
we know aren't supported (ugly). It can also be that the calibration
data is invalid (zeros, which we now initialize to a default). Or
perhaps is the firmware/hardware version related HID report returning
anything interesting?

Thanks,
Roderick

