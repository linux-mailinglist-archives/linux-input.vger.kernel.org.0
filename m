Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F508598568
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 16:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245016AbiHROH6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 10:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245644AbiHROHb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 10:07:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8F8754B4
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 07:07:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E72D6170A
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 14:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E75CC433D6;
        Thu, 18 Aug 2022 14:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660831637;
        bh=aTkYuW8eGF5gN3d3VegeLnlwLbS/U2ee2/6G86Bg+RI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zJ3+0KABFL6VZimsSw9Gm9bmQ3gxsSoQFKd5YU9EFNNkyLOTHTSKk9aJEaefs8Tao
         qtb8xP2EaeXOxdbMkVv/vKHktscKFU65XgQogbOezy/d11ffmYY5+M7hhnSi2TUAbK
         1utqH5pX5Ut5Ph3vD8AgJWWdgNMjmZLwuCJXXazQ=
Date:   Thu, 18 Aug 2022 16:07:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Cameron Gutman <aicommander@gmail.com>
Subject: Re: [PATCH 2/4] Input: xpad - fix wireless 360 controller breaking
 after suspend
Message-ID: <Yv5Hk7+8TY+SETlc@kroah.com>
References: <20220818130021.487410-1-rojtberg@gmail.com>
 <20220818130021.487410-3-rojtberg@gmail.com>
 <Yv46XUD1/Kx9cGcy@kroah.com>
 <69d7663a-eaab-124b-4e68-83567c79c56f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69d7663a-eaab-124b-4e68-83567c79c56f@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 18, 2022 at 03:51:55PM +0200, Pavel Rojtberg wrote:
> Am 18.08.22 um 15:10 schrieb Greg KH:
> > On Thu, Aug 18, 2022 at 03:00:19PM +0200, Pavel Rojtberg wrote:
> >> From: Cameron Gutman <aicommander@gmail.com>
> >>
> >> Suspending and resuming the system can sometimes cause the out
> >> URB to get hung after a reset_resume. This causes LED setting
> >> and force feedback to break on resume. To avoid this, just drop
> >> the reset_resume callback so the USB core rebinds xpad to the
> >> wireless pads on resume if a reset happened.
> >>
> >> A nice side effect of this change is the LED ring on wireless
> >> controllers is now set correctly on system resume.
> >>
> >> Signed-off-by: Cameron Gutman <aicommander@gmail.com>
> >> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> >> ---
> >>  drivers/input/joystick/xpad.c | 1 -
> >>  1 file changed, 1 deletion(-)
> > 
> > What commit id does this fix?  Should it go to stable kernels?
> > 
> > thanks,
> > 
> > greg k-h
> 
> this is a fixup for 4220f7db1e424f2a086ad41217b5770cc9f003a9.

Great, can you resend and add the Fixes: tag for it like:
	Fixes: 4220f7db1e42 ("Input: xpad - workaround dead irq_out after suspend/ resume")

> It should be applied to stable kernels, too.

Great, it needs a stable tag too.

thanks,

greg k-h
