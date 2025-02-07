Return-Path: <linux-input+bounces-9838-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDE3A2C342
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F44016AD04
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259A47FD;
	Fri,  7 Feb 2025 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHnYRH1k"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E721E1023
	for <linux-input@vger.kernel.org>; Fri,  7 Feb 2025 13:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933635; cv=none; b=aq/usn9wBaZ8n0QaR4jkc/pGOGStMVEmt7JQ1ZWthooTYoh9KJSNeOgRqphVLuEkeElUX1Zyf67KZnsk3KVShzXatZC4CAR5fxvjHnRc098LtnVV+PhvbZqm7AnMv7VMXFY0byXirDW0Zhs/QT0cKIiEDOpAov+59/d6WxGRSsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933635; c=relaxed/simple;
	bh=PIzIt7kfe1FqK6WEeyibm+R8OtEl4VYdMyE8lL7wBaE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JZyLW+/bl+BivrrOVrv/C8Z+MRYmx3PKslvugTBYVLWczZoWIdJAQLZbjopgrxN1bU9ET5JWnjm+HTkYw+H69cmvVePsSvk3P9KrlJjKA189gSJmL/Xga0fz8BsUK5nSDbGL0JOopu7U2KD36AVQlVQinf4S01S5lI+1VGiPVg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHnYRH1k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73391C4CED1;
	Fri,  7 Feb 2025 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738933634;
	bh=PIzIt7kfe1FqK6WEeyibm+R8OtEl4VYdMyE8lL7wBaE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RHnYRH1kPDF4KneC3LFqHEXFTeOq/MXni7Hdi2N8eePuPbLd72Q28e14XU4utidrO
	 35m3AbV1ir6uryp/jxLWpJ0rPiXp4eJ1TgnrVzVcL+KLZY3yPNNJT5vQsM9pCkySy1
	 09rtMZG7KbLRfvKK+QHBE1eh8y5x2mTqDdEd40ch81yhGAPL1sf1beXRcO2Kmab+Cw
	 ihBxk8/YmroU0u1XoNJjCvHMty1EoEeG4s8sqb2Ew3IzoruCAROzyqCF3ctM9Zy31F
	 IkucQA4rCUw5cSkJkL7Cr+0xyn5Y5oE9EcXq5Af8uk89rp4X3yEUbKkn0w5KN/u1Mj
	 mDuE7OVyiVlwA==
Date: Fri, 7 Feb 2025 14:07:12 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Alex Henrie <alexhenrie24@gmail.com>
cc: linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH resend] HID: apple: fix up the F6 key on the Omoton KB066
 keyboard
In-Reply-To: <20250117061254.196702-1-alexhenrie24@gmail.com>
Message-ID: <372n46q0-s03r-52r7-48os-34o8n244nnr2@xreary.bet>
References: <20241001055146.543800-1-alexhenrie24@gmail.com> <20250117061254.196702-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 16 Jan 2025, Alex Henrie wrote:

> The Omoton KB066 is an Apple A1255 keyboard clone (HID product code
> 05ac:022c). On both keyboards, the F6 key becomes Num Lock when the Fn
> key is held. But unlike its Apple exemplar, when the Omoton's F6 key is
> pressed without Fn, it sends the usage code 0xC0301 from the reserved
> section of the consumer page instead of the standard F6 usage code
> 0x7003F from the keyboard page. The nonstandard code is translated to
> KEY_UNKNOWN and becomes useless on Linux. The Omoton KB066 is a pretty
> popular keyboard, judging from its 29,058 reviews on Amazon at time of
> writing, so let's account for its quirk to make it more usable.
> 
> By the way, it would be nice if we could automatically set fnmode to 0
> for Omoton keyboards because they handle the Fn key internally and the
> kernel's Fn key handling creates undesirable side effects such as making
> F1 and F2 always Brightness Up and Brightness Down in fnmode=1 (the
> default) or always F1 and F2 in fnmode=2. Unfortunately I don't think
> there's a way to identify Bluetooth keyboards more specifically than the
> HID product code which is obviously inaccurate. Users of Omoton
> keyboards will just have to set fnmode to 0 manually to get full Fn key
> functionality.
> 
> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>

Now applied to hid.git#for-6.14/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


