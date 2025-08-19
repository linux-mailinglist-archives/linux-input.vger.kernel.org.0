Return-Path: <linux-input+bounces-14137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F330AB2BC48
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 10:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7B733BFEF5
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 08:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7623115AE;
	Tue, 19 Aug 2025 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Svt3zP5i"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C02DE1FC;
	Tue, 19 Aug 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755593742; cv=none; b=QjLdZNHm8ycvrt2+oSIsomWkHOXCUmgG5MDVzRQvgDeSN6IF6meKs12Y/hhDHcCt649R0w2jJwgy80MAYTScHKDLAKrbLiUzoGah8FNkyNyIYIfevCnaBMtj9qT7b3EEWSKeoa2ThjTp9tCrH3+eEk4xBwvbackdtFzRqxE//0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755593742; c=relaxed/simple;
	bh=o38PEwzzrhvK+nqHyUUjRkWWce1cZQTdYtgaTwqj/pI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BxTl04Pwi9XO5jKj8GDNlUNeRZ5kEjDNyt+MgT8x+/A1hITkqdTkBRgDFCA0t3k0yzVVTxAOvaajzLKyMsN7klPlVTeVeU/3zaxBjKCI1+KjsBa8uTSAngByisZjrV/FB+GePsXlf8DC1emkJ3Y049U07aq9nXtShDzZmhBVX/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Svt3zP5i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4BCC4CEF1;
	Tue, 19 Aug 2025 08:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755593741;
	bh=o38PEwzzrhvK+nqHyUUjRkWWce1cZQTdYtgaTwqj/pI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Svt3zP5ikcCRJxVMWcW7yPQmZqlzWWDfFxK27vTuo2meswaOXf2IPIC8IT/AhIO5e
	 bI1ViD+JfTXXbJuJK+DFDutCMbb4nQefSpzOuKvUIrd6A4kMGnDcZ8EVxooed8xLeB
	 eKIJhPqmzL6Our9N+B7AwsHEq6dVlv/DX4rex8sSqSC3uW18Cd3vekJD5/LH/SEZWO
	 92RLO0RIjw4gbNebdJdC5rHs+ggTFmII1TxHmDup8OTSX9SFzbz8nFc3bx4DG6BDKt
	 ImusUjXNfcwrvmQl7g6IGRRRtk6oOoQV3Fm8z+bWy2asEKt5En9QdX42GenQvpPSBW
	 FdHQAa2pW9mrg==
Date: Tue, 19 Aug 2025 10:55:38 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Doug Anderson <dianders@chromium.org>
cc: Pin-yen Lin <treapking@chromium.org>, 
    Neil Armstrong <neil.armstrong@linaro.org>, 
    Jessica Zhang <quic_jesszhan@quicinc.com>, 
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>, Benjamin Tissoires <bentiss@kernel.org>, 
    linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
    Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/2] HID: Make elan touch controllers power on after
 panel is enabled
In-Reply-To: <CAD=FV=WCfFWHAh=XxA_jZpMsS_L0U_k=_g_oj36Nd=4winZ24g@mail.gmail.com>
Message-ID: <pr01os80-s752-1rqp-782q-65nr8222npq7@xreary.bet>
References: <20250818115015.2909525-1-treapking@chromium.org> <20250818115015.2909525-2-treapking@chromium.org> <CAD=FV=WCfFWHAh=XxA_jZpMsS_L0U_k=_g_oj36Nd=4winZ24g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Aug 2025, Doug Anderson wrote:

> > Introduce a new HID quirk to indicate that this device has to be enabled
> > after the panel's backlight is enabled, and update the driver data for
> > the elan devices to enable this quirk. This cannot be a I2C HID quirk
> > because the kernel needs to acknowledge this before powering up the
> > device and read the VID/PID. When this quirk is enabled, register
> > .panel_enabled()/.panel_disabling() instead for the panel follower.
> >
> > Also rename the *panel_prepare* functions into *panel_follower* because
> > they could be called in other situations now.
> >
> > Fixes: bd3cba00dcc63 ("HID: i2c-hid: elan: Add support for Elan eKTH6915 i2c-hid touchscreens")
> > Fixes: d06651bebf99e ("HID: i2c-hid: elan: Add elan-ekth6a12nay timing")
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v3:
> > - Collect review tag
> > - Add fixes tags
> >
> > Changes in v2:
> > - Rename *panel_prepare* functions to *panel_follower*
> > - Replace after_panel_enabled flag with enabled/disabling callbacks
> >
> >  drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++-----------
> >  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
> >  include/linux/hid.h                   |  2 ++
> >  3 files changed, 40 insertions(+), 19 deletions(-)
> 
> Re-iterating my response from v2 [1] so it's still seen even if people
> only look at the latest version. :-) If HID folks don't mind us
> landing this through drm-misc, feel free to Ack this patch. 

Acked-by: Jiri Kosina <jkosina@suse.com>

Thanks!

-- 
Jiri Kosina
SUSE Labs


