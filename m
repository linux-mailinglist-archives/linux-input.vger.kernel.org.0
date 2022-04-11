Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1A64FBE06
	for <lists+linux-input@lfdr.de>; Mon, 11 Apr 2022 16:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346827AbiDKODE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Apr 2022 10:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346923AbiDKOCr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Apr 2022 10:02:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626AD31923;
        Mon, 11 Apr 2022 07:00:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DE9B761253;
        Mon, 11 Apr 2022 14:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCB9C385A4;
        Mon, 11 Apr 2022 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649685632;
        bh=deD3R4iI7HvK5x64Tnw8Uwt4gez6EDV/dTEjtiDSBSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=avou1tlb519HqrMj7nDgj3Tve9u0f7Hq+yuBNQduRWmKTVRKEeX8Sy5QtyizHjm91
         4C+fFNbMX99k2GYaMicIhkHohq49/9eEemTub3xYYBtGaLobYxOjFD2zh+rfWpJarI
         V1ayOqJlVDcE+RuhFOHKdtaKWm75y73pkbIQaApbKL9c5wFLH8RGM95qCp5FiD4td0
         ldF53gTPJTHPLtq0vju5T8jb3SPTDEHbwpTn9DKDv2CvKcDbzUrvkfPHNB+RHM735Y
         JcddRXb3CC88JqngQvkKY9yw2+F/Y/xN0UDzXPJZjtrWmIzu9amqxJdvm7NtldO2LV
         rpNCH2thWJnMg==
Received: by pali.im (Postfix)
        id 49FA6947; Mon, 11 Apr 2022 16:00:27 +0200 (CEST)
Date:   Mon, 11 Apr 2022 16:00:27 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Pearson <markpearson@lenovo.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Dell.Client.Kernel@dell.com,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Perry Yuan <Perry.Yuan@dell.com>
Subject: Re: [External] Re: Dell laptop touchpad disabling?
Message-ID: <20220411140027.wc325qdoprzjpuaj@pali>
References: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
 <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
 <225c5a10-59a8-d33e-abac-5fbb4341a6eb@lenovo.com>
 <efb7e4bd-a758-3d70-6967-78fa176055e5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efb7e4bd-a758-3d70-6967-78fa176055e5@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello!

On Monday 11 April 2022 15:48:48 Hans de Goede wrote:
> Hi Mark,
> 
> On 3/21/22 23:18, Mark Pearson wrote:
> > 
> > Apologies if this is thread hijacking...but I've got a similarish
> > problem on Lenovo laptops that we have on the todo list to investigate
> > so wanted to jump in with a somewhat related question...
> 
> No problem.
> 
> > On 3/18/22 04:54, Hans de Goede wrote:
> >>
> >> Regardless of the method, the kernel's responsibility here is
> >> to make sure the touchpad gets seen as a touchpad and after that
> >> "disabling" it is a userspace problem.
> >>
> > 
> > The issue on our platforms is that if you disable the touchpad in the
> > BIOS it doesn't actually disable the touchpad. It sets a flag in the EC
> > registers to let the OS know the touchpad is not supposed to be enabled
> > (I only just found out this is how it is supposed to work).
> 
> Interesting.
> 
> > I'm not 100% sure the reasons for this - I think it's to do with keeping
> > the trackpoint usable (maybe).
> 
> Yes that makes sense the trackpoint often sends its data to the touchpad
> which then muxes the trackpoint data into its own datastream as special
> trackpoint packets. So disabling the touchpad at the hw level would also
> disable the trackpoint in these kinda setups.

That is truth. And some kernel drivers are smart and try to de-mux these
packets and reports trackstick events via different input device as
touchpad input device. So via xinput it is possible to disable e.g.
touchpad while keeping trackstick working. This disable method is of
course Xserver specific and just instruct Xserver to ignore events on
one input device.

> > So just curious on the comment above - is there a standard way to let
> > user space know to ignore the touchpad or disable it by default?
> 
> Not yet, but we could define one. Or we could even try to see if
> a patch to drop all non trackpoint data inside the kernel when the
> flag is set would be accepted.
> 
> Someone needs to write the code for this though and if we want to let
> userspace know also define a userspace API. I think the all kernel
> solution might be the easiest to implement, but I'm not sure if this
> will be accepted by the input subsystem maintainer.

There is really no standard way...

> > I'm obviously being lazy here as I've been meaning to go and read code
> > but I was flicking thru the mailing list and this caught my eye....and
> > if there's a shortcut to the answer that would be awesome.
> > 
> > I've no idea if this is a Lenovo specific issue or more generic - but
> > this thread made me wonder if it's actually a common/standard problem?
> 
> This is the first time I have heard about this.
> 
> Regards,
> 
> Hans
> 

... and this not first time I read about this request. In past there was
request for Nokia N900 touchscreen driver and its userspace to disable
receiving events on opened touchscreen input device. External tool
monitored ambient light sensor and determined when phone was in pocket
and when not. And it needed to instruct kernel to not send touchscreen
events when phone was in pocket. IIRC at that time kernel for Nokia N900
had custom patch with custom API for enabling/disabling touchscreen.

This requirement is not exactly same as yours, but have common thing:
ability to enable / disable input device and report if device is
disabled or not.
