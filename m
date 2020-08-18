Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE9E248D7F
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 19:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgHRRvn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 13:51:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:55270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726552AbgHRRvm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 13:51:42 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7251C2080C;
        Tue, 18 Aug 2020 17:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597773102;
        bh=J4/+5tA8Fug1dB4bZX92MmZfbq9+rUEgquwGY02+xII=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=T3wpR2WBUlCabkr4fsPmJg4+KcnhOa796FGKnSRNr7m5pn8yGRiPDm4jc9BQkjccc
         Bwa2CLWXsztXFXONIUPACeVTcvT3h8yHJynGrOaR07PEDVjC7K88faZ/xWoL6UzYNo
         y1zS+yT0s4GxQqfW8EFz0g5mlVCch/a6PYSb+Q7Y=
Date:   Tue, 18 Aug 2020 19:51:38 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Marius Zachmann <mail@mariuszachmann.de>
cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: corsair-cpro: fix ccp_probe, add delay [HID
 related]
In-Reply-To: <79890342.HV0Al07Iil@marius>
Message-ID: <nycvar.YFH.7.76.2008181948290.27422@cbobk.fhfr.pm>
References: <20200817070040.7952-1-mail@mariuszachmann.de> <20200817153533.GA243558@roeck-us.net> <79890342.HV0Al07Iil@marius>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 18 Aug 2020, Marius Zachmann wrote:

> > > Possibly because of the changes in usbhid/hid-core.c the first
> > > raw input report is not received during ccp_probe function and it will
> > > timeout. I am not sure, whether this behaviour is expected after
> > > hid_device_io_start or if I am missing something.
> > > As a solution this adds msleep(50) to ccp_probe so that all initial
> > > input reports can be received.
> > > 
> > > Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
> > 
> > Let's just ask the HID maintainers. Is this expected, and the correct fix ?
> 
> This seems to be a problem with "HID: usbhid: do not sleep when opening
> device". There is a bug report with some Logitech devices at the correct
> thread. These drivers also use hid_device_io_start and fail. Seems to me,
> this is the same problem and I retract this (not so beautiful) fix until
> this is sorted out.

[ CCing Dmitry ]

Yeah, this problem popped out also in other contexts, where many Logitech 
devices didn't probe properly, because of the race where the first IRQ is 
dropped on the floor (after hid_device_io_start() happens, but before the 
50ms timeout passess), and report descriptor never gets parsed and 
populated.

As this is just a boot time micro-optimization, I am going to revert the 
patch for 5.9 now, and we can try to fix this properly for next merge 
window.

Thanks,

-- 
Jiri Kosina
SUSE Labs

