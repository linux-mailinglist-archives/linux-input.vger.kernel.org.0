Return-Path: <linux-input+bounces-7131-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25F993F6D
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 09:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6142859BE
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 07:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA13197A65;
	Tue,  8 Oct 2024 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+Zn5nRo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BA7190693;
	Tue,  8 Oct 2024 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370080; cv=none; b=EQ9h/k4j+zwRf4DVyw3k3f2U1g6sdpYYpHUKgouQcNwGMTkRVllbZ/WHsZIDk4MPTGxbKIxPjWINYTxiQey6Jwh4ZWVOoWjBl+i+Zo5HZS5W1PbUi3hDOcyNnjnXrTnryFYoTHcr4c8px92A6UZnYbT6dpGbSD9zlSXCS3qmjw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370080; c=relaxed/simple;
	bh=LTKk0/uvDJCw0GaRtq9z640qWgt6bGOh9MPT70icp8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFGJz4urUFhg3GbGh2cR74usl0Cy1ufOn8H8x7lQgxv61IHNO7DljhMyfc8oV41jbh1qsmb6gpBdHbzRzw7v8VGLQmX7W+LXJrw96krWnxa4EpJEmmOI1b+v+s5HH+ISOBffPU94dKtnK5AYVuN7i2o8ytcDFfVLznVvZ70sU1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+Zn5nRo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC63C4CEC7;
	Tue,  8 Oct 2024 06:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728370080;
	bh=LTKk0/uvDJCw0GaRtq9z640qWgt6bGOh9MPT70icp8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y+Zn5nRo0m325cMQ5SClV/7VgOPojm23fdrXGMFNj4NXF91UkIfcxSLT5A1qxRGRi
	 /j3K3GVKczxEvZXXzXVRkCZXpI6iSHHUI2n2weoOGLaE8vtZI0VHbtXQmp+aAeRDot
	 3INtzAnUGrLRa5dkvdDAU8WURvgYohwCgozTWiBjTW3/ChyDxNSmm1n9uIvEncsGb2
	 azjJ0gVkL2H+/B96N8N/1OMdj6x2pgRu/pbmUfRKA2dCQUVNjfAgPZ3vW7fqts/qMv
	 YwlI7Gn8Ai5ZD/khgQ4fDw/0CFmSoMdTIYaf0HdwM4SGSIeCwy2Dc3nyF29PuroMnD
	 4IoAeqtsllBVQ==
Date: Tue, 8 Oct 2024 08:47:55 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Jose Fernandez <jose.fernandez@linux.dev>, 
	Jiri Kosina <jikos@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Johan Hovold <johan+linaro@kernel.org>, 
	Nam Cao <namcao@linutronix.de>, linux-input@vger.kernel.org
Subject: Re: [REGRESSION] HID: i2c-hid: Touchpad not working on Thinkpad Z16
 Gen 2
Message-ID: <hffdmqx4binr6tpc7lqfzah3mwn75h2lifoqcy72gr2hvc3ath@lugoxeaf444z>
References: <gbvkokf7rpsayfqv4l5mvk347lal72q54jgxfvwu7bmx7olngm@e3tcy6oyaas3>
 <5c666a9c-e10b-4eea-b2e7-3f781e177c19@leemhuis.info>
 <c5020404-2d48-47ad-a75b-f2d37897f57c@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5020404-2d48-47ad-a75b-f2d37897f57c@leemhuis.info>

On Oct 07 2024, Thorsten Leemhuis wrote:
> On 06.10.24 05:46, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 06.10.24 01:01, Jose Fernandez wrote:
> >> I'm using Fedora 40 with the vanilla kernel built from the 6.12-RC1 [1]. There
> >> is a regression that causes the touchpad to stop working on my Thinkpad Z16 Gen
> >> 2 (Sensil touchpad). dmesg shows this on 6.12-rc1 when filtering by `hid`:
> > 
> > Could you try latest git instead of rc1 if you haven't yet? E.g. the
> > latest packages from your "[1]". I wonder if this is
> > https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> > which is fixed by a3f9a74d210bf5 ("Revert "Input: Add driver for PixArt
> > PS/2 touchpad"") [v6.12-rc1-post]
> > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a3f9a74d210bf5b80046a840d3e9949b5fe0a67c
> > ).
> 
> Those two are apparently different problems, as from
> https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> it seems that it might be not kernel regression after all, but a change
> in the Fedora's .config that causes your problems.
> 

There were 2 problems happening at the same time.

There is a high chance the whole issue was because of this config change
in the Fedora kernel, because of automation. However, the PixArt driver
was still bogus and interfered in PS/2 capable touchpads: we couldn't
have a PS/2 fallback.

IIRC, in the PixArt thread, they mentioned that they had something like
"if that command fails, return a touchscreen, no matter what kind of
failure it was".

Anyway, we should be fine in the next Fedora builds, so I guess we can
close these regressions.

Cheers,
Benjamin

