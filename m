Return-Path: <linux-input+bounces-14660-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A1B5538E
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 17:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35C707A4076
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 15:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEAA21A421;
	Fri, 12 Sep 2025 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMKZRU7W"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968DD1E7C18
	for <linux-input@vger.kernel.org>; Fri, 12 Sep 2025 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690997; cv=none; b=kLMaeY7OBKa/y0IiY3L3Q7F8vCbPM5pWSf8SVWmWO9RUOpPJYxVHNK1kbFt1HUSRWeTX2qFCV/7qQP/Z7xCbLys5MArCunJPjF4c6TJquocIGFHUCM5ABBALxS9+q2YiMurTsGfPScfjF0rGJByOwdrtsff/vrkbxskY4XRj1q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690997; c=relaxed/simple;
	bh=BOQ+mzZ3TLR6Ti4WAAlvIpTrosvIqLrC8pjqFYTfiA4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IyoA3mCaG3v7U5rIcmhNc8urE4GT/tTS5SD1l4YdEuODR0/pjQvOEi5jJMiorWu8dhQboajexpzvDs2oZ1fAe3rt7xr5/8oIj8f1RKHxOyiX0ivPFyODcZvhAKE1zF9uBfBu6ZE3gY/RUWfvwXQZTb2hcgA19TTnLwTh4JXCCUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMKZRU7W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A1FC4CEF8;
	Fri, 12 Sep 2025 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757690997;
	bh=BOQ+mzZ3TLR6Ti4WAAlvIpTrosvIqLrC8pjqFYTfiA4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GMKZRU7WckYzE6fbIs+cFxwEMKpF4bsqEmbZKNF/jCKqrccnQIKNh7H7xGZLW17WW
	 Qpf4mW504j9IeuO2mhmd1G23lbbT3PIxoNjHlLKe8hdqawEeLBNsQO85Sgu0LT3hFY
	 IGYqXhtFBnYlruo83NBlH6uxzbQ32eq/d9349/Hjt/sp3NLOD18kfD2duPJ0ykgxbP
	 auPfMHUU91Gz4SLkViyhVFKRaizuaFkCYhS5iZDC9uQS5QQVjpi/Px1r3dZS6CPeL4
	 EUHtl5MysBZmk1YunvuaaeR2uAfk/pjVZou8SZRtYZ+Odo38JpwdokrhKVblU0Dnxv
	 LpPXxz5Mh5emQ==
Date: Fri, 12 Sep 2025 17:29:54 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>
cc: bentiss@kernel.org, oleg@makarenk.ooo, linux-input@vger.kernel.org, 
    dan.carpenter@linaro.org
Subject: Re: [PATCH] HID: pidff: Fix possible null pointer dereference
In-Reply-To: <20250823194516.2425885-1-tomasz.pakula.oficjalny@gmail.com>
Message-ID: <nq76p676-0309-n4o4-nnq7-0q696549o251@xreary.bet>
References: <20250823194516.2425885-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 23 Aug 2025, Tomasz Paku=C5=82a wrote:

> As reported by Dan Carpenter, if the axes_enable field wasn't found,
> trying to find the axes themselves will result in a null pointer
> dereference. This could only occur with a broken PID descriptor, but
> it's worth protecting from.
>=20
> Exit early if the axes_enable wasn't found AND add a gate to the
> pidff_find_special_keys to exit early if the passed HID field is null.
> This will protect again null dereferencing in the future and properly
> return 0 found special keys.
>=20
> Fixes:
> Commit 1d72e7bd340b ("HID: pidff: Add support for AXES_ENABLE field")
> Made on top of for-6.18/pidff
>=20
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com>

Applied to hid.git#for-6.18/pidff, thanks.

--=20
Jiri Kosina
SUSE Labs


