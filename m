Return-Path: <linux-input+bounces-12799-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63794AD45F9
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 00:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FB9E17840C
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 22:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7881128AB07;
	Tue, 10 Jun 2025 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qtzqqcuw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E15E197A88;
	Tue, 10 Jun 2025 22:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749594528; cv=none; b=STxGPOdYKtdKX1r0fRluBQrMFQ4T5SZz+Pa36vVewyQwXYQMFfoCw5BBurkOLz34gcGWZh0gByJmMq8ryM77c4TYxzUCi0qiBIjXLJg7reXaVJ3dTyRHQDvt3Nialrr+TAf2vj4h8DS4wNTEmV+w/JDg8T8HhPnLFqamC52nFFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749594528; c=relaxed/simple;
	bh=glSB2G/oGANGnauIPzHZT4WfObIz737+humylOVK+10=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ojFpYDtpTDFbPIML7zVv6MNwgc/t3DgsBGxwjU0Ud4HQAU2aI3jrwyhHvBwXBtplOzYLZ5c8c8AsNqFHoJ1pQczhXdezyVOrAFamXoVxAsu2zYVT3F9Kprp7WeCRWvESy9W4N9MNWQAf5cv9pjzrZvuwaHGlOXq8ZgB83pZ8npU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qtzqqcuw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B306C4CEED;
	Tue, 10 Jun 2025 22:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749594527;
	bh=glSB2G/oGANGnauIPzHZT4WfObIz737+humylOVK+10=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QtzqqcuwGJjqSN7V+WmZM18z7dxfbijv9iSnPv1S+t9UmCaF+FNGQbQfSlKjehJtV
	 /1OEG93XiigM2xivO2UOxDM2pGFeKHyrHKtfuePn5XgGjsM2/tHSOoBqyPrFBUY7Ie
	 pOXLoquTnniTFXMc96i35g3H6YOlQdFgW2c024t5c8U4YUMV6kGCUT3v/R1VGLiY1K
	 tHtNBvt5j+mmjmmP5d7IhVsXl41f+J7hJ3rVtCb2+4Wcuke+ab9gw28m5UrukdZDXl
	 wBca/M7r6UDmqBql32AJ2A4Hkv222FiRciTUHwuZVNhP9ybUI7GXfirLV6xn6Xd3wj
	 PzOvyY78N8MZA==
Date: Wed, 11 Jun 2025 00:28:44 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Ping Cheng <pinglinux@gmail.com>
cc: stable@kernel.org, Thomas Zeitlhofer <thomas.zeitlhofer+lkml@ze-it.at>, 
    Jason Gerecke <jason.gerecke@wacom.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Josh Dickens <joshua.dickens@wacom.com>, 
    Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>, 
    Aaron Skomra <aaron.skomra@wacom.com>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: wacom: fix crash in wacom_aes_battery_handler()
In-Reply-To: <CAF8JNhKjXH+zD6-b=ym+Y8SPwPEUdUu+r8k25FBefYg+aEi6JQ@mail.gmail.com>
Message-ID: <n1375n01-ons7-4766-8q99-p5on1691q2rr@xreary.bet>
References: <aCrx1iRQ-9tXiyJp@x1.ze-it.at> <p4917005-n9n1-0577-q49n-o9639pos5o44@xreary.bet> <CAF8JNhKjXH+zD6-b=ym+Y8SPwPEUdUu+r8k25FBefYg+aEi6JQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Jun 2025, Ping Cheng wrote:

> > > Commit fd2a9b29dc9c ("HID: wacom: Remove AES power_supply after extended
> > > inactivity") introduced wacom_aes_battery_handler() which is scheduled
> > > as a delayed work (aes_battery_work).
> > >
> > > In wacom_remove(), aes_battery_work is not canceled. Consequently, if
> > > the device is removed while aes_battery_work is still pending, then hard
> > > crashes or "Oops: general protection fault..." are experienced when
> > > wacom_aes_battery_handler() is finally called. E.g., this happens with
> > > built-in USB devices after resume from hibernate when aes_battery_work
> > > was still pending at the time of hibernation.
> > >
> > > So, take care to cancel aes_battery_work in wacom_remove().
> > >
> > > Fixes: fd2a9b29dc9c ("HID: wacom: Remove AES power_supply after extended inactivity")
> > > Signed-off-by: Thomas Zeitlhofer <thomas.zeitlhofer+lkml@ze-it.at>
> 
> Acked-by: Ping Cheng <ping.cheng@wacom.com>
> 
> Thank you, Thomas, for the patch. Your support is greatly appreciated!

Excellent, thanks. Now queued in hid.git#for-6.16/upstream-fixes.

Thanks,

-- 
Jiri Kosina
SUSE Labs


