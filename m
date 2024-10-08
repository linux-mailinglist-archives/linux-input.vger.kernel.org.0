Return-Path: <linux-input+bounces-7146-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4929999450E
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 12:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4A8DB23EEF
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 10:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E146F17DFEF;
	Tue,  8 Oct 2024 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPyW8pwq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7F117BEAC
	for <linux-input@vger.kernel.org>; Tue,  8 Oct 2024 10:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728381659; cv=none; b=KdFnbboA1Aik+BuWjNvryeLXhc86ynBdIx8Owurx4XhjMCzWskVkn7WJwwC35Mg6swIU9RLeCQlriOdwjxFY0WGFp9iVrgHgFWyBqrf6rMuOqtDpc40b/Reny5bKqahb+m26F8uwGpyzS4OfDmfkmvR+p4SkZzD8jGOVUIBoaHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728381659; c=relaxed/simple;
	bh=bhSMkVhE0H7JkXCKWJ2Lk6CRZ91v90BXSnICEnEYuIQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R1on5ZUeNoy7wN7tTsXMjqdC9Q0ol3Yc0s6Xxs/FufD2gloeeufkV/c70dKsmsF50tjXlfRXODw2inhCsfVHLFStQ8FmPNTAdV01d31kKvU7RfnhLu6vNA7A6r9CitVbLnG9luZRPSf9ZvG7vEVkaCmLsareGMR1C+ViTmjXoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPyW8pwq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476FBC4CEC7;
	Tue,  8 Oct 2024 10:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728381659;
	bh=bhSMkVhE0H7JkXCKWJ2Lk6CRZ91v90BXSnICEnEYuIQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OPyW8pwq9ZcFkrNkLPeFVhqdVDwyyBA68BelyP3VtqpQ6oKpUWZ/4C8MnuZyVucUS
	 /yTg+xmQoks4gHAEYXDRKufaNadTg41VjTLyf1oPlyIcDIj1aHk63aGyIyYgtsr2B7
	 QNurYJy0NiDuOvq6l8AsKhhPwTzdvCOlbOx9PLszF2WVnvFC7A4feI5ozeB6Z3d1AW
	 yuE/eI4Uc7Po+toqEJipRtX2e/cFbZw13ibEXfA/MXx1AvirmHgovXcg6Ur9O7IweT
	 xlu9d8jOK2nw4zjMZsmruFlfeIwjto7wSqXFVvXtZW+VBCE5aMyuG3FB5RyryBrzdL
	 IzCeL8DxGJVzQ==
Date: Tue, 8 Oct 2024 12:00:57 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>, 
    benjamin.tissoires@redhat.com
cc: linux-input@vger.kernel.org, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH v3 RESEND] HID: logitech-dj: Add support for a new
 lightspeed receiver iteration
In-Reply-To: <20240627224242.193873-1-mavchatz@protonmail.com>
Message-ID: <nycvar.YFH.7.76.2410081200050.20286@cbobk.fhfr.pm>
References: <20240627224242.193873-1-mavchatz@protonmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 27 Jun 2024, Mavroudis Chatzilazaridis wrote:

> The lightspeed receiver for the Pro X Superlight uses 13 byte mouse repor=
ts
> without a report id. The workaround for such cases has been adjusted to
> handle these larger packets.
>=20
> The device now reports the status of its battery in wireless mode and
> libratbag now recognizes the device and it can be configured with Piper.
>=20
> This receiver has new descriptors, which have been added. The mouse
> descriptor has 5 extra vendor defined bytes at the end, while the keyboar=
d
> one has a different report layout and minimums/maximums. As such, mice
> with key press macros and keyboards that use this receiver misbehave
> without them.
>=20
> Fixes: 9d1bd9346241 (HID: logitech-dj: Add support for a new lightspeed r=
eceiver iteration)
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218172
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218094
> Link: https://lore.kernel.org/r/CAOEevLOrTSugnLePJwpcqx2_AacNbBxFZDTqp0Qm=
_jjVpWKgFQ@mail.gmail.com/
> Link: https://lore.kernel.org/r/6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmai=
l.com/
> Co-developed-by: Filipe La=C3=ADns <lains@riseup.net>
> Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
> Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>

Given the regressions this caused in the previous attempt ... Benjamin,=20
would it be possible to get some sort of extensive targetted testing in=20
your CI, please?

Thanks,

--=20
Jiri Kosina
SUSE Labs


