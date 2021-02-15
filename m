Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB27231BB0F
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 15:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhBOOaR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 09:30:17 -0500
Received: from lists.nic.cz ([217.31.204.67]:36680 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229627AbhBOOaR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 09:30:17 -0500
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 30AC513F62D;
        Mon, 15 Feb 2021 15:29:35 +0100 (CET)
Date:   Mon, 15 Feb 2021 15:29:34 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, dmitry.torokhov@gmail.com,
        pobm@protonmail.com, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v6 00/4] HID: new driver for PS5 'DualSense' controller
Message-ID: <20210215152934.62e134a3@nic.cz>
In-Reply-To: <20210215004549.135251-1-roderick@gaikai.com>
References: <20210215004549.135251-1-roderick@gaikai.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 14 Feb 2021 16:45:45 -0800
Roderick Colenbrander <roderick@gaikai.com> wrote:

> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> 
> Hi,
> 
> Recently Sony released a HID driver for the new PlayStation 5 controller
> 'DualSense'. Pavel Machek noticed the driver got staged for "-next" and asked
> me to share the LED patches to linux-leds as well.
> 
> The LED patches I'm sharing are patch 6, 9, 11, 12 from the v6 hid-playstation
> series as originally posted to linux-input. The driver in its full form can be
> found on "hid.git/log/?h=for-5.12/playstation".
> 

Hi,

OK I see you described the purpose of these LEDs here, please ignore
that one question in my reply to patch 1/4.

> Finally, the DualSense has a audio mute LED and a mute button. The mute button is
> expected to mute the internal microphone of the DualSense. The mute behavior
> is handled driver side and the driver then also programs the LED. From user space
> perspective the LED is read-only.

The audio mute LED should not be read-only from userspace. Instead a
LED trigger should be assigned by default, audio-micmute / audio-mute.

With this trigger the LED subsystem will handle setting brightness of
the LED according to whether the audio is muted or not.

This trigger is currently simple, though. It is system wide - it
is impossible to configure it to report only on the state of a
specific microphone. But the trigger driver can be extended if this is needed.

Marek
