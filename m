Return-Path: <linux-input+bounces-3515-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D88688BD6D1
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1671D1C2125D
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303BE15B553;
	Mon,  6 May 2024 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWn4fFXf"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095A4EBB;
	Mon,  6 May 2024 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715030798; cv=none; b=n7xcJD6F4QhNktitx87uUJ0ROPz8tsaGcIqr/8e1wlOd54v+03rtZHhgKQcYppNEfke0finKw49bvcQAHXwQtqQ/Y+fvItRre3T2UT/ipUBJAh6+BJ3PfX0Xy1AkYq/KGSH3021wcKy0djinTt3cflx0STGzF4USyec5AbjKuT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715030798; c=relaxed/simple;
	bh=2xLRePQ3cgWirLoVUDfCWa+eN0oKz3t9iHt5jvVMFU0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fn6DUjNWAPq6tqGLPl71B7Lf5aS3FBfKjinEFMTtVqeiqtkqx+TgjVUMPnb7FJsZRRCh0CBfSWyj6fhkbV37AQGg5wCOaE5DATwfqDezGBNGnjhatOL7X6908iLyE1BkpoHUofAtm2SyOZW5xf9Msl6tjFn6CpkWO5gwG91ERrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWn4fFXf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47638C116B1;
	Mon,  6 May 2024 21:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715030797;
	bh=2xLRePQ3cgWirLoVUDfCWa+eN0oKz3t9iHt5jvVMFU0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sWn4fFXfEU5dnRIdtYXnKufywR8DSMCCDShEaBDX0BVj8M7YOokrKJS78sYHMowNS
	 5tfEFAQrgv4IjuUzlM8LCB6f9bexYV6tvfSmTtAtfnZZC9wyQSZSxM7z0z00JTlgxD
	 6OchAxUCZ4kP7h2zbEuOQYhkHrcnqtPtLf1M9oJpnMIou1C/JRI/WmM6yrpW1+Ukbf
	 5EvNRVDSP51Vh1Qrq4LIOxuttLcMGcyCeIqoIAhfukiOzNCV9BZVPMRWZcQuuM3d1F
	 WJoBmIc+CxKUAxdW9z7Cr8LVP+vAhAueak3e57Mc9ZzwEliWuxyIuXFpuc7dWu8VoY
	 zQnEkC8G5hq5g==
Date: Mon, 6 May 2024 23:26:35 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Luke D. Jones" <luke@ljones.dev>
cc: benjamin.tissoires@redhat.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] HID: Asus
In-Reply-To: <20240416090402.31057-1-luke@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2405062326200.16865@cbobk.fhfr.pm>
References: <20240416090402.31057-1-luke@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Apr 2024, Luke D. Jones wrote:

> This is a small series of patches that does some cleanup and also adds some
> initialisation support for the ROG Ally and the ROG X13 devices. The series is
> a partial prep fro a *much* larger 2k line patch adding full feature support
> for the ROG Ally - this patch isn't included as I don't want to hold up this
> small series during review.
> 
> Luke D. Jones (4):
>   HID: asus: fix more n-key report descriptors if n-key quirked
>   HID: asus: make asus_kbd_init() generic, remove rog_nkey_led_init()
>   HID: asus: add ROG Ally N-Key ID and keycodes
>   HID: asus: add ROG Z13 lightbar
> 
>  drivers/hid/hid-asus.c | 132 ++++++++++++++++-------------------------
>  drivers/hid/hid-ids.h  |   2 +
>  2 files changed, 54 insertions(+), 80 deletions(-)

Now queued in hid.git#for-6.10/asus.

Thanks,

-- 
Jiri Kosina
SUSE Labs


