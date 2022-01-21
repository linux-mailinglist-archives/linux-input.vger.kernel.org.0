Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA5D496257
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 16:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381691AbiAUPvV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 10:51:21 -0500
Received: from mail.zeus.flokli.de ([88.198.15.28]:38484 "EHLO zeus.flokli.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1381698AbiAUPvP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 10:51:15 -0500
Received: from localhost (ip-178-200-100-55.hsi07.unitymediagroup.de [178.200.100.55])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: flokli@flokli.de)
        by zeus.flokli.de (Postfix) with ESMTPSA id D6ED512770C7;
        Fri, 21 Jan 2022 15:51:12 +0000 (UTC)
Date:   Fri, 21 Jan 2022 16:51:12 +0100
From:   Florian Klink <flokli@flokli.de>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     ValdikSS <iam@valdikss.org.ru>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
Message-ID: <20220121155112.edcstwrcm5u27mnj@tp>
References: <20211216224611.440397-1-iam@valdikss.org.ru>
 <nycvar.YFH.7.76.2201061419420.16505@cbobk.fhfr.pm>
 <e9e1f6ce-f12c-291b-81a8-c76f72ee29f2@valdikss.org.ru>
 <20220121124116.cj6xtxvzw7rbkcs6@tp>
 <nycvar.YFH.7.76.2201211624150.28059@cbobk.fhfr.pm>
 <20220121152848.knyggraeu5w7xqkb@tp>
 <nycvar.YFH.7.76.2201211631010.28059@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2201211631010.28059@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

>> >> I tested the driver and it's a big improvement. I just sent a v3 with my
>> >> name in the Signed-Off-By field.
>> >
>> >Thanks. Where did you send it to? :) I don't seem to have it in my inbox.
>>
>> Message-Id 20220121123206.36978-1-flokli@flokli.de and following, it's
>> also visible on
>> https://lore.kernel.org/all/20220121123206.36978-1-flokli@flokli.de/
>
>I see; please always CC the maintainers of the code directly as well,
>otherwise the patch might fall in between cracks easily.

Oops, I forgot to copy the CC list again while invoking git send-email.

I now also bounced the three mails over to you manually.

Let me know if there's anything else left to be done :-)

-- 
Florian Klink
