Return-Path: <linux-input+bounces-6417-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E794A9742DC
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 20:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F3B91F23BC4
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 18:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540801A0708;
	Tue, 10 Sep 2024 18:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NG/rLi3e"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB3A945
	for <linux-input@vger.kernel.org>; Tue, 10 Sep 2024 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725994742; cv=none; b=riHQRbrhIzCrbZZfDZ9TxmC+TsDA0POSbRfUiGKav0lbpi63VY6faZ3eOGHCw7sQKriKYn4ICyqUTB3a0fPijiBGQ90PSPGF7jISJvoxA5iQrt0SNH5s6G+bfNConl3eFToAJ6M56ntnFcMy/05LoDLRTueIKhNr5j2Np3a546g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725994742; c=relaxed/simple;
	bh=eF4D3CY/IUSppKhFNZcypBvXXSl0h4yAuAl1i92sr+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEqnyusn5g/9X+93hvRa6d0eBmU2VsBQc7VxHfhndNRXjGQspC4b8IuJGNZaGKgjneiydcrJIDn0WRmzNFxlBa0YVVYVZFQ0awqfOTZFU+ske3jzDunJxTpBp2OMNdgrakGBygcD5eLGSa7SwKNHaXSGb9sA6HK21EqBTX9zKy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NG/rLi3e; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c26311c6f0so7361741a12.3
        for <linux-input@vger.kernel.org>; Tue, 10 Sep 2024 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725994738; x=1726599538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRZAMtFCjTHfa+UAc/csNMlyNLC3KPLlJOASOO55C1Y=;
        b=NG/rLi3eO5Nf1daEfNfbkP/Eb7MxQBPqePtT6scjlNIaOqZqNHSMnp+iFjYE2HraKu
         ISNdnqjiQ+dBXNOSaSV/y5hIDL6MKBzyXKJI7fZ5I5tcqgaK5Icfh5TDe7lkyY9zIw+0
         9vHhRr/Yupv5stLXvrE0MVV0rLk1vAvugDqTPgV6az0q7DLrAAotJVVr4gaH/+NcxIbe
         Jn6d5NO41BaY8C2RXxgmhRps768qn/LUcskstgEZ+JJB1Wryq94Hj9e8FhQ10NSPjTNo
         T3Li39yk89AjyKTkPhUVJLEGJ6uf/41l0E2BADZU5ZpT7p94o+TFJ39xrT98KFXDdR/h
         5wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725994738; x=1726599538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRZAMtFCjTHfa+UAc/csNMlyNLC3KPLlJOASOO55C1Y=;
        b=FqTFMvXUuZt7PWxCck/qDxBgDleQFoEixPAof4FfJjpcndCLmHszJq+n5TQmTKsJRq
         sQcwk79RJ6Mk390T8A9kBQTEG5HaQlQgrtuaQEvd1jR9uh2EhOsUsyhwLsrA7s+3djgV
         6B7u6sIY3n5cYQVww1toP8yoGTCjLyb3NiIq5uyMskfsEYSQ86zkmRB8NwZ2Q87095rj
         O1OiXrOSKJR6SylLkHpwYxgvkIlM+nnxhRcxQyD9oh+HmyOttkQ93ebnbGZDKXdPEk08
         VrmGnNdb/j6MszkIXuXcScpDvhZWzERUFQaRXQOpCbYH5koNPiy63Rr11sUZFMXsqgrQ
         HnxA==
X-Gm-Message-State: AOJu0Yz4vrOQBWiyKm7kd/xj5Cf0pOw/9S5rQhKHMG12SwC32grvoTRd
	cmLDcO5/9uplHP3DeF6IPW1livdmjX8U666KIyxWww58UzjPQBwU/vXZpuAVlnqxCLd+uRut1XY
	N3T/wqBq2jKeSPlXZj9pZRhT0oWQ=
X-Google-Smtp-Source: AGHT+IFx0XxbgGwqqwP+B4cnxb3WTXuZ7RJVRhlS63Z9qRFrehoupjciify8P24xujydXVsK348xZwGsyQ04+DYQLh8=
X-Received: by 2002:a05:6402:2708:b0:5c2:58f7:fe95 with SMTP id
 4fb4d7f45d1cf-5c3dc7c3e2cmr10199896a12.31.1725994737105; Tue, 10 Sep 2024
 11:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909203208.47339-1-jason.gerecke@wacom.com> <nycvar.YFH.7.76.2409092238300.31206@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2409092238300.31206@cbobk.fhfr.pm>
From: Jason Gerecke <killertofu@gmail.com>
Date: Tue, 10 Sep 2024 11:58:45 -0700
Message-ID: <CANRwn3ROebV4gj2w9Q2q7xDSKL0qEiH+Knx_jF55FqQLZ1YRcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: wacom: Support sequence numbers smaller than 16-bit
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-input@vger.kernel.org, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Ping Cheng <pinglinux@gmail.com>, 
	Joshua Dickens <Joshua@joshua-dickens.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Joshua Dickens <joshua.dickens@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 1:40=E2=80=AFPM Jiri Kosina <jikos@kernel.org> wrote=
:
>
> On Mon, 9 Sep 2024, Gerecke, Jason wrote:
>
> > From: Jason Gerecke <jason.gerecke@wacom.com>
> >
> > The current dropped packet reporting assumes that all sequence numbers
> > are 16 bits in length. This results in misleading "Dropped" messages if
> > the hardware uses fewer bits. For example, if a tablet uses only 8 bits
> > to store its sequence number, once it rolls over from 255 -> 0, the
> > driver will still be expecting a packet "256". This patch adjusts the
> > logic to reset the next expected packet to logical_minimum whenever
> > it overflows beyond logical_maximum.
> >
> > Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> > Tested-by: Joshua Dickens <joshua.dickens@wacom.com>
> > Fixes: 6d09085b38e5 ("HID: wacom: Adding Support for new usages")
>
> Hi Jason,
>
> thanks for both fixes.
>
> Looking at them, it seems like it'd normally be 6.11 material, but given
>
> - how far we currently are in a 6.11 development cycle
> - how long this issue has been present in the code
> - the fact that it actually does change the event processing behavior
>
> I have to ask you for a judgement -- would you like to absolutely see
> these in 6.11 as last-minute fixes, or do you consider this to be 6.12
> material?
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
Hi Jiri,

These are pretty minor fixes, so I agree that there is no urgent need
to get them into 6.11. Feel free to queue them for 6.12 instead.

Jason (she/they)
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

