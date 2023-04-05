Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE786D8499
	for <lists+linux-input@lfdr.de>; Wed,  5 Apr 2023 19:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjDERLm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Apr 2023 13:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbjDERLl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Apr 2023 13:11:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A756E268B;
        Wed,  5 Apr 2023 10:11:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 40D3A63B8D;
        Wed,  5 Apr 2023 17:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553A9C433EF;
        Wed,  5 Apr 2023 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680714687;
        bh=+zyZst7SV5qhrY992xxhoKrB2yqIXXTFRpPQnZoUrAs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uiUpSCl7jEpioiVY3TxwZEfWs3AQKErIPE/OmjBZZnXAflH29ZFy9XRSlWEn7PSEP
         ep50L97az00XXqWzNNv54Ik0VBZB4q4SfA/NFUc+W3ush5peZc9Z/J5aUxdoC28ih3
         iTG86g65GHWSiJj0AjF4CAr2m8ZEpYVOKSzVfDHE=
Date:   Wed, 5 Apr 2023 19:11:25 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] USB: core: Fix docs warning caused by wireless_status
 feature
Message-ID: <2023040507-revenge-universal-3247@gregkh>
References: <20230405091157.35056-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405091157.35056-1-hadess@hadess.net>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 05, 2023 at 11:11:57AM +0200, Bastien Nocera wrote:
> Fix wrongly named 'dev' parameter in doc block, should have been iface:
> drivers/usb/core/message.c:1939: warning: Function parameter or member 'iface' not described in 'usb_set_wireless_status'
> drivers/usb/core/message.c:1939: warning: Excess function parameter 'dev' description in 'usb_set_wireless_status'
> 
> And fix missing struct member doc in kernel API, and reorder to
> match struct:
> include/linux/usb.h:270: warning: Function parameter or member 'wireless_status_work' not described in 'usb_interface'
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 0a4db185f078 ("USB: core: Add API to change the wireless_status")
> ---
>  drivers/usb/core/message.c | 2 +-
>  include/linux/usb.h        | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
