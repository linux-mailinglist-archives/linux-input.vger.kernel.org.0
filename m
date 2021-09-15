Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C9940C7C1
	for <lists+linux-input@lfdr.de>; Wed, 15 Sep 2021 16:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233901AbhIOO5w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Sep 2021 10:57:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:46726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230499AbhIOO5w (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Sep 2021 10:57:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E48F36103B;
        Wed, 15 Sep 2021 14:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631717793;
        bh=sn7JcVltd7ykdK3LC1AZjdciolAldbn6IoLxtNEvLHo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Z9kQBN4V7wMlMHO+gVts1yj90JnjzL51pc/H1MQifTIGIzMU3PDRk7x2ZkqDLTBt0
         zfBuu5NZvqsz3PPgl3MzNoUMgPKa95aC/BPO99oz90T8ZLJrwj29X0hvQRzZKn3gY/
         TLW+JCTH1ykixMG9koHo3Ffe0NMwUjvNZzGFElkD+Gow3WA3xMMA9E2pLGJcuCd590
         pv+p+aNOTCGHltS9EfLp7L+/JUQYFAHcdbuq4QlkDijb1wkrq2Nr3ggiaO/lQ7Z6hH
         1u80otDpN7GylQSDN5Hywnm4JXszVFqummtmwEmlbeA/7+rIoXq0XbsH7PfPkiIVMx
         /+MTbdRWvpz2Q==
Date:   Wed, 15 Sep 2021 16:56:29 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Kenneth Albanowski <kenalba@google.com>
cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH 0/3] 64-bit Digitizer Serial Numbers
In-Reply-To: <20210520002249.361821-1-kenalba@google.com>
Message-ID: <nycvar.YFH.7.76.2109151655240.15944@cbobk.fhfr.pm>
References: <20210520002249.361821-1-kenalba@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 19 May 2021, Kenneth Albanowski wrote:

> Still as RFC, here's a patch set to implement support for 64-bit
> Digitizer Serial Numbers, following on to the prior discussion of how
> we can support Usage(Digitizers.Transducer Serial Number) larger
> than 32 bits.
> 
> My primary goal is making the serial number available via the
> power_supply node interface, and the third patch implements that: if
> CONFIG_HID_BATTERY_STRENGTH is enabled, and a hid report includes
> both Usage(Digitizers.Battery Strength) and Usage(Digitizers.
> Transducer Serial Number) then the generated power_supply node
> includes a SERIAL_NUMBER of "DG-ABCDEF..." of the last seen digitizer.
> 
> For this patch set, I have not implemented any changes to MSC_SERIAL*,
> however everything should be available for a future implementation. This
> patch set does not change any events emitted by evdev.
> 
> After some conversation with Dmitry, I am leaning towards serial number
> integration with the hid-multitouch protocol being the better long term
> solution for evdev, as that fits better with combined touch and stylus
> operation, as well as providing a clear means to providing multiple
> serial numbers for simultaneous styluses.
> 
> This set includes general modifications to hid-core to decode and
> represent HID fields larger than 32-bits as multiple consecutive 32-bit
> words, allowing arbitrarily long fields (or at least as many as can fit
> into HID_MAX_BUFFER_SIZE) to be passed upstream and (potentially)
> processed by hid-input and other subsystems.
> 
> (After trying a 64-bit implementation, I decided staying with 32-bit
> words kept the rest of the hid-core cleaner, and it was worth 
> supporting arbitrary length fields instead of only upgrading
> from 32 -> 64.)

Sorry for keeping this on hold for so long, it fell in between cracks.

This would need quite an extensive testing by Benjamin's testing 
infrastructure ... Benjamin, could you please put that into your queue?

Other than that, please rework the patchset so that it uses kernel comment 
styles, it can't be applied in this form.

Thanks,

-- 
Jiri Kosina
SUSE Labs

