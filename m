Return-Path: <linux-input+bounces-12770-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60825AD429F
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A644189D122
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524CE26158B;
	Tue, 10 Jun 2025 19:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kM/BnEk1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8D6261362;
	Tue, 10 Jun 2025 19:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749582643; cv=none; b=kV88zgkFqIJwPLjoIIlnzi2JQLRj5mIlKAv0TVh8FoBdNCGmOM5gIaicnGtQRiLt+FTQ5TPDBEPI8FEMclNVCAG2V3QLHNdHqKuwuzad2PDVX1C7+5umVZmbmdzl7MNOeVTdXmA4BuwP9qR5vR3piZXjFlQRoGQzdQ/mbg8KcQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749582643; c=relaxed/simple;
	bh=bsmdydn3T39uPdYvgJHI9z2EWo8v3kLRBFYXp1raCQg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eZBge8YelsmksGQNO3F1gT5qGJmAtzD+3MAtwYhCYWVyKv7/rKs1jr4xUZmCrv+BEY/xms9AHgNyWiH+0KfjNT1DpWabYpcW7qUyQ9AknKnWD0TlasGjc8rzlUkRWcTpg8r/Tq0TWaI0H6QrAG8Z1DoSEkU+P47a36PNDQHfTSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kM/BnEk1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C949C4CEED;
	Tue, 10 Jun 2025 19:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749582642;
	bh=bsmdydn3T39uPdYvgJHI9z2EWo8v3kLRBFYXp1raCQg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kM/BnEk105a2ZZu6Q0D727RfRXYDwQ4DGhYsjCGuHOWn5g85Rufvug3H1v8r2488/
	 9loajBACLCci3tVcOFfYNJ7qxxbO+dUeUm6BcQeI/TPs2V25U1P5fMZv7KqY5Fkel4
	 DA0o7M5gmasM66K5ekWdrkjgPst//YIQv1rDhiTvSc8mpW/uwWOpeA4Z0+QzwORbJ0
	 zwpU2RV3NEbB4tUj/775cV2gqNghi53mQYpnbADgweCynT94hTomIozgwSLKRszKMm
	 Kegm8FJ08LO5aFozMsoJ8mCAa+2QNUGoBMiJ3h59fSDQ1WzYt4O7gX647FLK34+ULO
	 43CuBHEAouuYw==
Date: Tue, 10 Jun 2025 21:10:39 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
cc: Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/3] HID: wacom: fix resource cleanup issues
In-Reply-To: <20250606184959.35915-1-qasdev00@gmail.com>
Message-ID: <oq54ppn1-sn54-o797-3p3s-0nrps810s19s@xreary.bet>
References: <20250606184959.35915-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Jun 2025, Qasim Ijaz wrote:

> Fix a few resource cleanup issues.
> 
> Qasim Ijaz (3):
>   fix memory leak on kobject creation failure
>   fix memory leak on sysfs attribute creation failure
>   fix kobject reference count leak
> 
>  drivers/hid/wacom_sys.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


