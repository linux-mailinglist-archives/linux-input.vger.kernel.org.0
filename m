Return-Path: <linux-input+bounces-14048-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD95AB2866E
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 21:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBA7AB64922
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 19:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7A8276049;
	Fri, 15 Aug 2025 19:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="wKhuDwBP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF46AD21;
	Fri, 15 Aug 2025 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755286199; cv=none; b=GHfoxnpWhI6GOKwedcdaTaliWP1DuVT5xvI54TBqFf07s+qVb/3IB7VB+PCwiQFGo71b3xdqtouedyte8TZM6HtT6bPRYsmBy+UhBkeDJuMaN5gbNmDC2h7J6omOgEYv+ZMO1qyxiebyGHU8dGZ3GZwa+nc8Xb2uBbD501+7rXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755286199; c=relaxed/simple;
	bh=q6jRftGOO3wz+b3UVA1YxwBxYfxkLHxm4Vbs1vuORhc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SPnMh2NL0reuavf+5Ev6m0i81OIII86/tSNUy+Nx9HFiOUrdvJqSyhpF70znqcrWHsQEvKbWc4JArEwWi9ibvqa7e8UszfAT1zVW8Xiaj9QgKWrHLJzN3NMHHhzfMOo7BONTJ9enRGAWNmfHVvTp0CUSho0PkUuimsoizOpoKuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=wKhuDwBP; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=BrSUeH4P0PSK2uvCkbvFb+IfsX3lgB/R+F9meJ5wTko=; b=wKhuDwBPDUtgwGffwH5yrwPHmj
	ld5ITYTxKzGFrRQGD8KMO1iouvONCa7cIjWzSQaGibfA+zeBXIgHVukrqXyRamjOKiv2pHHrlwNpX
	bC4stIj40k7W3nAn2dPBWc9z6JvK37FKSc2v3oaaNHpTCJRzCM75PcPE+T6KN2EVkEoepoMjRh8Yc
	QWJol4PX20aVWzTCrZmXSqMyIW+/FYOxllN2sWT1lfDiVqFl+IEnAcwOulAkKSgfoJJtPIjqAOApG
	QF93F2RC66HXOrO6JVULemn0RqxjEMEflQtNMQTiRf1cZAH4TohWBVl+Ql85qn1d+p5Bg4470DyK5
	GBw6+9ww==;
Date: Fri, 15 Aug 2025 21:29:45 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: twl4030_keypad - drop support for platform data
Message-ID: <20250815212945.49b7ccba@akair>
In-Reply-To: <tica7ol7xwv5tqb7hlkzu6wkiv4quxwrpqv6croe4wfnwvj6wv@4ob6ktqqi3cr>
References: <tica7ol7xwv5tqb7hlkzu6wkiv4quxwrpqv6croe4wfnwvj6wv@4ob6ktqqi3cr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 15 Aug 2025 10:36:09 -0700
schrieb Dmitry Torokhov <dmitry.torokhov@gmail.com>:

> Support for platform data from dropped from twl in 4a346a03a63c ("mfd:
> twl: Remove platform data support") and board files were dropped even
> earlier. There are no in-kernel users of twl4030_keypad_data in the
> kernel, and the driver supports configuration via generic device
> properties.
> 
> Drop support of static platform data from the keypad driver.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

