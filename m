Return-Path: <linux-input+bounces-2484-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E942D886AEA
	for <lists+linux-input@lfdr.de>; Fri, 22 Mar 2024 12:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2435F1C2197B
	for <lists+linux-input@lfdr.de>; Fri, 22 Mar 2024 11:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D7D3F8C0;
	Fri, 22 Mar 2024 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhDbIA1v"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF873EA98
	for <linux-input@vger.kernel.org>; Fri, 22 Mar 2024 11:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711105327; cv=none; b=hZSWlIdfngJ9whsaHNmBo6DKobFlXh/JcOAqV0240/x4+1heu2WUY0iHREvdFU8m8CSf2zJsb6qgbSu0BUDhy7xayybr/3nheujxRKXFUk55B4Dq0qCekxy9cLGpSgnl8qd6nWP+Q8ByUZJ0afASUq94xF/h7GlGM2OI9pJ3ry4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711105327; c=relaxed/simple;
	bh=4DqjK22ZCt0bSkx6u8oW+PTXk+/X2FU8SWukR1m1R50=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UHYbMCOMaAx64RAFvMTulC15b2teuhda0XuX2G9fvZp64IRnO5GEte5GzVsO7WNE+tOUx1vU37W5+9ICZi8QobR1vMLssIuX3kWULq/Y4sv/URVSWR48c27gjMNTwtUliKq2XfasXiObAJfP5Qinw6SZwupVpfr/ah2oBjWDPCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhDbIA1v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75956C433F1;
	Fri, 22 Mar 2024 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711105326;
	bh=4DqjK22ZCt0bSkx6u8oW+PTXk+/X2FU8SWukR1m1R50=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PhDbIA1v0hZAsAdhPKGjhwujeyVf8hi9VkBCeWoGEizBE7OsY3kZiHZUbMOCFn0Sr
	 iCAvlopwlXLigywKOl5iAxAAno27zbV/KWg7HBkfJTSULzHOlLawbRnKpWIyqbuLuJ
	 jLuNJ/hbhDku6R2CZ6IfutXUox05SPkF95VB8P8iF+MTlwbtDeaa3t/HF2Bz0l9PzM
	 RgxWg+YKsNq9gQV1FXM/FbSb4VlCiKpOO3ePB37DmpeCOmTz2PP78dx9opI4V8kjiU
	 xKQtZ0CxVzb88sq95lb3/dK9ZV17usFivJMFI6yOWvbrJVrRCDuyDnjbp0rVzjTfB3
	 ojgyIMU5hs/Ag==
Date: Fri, 22 Mar 2024 12:02:04 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Nuno Pereira <nf.pereira@outlook.pt>
cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    Daniel Ogorchock <djogorchock@gmail.com>, 
    Ryan McClelland <rymcclel@gmail.com>, 
    "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: nintendo: Fix N64 controller being identified as
 mouse
In-Reply-To: <DU0P189MB2044EAF345CB76578D8C1A5CFD5A2@DU0P189MB2044.EURP189.PROD.OUTLOOK.COM>
Message-ID: <nycvar.YFH.7.76.2403221200350.20263@cbobk.fhfr.pm>
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

Thanks for the fix. I believe it's missing

	Fixes: 94f18bb1994591 ("HID: nintendo: add support for nso controllers")

tag.

Ryan, what was the reason for your initial assignment to FWD/BCK/LFT/RGHT 
instad of SELECT/X/Y/C ?

Thanks,

-- 
Jiri Kosina
SUSE Labs


