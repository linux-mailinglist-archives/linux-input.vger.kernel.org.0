Return-Path: <linux-input+bounces-16640-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09749CCFFCD
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 14:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8FB1303B420
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 13:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A2432AABD;
	Fri, 19 Dec 2025 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYGeRHbT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DDD32AAAC;
	Fri, 19 Dec 2025 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149568; cv=none; b=uee2a+z7iAABYzzqAopeH//AUmSKRO3RRxjKAq5JBOjzI5t4MBbUZuhpn0M/DzY0pXqFj7QtGD81+u6oi67BZ1sq2EHG/L8YtnEhhw/0XsOy0t6erUpx0TRzavUeP5jqTYkCxyLWg3a4uTADUnCXUvgqNkwqbX1DqPDG0aWPFxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149568; c=relaxed/simple;
	bh=gfmtNOnRKDSbZQs4bz41ugGrXAvB/OhRWt1u7+vuxqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JP/yxg4Uf6BZOaG+ErmvFWKWBl85S01S/JGZUSOU6ds1jZnmMHYfky+Om/gLtOEbPnry0nj9r+7mvL7NGTfxSeBxkaz0oI6AUh0oDpYKI2aptyS+WxhaalrY6mEKNR1pH2Ke9bFHFOBhNpyToVRFAmnYvFQWsZeMsZX2/g3XDVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYGeRHbT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA38C116C6;
	Fri, 19 Dec 2025 13:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766149566;
	bh=gfmtNOnRKDSbZQs4bz41ugGrXAvB/OhRWt1u7+vuxqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GYGeRHbTvCwbQedZnlHEcibBTNZDKsr1yonJdYYf11ZkMdj5tkCTj28rnk+o1j16e
	 NeRbH4cXNbVlur1iR72anColqq9mF8llyMn9B4aZ2DIhUzZu/arSdb7eMJ5RYTkU3F
	 2PiEs00F+zsNmgGMczd1D4+cTmM24n5lHifb/4JH/AhtfOHJaijYwY9wLLpg4opDK8
	 YJlGlbRFHYCpoG3ySbUSyhOJrS58WeBAFD2QoIZx6qRLqtjYdBH6F4PjmiN655r6xW
	 eq3/tZbczPFSyXwj839OfBbLIVmL5tj1izsZTEu/8xDe4oyGCi8SaA0nlzcbrc6d7V
	 UP5jOxZcIr5OA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>, 
 DaytonCL <artem749507@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251214133648.307106-2-artem749507@gmail.com>
References: <20251214133648.307106-2-artem749507@gmail.com>
Subject: Re: [PATCH] HID: multitouch: add MT_QUIRK_STICKY_FINGERS to
 MT_CLS_VTL
Message-Id: <176614956549.1654761.10987553209393776343.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:06:05 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Sun, 14 Dec 2025 14:34:36 +0100, DaytonCL wrote:
> Some VTL-class touchpads (e.g. TOPS0102:00 35CC:0104) intermittently
> fail to release a finger contact. A previous slot remains logically
> active, accompanied by stale BTN_TOOL_DOUBLETAP state, causing
> gestures to stay latched and resulting in stuck two-finger
> scrolling and false right-clicks.
> 
> Apply MT_QUIRK_STICKY_FINGERS to handle the unreleased contact correctly.
> 
> [...]

Applied to hid/hid.git (for-6.19/upstream-fixes), thanks!

[1/1] HID: multitouch: add MT_QUIRK_STICKY_FINGERS to MT_CLS_VTL
      https://git.kernel.org/hid/hid/c/ff3f234ff1dc

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


