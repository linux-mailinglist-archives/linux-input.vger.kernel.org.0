Return-Path: <linux-input+bounces-15830-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C22C240BB
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 10:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 750961890359
	for <lists+linux-input@lfdr.de>; Fri, 31 Oct 2025 09:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE6D32E6AD;
	Fri, 31 Oct 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUT+krAA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AE132E136
	for <linux-input@vger.kernel.org>; Fri, 31 Oct 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901653; cv=none; b=D7TBdl0J7YH8qU8X+a46WtqUOrRxmf2sa9X+3jRPBx3d8o53TQLuOnLnbKvcIKsbjBUABP9pcSKsiP/EsqPYtqzLqmrGP66ILx4ONNdXh4rB0HXv0MF+kxtu5DdaZ9QLobheCpXWm1oVWiaillULVNKI+98MctGwavlBZxdyGNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901653; c=relaxed/simple;
	bh=JvZcydABSvOQ9sqjD7D/F7p0uXZOfYnTLIJqHz8GpmM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rhtc2R9SlXqRxt5YTouORkdEK4/kNa4yRE1qNgQS6Y7Q7X9jgEPzr/KxcBnA1n6tAIpqPdpqEKvZI0Pvo37eAunP07VKWB7eZsJ5IrTDyKU87c+UNGmlJbGcYMNWF+tWhligrWcFo0CMii0wl7/MThPh/GkXrNEg6mGKe6Pyegk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUT+krAA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991A2C116C6;
	Fri, 31 Oct 2025 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761901653;
	bh=JvZcydABSvOQ9sqjD7D/F7p0uXZOfYnTLIJqHz8GpmM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qUT+krAAoET9da/elO45PJLfGyXx2hoWFI94ZnogRpmDVQetVHewdmrAF3+4tVHMy
	 P8OoJ8q62yJhaVB2XX2W5/9ghgdRCA5oQeVWfG5FSs1e7CQJbhtN48YtB6YCVtSO1d
	 mSlmZHBevtS4xXAlm7SXGdlkydsDJz9fPy30JkLg5KUcTDP75OsMhyn9oU9qyilssI
	 a89ytfazfyl3Wtcg72ZkX5Akg0uMyt7bNJEVm8DZLZNQXLXzUFqeZsI8azalSMyfgN
	 b+BFCq3z7IcaBdYGC+vpyCU7E/qgoY9sUa9OtGTMDQs2D07GeeU7jtvUxiO/uAKHYQ
	 AiQmKqHRhsBBA==
Date: Fri, 31 Oct 2025 10:07:30 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
cc: mario.limonciello@amd.com, bentiss@kernel.org, 
    Hans de Goede <hansg@kernel.org>, 
    =?ISO-8859-15?Q?Andr=E9_Barata?= <andretiagob@protonmail.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: hid-input: Extend Elan ignore battery quirk to
 USB
In-Reply-To: <20251030160643.3775606-1-superm1@kernel.org>
Message-ID: <s0qn1098-s856-1942-48q7-n3691sn109qs@xreary.bet>
References: <20251030160643.3775606-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 30 Oct 2025, Mario Limonciello (AMD) wrote:

> USB Elan devices have the same problem as the I2C ones with a fake
> battery device showing up.
>=20
> Reviewed-by: Hans de Goede <hansg@kernel.org>
> Reported-by: Andr=C3=A9 Barata <andretiagob@protonmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220722
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

Now applied.

We'll have to come up with something more sophisticated once/if Elan ever=
=20
starts producing devices with real battery ...

Thanks,

--=20
Jiri Kosina
SUSE Labs


