Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C71845713A
	for <lists+linux-input@lfdr.de>; Fri, 19 Nov 2021 15:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbhKSO5r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Nov 2021 09:57:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:46204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230373AbhKSO5r (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Nov 2021 09:57:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 582FE61401;
        Fri, 19 Nov 2021 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637333685;
        bh=FefE7Kz0RTzx9JNe48AeYazAcjkmSekoj4cJewzIEmI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=bQ9NR7ba1qlQNaJsW633RCBoNyiJZV/SZpkcneiyINrdXTQN4iuSaphVcXcq0+viY
         aL8cK/YSp/BogewcGH0K3JTqJm8weMnmMrk/5JVdwUypwjqndcjjs5VM/kiqy4nhYa
         ocrm3Z8eWg189AMBwYdDP5/gj1yy5EqnM5Sc6Py6Ke2BY6Xj28V2ZwQbBpAynKgoNQ
         UnZa2w/Uso5thEH59I2XvPePMG6Inwepx9ugo6hPAGX6tZN6n2YAur/MU5Mqmvo2Rc
         PPoAKm0kXNpj4C5C64AJYGor2Si6wm1TpoyV7Q2T7GP2i29Qr/ZTJAGdbl5Z2gGRmh
         M8lT5OfIz8n9w==
Date:   Fri, 19 Nov 2021 15:54:42 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Claudia Pellegrino <linux@cpellegrino.de>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: magicmouse: prevent division by 0 on scroll
In-Reply-To: <20211114025327.146897-1-linux@cpellegrino.de>
Message-ID: <nycvar.YFH.7.76.2111191554340.16505@cbobk.fhfr.pm>
References: <20211114025327.146897-1-linux@cpellegrino.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 14 Nov 2021, Claudia Pellegrino wrote:

> In hid_magicmouse, if the user has set scroll_speed to a value between
> 55 and 63 and scrolls seven times in quick succession, the
> step_hr variable in the magicmouse_emit_touch function becomes 0.
> 
> That causes a division by zero further down in the function when
> it does `step_x_hr /= step_hr`.
> 
> To reproduce, create `/etc/modprobe.d/hid_magicmouse.conf` with the
> following content:
> 
> ```
> options hid_magicmouse scroll_acceleration=1 scroll_speed=55
> ```
> 
> Then reboot, connect a Magic Mouse and scroll seven times quickly.
> The system will freeze for a minute, and after that `dmesg` will
> confirm that a division by zero occurred.
> 
> Enforce a minimum of 1 for the variable so the high resolution
> step count can never reach 0 even at maximum scroll acceleration.
> 
> Fixes: d4b9f10a0eb6 ("HID: magicmouse: enable high-resolution scroll")
> 
> Signed-off-by: Claudia Pellegrino <linux@cpellegrino.de>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

