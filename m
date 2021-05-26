Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4153915B7
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 13:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234209AbhEZLIL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 07:08:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:58152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234006AbhEZLIK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 07:08:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9980C6108E;
        Wed, 26 May 2021 11:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622027199;
        bh=k3N8lwt6aT38SkZGdYgMsbgpPYMJHEZhJOiZQILvW7A=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=dmzMv50ej1fXqnR305pbSrIbaJlRwoZ/VB5oASsXTZ7ZJZd28woueXUw6/1rglrUl
         tufw4lf0GUTSbnmtYJLnXV7ku5GszZG1svb7LSQBgjl3W746mkBZfGmeTbgUTHeOkw
         pi5IHcoPlNEoM9YDgCIlqvBRnUxHgMG172i2DnuDPjLIiHP1YI4mfcbcGM8s0PwI2k
         kXhWpaZy7fsFNkZnfahQjailM4n/A9E8RdunoCaLJVEsWLM/zJD0iaIrvKsiq7hVg+
         eq9FBiFIZDRXgm99uIDf+ul75efXfeZUuLQQVzbJ5HHh7+rpvxFnQKkalgisQPHf0Y
         +C7TWLjchFgYQ==
Date:   Wed, 26 May 2021 13:06:36 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/6] HID: Misc. fixes
In-Reply-To: <72853307-3e7a-a98e-8870-0c7d74506e65@redhat.com>
Message-ID: <nycvar.YFH.7.76.2105261306140.28378@cbobk.fhfr.pm>
References: <20210505213935.631351-1-hdegoede@redhat.com> <nycvar.YFH.7.76.2105261238110.28378@cbobk.fhfr.pm> <72853307-3e7a-a98e-8870-0c7d74506e65@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 26 May 2021, Hans de Goede wrote:

> >> Hi Jiri, Benjamin,
> >>
> >> Here is v2 of what started out as a small series to fix spurious wakeups
> >> on T101HA 2-in-1s.
> >>
> >> This adds the discussed hid_is_usb_device() helper and uses that in:
> >>
> >> "HID: multitouch: Disable event reporting on suspend when our parent is
> >> not a wakeup-source"
> >>
> >> To avoid needing to add a "depends on USB_HID" to hid-multitouch Kconfig
> >> settings.
> >>
> >> I've checked all other hid_is_using_ll_driver(hdev, &usb_hid_driver) callers
> >> and the only one which can truely benefit from the new helper is the
> >> hid-asus driver, which also deals with some I2C devices on some Asus hw.
> >>
> >> All other drivers using hid_is_using_ll_driver(hdev, &usb_hid_driver)
> >> are only for USB devices, so dropping the "depends on USB_HID" does not
> >> make sense for them.
> >>
> >> The one other driver which may benefit from the new hid_is_usb_device()
> >> helper would be the Wacom driver which seems to also support I2C devices,
> >> but that contains a lot of USB specific code, so I don't think we can
> >> easily drop the "depends on USB_HID" there.
> >>
> >> Even though this is a bit if a mixed-bag of patches, their are several
> >> dependencies between them, so these should probably all go on a single
> >> topic branch.
> > 
> > Now in for-5.13/upstream-fixes. Thanks,
> 
> Thank you, it seems that in the process of dropping the patches which
> you had already merged from v1 of this series; and replacing them with v2,
> you completely dropped:
> 
> [PATCH v2 5/6] HID: asus: Cleanup Asus T101HA keyboard-dock handling
> 
> (which was also in v1) at least I cannot find this in either one of:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/drivers/hid/hid-asus.c?h=for-next
> https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/drivers/hid/hid-asus.c?h=for-5.13/upstream-fixes

It will appear there shortly, not the full state of my tree has been 
mirrored out yet.

Thanks a lot for double-checking!

-- 
Jiri Kosina
SUSE Labs

