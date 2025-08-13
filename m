Return-Path: <linux-input+bounces-13964-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592AB245EF
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 11:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3D907B8F26
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 09:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8CE2F8BF1;
	Wed, 13 Aug 2025 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1twrd93"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2A92F8BDF;
	Wed, 13 Aug 2025 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078211; cv=none; b=O3jbRr9WVYQ2HKirwpsJ2hSUykadEnMn0w4fWnIoNBUtAmJzQLolPaDSv4A5GD1jryH23HhzePRzR8sDzRmRySwyB8g61MIYpapnfDykRvrZ9Wxd3IXKZcg0aaWFnO51vvbHCq3NBpitIRDpZqqjGDAuOCU9xheRRcXac9dzd3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078211; c=relaxed/simple;
	bh=N0Lff5QX5H65Nvu8xKFVfX3EgZNQa3ItLK4rAN0jw+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bDGXSnpYm+a06AbV9P8PcJPIG3RcrKktDx+z4cjNaM80upQIOLDXQzgjoIA+asn/ZyQEgkWzSt8Am/KnCaLbi4dc9Co8jhxV2DU4aRNkiXQexzIAN2YOHF0CiISzrIhwZpoSvt7NspoxU9+Imoi8cEHGqXH2fesW59r279mLUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1twrd93; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90840C4CEF5;
	Wed, 13 Aug 2025 09:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755078210;
	bh=N0Lff5QX5H65Nvu8xKFVfX3EgZNQa3ItLK4rAN0jw+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C1twrd93wg2L3YBTg8rPA0NDYXxjYQLKGJH+ikpDwbVS/xzwf8K+yxjugFSCD5Ijk
	 CCEfnfhe+xGqa2e1tnZk7utciA0lBtFEQa+Jzx7Rf+YVenpZYAX36sHfVDxsClc3JV
	 S+t41ZlqgfP9I0mBYDesdeM588IxMhP6NO7fYohPv0DOVsoLYz35Zpr2yNM0tF/NBN
	 ak9YT9kvawA4vKFSdQeDKtvuSVUqPPx2jD3Ke7lsKUtnpno+FFXA1TcvgeIlY+gqE2
	 YHbSlb39JhKh4vUTXmf+EiRcooPsvrvMEOPJpNmTVn5n0nV/ssLty4Vcg1jOClNznj
	 vYDWnx4+4kM+g==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qasim Ijaz <qasdev00@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20250810181041.44874-1-qasdev00@gmail.com>
References: <20250810181041.44874-1-qasdev00@gmail.com>
Subject: Re: [PATCH RESEND] HID: asus: fix UAF via HID_CLAIMED_INPUT
 validation
Message-Id: <175507820932.20076.1828761859413180643.b4-ty@kernel.org>
Date: Wed, 13 Aug 2025 11:43:29 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 10 Aug 2025 19:10:41 +0100, Qasim Ijaz wrote:
> After hid_hw_start() is called hidinput_connect() will eventually be
> called to set up the device with the input layer since the
> HID_CONNECT_DEFAULT connect mask is used. During hidinput_connect()
> all input and output reports are processed and corresponding hid_inputs
> are allocated and configured via hidinput_configure_usages(). This
> process involves slot tagging report fields and configuring usages
> by setting relevant bits in the capability bitmaps. However it is possible
> that the capability bitmaps are not set at all leading to the subsequent
> hidinput_has_been_populated() check to fail leading to the freeing of the
> hid_input and the underlying input device.
> 
> [...]

Applied to hid/hid.git (for-6.17/upstream-fixes), thanks!

[1/1] HID: asus: fix UAF via HID_CLAIMED_INPUT validation
      https://git.kernel.org/hid/hid/c/d3af6ca9a8c3

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


