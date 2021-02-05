Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0F3F3107B1
	for <lists+linux-input@lfdr.de>; Fri,  5 Feb 2021 10:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbhBEJWo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Feb 2021 04:22:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:33954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230034AbhBEJUq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Feb 2021 04:20:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B59D364F95;
        Fri,  5 Feb 2021 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612516805;
        bh=LPYwCLVMORkaSzpTvfp/9+nM6jkIXUDZkycBi0/2+TE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=WAbC/7U0//WpfLP23RPW25/fPLAMyqjBPzbbrJ5lSq9GgJFqDa+WsG4jup+Vx05eM
         EHumneEQV7HqeA+tsjGjpImvdoKZAZ05E2DvIC8tvfaiqAx2o/a/DnaMiSPhiq9uQQ
         DySONVEHg00o5V5YNzQokOsfu52eOmAIi7n6dWh9MpBWxMPSGoKsWnuhJH9rKrUkzD
         Q0e483eIY0QdXs3/CHZZWsnM5TEaYoGcBcrs5AkgFlMOMxCnir4b2Czzm9PBzTdjeS
         1/i36GBrhrgKYEAt1HEmF3WOqjbAXm7QzwMB3Ll0cT936BVIWUhcip8M+mM0ikduCr
         ZURNqvbck/2ww==
Date:   Fri, 5 Feb 2021 10:20:02 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: Add I2C_HID_QUIRK_NO_IRQ_AFTER_RESET for
 ITE8568 EC on Voyo Winpad A15
In-Reply-To: <20210130203323.88405-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2102051019530.28696@cbobk.fhfr.pm>
References: <20210130203323.88405-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 30 Jan 2021, Hans de Goede wrote:

> The ITE8568 EC on the Voyo Winpad A15 presents itself as an I2C-HID
> attached keyboard and mouse (which seems to never send any events).
> 
> This needs the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk, otherwise we get
> the following errors:
> 
> [ 3688.770850] i2c_hid i2c-ITE8568:00: failed to reset device.
> [ 3694.915865] i2c_hid i2c-ITE8568:00: failed to reset device.
> [ 3701.059717] i2c_hid i2c-ITE8568:00: failed to reset device.
> [ 3707.205944] i2c_hid i2c-ITE8568:00: failed to reset device.
> [ 3708.227940] i2c_hid i2c-ITE8568:00: can't add hid device: -61
> [ 3708.236518] i2c_hid: probe of i2c-ITE8568:00 failed with error -61
> 
> Which leads to a significant boot delay.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

