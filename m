Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A501E1503C7
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2020 11:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgBCKCX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Feb 2020 05:02:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:60106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727027AbgBCKCX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Feb 2020 05:02:23 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B537D20661;
        Mon,  3 Feb 2020 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580724143;
        bh=ahQQuLeVqRAeyXyZkeWfDPhMHbc2ezc3Vjb5QoYyF+k=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Tfo8yOtgWCScFhAUIo507L4tR5sodkhhjKX+bgYWpvA0Xi32rVKt/i1vj5gUNRRO5
         cr0vi1oixVnXC87JDZeTag6rAmtywF6govCz45tjSBUCpAmTqbZBiu1Whj/+Po/YV+
         3R/bVh61Mh3QOuOMQK7mgAIhcXYal1VLM7H3+0mo=
Date:   Mon, 3 Feb 2020 11:02:19 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
cc:     Martyn Welch <martyn@welchs.me.uk>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Conn O'Griofa <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
In-Reply-To: <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2002031100500.31058@cbobk.fhfr.pm>
References: <20200126194513.6359-1-martyn@welchs.me.uk> <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com> <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk> <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 28 Jan 2020, Roderick Colenbrander wrote:

> Let me explain the situation a little bit better from our angle. These 
> devices exist and from the Linux community perspective of course they 
> should see some level of support. And as I said since this is PS3 
> generation I don't have much of a concern.
> 
> Where it becomes tricky for any company in our situation is the support 
> side. We don't know these devices and don't have access to datasheets or 
> anything, but when such code is in our "official driver" it means we 
> have to involve them in our QA process and support them in some manner 
> (kind of legitimizing their existence as well). We now support this 
> driver in a large capacity (pretty much all mobile devices will start 
> shipping it) it puts challenges on our partners (not a big issue since 
> just PS3 right now).
> 
> As you can see this creates an awkward situation. I'm sure there other 
> such devices as well e.g. counterfeit Logitech keyboards, USB serial 
> adapters and other periperhals with similar challenges. In an ideal 
> world the support would live in another driver, but since in case of 
> this "fake" PS3 controller it "share" our product / vendor ids it is 
> tricky. At this point there is not a strong enough case yet to augment 
> the "hid-quirks" to do so, but perhaps if it became a serious issue 
> (e.g. for newer controllers) maybe we need to think of something.

If this is a big issue for you, one possible way around it would be 
creating a module parameter which would tell the driver whether it should 
those "fake" devices, and you can then turn it off in your products (or we 
can of course start the "what should the default setting me" bikeshedding 
:) ).

Thanks,

-- 
Jiri Kosina
SUSE Labs

