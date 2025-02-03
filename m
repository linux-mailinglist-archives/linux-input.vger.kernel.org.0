Return-Path: <linux-input+bounces-9705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DCDA256A5
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 11:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 555FA1660DD
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 10:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E647D200B8C;
	Mon,  3 Feb 2025 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbMeb5W8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E923594B;
	Mon,  3 Feb 2025 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738577375; cv=none; b=UcBW+0LF7zmDzPzGECX6JimeBsQYT2cMWz8c4B3ui8c3avqY3JjyjgF8U0cHJ9BBK7VErB/oYl53/qoT5yc5ED1fIK92soDD+62PPktapHLt61Gdnd/O4IPvssyM1phEj4E+/JtM1mVwPXh2HeBBNxJ6IDDL6QFxixOB1RQw5yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738577375; c=relaxed/simple;
	bh=K7rQae8QcWFmR02VR2cc/NnbWKKlcWy0NGP/Eu3OnVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R4bVCgl2NB1im26kDQ9+B8Q4UUw4OIYN5PGLWEaxlYweUx1fVYa7MJG/5K6JzmGl0ycVSjxLi1Y1ZJeDu00KHvE1mXww/5vBsNWvJ3Z2jdyrfnsE49k8NJbDcXu5mf0V3ytkXORyuga+HsdJjoXz2Cc5APNWZOE6F4zAj6jtuU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbMeb5W8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1225C4CEE0;
	Mon,  3 Feb 2025 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738577374;
	bh=K7rQae8QcWFmR02VR2cc/NnbWKKlcWy0NGP/Eu3OnVY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LbMeb5W8rEG3V3vtsr9HPkZPIepcDp94LPsv4UvBqeOB9IvQW1Iplx3D3vgtPAkwc
	 gZf/GiZGEz/8kFzI5dJUnsjCzH5gP+YIvY59ztzy/5xmFoVA/zk/fxNkFBHkiOTA0+
	 97c0S8coHmUXvktMIZuENNqQpm3ql5bpIuA5pccxL6CPTbm0HYlXRyB9qWNrCySxlK
	 g3jPoICRSA4D78/OiHzcdADfVwvW7Xvxlr9TwAKO/+VF3+QfMhn+tAdiTupEX66QoA
	 zBD3SNfuYwn+ar6XrhHgOHSDd+O/HxlEGCFEboniDluvUd1TpMe+c1KItj7OY3RzmZ
	 ghKCCSXcgu+Aw==
Date: Mon, 3 Feb 2025 11:09:31 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, 
    Takashi Iwai <tiwai@suse.com>, Wade Wang <wade.wang@hp.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
    linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Introduce Poly/Plantronics mute event support
In-Reply-To: <87tt9wr13v.wl-tiwai@suse.de>
Message-ID: <7r09s51n-po04-ps84-8n9q-89ppqs6o7qs0@xreary.bet>
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com> <20250118005841.6618-1-linuxhid@cosmicgizmosystems.com> <87tt9wr13v.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 18 Jan 2025, Takashi Iwai wrote:

> On Sat, 18 Jan 2025 01:58:37 +0100,
> Terry Junge wrote:
> > 
> > Hi Jiri and Takashi,
> > 
> > If at all possible, it would be preferred if this patch set could be
> > sent upstream and to stable together.
> 
> Note that, for picking up to stable, it's never guaranteed to take two
> at the same time unless you explicitly request to the stable
> maintainers.
> 
> In anyway, I don't mind to put the USB-audio change via HID tree.
> In that case, feel free to take my ack:
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

Thanks, I have now queued both patches in hid.git#for-6.15/plantronics

-- 
Jiri Kosina
SUSE Labs


