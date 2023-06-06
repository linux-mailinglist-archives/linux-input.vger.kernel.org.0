Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF4FA723B05
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 10:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235195AbjFFIJL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 04:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235057AbjFFIJK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 04:09:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E0A197
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686038903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=C3WImzMMIy/+euBBzL0YKACBrtfSAIGcyz6zFj7th9k=;
        b=WmSDgMDTkJ/dKIzXvW6P3k99MxpTHHDSKQwxhBgnId0bjHbVRZpQyGYB5VB0gnSEp1iC2D
        5PwXXEKw+haWNU2XxHlXtx7zu0txbG9FBF6oOwSyrOp1VX+DNz2X1ZwO8WmVr7+jHf6Orz
        8ol0zf8qgZ75/tGJfVUQh+GNJ1uyfhM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-T4oP3m_IPsmwOwMkgrf5bg-1; Tue, 06 Jun 2023 04:08:19 -0400
X-MC-Unique: T4oP3m_IPsmwOwMkgrf5bg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2CE2101A52C;
        Tue,  6 Jun 2023 08:08:18 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.224.77])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 631992166B27;
        Tue,  6 Jun 2023 08:08:16 +0000 (UTC)
Date:   Tue, 6 Jun 2023 10:08:13 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Malte Starostik <malte@starostik.de>,
        basavaraj.natikar@amd.com, linux-input@vger.kernel.org,
        linux@hexchain.org, stable@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: amd_sfh driver causes kernel oops during boot
Message-ID: <aci7a4jnosozypn6sffsdoaezg4p42zgjy5dwnjyvnbav7chdm@wettfjwb4enw>
References: <ZG3ipauL9FTnQJiC@debian.me>
 <3250319.ancTxkQ2z5@zen>
 <ZH6buB8TcMd5aT_1@debian.me>
 <46d5acd2-5961-a496-4c1a-68e5c47021fb@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46d5acd2-5961-a496-4c1a-68e5c47021fb@leemhuis.info>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Jun 06 2023, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
> On 06.06.23 04:36, Bagas Sanjaya wrote:
> > On Mon, Jun 05, 2023 at 01:24:25PM +0200, Malte Starostik wrote:
> >> Hello,
> >>
> >> chiming in here as I'm experiencing what looks like the exact same issue, also 
> >> on a Lenovo Z13 notebook, also on Arch:
> >> Oops during startup in task udev-worker followed by udev-worker blocking all 
> >> attempts to suspend or cleanly shutdown/reboot the machine - in fact I first 
> >> noticed because the machine surprised with repeatedly running out of battery 
> >> after it had supposedly been in standby but couldn't. Only then I noticed the 
> >> error on boot.
> >>
> >> bisect result:
> >> 904e28c6de083fa4834cdbd0026470ddc30676fc is the first bad commit
> >> commit 904e28c6de083fa4834cdbd0026470ddc30676fc
> >> Merge: a738688177dc 2f7f4efb9411
> >> Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >> Date:   Wed Feb 22 10:44:31 2023 +0100
> >>
> >>     Merge branch 'for-6.3/hid-bpf' into for-linus
> > 
> > Hmm, seems like bad bisect (bisected to HID-BPF which IMO isn't related
> > to amd_sfh). Can you repeat the bisection?
> 
> Well, amd_sfh afaics apparently interacts with HID (see trace earlier in
> the thread), so it's not that far away. But it's a merge commit, which
> is possible, but doesn't happen every day. So a recheck might really be
> a good idea.

Let's not rule out that there is a bad interaction between HID-BPF and
AMD SFH. HID-BPF is able to process any incoming HID event, whether it
comes from AND SFH, USB, BT, I2C or anything else.

However, looking at the stack trace in the initial report[0], it seems
we are getting the oops/stack traces while we are still in amd_sfh:

list_add corruption. next is NULL.
WARNING: CPU: 5 PID: 433 at lib/list_debug.c:25 __list_add_valid+0x57/0xa0
...
RIP: 0010:__list_add_valid+0x57/0xa0
...
Call Trace:
  <TASK>
  amd_sfh_get_report+0xba/0x110 [amd_sfh 78bf82e66cdb2ccf24cbe871a0835ef4eedddb17]
...

If HID-BPF were involved, we should see a call to hid_input_report() IMO.
Also AMD SFH calls hid_input_report() in a workqueue, so I would expect
a different stack trace.

I have a suspicion on commit 7bcfdab3f0c6 ("HID: amd_sfh: if no sensors are enabled,
clean up") because the stack trace says that there is a bad list_add,
which could happen if the object is not correctly initialized.

However, that commit was present in v6.2, so it might not be that one.

Back to the merge commit: the hid-bpf tree was merged in the hid tree
while it took its branch during the v6.1 cycle. So that might be the
reason you get this as a result of bisection because the AMD SFH code in
the hid-bpf branch is the one from the v6.1 kernel, and when you merge
it to the v6.2+ branch, you get a different code for that driver.

Cheers,
Benjamin

[0] https://lore.kernel.org/regressions/f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org/#t

