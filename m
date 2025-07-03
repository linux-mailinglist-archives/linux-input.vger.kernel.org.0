Return-Path: <linux-input+bounces-13350-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC8CAF6BAB
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 09:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E7F14E184F
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 07:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DE0291C3C;
	Thu,  3 Jul 2025 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYrXgauR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE737224AF3;
	Thu,  3 Jul 2025 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528073; cv=none; b=RueoObDruA/HiVdJXW4TugOJXZ99x24Rj98qUIglaEzb5VAMheyLks5XYJAHt1DSZ5tJgwLRdys7KGsLwBDFfr8vJPgqnVp2PSQj3Gt2ZnRrJCiY4tH9B71dMdSOHrZZIFx0NHR71LFPIzblbtc7Qr648g9v086w/MtlB8Gy0Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528073; c=relaxed/simple;
	bh=vHHcHbXK2/4kGN4XijZxmZHUbb4u8b32ycKO9pSiV8E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HWvW1AfJZ/YLEd+L8AigDC4YtzR+S1pvbdr7OUk7PEBgunLZAGhi5SKZDYrc270e/LhiJJLpNszFAnKF+mbby8KaOT1ZE2SPeR5DTcPNKuW5bVejDerRWB0J/jN/JsInInhqF1S32qXMJowajvOsRTLV6Giv9blSBZKoyUO2/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYrXgauR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E970BC4CEE3;
	Thu,  3 Jul 2025 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751528073;
	bh=vHHcHbXK2/4kGN4XijZxmZHUbb4u8b32ycKO9pSiV8E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aYrXgauRjr49M17MFsrYssAMeAaKQZBooZRqqfEntku2xPcyTv1yCyJQorRs+Gaed
	 Hv1a0eC146UWun4gCUHGWfa2PU5qDtgHuATFRmUXN14VG42NQOhTdFLlWdnu5lZcj4
	 ZDk9h5Gfv7Y8zOyR+rwqBBEIwFEKzOM+JJjsYeu2onNbucmv0d21d40tRh/7ixDaYk
	 iuLjTvaZoRqllFldqY+2OIvmsg4KqU2wuE+c1geYWBmAB/PrPgCiDmWnX9NpptDhTi
	 khrkJPF5Vcxj+5detVyouhsfuKaD9/qvubO1g0hBdpr19ZBibZ10UXsi1gPALP3yus
	 hlhXhUQeuWHog==
Date: Thu, 3 Jul 2025 09:34:30 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Joshua Goins <josh@redstrate.com>
cc: linux-input@vger.kernel.org, jose.exposito89@gmail.com, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/1] HID: uclogic: Add support for XP-PEN Artist 22R
 Pro
In-Reply-To: <20250623024309.17356-2-josh@redstrate.com>
Message-ID: <r0pn650n-3r37-52nn-3pr0-nop3ps296pp5@xreary.bet>
References: <20250623024309.17356-1-josh@redstrate.com> <20250623024309.17356-2-josh@redstrate.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Jun 2025, Joshua Goins wrote:

> Adds support for the XP-PEN Artist 22R Pro, including stylus, tablet frame
> and pen pressure.
> 
> The tablet has 20 buttons, but need to be remapped in order since the
> device reports invalid keycodes. Existing tablet functionality should
> not be inhibited, as BTN0-8 is still used.
> 
> New initialization functions are added since the device differs slightly
> from other UGEE v2 devices.
> 
> Signed-off-by: Joshua Goins <josh@redstrate.com>

Queued in hid.git#for-6.17/uclogic, thanks.

-- 
Jiri Kosina
SUSE Labs


