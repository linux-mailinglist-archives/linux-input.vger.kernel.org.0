Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDFFEED068
	for <lists+linux-input@lfdr.de>; Sat,  2 Nov 2019 20:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfKBTfO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Nov 2019 15:35:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:39778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726634AbfKBTfO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 2 Nov 2019 15:35:14 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 723F820862;
        Sat,  2 Nov 2019 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572723313;
        bh=MuKISYn7aL/t1Jz68PuFO9zEm0915XMIQ0YVXRpWqD8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=urMQDf1XeWV1klVhoAijv93T6sKCPRw2p5ysKO/3rPaje3q6sN+oxMC9Ii9atk34t
         cB4InKYJj8yhma1cQIlgDdzFdAG513hVCUpebVr9zsnwTWKaH9HXZ9/s/EOcIMPnI1
         nJS4WinquCK3j4eEzJlPYKcpr0mrQCvS6dnS/kA0=
Date:   Sat, 2 Nov 2019 20:35:03 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] HID: i2c-hid: Send power-on command after reset
In-Reply-To: <20191020214718.150906-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.1911022034330.1799@cbobk.fhfr.pm>
References: <20191020214718.150906-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 20 Oct 2019, Hans de Goede wrote:

> Before commit 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power
> management"), any i2c-hid touchscreens would typically be runtime-suspended
> between the driver loading and Xorg or a Wayland compositor opening it,
> causing it to be resumed again. This means that before this change,
> we would call i2c_hid_set_power(OFF), i2c_hid_set_power(ON) before the
> graphical session would start listening to the touchscreen.
> 
> It turns out that at least some SIS touchscreens, such as the one found
> on the Asus T100HA, need a power-on command after reset, otherwise they
> will not send any events.
> 
> Fixes: 67b18dfb8cfc ("HID: i2c-hid: Remove runtime power management")
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks a lot for debugging this.

I've queued this in for-5.4/upstream-fixes and will make sure it hits 
Linus' tree before 5.4 final.

-- 
Jiri Kosina
SUSE Labs

