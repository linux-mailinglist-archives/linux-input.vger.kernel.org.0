Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1D04C410F
	for <lists+linux-input@lfdr.de>; Fri, 25 Feb 2022 10:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237481AbiBYJPx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Feb 2022 04:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237233AbiBYJPw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Feb 2022 04:15:52 -0500
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4001B60B1;
        Fri, 25 Feb 2022 01:15:21 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id B9D425804B3;
        Fri, 25 Feb 2022 04:15:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 25 Feb 2022 04:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=WXyuD17PmhmoGYY0af4lhGHLO641jXk0/KyMPM
        1yNos=; b=rZjVXqujsO/tzbkd8A/z+VWjerlPxzXrBQMfpJQFht87nLkPqmVE++
        DdYoRv5dMqyE/uksn6/a1urpaNGxLsHEdYuBAhiwS5Ww4DzPsbNDs/TcuM2Uoy4O
        Twv84GC66p/SZYbuRQZNWedOQmRVtj1lkV1+lrTC/6Mwg1sznpQcJAfkgb5jpNbH
        Xd4+Am7hj2NC3KKgj1pIXW6n+XlnRkgJHH9GkxmThg9C+Zk0BIzvp6fk8MPrV/PP
        bAVymFbXg0F9fCFHniwfOVKQDux21A08+3JOWrRNP9jF4Tw8Drx52Sfmt3prnD4C
        xu/HO1ctAipuY3FR6/6idbHADLcSBxow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WXyuD17PmhmoGYY0a
        f4lhGHLO641jXk0/KyMPM1yNos=; b=NKSOcve51EqgyBVaRvQx3XCJjXH7ShuWG
        MfgqNZR4F7/TF+Nia/YQvdhP96cC3xxZeqJVtzfnIOFS+j+ejltAn+g46nnEJrzK
        z8wbPRN0EpK5PqUvsZ6s7ucHg80cJtWDs10DnTfuRLjxtTeT6qIugRax4BAjpHud
        MzyfW7+2YVtdFlzFypL8xNlMn77s4nJBBNgbUOoHrHPSG2BlbcbYjqSSyv1xfUwq
        XnxWaoNwEnRn6/2vJ/QnsaoHwPHygBUFh83aFkQCBH5dslfx2LzzQhvdew7fxTV8
        z+WU8agzRnvd8P20Upn38p7N2Jrkcel+am4OFVuu++7tATe9lfhOg==
X-ME-Sender: <xms:Jp4YYrFfHIIG2yFoZGdk-LqjZjHnxQN3DYK77q9PG-emYdLEJTdi0A>
    <xme:Jp4YYoXgL-FZGB2cpl9G-G97JC1BW30a6T89EYRK1Cs5TV3Cr71uvuIYncKZJdxLg
    uFKYeg5Ij12DA>
X-ME-Received: <xmr:Jp4YYtJuFi14U3gR7Xw3s9iBh0pw9UrvjufUix3T0-T0qGw7_DFjQ8ImmIg0BOhCLLOalzpLUqNHacOwlVI4_3uy6jw0Ukkx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggddtudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepudejledvie
    ejtddvfeejleejhfduffekvdevgeegvdeguefhjedugeeuudfhhedvnecuffhomhgrihhn
    pehsphhinhhitghsrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:Jp4YYpFHmeRH6zan_2Ws5_-RklLvqStOeH9bjMV-of6CUhBmOqSixQ>
    <xmx:Jp4YYhWDf__d5DlKRAjXpKy5UPBjR2e85srRqk2wdI6_1uxldjOPnQ>
    <xmx:Jp4YYkNKUueeJUFaHRCXFw2yQM-c4nMAvZicuFOLLP3bSnbqRbYC9g>
    <xmx:Jp4YYu28Co6pm_xg3Krm7wY0ai01De_tS2_tgd_38Gu3gqhMDhi6aw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 04:15:17 -0500 (EST)
Date:   Fri, 25 Feb 2022 10:15:15 +0100
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        Salah Triki <salah.triki@gmail.com>,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        noralf@tronnes.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        tzimmermann@suse.de
Subject: Re: [PATCH] HID: elo: Fix refcount leak in elo_probe()
Message-ID: <YhieIzbS0OLSZTdj@kroah.com>
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu>
 <000000000000d31cac05d7c4da7e@google.com>
 <YgcSbUwiALbmoTvL@rowland.harvard.edu>
 <CAD-N9QX6kTf-Fagz8W00KOM1REhoqQvfTckqZZttMcdSCHmSag@mail.gmail.com>
 <YgpqHEb1CuhIElIP@rowland.harvard.edu>
 <20220217080459.GB2407@kadam>
 <Yg5ozvWf0T+NTWPz@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yg5ozvWf0T+NTWPz@rowland.harvard.edu>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 17, 2022 at 10:25:02AM -0500, Alan Stern wrote:
> On Thu, Feb 17, 2022 at 11:04:59AM +0300, Dan Carpenter wrote:
> > Salah sent a bunch of these.  The reasoning was explained in this email.
> > 
> > https://www.spinics.net/lists/kernel/msg4026672.html
> > 
> > When he resent the patch, Greg said that taking the reference wasn't
> > needed so the patch wasn't applied.  (Also it had the same reference
> > leak so that's a second reason it wasn't applied).
> 
> Indeed, the kerneldoc for usb_get_intf() does say that each reference 
> held by a driver must be refcounted.  And there's nothing wrong with 
> doing that, _provided_ you do it correctly.
> 
> But if you know the extra refcount will never be needed (because the 
> reference will be dropped before the usb_interface in question is 
> removed), fiddling with the reference count is unnecessary.  I guess 
> whether or not to do it could be considered a matter of taste.
> 
> On the other hand, it wouldn't hurt to update the kerneldoc for 
> usb_get_intf() (and usb_get_dev() also).  We could point out that if a 
> driver does not access the usb_interface structure after its disconnect 
> routine returns, incrementing the refcount isn't mandatory.

That would be good to add to prevent this type of confusion in the
future.

thanks,

greg k-h
