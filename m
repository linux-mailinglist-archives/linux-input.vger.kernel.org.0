Return-Path: <linux-input+bounces-16934-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C89D0D3F8
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C015B3011ED8
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5014C26738C;
	Sat, 10 Jan 2026 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWUdgOv9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5A145B27;
	Sat, 10 Jan 2026 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768037269; cv=none; b=tDTtJxgl0ZsO9xuvvTw5en/LIHS/3BT4Zd0jWkfY1b54cZ9lMHKFikBuwftwhXpHEveE2jfR13AsMaV9VSKnuldOVGgZWUMf2tpkyXU006mA3h3NVA8A4T81mLiBJ7a3bCx7bDdnR8JR0wFovkk9ZTVmNKcXg5+L/Jp0YifrEMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768037269; c=relaxed/simple;
	bh=yKJK540WKXUYrH2xFj9ONvRfRhRouLl6J+zWW8nid7E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ip5pXcnIjNxigmTnlB5qoCnsj6kT7rZkN1UCsiT9bYSKIotmevbOTxsR++/f66HR50xibdfTdc8Riht4/lmGgzVvf3NlbJUUxFr8jIyw3dkvm/Xb448IQ1TEiyeTvGNwleSBkCrVU7RvIxZIN0YS/L4qs9tRxIiI4/h4+Eib9Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWUdgOv9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33F7C4CEF1;
	Sat, 10 Jan 2026 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768037269;
	bh=yKJK540WKXUYrH2xFj9ONvRfRhRouLl6J+zWW8nid7E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZWUdgOv9Wmyse4Ban574bMhbnIbe8jPQjCUjVxSfE/e3qjbRirwhJF7ddv+YGFjN8
	 obVGpjPWBTO11T6/rPBQUzdzgSLMu1Eqhan4f3NYYecYgmDDXZk5dMXSJAX4XsQXzm
	 rv3dN/DDfkSd+bYDu4kBKCLhb8fODAR6qA34bOhqLFBTjDmD8WpTiX7wiRLYsdnHBs
	 1ofidzzTAs3POpWG2QSrOYvzIIv+TWv/jQb2ow47JERPLM0dQKln/lajL7bloKeNW4
	 3c1IHK2Kjz3dntCNSTJ2kPY8ILsaMdPXXsoqZLoSgpzT/i2hArMOigV4A++w6sAfAz
	 0Y+Wd1qB9pHWQ==
Date: Sat, 10 Jan 2026 10:27:46 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?G=FCnther_Noack?= <gnoack@google.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, stable@vger.kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: magicmouse: Do not crash on missing msc->input
In-Reply-To: <20260109105714.3140851-2-gnoack@google.com>
Message-ID: <p9o1r5o6-3051-865n-3432-p507pqn9o3s6@xreary.bet>
References: <20260109105714.3140851-2-gnoack@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 9 Jan 2026, G=FCnther Noack wrote:

> Fake USB devices can send their own report descriptors for which the
> input_mapping() hook does not get called.  In this case, msc->input stays=
 N=3D
> ULL,
> leading to a crash at a later time.
>=20
> Detect this condition in the input_configured() hook and reject the devic=
e.
>=20
> This is not supposed to happen with actual magic mouse devices, but can b=
e
> provoked by imposing as a magic mouse USB device.

Applied to hid.git#for-6.19/upstream-fixes, thanks Guenther.

--=20
Jiri Kosina
SUSE Labs


