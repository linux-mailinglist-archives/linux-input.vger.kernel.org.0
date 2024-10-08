Return-Path: <linux-input+bounces-7150-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F779945D5
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 12:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43E41F244C9
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 10:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCDA1C3F27;
	Tue,  8 Oct 2024 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="XqayhOl3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD82CA8
	for <linux-input@vger.kernel.org>; Tue,  8 Oct 2024 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728384910; cv=none; b=pptmKpC/22ZEncVubyerRdAzL1ThmID67XArS8pmNgxaI4BnlU9ewRNLuKoVWZumfC2trQQXvflSSaNZtS5lGtkNTYcB48CRrY7cgvqgLAvU6P8x9bsfCZYWu8toHBJe/Sf6cNO6071qyzYEXuOddGdPLcpCjLG+9lhq9xH+8CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728384910; c=relaxed/simple;
	bh=OjaDCOM7DELO4shW4480gg4tKFU0mHn0HcGUNLtiAK0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPESR1ckGC2Xpbpo4aax43vIXYCWfAfm93/Th9EGMtRsxMeWXl73scAOSx/67PGCKqIrNdN5RNje7ox3ThO2x09teUw2/N0CmkJRi+hZ7hI26LzcW91k1DBf8zuMd16KheyI1NvhW55tNuuP7C5JfLpvgNnEA2+7TG18SFfETZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=XqayhOl3; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1728384906; x=1728644106;
	bh=OjaDCOM7DELO4shW4480gg4tKFU0mHn0HcGUNLtiAK0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XqayhOl3bqIwtoLF/j/COqkfIoVTFRFEZVKJYhfgLZlFa5acEwkoZ1larJDMATKSm
	 tNYzjHlH+dnUMzvlbMN8F/6OZZZtgnlH9TGTRkoL9f5Xr70GopZDkmOUn5aEACX58u
	 BCo5LVSl/rQ09d8+wqMhhKQCyRGkvLnofs4lVbyVDqIerNVe+3LhEFVfe15HvrIdA7
	 AuXsFOiLahoR6ifNfHnhR+8F9rdld8AnKjFFddYR4T9yDREEaZV2xkRx4CR+6wZzlF
	 x6JJe7tyQOtu1x1hBQ/I8bPXjLMo983sxtfj2gO0BSX8kYY8meR9iMVjEGkJKblxNy
	 UEav2HLc6Ah1g==
Date: Tue, 08 Oct 2024 10:55:02 +0000
To: Jiri Kosina <jikos@kernel.org>, benjamin.tissoires@redhat.com
From: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: linux-input@vger.kernel.org, hadess@hadess.net, lains@riseup.net
Subject: Re: [PATCH v3 RESEND] HID: logitech-dj: Add support for a new lightspeed receiver iteration
Message-ID: <12b0696a-81d9-446b-b0bd-5f1814368064@protonmail.com>
In-Reply-To: <nycvar.YFH.7.76.2410081200050.20286@cbobk.fhfr.pm>
References: <20240627224242.193873-1-mavchatz@protonmail.com> <nycvar.YFH.7.76.2410081200050.20286@cbobk.fhfr.pm>
Feedback-ID: 20039310:user:proton
X-Pm-Message-ID: b3c65488067a2c10225fc1318ea579445fbc5a14
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2024-10-08 13:00, Jiri Kosina wrote:> Given the regressions this=20
caused in the previous attempt ... Benjamin,
> would it be possible to get some sort of extensive targetted testing in
> your CI, please?
>=20
> Thanks,
>=20
> --
> Jiri Kosina
> SUSE Labs
>=20

Thanks for looking into this!
If there's anything I can assist with, let me know.


