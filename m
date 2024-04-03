Return-Path: <linux-input+bounces-2796-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEB9896E97
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 14:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10B481F2737A
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 12:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18E017583;
	Wed,  3 Apr 2024 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LB/fnnFC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A808134CCA;
	Wed,  3 Apr 2024 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712145727; cv=none; b=Lca4eq25kxuiFQ/xt7mVB49dwT0z4QNioO85QcBJkn1gDfIBq228VNEloAKYWaYlhBxBf8CwWo4Fh4B+E52uGPCsMUGHYfz+GJRGUEh4KDi7EyZ+tAWlz/c4thpaqeml+FJ7z1/bWvFYjWI5dRDDHghN7vQy97W3zmqEAw0dTrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712145727; c=relaxed/simple;
	bh=CXjZ1nRUlX5d/+5e4V3RclbSrcLQ7nTudEHSDK68kWI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YLTudwiBP9nP/xRepPmoQdEbahZJTVkrsGLJxLkTitNXqsaDMXvDC5TVfSyscd5UOmxxX4uE247Gya461Q77/yLHx+eLgtSFN/3ZZv5A3Fi599hDxheqnS3lPALO9JhOOhazZoK7kzIEChGH4am4UX9S+W1rjx361JHTCGgUdlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LB/fnnFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB66C433C7;
	Wed,  3 Apr 2024 12:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712145727;
	bh=CXjZ1nRUlX5d/+5e4V3RclbSrcLQ7nTudEHSDK68kWI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LB/fnnFCpa7jE1o6NrubFTG6Uzoyit6/ZRxHMBBXOMWKOzBtKlRL7LEZhgVJw/cQl
	 7ZdrawRqRspHtlWMxJZH8jL3BclAl3/KLxjM1HI5uQalaHb9MzpuTfvLdA2NChs74N
	 kiJ5nCNzGJfOJzB+lb9gi740jOhDAezhXm+fRIUUPaqjKnVs8toeV0N/jMQwzED3ru
	 DoG6jdonyhn0lsJsCExCS6+SBnAzD6GbltlamxiGFw2tdBiFgc4F/Qm3gaJvPZX1FS
	 IltpViDDaO/2skc8/nTucAeprc7VhWP9T9TwN6Rgny2T9LIZVPrlM1ua0t9JtcuHbR
	 ZczUihfaBBasw==
Date: Wed, 3 Apr 2024 14:02:04 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mark Pearson <mpearson@squebb.ca>
cc: Hans de Goede <hdegoede@redhat.com>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Kenny Levinsen <kl@kl.wtf>, 
    =?ISO-8859-15?Q?Philip_M=FCller?= <philm@manjaro.org>, 
    Douglas Anderson <dianders@chromium.org>, Julian Sax <jsbc@gmx.de>, 
    ahormann@gmx.net, Bruno Jesus <bruno.fl.jesus@gmail.com>, 
    Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com, 
    Tim Aldridge <taldridge@mac.com>, Rene Wagner <redhatbugzilla@callerid.de>, 
    Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH v3] HID: i2c-hid: Revert to await reset ACK before reading
 report descriptor
In-Reply-To: <e941980b-5efb-4ba7-aaf9-f0ed694fb39d@app.fastmail.com>
Message-ID: <nycvar.YFH.7.76.2404031401411.20263@cbobk.fhfr.pm>
References: <20240402111004.161434-1-hdegoede@redhat.com> <e941980b-5efb-4ba7-aaf9-f0ed694fb39d@app.fastmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Apr 2024, Mark Pearson wrote:

> On Tue, Apr 2, 2024, at 7:10 AM, Hans de Goede wrote:
> > From: Kenny Levinsen <kl@kl.wtf>
> >
> > In af93a167eda9, i2c_hid_parse was changed to continue with reading the
> > report descriptor before waiting for reset to be acknowledged.
> >
> > This has lead to two regressions:
> >
> > 1. We fail to handle reset acknowledgment if it happens while reading
> >    the report descriptor. The transfer sets I2C_HID_READ_PENDING, which
> >    causes the IRQ handler to return without doing anything.
> >
> >    This affects both a Wacom touchscreen and a Sensel touchpad.
> >
> > 2. On a Sensel touchpad, reading the report descriptor this quickly
> >    after reset results in all zeroes or partial zeroes.
> >
> > The issues were observed on the Lenovo Thinkpad Z16 Gen 2.
> >
> > The change in question was made based on a Microsoft article[0] stating
> > that Windows 8 *may* read the report descriptor in parallel with
> > awaiting reset acknowledgment, intended as a slight reset performance
> > optimization. Perhaps they only do this if reset is not completing
> > quickly enough for their tastes?
> >
> > As the code is not currently ready to read registers in parallel with a
> > pending reset acknowledgment, and as reading quickly breaks the report
> > descriptor on the Sensel touchpad, revert to waiting for reset
> > acknowledgment before proceeding to read the report descriptor.
> >
> > [0]: 
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/plug-and-play-support-and-power-management
> >
> > Fixes: af93a167eda9 ("HID: i2c-hid: Move i2c_hid_finish_hwreset() to 
> > after reading the report-descriptor")
> > Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2271136
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kenny Levinsen <kl@kl.wtf>
> > Link: https://lore.kernel.org/r/20240331182440.14477-1-kl@kl.wtf
> > [hdegoede@redhat.com Drop no longer necessary abort_reset error exit 
> > path]
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
[ .. snip .. ]
> Tested on my Z13 G2 system and confirmed this fixes the issue.
> 
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Applied to hid.git#for-6.9/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs


