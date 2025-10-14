Return-Path: <linux-input+bounces-15468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D9EBD893D
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CD9CA4E40C9
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83221273D77;
	Tue, 14 Oct 2025 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tg8hIXbG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594CD2EA73D
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435581; cv=none; b=TBlNkFYffbNH2vsg/GiN2bNwx5XXaPuDHFr2neTSiNgMZgq/bxFWsSkouZ5Pljoj6052dKZ9uVamtVe94c4NG4UOkMY3DeEM+3aSjm4ZTX40sAv8fX3yQSzpo13TvUX7Kt7pvfdBu5Hk+LQ9yBytG0enHTwTNheOvqYlHOHN7xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435581; c=relaxed/simple;
	bh=LxQO1EtKuGnb3V02ip1ovpJhbhgWFO+QNxkics0Bnm4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pjO6RV1z4ubVupnVx5f6BOn2ZiLGHSvgDNld7Q8LF/AxrZDDAGmUqPsDy8koxk1oRPZ9WL0iWhH9W568DNwlt+WLJ6lwM77kgo5p/oTPQk/GNFUtmSM/vMMwFUbYyf0WfM89mqHJsVeG/eUvn/gJxMM1orQ8mRhJ6pf+0ZHuzvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tg8hIXbG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765D3C4CEE7;
	Tue, 14 Oct 2025 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435579;
	bh=LxQO1EtKuGnb3V02ip1ovpJhbhgWFO+QNxkics0Bnm4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tg8hIXbGKFWW77l9VMEiOXAElVAZGp+4YFnajnVDEV644r97bXwZD205WjAhggGkF
	 vxaD8AdJjS6RbowAsPTHUxK1rJXC2GF/6boQTCChRM/fk9anWgfp7BYQqpb9zHWxTo
	 P4ZGhKoDQM5g6jBz3bm7rjxY3694SL0M3RQJqh0gs2ftEip3iclXKdczAGv1Ez/v9r
	 PJOTcIWBVVvXhdeQFqfOkhWuTd7fW0lUj0xcIZz74cddNj43Jv8/7uOMNMpN4YsySK
	 fZk7IEQInoSU95BOaVMMYPDLXr2JkfBHwkq2P4C2DxNyXEti/BVa5/N7U1SYfNoTOw
	 J93V28HJfPOMA==
Date: Tue, 14 Oct 2025 11:52:57 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
cc: stuart.a.hayhurst@gmail.com, linux-input@vger.kernel.org, 
    benjamin.tissoires@redhat.com, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH v5] HID: logitech-dj: Add support for a new lightspeed
 receiver iteration
In-Reply-To: <20250927234834.2635483-1-mavchatz@protonmail.com>
Message-ID: <9q9po5no-op7n-o07o-rn1n-rr36oqs9p9sp@xreary.bet>
References: <20250927234834.2635483-1-mavchatz@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 27 Sep 2025, Mavroudis Chatzilazaridis wrote:

> This lightspeed receiver uses 13 byte mouse reports without an ID.
> There are 5 additional vendor defined bytes appended to the report.
> The workaround for such cases has been adjusted to handle these larger
> reports.
>=20
> The keyboard reports have a distinct layout with differing minimums and
> maximums. Additionally, the LED reports now require a report ID of 1.
>=20
> New keyboard and mouse descriptors have been added to reflect these
> changes.
>=20
> The devices attached to this receiver now report the status of their
> battery in wireless mode, libratbag communicates with them and they can
> be configured with Piper.
>=20
> Fixes: 9d1bd9346241 ("HID: logitech-dj: Add support for a new lightspeed =
receiver iteration")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218172
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218094
> Co-developed-by: Filipe La=C3=ADns <lains@riseup.net>
> Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
> Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>

Applied to hid.git#for-6.19/logitech, thanks.

--=20
Jiri Kosina
SUSE Labs


