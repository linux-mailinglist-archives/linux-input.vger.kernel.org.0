Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3182EF37B
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 14:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbhAHNwz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 08:52:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:41498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbhAHNwz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 Jan 2021 08:52:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DD32239EB;
        Fri,  8 Jan 2021 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610113934;
        bh=LBVqpp59oazR+XXSXEg2T0WByDOyqaIigbRhTWw/8ts=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=A/gZfHwh59YAAQfXYrIx3qpK37jgzAvd0kegt5+VGRhq4U0mGr3jyRNvwcGbDE6hT
         YjQWwRao1Ev5QKnmi/hMsrdUXYd+w8Q5yBO8BtuOEDNRBZKqXkw9VCD/N+YUrlfmqJ
         7kVEwdgyrgeDvLcIH8OJqt+MwZkL9IxIZOJ1bMzjOuy3tKiTFS0fr8Yae6oKVjgENF
         NLnQXUA0aQO70s4CoOrr4xudvHfp9DkjgTALuxb501si2iaXoqevly+FUUVLwNESaO
         FQhAkkWLsNEs4So7oLJGlv84504xc++35pcIIyiXLMq9lbXqY2eQjaL7kvqpJsC2nO
         rnn9V6oMhVPQA==
Date:   Fri, 8 Jan 2021 14:52:09 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     linux-kernel@vger.kernel.org,
        syzbot+1e911ad71dd4ea72e04a@syzkaller.appspotmail.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: core: detect and skip invalid inputs to snto32()
In-Reply-To: <20201217011221.25678-1-rdunlap@infradead.org>
Message-ID: <nycvar.YFH.7.76.2101081450590.13752@cbobk.fhfr.pm>
References: <20201217011221.25678-1-rdunlap@infradead.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 16 Dec 2020, Randy Dunlap wrote:

> Prevent invalid (0, 0) inputs to hid-core's snto32() function.
> 
> Maybe it is just the dummy device here that is causing this, but
> there are hundreds of calls to snto32(0, 0). Having n (bits count)
> of 0 is causing the current UBSAN trap with a shift value of
> 0xffffffff (-1, or n - 1 in this function).
> 
> Either of the value to shift being 0 or the bits count being 0 can be
> handled by just returning 0 to the caller, avoiding the following
> complex shift + OR operations:
> 
> 	return value & (1 << (n - 1)) ? value | (~0U << n) : value;
> 
> Fixes: dde5845a529f ("[PATCH] Generic HID layer - code split")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: syzbot+1e911ad71dd4ea72e04a@syzkaller.appspotmail.com
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org
> ---
>  drivers/hid/hid-core.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> --- lnx-510.orig/drivers/hid/hid-core.c
> +++ lnx-510/drivers/hid/hid-core.c
> @@ -1307,6 +1307,9 @@ EXPORT_SYMBOL_GPL(hid_open_report);
>  
>  static s32 snto32(__u32 value, unsigned n)
>  {
> +	if (!value || !n)
> +		return 0;
> +

Given the fact that this has been in the code basically since ever, we're 
probably fine, but it's good to have this fixed nevertheless. Applied 
conservatively to hid.git#for-5.12/core.

Thanks,

-- 
Jiri Kosina
SUSE Labs

