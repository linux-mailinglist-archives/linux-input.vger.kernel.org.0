Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B4A6B4267
	for <lists+linux-input@lfdr.de>; Fri, 10 Mar 2023 15:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbjCJODE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Mar 2023 09:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbjCJOCo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Mar 2023 09:02:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5276D117583
        for <linux-input@vger.kernel.org>; Fri, 10 Mar 2023 06:02:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8AFA61552
        for <linux-input@vger.kernel.org>; Fri, 10 Mar 2023 14:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A2EDC433D2;
        Fri, 10 Mar 2023 14:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678456962;
        bh=Bg4GU5+ExAVQKhyeDYeLkMepGHbujFA2Pz/wujgoPbw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=eNuea4cvzDD9Sk9upyBE26gFoeUORvYkqsZfiKZ05Us9QE+gcFIBHZWGVJlejr2bl
         dNPB+fiR2JJ5ByVzuxabGOteEb+H43D/I1C0/pnrb4nMX4soJh3T/PG7lRwto0GlVR
         Jp8ZmrlIIKtO1aABPWix7Wm17i7/awV9Cjbftyi3wzgOnwnPijhMY5nkYi2N7odY65
         TUOf3xECSOgbVA+ylA5FuVnJBq/a6TpH0RFyqFWTNKGEOYw1ibdRa7QM0c0PnUhX3A
         kMxGZ2C4G+fTxiYlpw/udI7d+tVhU8eBbJdE7QvboMx/Yasx/EVi0s8xG0aVSDjn+D
         bZJgKCMdTDS/w==
Date:   Fri, 10 Mar 2023 15:02:44 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com
Subject: Re: [PATCH v0 0/2] HID: nintendo: avoid BT rumble disconnections
In-Reply-To: <20230203215119.435091-1-djogorchock@gmail.com>
Message-ID: <nycvar.YFH.7.76.2303101502330.1142@cbobk.fhfr.pm>
References: <20230203215119.435091-1-djogorchock@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 3 Feb 2023, Daniel J. Ogorchock wrote:

> The hid-nintendo driver has been plagued by an issue where rumble
> command traffic to bluetooth-connected controllers can cause frequent
> power downs of the controllers.
> 
> Digging into other pro controller driver implementations, I've not found
> anything that hid-nintendo is doing incorrectly. Some implementations
> seem to be working around the same problem (e.g. libsdl's hidapi
> implementation rate limits rumble commands to avoid the problem).
> 
> hid-nintendo already rate limits rumble control packets, but that does
> not solve the problem.
> 
> Using btmon output, I've fuond the the disconnections reliably occur
> shortly after the controller's reporting rate become erratic. The
> controller is meant to report input packets roughly every 15ms. Sending
> rumble commands can sometimes result in the input packets arriving in
> bursts/batches. Once the controller and/or BT stack enters this state,
> even halting rumble commands will never allow the reporting rate to
> recover to nominal. The controller will eventually disconnect.
> 
> This patch set strives to avoid the problematic scenario. It detects if
> input reports arrive at clearly incorrect deltas. During these times,
> the driver will hold off on transmitting any rumble commands to the
> controller. This approach has allowed the reporting rate to reliably
> recover in my testing. I've not been able to generate a controller
> disconnection during hours of testing games with frequent rumble.
> 
> The behavior of this mechanism is tunable using #defines. We may need to
> tweak/tune as the mitigation is used on different hardware setups.
> 
> My suspicion is that the core issue is somewhere in the bluez stack. My
> next step is to investigate that lead in more detail. This patchset at
> least allows for use of the controllers via bluetooth with rumble
> enabled without frequently disconnecting.
> 
> Daniel J. Ogorchock (2):
>   HID: nintendo: prevent rumble queue overruns
>   HID: nintendo: fix rumble rate limiter
> 
>  drivers/hid/hid-nintendo.c | 95 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 86 insertions(+), 9 deletions(-)

Now queued in hid.git#for-6.4/nintendo. Thanks,

-- 
Jiri Kosina
SUSE Labs

