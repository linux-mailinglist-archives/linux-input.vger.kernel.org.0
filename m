Return-Path: <linux-input+bounces-2784-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D021896DF5
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 13:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D10F91F23C55
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 11:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494EE1353E2;
	Wed,  3 Apr 2024 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l22ceYeP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CB2259C
	for <linux-input@vger.kernel.org>; Wed,  3 Apr 2024 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712143187; cv=none; b=mxXfg70eCFMzM4xXRY0CaXPGK8oJ1/bMz/wy9OWJ4kgC+HBvWDlxl0yvLaKwZYFUc9+hZoeY/0hxuKE8f7V9iU5O+Aa1NhSDlrMWt3Rlu9zVCGgQf3w/SYuVMlNWTti6oOblx5OhX7Q/eR5CD0nAr0vqJgilVqUBhW9b+cj3R34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712143187; c=relaxed/simple;
	bh=3zAlxF6tTHbOBkKIjxeRFfuUf4kXJp32oAn753JHDYU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rmdgwAczrqtpsQBw1nb9tj+UUPq5HQyaNctORvOSFIY6UGaCOCkQJHjS2Fow9gm3FkwNgcbyeXOnn5O8X1XBZPpb8s0kXH8ef3qR1v7RQzAMcv8c/8IextmBtgE5GGlrXJAiax24R/Ghu9sT6nFTSal2ypGYxf7xvaMGmepQKw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l22ceYeP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54ECAC433C7;
	Wed,  3 Apr 2024 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712143186;
	bh=3zAlxF6tTHbOBkKIjxeRFfuUf4kXJp32oAn753JHDYU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l22ceYePRFcvbLW2hdO7hQsai+h3jqJC6RTq/rqWNeWfrt6a4zxdH6+KyqDBZokxr
	 GkUV5ZbTQbano58gT69BmS7VgFZ4Xx8REKPBlCBAbjwrXnZ6GzdpJUv56P3bKiRhmf
	 LkevbKA34kVRYdjUFp94vInQZt/xoXvRfnlU8pSUAg/qgbfFJOYLQIqtLdrVKQHC2Q
	 N0Pj7Z3ZHPphl/nYewQTFTOYvhKGWafU2J0bkT3oXPD/xnptsMyWPFvMVch5i0QiLK
	 e+ZtUjH5HRAngkenPX6JazqQK9SABXEj82RROf5GX4sDEHRN/kPb/UTA825BNg4yyk
	 qtnaOhzEqyJzg==
Date: Wed, 3 Apr 2024 13:19:44 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Nuno Pereira <nf.pereira@outlook.pt>
cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    Daniel Ogorchock <djogorchock@gmail.com>, 
    Ryan McClelland <rymcclel@gmail.com>, 
    "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: nintendo: Fix N64 controller being identified as
 mouse
In-Reply-To: <DU0P189MB2044EAF345CB76578D8C1A5CFD5A2@DU0P189MB2044.EURP189.PROD.OUTLOOK.COM>
Message-ID: <nycvar.YFH.7.76.2404031319370.20263@cbobk.fhfr.pm>
References: <DU0P189MB2044EAF345CB76578D8C1A5CFD5A2@DU0P189MB2044.EURP189.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Feb 2024, Nuno Pereira wrote:

> This patch is regarding the recent addition of support for the NSO
> controllers to hid-nintendo. All controllers are working correctly with the
> exception of the N64 controller, which is being identified as a mouse by
> udev. This results in the joystick controlling the mouse cursor and the
> controller not being detected by games.
> 
> The reason for this is because the N64's C buttons have been attributed to
> BTN_FORWARD, BTN_BACK, BTN_LEFT, BTN_RIGHT, which are buttons typically
> attributed to mice.
> 
> This patch changes those buttons to controller buttons, making the
> controller be correctly identified as such.
> 
> Signed-off-by: Nuno Pereira <nf.pereira@outlook.pt>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


