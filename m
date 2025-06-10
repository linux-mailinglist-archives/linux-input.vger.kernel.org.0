Return-Path: <linux-input+bounces-12790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD118AD4344
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 698BC17C919
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFF9231825;
	Tue, 10 Jun 2025 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RY9wsftq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35951EE7D5;
	Tue, 10 Jun 2025 19:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749585120; cv=none; b=m+u8tCStnvNhs8DeM1DXmrhBU48d7PNnk3J2+78/MXD2UoiEENn1Axg29cn1RGlqoMMGNV1m3jthiZt3Q7uOxQHXdrlI8SLhHNbLWoTkQo9f/l2BmJfgJlQUuPfvL6iI9U9A0qVBdyc8RnIYUtG3DohcfSvs999iiRpWSTms/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749585120; c=relaxed/simple;
	bh=BKbIS+rwj8I4WhYx9GtGwFnaZgygi8UgwF8UhCFtPBQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rbOu5SsTxxl7Gfyc67ws3gGnLufOa+MJ7XVeZMaXSIKAX1+9Mwr13dujDZEbPYug9ZXyaBlqwjn6ww1u9R4jgxwHqZ2stK+JfK3FShP76M9uH91WO7uG440vTP5rIcfd2TGBW1W/wfYlNIknu3iyUNhPs2mtRdsr4tL5fddCEFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RY9wsftq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07087C4CEF6;
	Tue, 10 Jun 2025 19:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749585120;
	bh=BKbIS+rwj8I4WhYx9GtGwFnaZgygi8UgwF8UhCFtPBQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RY9wsftqyhtp+mDLAG2kSwho1gXQFSFvAedtwbmajJo7BfH0SyBS89m/saO9+M9Ir
	 F2yTuDMO4e3ncAMLeVlNjDajMBzQ5zLYsn+sHlKR3yrgCW2T5HNYb5M39PrSBZz9/T
	 OuJrLk6Q2PTBFWGVO2xVYE25wdwz/QOiIRGkRemkaVJ5cu4te2/jQDMAUIu7ZiV0s+
	 3gKmAtfPF8l8mqiS2p/XRzJSY8DdQnjeofVH8yHTgdxd8bDwhMeIWmvRaN0rGGUGue
	 BBPLOrOReNr1byb3bcmMpRNexLhQtHNtL+jMQplnQX41EognLnbIzdlGDCRrx48+gU
	 Vdp5Y57dHXDYQ==
Date: Tue, 10 Jun 2025 21:51:57 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Iusico Maxim <iusico.maxim@libero.it>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    bentiss@kernel.org, stable@vger.kernel.org, Jamie Lentin <jm@lentin.co.uk>
Subject: Re: [PATCH] HID: lenovo: Restrict F7/9/11 mode to compact keyboards
 only
In-Reply-To: <20250605175550.641392-1-iusico.maxim@libero.it>
Message-ID: <s75n1nrp-n149-p177-1211-730r21s01r88@xreary.bet>
References: <20250605175550.641392-1-iusico.maxim@libero.it>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Iusico Maxim wrote:

> Commit 2f2bd7cbd1d1 ("hid: lenovo: Resend all settings on reset_resume
> for compact keyboards") introduced a regression for ThinkPad TrackPoint
> Keyboard II by removing the conditional check for enabling F7/9/11 mode
> needed for compact keyboards only. As a result, the non-compact
> keyboards can no longer toggle Fn-lock via Fn+Esc, although it can be
> controlled via sysfs knob that directly sends raw commands.
> 
> This patch restores the previous conditional check without any
> additions.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2f2bd7cbd1d1 ("hid: lenovo: Resend all settings on reset_resume for compact keyboards")
> Signed-off-by: Iusico Maxim <iusico.maxim@libero.it>

CCing Jamie Lentin, the author of the original commit, for awareness.

I've now applied your patch to hid.git#for-6.16/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


