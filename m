Return-Path: <linux-input+bounces-16852-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A2D00134
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 21:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF1033018F7F
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 20:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181EF3128CA;
	Wed,  7 Jan 2026 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qu8iUcYK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E1F23C8A0
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767819384; cv=none; b=ldd1yK/NVzoqrGEqc5tYbvap2iyEWtvPt8bK7bMrbuIRAcxXQpDlOnEwcQAojaiTOSZQu6znbK9nm1yHmqIjxf5/D4mkab6urEtah4zVjqYksf0yUMIsWxjErTMusJh29vz6j76G6Wnnu0DRsWultNHTvA298+lKPBJa6hs9Rv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767819384; c=relaxed/simple;
	bh=f7i4pAp6uvDNYUsTyBiFg7SSRSKc04RW3h+Yb4nlkTI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CeLHbcvlWbpqVQ8n/qORdSPhRAjnbfHlfPAS2x5tboHtgdh7hpNalhtG8xPQGQfQO7gjgDcpn72FRcg51Gs2w+oj+ZyAExS7N67RagEu+ND4L4k9ZJczXPq4as10xpqE4rMn/4tTyvecORfVUDx4ZMORgQLmYQ519ZR2HYqFIvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qu8iUcYK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0371C4CEF1;
	Wed,  7 Jan 2026 20:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767819383;
	bh=f7i4pAp6uvDNYUsTyBiFg7SSRSKc04RW3h+Yb4nlkTI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qu8iUcYKv0w3WAwt/01kgHXmi8Hs8+ApzdvtQb9kcikAeJ13KH67+0Qx93nv6rr3d
	 xJ4FT7gDbUd1CtXj3tKEmssz09/SyxCl0MiysSa8F83tBl22k0GQuvBVtogLDC4QDg
	 f+1sdjkffSIhdD3R1nJ8Kx0NzMSOj6d6/OXDBF1t5DBztGEy0WEZXGt57/bqj0SZ8k
	 OGUagKj95DiiaAn/kWWOHiHMit55wbS83d6MAR/Y9TdEemwxtvHgjWSRhwsMC05gfd
	 Vdqq3W7TEQ4ClOEPwHQaKr5sQKo+cMU66gXtUn7KfC/DlMLw0lAc8ZsAV3rnTz1veF
	 041UDg9ljpqww==
Date: Wed, 7 Jan 2026 21:56:20 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Ren=E9_Rebe?= <rene@exactco.de>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [PATCH] HID: quirks: work around VID/PID conflict for
 appledisplay
In-Reply-To: <20251128.134641.2239011056142092631.rene@exactco.de>
Message-ID: <9118qsp8-pp84-o09s-n8n9-3s8s54r40207@xreary.bet>
References: <20251128.134641.2239011056142092631.rene@exactco.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 28 Nov 2025, Ren=C3=A9 Rebe wrote:

> For years I wondered why the Apple Cinema Display driver would not
> just work for me. Turns out the hidraw driver instantly takes it
> over. Fix by adding appledisplay VID/PIDs to hid_have_special_driver.
>=20
> Fixes: 069e8a65cd79 ("Driver for Apple Cinema Display")
> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>

Applied to hid.git#for-6.19/upstream-fixes.

Thanks,

--=20
Jiri Kosina
SUSE Labs


