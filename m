Return-Path: <linux-input+bounces-12942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0427AADDE3C
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 23:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC2F83A8B46
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 21:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A4528C00E;
	Tue, 17 Jun 2025 21:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eCpXaUe8"
X-Original-To: linux-input@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57192277CB4
	for <linux-input@vger.kernel.org>; Tue, 17 Jun 2025 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197135; cv=none; b=jaLcptiffCNq/gDYcYE4IQ/ewKD0LlVy0PngiT0nAIfWjNSwqMO7YP6E6VqSU7MqMYCwPpjRbN8owTsCRgKGB6eAypEzJ6VafFxQwFWQUPbkj5sNNtZh/7l4Yyafi8V10DxuFFdKX1xg38dJXYh/PQgvQ5nqpXnwC/44HaTNQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197135; c=relaxed/simple;
	bh=OLfr+FjabWyxMYerPlgVHisNdZNdT+c/fmhZ7112qy0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RWVGugT1cr+h5n4KpddBpIm2pxCcEFBZBKmRydXriPc4hToddjul9euORYPcFbAK1fiAobY8LAmqBsRgXBaYYsRnnOwzt1J2oZ1+Xkdiw8UNHhGxj0X6hCMJDd4jHRFuXW5DTt4Z3JSwkeBFGrO5NNr1x9iyuguTJJ8JyDCkpss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eCpXaUe8; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750197130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLfr+FjabWyxMYerPlgVHisNdZNdT+c/fmhZ7112qy0=;
	b=eCpXaUe8tmDlFSsUUH1fzrudqDrTjmKWNjCh9zEEtqDCdqLtusjGT/0CGY5Ih7a60aQ94v
	pSPsZMGweLY+0RdtfW/jDtZIoZif0pA8wbbihBNdvVkIub9sgTtyuwwVjiAZC+1WuHDCUU
	wm6ketwuJ4TrHnR7NCdYcr8smwngsJU=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3853.100.6.1.1\))
Subject: Re: [PATCH 0/2] Add nokbdwakeup quirk and enable it for MSI Claw
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <lgedr3vr65tlmdt6p7gsd4cqlhgtadu5gj63ibwpzjuaxgrnwt@vlp3utkui3fh>
Date: Tue, 17 Jun 2025 14:50:07 -0700
Cc: linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <72732EC5-5244-40D5-8928-1FA7F161EFE6@linux.dev>
References: <20250617051930.3376981-1-matthew.schwartz@linux.dev>
 <5isz34mtyxezwrhmvtedygszhhnstsqa4dmcttb33p5dgw47st@3n6wswp2p6di>
 <98727492-5E7C-41A5-B0EF-1A21852FFB05@linux.dev>
 <lgedr3vr65tlmdt6p7gsd4cqlhgtadu5gj63ibwpzjuaxgrnwt@vlp3utkui3fh>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Migadu-Flow: FLOW_OUT



> On Jun 17, 2025, at 2:45=E2=80=AFPM, Dmitry Torokhov =
<dmitry.torokhov@gmail.com> wrote:
>=20
> On Tue, Jun 17, 2025 at 02:33:34PM -0700, Matthew Schwartz wrote:
>>=20
>>=20
>>> On Jun 17, 2025, at 1:50=E2=80=AFPM, Dmitry Torokhov =
<dmitry.torokhov@gmail.com> wrote:
>>>=20
>>> Hi Matthew,
>>>=20
>>> On Mon, Jun 16, 2025 at 10:19:28PM -0700, Matthew Schwartz wrote:
>>>> This patch series aims to solve an issue on the MSI Claw, a series =
of
>>>> handheld gaming PCs, where their volume buttons will wake the =
system out
>>>> of s2idle because they are registered via an i8042 keyboard device. =
This
>>>> is not expected behavior on a handheld device that lacks an actual
>>>> keyboard, as it is very easy to press the volume buttons while =
handling
>>>> the device in its suspended state.=20
>>>>=20
>>>> To solve this, introduce a new quirk based on DMI match that will =
disable
>>>> the wakeup property of an i8042 keyboard device and enable it for =
current
>>>> MSI Claw models.
>>>=20
>>> Why does this need to be done in kernel instead of having a udev =
rule
>>> to toggle this through sysfs:
>>>=20
>>> /sys/devices/platform/i8042/serio0/power/wakeup
>>>=20
>>> Thanks.
>>=20
>> Yes this would work, but it would also mean relying on individual
>> distros to discover such a udev rule is necessary and figure out how
>> to ship this as a device specific workaround within userspace such
>> that it won=E2=80=99t apply to other devices that do want to maintain =
i8042
>> keyboard wakeup functionality.
>=20
> If you submit the rule to systemd repository then distributions will
> get it when they update to the new systemd release. Very similar to =
the
> kernel.
>=20
>=20
>> I will investigate implementing this
>> via udev in some sort of packaged fashion, but a kernel quirk seemed
>> like the better option here in my opinion, especially because a quirk
>> system is already in place for i8042 within the kernel.
>>=20
>=20
> Quirks in the kernel should be used when they are needed for booting.
> When configuration can be delayed to [early] userspace then we should
> try to use userspace solutions. This way we are not wasting =
unswappable
> kernel memory.

I see, I will look into implementing this via systemd in that case. =
Thanks!

>=20
> Thanks.
>=20
> --=20
> Dmitry



