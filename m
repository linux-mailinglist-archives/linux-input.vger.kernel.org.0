Return-Path: <linux-input+bounces-7154-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6923994C5D
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 14:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67CE31F24E2B
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 12:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437D21DED74;
	Tue,  8 Oct 2024 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1Af5RFR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180011DE89F;
	Tue,  8 Oct 2024 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392010; cv=none; b=LQkQkQT4SQZi5zSikePCiaPoheunQc9KOoICt2YU0aBCH142dQDwO4XTR0b1IT8yGwL0DfH42UcT+YJyjzn4cHYK5lLIfgAZDViAzd0EmWRy4RhVZCAwQj7OXCMD5bTkbORGL8h1BOnk0BtlHlBjgYD/9sLW5AUchY4kGoGUvqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392010; c=relaxed/simple;
	bh=CcJUGfytgM2+NKs+g+CHk3FGoeLny+3VmGmrZqo6EqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/faA71xfrzWAfL5ecPpqOT6ouslkVXEDh1mfokG7qBY6xWN8euxit8x2jEHZRFn+ye2l00135qcxjMP/suxMeMr/psjYTMmvokQdtR5KAmtIGbhupSbvV0PjIzUK2XTQR0EzTCC8wz1iSa0hsNUzKgkY5EhpLgmfuswiHbSjGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1Af5RFR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23ADBC4CEC7;
	Tue,  8 Oct 2024 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728392009;
	bh=CcJUGfytgM2+NKs+g+CHk3FGoeLny+3VmGmrZqo6EqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1Af5RFRl4BRMu3s+ybroMr0CrYn27qm6mstZTOKkhR3hhjTgmxzWR6mDlGU40q3d
	 JKcilaEKTbMAKX3KS1gJysZ7zOldhJ+wZddc2SSI/CjIuy7qc4VeTGu7DT/+ylEmHt
	 F56W6RzFAuj1D8K1FNoquYiUENRQAVzNl+AJtV/UEZhCkohJ4vREu1wo0jgQIdlMwJ
	 8NMHjidvtv843wPDOnZhkX5P4E+KhdnfQF5+imjz7UtTXa3nabO4AC2B0LFcYNfSu7
	 FsNoo94QVkxaVa7bFQkYSOtvh5VYiH/71Hg0VETeQZ/p2z1s4L82twT1imJkEplPHZ
	 v6oPgPRfQU3kQ==
Date: Tue, 8 Oct 2024 14:53:25 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Christian Heusel <christian@heusel.eu>
Cc: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, 
	Ping Cheng <ping.cheng@wacom.com>, regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Jutz <daniel@djutz.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	linux-input@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] YOGA 7 pencil only show up as eraser
 since 9c2913b962da
Message-ID: <ozaaiintvlmf75vxwscs45lvq5n2ieuglv4l4gjgymexeirh4b@jn2wijwbkgxr>
References: <3cd82004-c5b8-4f2a-9a3b-d88d855c65e4@heusel.eu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cd82004-c5b8-4f2a-9a3b-d88d855c65e4@heusel.eu>

On Oct 08 2024, Christian Heusel wrote:
> Hello everyone,
> 
> Daniel (in CC) as well as the Arch forum user "ls" report a regression
> with the pen of their Yoga 7 2-in-1 14AHP9 Laptop that leads to it being
> always recognized as an eraser:
> 
>     $ libinput debug-tablet
>     Tool: eraser serial 0x80e51447, id 0x219
> 
>     $ evtest /dev/input/event6
>     type 1 (EV_KEY), code 321 (BTN_TOOL_RUBBER), value 0
> 
> While the expected output with a previous kernel version (6.10.y stable
> series) is the following:
> 
>     $ libinput debug-tablet
>     Tool: pen serial 0x80e51447, id 0x219
> 
>     $ evtest /dev/input/event6
>     type 1 (EV_KEY), code 320 (BTN_TOOL_PEN), value 0
> 
> We have bisected the issue together in the mainline tree and found that
> the following commit has introduced this behaviour:
> 
>     9c2913b962da ("HID: wacom: more appropriate tool type categorization")
> 
> If any more debug information is needed or there are preliminary patches
> to test we're happy to help!
> If there is a fix found for this issue it would be nice if you could
> credit us as follows:
> 
> Reported-by: Daniel Jutz <daniel@djutz.com>
> Bisected-by: Christian Heusel <christian@heusel.eu>

Good catch. This was already reported as:
https://gitlab.freedesktop.org/libinput/libinput/-/issues/1041
and:
https://github.com/linuxwacom/input-wacom/issues/440

Jason got the same bisect result, and should be posting the patch soon.

Jason, please tag the patch with the appropriate Reported-by,
bisected-by and the various links.

Cheers,
Benjamin

> 
> Cheers,
> Chris
> 
> ---
> 
> #regzbot link: https://bbs.archlinux.org/viewtopic.php?id=300005
> #regzbot introduced: 9c2913b962da
> #regzbot title: HID/wacom: Yoga 7 Pen always detected as eraser



