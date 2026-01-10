Return-Path: <linux-input+bounces-16936-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2ECD0D413
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1216E300ACE8
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8026126738C;
	Sat, 10 Jan 2026 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hM+ItYlz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87B35965;
	Sat, 10 Jan 2026 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768037392; cv=none; b=S4UVt/ZhB7q3kktpV2jF3Z74d1yzkMEpMBlTWNWJKev9mjEqwp8XyoK6Zl9qeE2dbO9FMru9mUw7r4LLa1abqyZ00bFxwdASJwnWkbPkBqtin81dLmB5+WPBpYlLBKbhmpkcVRDdaUOIphr9FkCkZlzl6veQ2gAxC2x0LHIt/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768037392; c=relaxed/simple;
	bh=g7SmOxfJrNFQceWB56Z6Gom7c2UYoMc+bb8kGjS4MO4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i9v3yH3ScNtyrq4ATEHmyFp3emqMLrXhiKc+tInneKmoogoWaqM3QXWsXJ85c/EAxHgddGylo2sHpCahx/NKHDxKvSIZHuEs+T8a7BwurvWIxOhlmx2jIUGWZuZM4/+exFJVnw084k+eKTxoMypVDV9L6FZBksuAHrVVi3VG+aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hM+ItYlz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F5EC116D0;
	Sat, 10 Jan 2026 09:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768037392;
	bh=g7SmOxfJrNFQceWB56Z6Gom7c2UYoMc+bb8kGjS4MO4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hM+ItYlzV/EWOcCgjtHD40RByLsw2cBOdGG8ACMxcNB18IPfvHOteQljmVKQ1cSuy
	 YasUJDJxmQg85CKs7mfHdaPmuNclmOeervSWPYREK/U6hcX0H59iwruzIpPOvK/YPW
	 2AO/9fzMd1UXJubuCMO4KrwqJC27FJGGEKHdG+OQJQc6hRad8UIvVIExuq1uLdudyO
	 47l0zW+WT9ZocM+bAFUef0iPbxmDIRAIrj6kG8k6mI8JlYvo0g6CZ9Qat1g1uB1e8V
	 yW6is7ZjCO0rr23DUEeLVTpYZstNBFCIq8bm1eq6J827UHSQL44TUKCR+sHnDEf+/F
	 8aEv62QmtTIuA==
Date: Sat, 10 Jan 2026 10:29:49 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?G=FCnther_Noack?= <gnoack@google.com>
cc: =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>, 
    Bastien Nocera <hadess@hadess.net>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: logitech-hidpp: Check maxfield in
 hidpp_get_report_length()
In-Reply-To: <20260109122557.3166556-3-gnoack@google.com>
Message-ID: <qp3o12sp-36rn-8p14-3679-r3np1657r70r@xreary.bet>
References: <20260109122557.3166556-3-gnoack@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 9 Jan 2026, G=FCnther Noack wrote:

> Do not crash when a report has no fields.
>=20
> Fake USB gadgets can send their own HID report descriptors and can define=
 r=3D
> eport
> structures without valid fields.  This can be used to crash the kernel ov=
er=3D
>  USB.

Applied, thanks.

--=20
Jiri Kosina
SUSE Labs


