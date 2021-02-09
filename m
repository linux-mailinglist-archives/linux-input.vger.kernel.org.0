Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07E9314C51
	for <lists+linux-input@lfdr.de>; Tue,  9 Feb 2021 11:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhBIKAR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 05:00:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:58146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230204AbhBIJ6L (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Feb 2021 04:58:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E129D64E9A;
        Tue,  9 Feb 2021 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612864650;
        bh=ElwCB0kFLsBJaJoVtMPHlA///w8sGUOx9T0B1O4njGQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=tfRrN0D4waGwkOWBs0vn+/5TBVypbyox15WQWOfrJTs/mDXXyOqu+6I3PWvtKZd5p
         ov2KLf0C9R0IVyORT2ZWSOpit5dMSRfMy+NnEPA7e78dGAk+hCeIVa9TG1bICcXeBT
         Yvw3xJTuK8Au4OO5pKx1QlF9U6M4rM3388/vcsmHxMQy4HWRg8FmPgxIv5TqQw8c2e
         JiPuO9Phqvmh/EP9yGuLjyWhho6IeYx+7czcUFSeAHyt1+Ok6zkoUTC1JecNPFl9w9
         Fhpqwy9W4nBIDDcCj6CSH5czQy+wjxZ0cKITMx0/Q8F3lbwHI9KQfGsJ7o6EMVXkZ0
         qxm7GjTDZcXLA==
Date:   Tue, 9 Feb 2021 10:57:27 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer
 Aspire Switch 10E
In-Reply-To: <20210206205327.45824-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2102091057170.28696@cbobk.fhfr.pm>
References: <20210206205327.45824-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 6 Feb 2021, Hans de Goede wrote:

> The Acer Aspire Switch 10E (SW3-016)'s keyboard-dock uses the same USB-ids
> as the Acer One S1003 keyboard-dock. Yet they are not entirely the same:
> 
> 1. The S1003 keyboard-dock has the same report descriptors as the
> S1002 keyboard-dock (which has different USB-ids)
> 
> 2. The Acer Aspire Switch 10E's keyboard-dock has different
> report descriptors from the S1002/S1003 keyboard docks and it
> sends 0x00880078 / 0x00880079 usage events when the touchpad is
> toggled on/off (which is handled internally).
> 
> This means that all Acer kbd-docks handled by the hid-ite.c drivers
> report their touchpad being toggled on/off through these custom
> usage-codes with the exception of the S1003 dock, which likely is
> a bug of that dock.
> 
> Add a QUIRK_TOUCHPAD_ON_OFF_REPORT quirk for the Aspire Switch 10E / S1003
> usb-id so that the touchpad toggling will get reported to userspace on
> the Aspire Switch 10E.
> 
> Since the Aspire Switch 10E's kbd-dock has different report-descriptors,
> this also requires adding support for fixing those to ite_report_fixup().
> 
> Setting the quirk will also cause ite_report_fixup() to hit the
> S1002/S1003 descriptors path on the S1003. Since the S1003 kbd-dock
> never generates any input-reports for the fixed up part of the
> descriptors this does not matter; and if there are versions out there
> which do actually send input-reports for the touchpad-toggle then the
> fixup should actually help to make things work.
> 
> This was tested on both an Acer Aspire Switch 10E and on an Acer One S1003.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

