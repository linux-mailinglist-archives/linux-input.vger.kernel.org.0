Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB31C2EF45C
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 16:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbhAHPCf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 10:02:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:51536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbhAHPCf (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 Jan 2021 10:02:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6308C23998;
        Fri,  8 Jan 2021 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610118115;
        bh=IILPEFi/JWzIYZ9DQVHDsq5/0esqom8SdyEIAwNmwXc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=VyQwluAbAzP5cmcsiXwZK4buJGaiXfQbiYCyXPvzVNpP5JkIM5Ajxsml4O8PGkPbD
         V6D40Hc1fwIQ/XhR1fe34f2ZKSOD+Ro44mUjYYfAkNl9J3vNXOJIoNCeB6aIqbFUqH
         yoC2V84y6ajFhMvxhduYHJx/wBEz2WVNZ7yByYaqciwwb89/bnw+VoK2+fGzJZ3qLU
         dWlmtrF/eEgjk6WjjJPzgU4HTqc8hTQDtfL/jLfceuKho1DEQHq+zoOqcCSJbL269Z
         Tf1ofXpR0JX7epsys7wEIGjjZGkg5Zjgtuk+0vEjXORgBM/pHatHbQdVIw+SLL2zlF
         /6OOdb+3fAyLQ==
Date:   Fri, 8 Jan 2021 16:01:52 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hui Wang <hui.wang@canonical.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH 2/2] HID: i2c-hid: Add a quirk to keep the power in
 shutdown
In-Reply-To: <41f85551-96a6-7bac-6dc9-02a66080e900@canonical.com>
Message-ID: <nycvar.YFH.7.76.2101081600460.13752@cbobk.fhfr.pm>
References: <20201204152912.151604-1-hui.wang@canonical.com> <20201204152912.151604-2-hui.wang@canonical.com> <nycvar.YFH.7.76.2101071011130.13752@cbobk.fhfr.pm> <41f85551-96a6-7bac-6dc9-02a66080e900@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 7 Jan 2021, Hui Wang wrote:

> >> On the latest Thinkpad Yoga laptop, the touchscreen module is wacom
> >> I2C WACF2200 (056a:5276), we found the touchscreen could not work
> >> after rebooting, needs to poweroff the machine then poweron the
> >> machine to let it work.
> >>
> >> It is highly possible that this is a BIOS issue, but the windows
> >> doesn't have this problem with the same BIOS.
> >>
> >> If keeping the power on when calling shutdown, the touchscreen could
> >> work after rebooting. Let us add a quirk for it and apply the quirk
> >> to this machine only.
> > I wonder what do Windows do differently here. Perhaps they never put the
> > i2c device to sleep while in shutdown anyway? Is there any downside to
> > (not) doing the same?
> 
> It is highly possible the Windows doesn't sleep the i2c device in shutdown.
> When calling shutdown, it usually means reboot or poweroff the machine, so the
> sleep is meaningless in this situation. In other situations like users
> manually unload the i2c driver, maybe it will add a bit power consumption
> without sleeping the device.

Agreed, but if windows really don't put the device to sleep before 
shutting down, odds are there will be more devices behaving the same, and 
therefore we'd rather make it the default case instead of growing just 
another quirk list.

> Anyway, I will try to ask for help from vendor, maybe they could provide 
> how Windows do when shutdown.

Thank you,

-- 
Jiri Kosina
SUSE Labs

