Return-Path: <linux-input+bounces-14433-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35075B40D64
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 20:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D0601889F68
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 18:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E362DF157;
	Tue,  2 Sep 2025 18:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="fUtS8L6d"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31596288DB
	for <linux-input@vger.kernel.org>; Tue,  2 Sep 2025 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756839301; cv=none; b=fIshuZEuvV8H9XKpBvtpGh65qXfZwDt/jx5KowZMCW2ZuNnT1VCI6GohViRNaV+QhPst79YnqUliDsag65HGNNLTF3OWuKkrX1ys+VibOArsfu9SR9P7GtFkMibZfzrJFe6N/yqH3+7VluobUj7XzlwCvWFA6o8+UrOvuu89j30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756839301; c=relaxed/simple;
	bh=p+DQstFqPyu2K24Mq9IJ0fFcdw7GnjgNTHG/sTz9AI0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AkjzIqgHyNUmWUsSOAHlBosbt59zlcokUi0kQJfhRvpoh2TfOasMyzJHPNcFRr8d/j+krXPm9QIPUdfkeTkfij4Nzse7fKkzEU0Mi3dx9ixdbpGXGw4ysQhh98tbGnRZvXxEWuZBtKp5gV/EcvvKJtCWTEw/iLpQhRtwBLPMeiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=fUtS8L6d; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1756839297; x=1757098497;
	bh=p+DQstFqPyu2K24Mq9IJ0fFcdw7GnjgNTHG/sTz9AI0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fUtS8L6d2Z6fLe+60IWgjVAmtoskueoMb86A/hHzmBnisXRcH9inKycbMlFVZwtG6
	 3GeFPXNfWsNuQBvt4KLHb6haYhUALQWAFwg1QfM/V5atkMLJR+Z9CDSw/SKFL2Op1Q
	 Dl7HPESJkKeM+56NmxtEND7J2yLk/+FNt8/fFa4NV/fTdPXaLrHUGWYuyV/KQHwb+D
	 7Qrrkjq/U4/43kM5/BH6LT0v8lcMHRUM6Qf/wFPk3CMGCQYzaqvupnajDSj2y6ZUP/
	 JgRmBLW0uVZZ419CQHmXyzrlUo81kdJC+lhSk2z2lilknI1mmZxslWrxj6HsbsbI5m
	 zXBo0nZP2oyKQ==
Date: Tue, 02 Sep 2025 18:54:54 +0000
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: benjamin.tissoires@redhat.com, hadess@hadess.net, jikos@kernel.org, lains@riseup.net, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 RESEND] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <7668ba41-19e1-404b-8a53-8db244153247@protonmail.com>
In-Reply-To: <20250831192548.433157-1-stuart.a.hayhurst@gmail.com>
References: <20240627224242.193873-1-mavchatz@protonmail.com> <20250831192548.433157-1-stuart.a.hayhurst@gmail.com>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: 2f430400301f25f52de7fef761ea3270784316ea
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-08-31 22:24, Stuart Hayhurst wrote:
> Is there any chance this can be updated for 6.16 / 6.17?
> I'd like to test this with my G915 TKL, I came up with almost exactly thi=
s solution myself, then found this while troubleshooting it...
>=20
> Thanks,
> Stuart

Hi,

I have rebased it against the latest HID tree [0] and sent a v4 [1].

Please let us know if it works by replying to the v4 with a Tested-by.

Thanks!

[0] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
[1] https://lore.kernel.org/linux-input/20250902184128.4100275-1-mavchatz@p=
rotonmail.com/T/


