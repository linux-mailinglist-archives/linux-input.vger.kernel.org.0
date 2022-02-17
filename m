Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE994BA44E
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 16:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232830AbiBQPZV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 10:25:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236472AbiBQPZU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 10:25:20 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 5AB982B101C
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 07:25:03 -0800 (PST)
Received: (qmail 821319 invoked by uid 1000); 17 Feb 2022 10:25:02 -0500
Date:   Thu, 17 Feb 2022 10:25:02 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dan Carpenter <dan.carpenter@oracle.com>, Greg KH <greg@kroah.com>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Salah Triki <salah.triki@gmail.com>,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        noralf@tronnes.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        tzimmermann@suse.de
Subject: Re: [PATCH] HID: elo: Fix refcount leak in elo_probe()
Message-ID: <Yg5ozvWf0T+NTWPz@rowland.harvard.edu>
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu>
 <000000000000d31cac05d7c4da7e@google.com>
 <YgcSbUwiALbmoTvL@rowland.harvard.edu>
 <CAD-N9QX6kTf-Fagz8W00KOM1REhoqQvfTckqZZttMcdSCHmSag@mail.gmail.com>
 <YgpqHEb1CuhIElIP@rowland.harvard.edu>
 <20220217080459.GB2407@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217080459.GB2407@kadam>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 17, 2022 at 11:04:59AM +0300, Dan Carpenter wrote:
> Salah sent a bunch of these.  The reasoning was explained in this email.
> 
> https://www.spinics.net/lists/kernel/msg4026672.html
> 
> When he resent the patch, Greg said that taking the reference wasn't
> needed so the patch wasn't applied.  (Also it had the same reference
> leak so that's a second reason it wasn't applied).

Indeed, the kerneldoc for usb_get_intf() does say that each reference 
held by a driver must be refcounted.  And there's nothing wrong with 
doing that, _provided_ you do it correctly.

But if you know the extra refcount will never be needed (because the 
reference will be dropped before the usb_interface in question is 
removed), fiddling with the reference count is unnecessary.  I guess 
whether or not to do it could be considered a matter of taste.

On the other hand, it wouldn't hurt to update the kerneldoc for 
usb_get_intf() (and usb_get_dev() also).  We could point out that if a 
driver does not access the usb_interface structure after its disconnect 
routine returns, incrementing the refcount isn't mandatory.

Greg, any opinion on this?

Alan Stern
