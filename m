Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39BFA4BA0ED
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 14:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240819AbiBQNVY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 08:21:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240720AbiBQNVX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 08:21:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393062AED8C;
        Thu, 17 Feb 2022 05:21:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DC791B82194;
        Thu, 17 Feb 2022 13:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE9EC340E8;
        Thu, 17 Feb 2022 13:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645104066;
        bh=SY5RUvNkbQo3lPMYQ3jF0zI45bXNW8TFyU399aFhlww=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rRrdGrEa9qmFMoAMY0FVGuT3TXSOR8+SyBucwyrqQ/t7aQo0RlSFgNyC/ND5FSpW4
         NObEmOc1xXekcO59IKdeQvSVDKM01hyH/75W/fFk9TXvdDFDbpfvvg+0PeDLb4E+53
         urqWUBTeOYxOCyRiB/jgdr3FI+Ad0W4o/wVtCw56EqsYnxMarRwzv0z1x2qV/FZ7uW
         VdPsWjwnYf6SAfd0E7MTDeZ6l22+sVWr/ezqBDXDEAFBI1pec6iX6KTs1XYsAuR9S2
         8r8i0KnBZywJ0HvaCBu3N2GnP8GksBIDKnuUG1WWszZQMzZgZeIWqSqBj2e4sCUBSD
         FSxqbfwfk7ZVA==
Date:   Thu, 17 Feb 2022 14:21:02 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Alan Stern <stern@rowland.harvard.edu>,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        Salah Triki <salah.triki@gmail.com>,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-usb@vger.kernel.org, noralf@tronnes.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        tzimmermann@suse.de
Subject: Re: [PATCH] HID: elo: Fix refcount leak in elo_probe()
In-Reply-To: <20220217080459.GB2407@kadam>
Message-ID: <nycvar.YFH.7.76.2202171420080.11721@cbobk.fhfr.pm>
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu> <000000000000d31cac05d7c4da7e@google.com> <YgcSbUwiALbmoTvL@rowland.harvard.edu> <CAD-N9QX6kTf-Fagz8W00KOM1REhoqQvfTckqZZttMcdSCHmSag@mail.gmail.com> <YgpqHEb1CuhIElIP@rowland.harvard.edu>
 <20220217080459.GB2407@kadam>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 17 Feb 2022, Dan Carpenter wrote:

> > The refcount was added less than a year ago by Salah Triki in commit 
> > fbf42729d0e9 ("HID: elo: update the reference count of the usb device 
> > structure"), but the commit message doesn't explain why it is 
> > necessary.  There certainly isn't any obvious reason for it; the driver 
> > doesn't release any references after elo_remove() returns and we know 
> > that the usb_device structure won't be deallocated before the driver 
> > gets unbound.
> 
> Salah sent a bunch of these.  The reasoning was explained in this email.
> 
> https://www.spinics.net/lists/kernel/msg4026672.html
> 
> When he resent the patch, Greg said that taking the reference wasn't
> needed so the patch wasn't applied.  (Also it had the same reference
> leak so that's a second reason it wasn't applied).

Sorry for late response, I've been away for a week. I have now queued 
revert of all this mess and will be sending it to Linus for 5.17 still. 
Thanks everybody for reporting.

-- 
Jiri Kosina
SUSE Labs

