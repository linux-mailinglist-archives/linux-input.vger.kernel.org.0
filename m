Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECA0262747
	for <lists+linux-input@lfdr.de>; Wed,  9 Sep 2020 08:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgIIGj3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Sep 2020 02:39:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:44112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbgIIGj2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Sep 2020 02:39:28 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7393321741;
        Wed,  9 Sep 2020 06:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599633568;
        bh=3b1PQjCPM4xEwgY5z5elbFiNLEFSibYLj7+2GMQ5om0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pOzs1qrwZF/hjunMHPY9ARZaOTe1AGW/TxagTpUJWCjMk1yRzZc5v2T25jjNhmM/2
         MeX0R17Bd/Pd4wlWMpSpRpwY52TlOrHwHRpTvA1a6oRcsN5mgoHzRWKUvx00eDYMU7
         Nc+ZaXuqzV5qrzcuJimVyOBGR907BNeCVLbt8Dj0=
Date:   Wed, 9 Sep 2020 08:39:24 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Pavel Balan <admin@kryma.net>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: Prefer asynchronous probe
In-Reply-To: <20200902214250.1.I63d3f1c93f88cb0cda5161c42e97decb4a63a571@changeid>
Message-ID: <nycvar.YFH.7.76.2009090839170.4671@cbobk.fhfr.pm>
References: <20200902214250.1.I63d3f1c93f88cb0cda5161c42e97decb4a63a571@changeid>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2 Sep 2020, Douglas Anderson wrote:

> Adding printouts to the i2c_hid_probe() function shows that it takes
> quite some time.  It used to take about 70 ms, but after commit
> eef4016243e9 ("HID: i2c-hid: Always sleep 60ms after I2C_HID_PWR_ON
> commands") it takes about 190 ms.  This is not tons of time but it's
> not trivial.  Because we haven't yet specified that we'd prefer
> asynchronous probe for this driver then, if the driver is builtin to
> the kernel, we'll wait for this driver to finish before we start
> probes for more drivers.  Let's set the flag to enable asynchronous
> for this driver so that other drivers aren't blocked from probing
> until we finish.
> 
> Since this driver can be configured as a module and modules are
> always asynchronously probed this is quite a safe change and will
> benefit anyone who has a reason to build this driver into the kernel
> instead of using it as a module.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

