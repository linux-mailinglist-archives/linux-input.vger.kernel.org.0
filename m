Return-Path: <linux-input+bounces-15886-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1CCC37855
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 20:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6621018C8279
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 19:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA62834164A;
	Wed,  5 Nov 2025 19:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NFntWLw4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E4F221703
	for <linux-input@vger.kernel.org>; Wed,  5 Nov 2025 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762371684; cv=none; b=S2DBwlL9S6Xi/FljKB+N5i0UOafkmVnMuxtsK8UW8675ea4oyIRFb8qkzXGJWHvp847BHQS2vaQCmD6k/GXvHM27fHfSE7C6J8rGEpoewHoMGMcxPxhKgbQA/Of4YDNuPlIiyEEaJ0HxNoUhhtXsQ4KyhsH8DNjs9kgKx4fsC3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762371684; c=relaxed/simple;
	bh=bZHv94L6/tQUoE0h96uu+ssXsm4jrc3twKjnXVEhbVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fm7vawC9YsPUeXwf2RGm8K7ODwYx+n1xgjVhHNHO/IyayPX+P0PrgXSRl04vJMKv5RIrrnrIvZ8ybR6j4Zya5nCBDre2V+L5Pdrv8Zk2M2UwGAMvxudMGyOAvGxYXhQURM38A9YL0tpevblzsKiagqZEP1mHJ+Dwpb5it2T94tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NFntWLw4; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-586883eb9fbso184558e87.1
        for <linux-input@vger.kernel.org>; Wed, 05 Nov 2025 11:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762371680; x=1762976480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZHv94L6/tQUoE0h96uu+ssXsm4jrc3twKjnXVEhbVk=;
        b=NFntWLw4oUOLucF1nBEsLwwyWmFE/9KfBzstS7U6Y33KHiiJaaXzjJOnV4SefYuiFe
         9fD5/ZIlkxZmQaQNyvMGOTKLrHspoBXHq2/n/S7W8qnPg3G4bg/7ZrOeLiF2DYf8UBtO
         qLy0hadsOHnDuzvqxzCzprvZ+pxf6PS8qsFvk4qKjU8BfVyY8mBDcyDYmHlA67Uo6sFQ
         Qd6szAio1IC+q8SDs0mSlcEgZgAxxz3yc0bT1c7oGWdHv3H1diMlKAz+lKFzF7WGRZyN
         H/Fu/jjp1zQDbTggPzIDD+RrjEdJssOlk/nIeF5sg0o6R5soj0kV+4oD/zTQ1ISuU5VT
         f4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762371680; x=1762976480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZHv94L6/tQUoE0h96uu+ssXsm4jrc3twKjnXVEhbVk=;
        b=gJ76giE0kB14BbwliEpuwSRWncVTfv/CYRW27KaMOlU0JvTBEhx49ZgSyNm6FXTFWg
         x3NbUfE5uWbVk8uzG1pgPTclKNMKM91+QLltvMMkduUKOdoHe635DtVIo/5XbIHC5YO7
         2AmedDE/e28Q5XEn8JToBNMWru5zQqPg4AR/o/rh5IB7lzRWqGtn3RxRlYEd89PtoZVk
         GmIFKc81YJEAdNPI63eotu5KLR0t5GykzKslEqmDaID0Dolwz2J+l//uMOxoKeMnzR9s
         fFQHWabNHz7sVHMaa8fecXrKHOwXg3HnmFUPEswMNJfFTAHs5FVrc8OWpPBujFIQqhlN
         +BLA==
X-Forwarded-Encrypted: i=1; AJvYcCXRSBZ++YrEgOM0cFOpQs3WJAhZ1gXQSy2GRwX88arelfpVWhg5mFpYZj5gb7/ciHs6qJCctd8xA5uZBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyARXgpb2NZHbcf8nBVkw9PjhwGlOnsM83rU1HAzUGx6HFClaTg
	OLxPR9rQeXqcuGvUz6Xl+ACcpyMXbRI0e707IWAq2LhbEVXYpxZwqU3RyV0AUCv8GO4SuNFbqvX
	nrPuYsU0J1JTTVkSB/QkMz24KLWXDAbn1VQYlveNpf4nRO55zWepfuefr
X-Gm-Gg: ASbGncvxAPCMCzbJoOokKq55WAoDtD6qAb1BKm12jyqzJ0VExFryF6Wvz/qftnmlF5L
	QDW2DymwqityQ7XSJDlp7Z11oECFgn3pUS/8qmMK2UtMNGNRswoHY9S1LS/eD8Q1zNgE7lBANAJ
	x6+RRlembgO3Uozul28ZbROb5DpTz/R3hE9HlShpSI43njSjz6VNrgmWiGVzDa4PTK13sw2K+pM
	WCLxLNDeL5t8F/mlbgSemM6TGDRpJlsxm/GpJ8pU7oOWWytgNnxnklWVzxEyRX0SGJoUVu9AdT+
	CV+nit1rphcpNXdcvDNiG6c=
X-Google-Smtp-Source: AGHT+IGQIiPZcHHq1WrKLoi7cZHVRI6qNimojPh1PTmb/201EYfhPdIi91zsPGboaAy7eklJpvt+vajCMx08/Xsmdrg=
X-Received: by 2002:a05:6512:1287:b0:594:2835:e751 with SMTP id
 2adb3069b0e04-5943d8044e6mr1659936e87.53.1762371680204; Wed, 05 Nov 2025
 11:41:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010012006.2282321-1-svv@google.com> <no3r172s-899p-7s78-o199-8q8oq1r2nr71@xreary.bet>
In-Reply-To: <no3r172s-899p-7s78-o199-8q8oq1r2nr71@xreary.bet>
From: Siarhei Vishniakou <svv@google.com>
Date: Wed, 5 Nov 2025 11:41:03 -0800
X-Gm-Features: AWmQ_bnYhq1zuERdrkg_2iQXFsAeKs5IR_ItocUtDqbe34Aptv1t2IbqkWYTTkg
Message-ID: <CAKF84v3zxT5siCOnXwn6Xc80T4vTDpP08K1Pd-J8XyBtv-V3Mw@mail.gmail.com>
Subject: Re: [PATCH] HID: playstation: Remap joystick axes to be centered at 0
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, 
	Roderick Colenbrander <roderick.colenbrander@sony.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 31 =D0=BE=D0=BA=D1=82. 2025=E2=80=AF=D0=B3. =D0=B2 02:00, Jir=
i Kosina <jikos@kernel.org>:
>
> On Fri, 10 Oct 2025, Siarhei Vishniakou wrote:
>
> > The joystick axes (ABS_X, ABS_Y, ABS_RX, ABS_RY) for PlayStation
> > gamepads report a neutral state of 128 over HID, with a full range of
> > [0, 255]. The driver previously mapped this directly, resulting in an
> > evdev range of [0, 255] with a resting point of 128.
> >
> > This approach is unconventional for Linux gamepad drivers and has sever=
al
> > drawbacks: it requires userspace applications to be aware of the
> > non-zero resting state, and it is incompatible with the input
> > subsystem's 'flat' (deadzone) logic, which assumes a resting point of 0=
.
> >
> > This patch remaps the four joystick axes to the conventional signed
> > 8-bit range of [-128, 127], with 0 as the neutral state. This is
> > accomplished by changing their evdev range in ps_gamepad_create() and
> > translating the incoming hardware value in the report parsing functions
> > by subtracting 128.
> >
> > The analog trigger axes (ABS_Z, ABS_RZ) are handled separately. Their
> > resting state is 0 (un-pressed), and their hardware range of [0, 255]
> > is already the conventional representation. They are left unmodified by
> > this patch.
> >
> > This makes the joystick behavior consistent with other gamepad drivers
> > while preserving the standard behavior for the triggers.
> >
> > Signed-off-by: Siarhei Vishniakou <svv@google.com>
>
> Hmmm ... as I am rather unaware of the existing playstation userspace
> ecosystem -- is there any way how we could now be breaking existing
> playstation-specific userspace assumptions that have already developed
> based on asumptions that we're centered at 128?
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

Thanks Jiri for looking! I chatted with Roderick, and he brought up
similar concerns. Generally, most of the joysticks have the "normal"
ranges with the 0 value at the center. However, I understand that some
user-space apps might have hardcoded some of these Sony-specific
assumptions.

Instead, I will change this patch to provide correct initial
(centered) values of 0x80 when the driver first starts. This is needed
in order to fix our Sony gamepad tests on Android (and will help
everyone else, because now there won't be a stray "bring to center"
event emitted from the gamepad in the beginning). I will follow up
later this week.

