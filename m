Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8891DAA3CE
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2019 15:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388248AbfIENDv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Sep 2019 09:03:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:41202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388180AbfIENDu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Sep 2019 09:03:50 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A0DF21D7F;
        Thu,  5 Sep 2019 13:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567688628;
        bh=5A97SrUDUqyVKNx4DSBp3SVRp3CJEByfutDERGx+WWs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=gEiMjB6HERBAz+GaBgIR5yO9T13FFCRmvjD84jb2uUtvX7vQrw1CCrmq+8gs+DPfv
         l7l0umFeo2NdYzHiwfgIbhu5BfDHaZnkuloRVqbeoavkh5nUMJsaRjlwBqAPIbcEp9
         Qr21N097KTIaylGDRz4ZB/0ZQxOUiNvC+jN6NFTU=
Date:   Thu, 5 Sep 2019 15:03:33 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
cc:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: hid-prodikeys: Fix general protection fault during
 probe
In-Reply-To: <Pine.LNX.4.44L0.1909041149390.1722-100000@iolanthe.rowland.org>
Message-ID: <nycvar.YFH.7.76.1909051503210.31470@cbobk.fhfr.pm>
References: <Pine.LNX.4.44L0.1909041149390.1722-100000@iolanthe.rowland.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 4 Sep 2019, Alan Stern wrote:

> The syzbot fuzzer provoked a general protection fault in the
> hid-prodikeys driver:
> 
> kasan: CONFIG_KASAN_INLINE enabled
> kasan: GPF could be caused by NULL-ptr deref or user memory access
> general protection fault: 0000 [#1] SMP KASAN
> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc5+ #28
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:pcmidi_submit_output_report drivers/hid/hid-prodikeys.c:300  [inline]
> RIP: 0010:pcmidi_set_operational drivers/hid/hid-prodikeys.c:558 [inline]
> RIP: 0010:pcmidi_snd_initialise drivers/hid/hid-prodikeys.c:686 [inline]
> RIP: 0010:pk_probe+0xb51/0xfd0 drivers/hid/hid-prodikeys.c:836
> Code: 0f 85 50 04 00 00 48 8b 04 24 4c 89 7d 10 48 8b 58 08 e8 b2 53 e4 fc  
> 48 8b 54 24 20 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f  
> 85 13 04 00 00 48 ba 00 00 00 00 00 fc ff df 49 8b
> 
> The problem is caused by the fact that pcmidi_get_output_report() will
> return an error if the HID device doesn't provide the right sort of
> output report, but pcmidi_set_operational() doesn't bother to check
> the return code and assumes the function call always succeeds.
> 
> This patch adds the missing check and aborts the probe operation if
> necessary.
> 
> Reported-and-tested-by: syzbot+1088533649dafa1c9004@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: <stable@vger.kernel.org>

Applied, thanks a lot Alan.

-- 
Jiri Kosina
SUSE Labs

