Return-Path: <linux-input+bounces-14041-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC807B2812A
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 16:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 329C01D00C93
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 14:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CF2186284;
	Fri, 15 Aug 2025 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quqsXSoE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14607E0FF
	for <linux-input@vger.kernel.org>; Fri, 15 Aug 2025 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755266497; cv=none; b=h95JtfC8QFZ96zlPqtn/S285TQnGGR4ymUOxkheiCJ1wnX/EZ/+ubGl762X1tDG56E1PZ+YO9oTtOzzJzXpsR8DBloU1Byb+ieGELhJHEBTlf0C2SFNn/F7ADbVxYmGe1c2zsquniTTd3LfpRXTTgRgJYBEpJbOOnzfvBBySYJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755266497; c=relaxed/simple;
	bh=IHqcOStyicGJDy/FcwDj6+B6+RkHbyZMdxmfvUH4Bk4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fsAGDxz9VkMPqgueni/6938XNgoCHhQBOoumATXs7rMu9k17S/jTVrCUr5rzT7xGlmMAtmNXnkEkkm2PH3+Qf5uBIkbxovCG+ePfagYFsq+wsIAKeH1uHvElSuM5ERrtWJHqxZz5eZhg7YuO2Ltn6AEd791KtxRM2uO0qFnjyC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quqsXSoE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8154C4CEEB;
	Fri, 15 Aug 2025 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755266497;
	bh=IHqcOStyicGJDy/FcwDj6+B6+RkHbyZMdxmfvUH4Bk4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=quqsXSoEwGsZYFlG/wPArx77JjTE5NDXKb0OA/UzewGasql9Xx26CQJRZF/7H6TSM
	 HYKYtIFwSHlJv4fOnSiv+Uu2AqWB50SoEf9C+J6/nTDADvKSRpof/y3vB92TdzJoA2
	 iYBaa86KOUhLIVCNxdz2RE3X8pkaLqOPzyhQLE5cZObMJ4IlAaEc8XRMH0B0JiiZlh
	 q/qJcE+5cBqI2yNhABwd7hxEYu9FvaLyaXVSzHumVrYZXQFw11+G3OemS5mq1MZ3Ra
	 c4auX5/Bj8AbhH9c6AF4aTwm9EooUacQImeYudbt+3Ec7P70S67iKT9qSpJnbNZGtd
	 aZBxpSc91A78g==
Date: Fri, 15 Aug 2025 16:01:34 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, oleg@makarenk.ooo, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 00/17] Further hid-pidff improvements and fixes
In-Reply-To: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <73586p4s-1s39-5o3r-8r2n-p73781107n60@xreary.bet>
References: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 13 Aug 2025, Tomasz Paku=C5=82a wrote:

> Another batch of improvements/fixes/updates to the hid-pidff driver. A lo=
t of
> code quality improvements with probably more to come as we better underst=
and the
> driver and strive to simplify it's inner workings. I think we're currentl=
y past
> 75% of touchups + Oleg is working on some compatibility changes for Simag=
ic
> support in a "pass-through" mode.
>=20
> Direction fix only for conditional effects fixes FFB in Forza games on Mo=
za.
>=20
> I removed Anssi's email from the "welcome message" that appears on succes=
ful
> PID init to make sure people will look for LKML to send in bug reports.
>=20
> Changes in v2:
> - Added changelogs to commits changing debug messages
>=20
> Tomasz Paku=C5=82a (17):
>   HID: pidff: Use direction fix only for conditional effects
>   HID: pidff: Remove unhelpful pidff_set_actuators helper
>   HID: pidff: Remove unneeded debug
>   HID: pidff: Use ARRAY_SIZE macro instead of sizeof
>   HID: pidff: Treat PID_REQUIRED_REPORTS as count, not max
>   HID: pidff: Better quirk assigment when searching for fields
>   HID: pidff: Simplify HID field/usage searching logic
>   HID: pidff: Add support for AXES_ENABLE field
>   HID: pidff: Update debug messages
>   HID: pidff: Rework pidff_upload_effect
>   HID: pidff: Separate check for infinite duration
>   HID: pidff: PERMISSIVE_CONTROL quirk autodetection
>   HID: pidff: Remove Anssi's email address from info msg
>   HID: pidff: Define all cardinal directions
>   HID: pidff: clang-format pass
>   HID: universal-pidff: clang-format pass
>   HID: pidff: Reduce PID_EFFECT_OPERATION spam

This is now in hid.git#for-6.18/pidff. Thanks,

--=20
Jiri Kosina
SUSE Labs


