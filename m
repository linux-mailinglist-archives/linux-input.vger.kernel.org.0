Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3759D504FAD
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 14:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbiDRMG3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 08:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237971AbiDRMG2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 08:06:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEC617A88
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 05:03:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 080F2B80EC6
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 12:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538E0C385A7;
        Mon, 18 Apr 2022 12:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650283427;
        bh=/8LJX/wuI3Jzd2qUFWeh55drajjDj8qmqkMcLTV9CFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fk/ON0fQUtQs7pfPC5bpKK7jLH6nzGJtNW8guRH4KA1vRtSULrPwiYmzYjzRPkQTQ
         kl+0wfnH3hsqONTq0hK3MB/epFKwcb/pllnvrxyQU1eXlFQ/zS9u+RrDxQ4hvzsrx9
         nedzBzX1118BT1fhlRygrxup31zXSy8K53hNbKs8=
Date:   Mon, 18 Apr 2022 14:03:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v2 0/3] Input: xpad - sync with github fork
Message-ID: <Yl1ToPGOMqOR7Y3G@kroah.com>
References: <20220418114022.23673-1-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418114022.23673-1-rojtberg@gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 18, 2022 at 01:40:19PM +0200, Pavel Rojtberg wrote:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> This upstreams some changes contributed on github.
> The first patch merely updates the list of supported devices.
> Compared to github and v1, sorting of the lists is preserved.
> 
> The remaining patches improve xbox360w gamepad support.
> Those were verified by me, as I own that device.
> 
> Cameron Gutman (1):
>   Input: xpad - fix wireless 360 controller breaking after suspend
> 
> Pavel Rojtberg (1):
>   Input: xpad - add supported devices as contributed on github
> 
> Santosh De Massari (1):
>   Input: xpad - Poweroff XBOX360W on mode button long press
> 
>  drivers/input/joystick/xpad.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> -- 
> 2.25.1
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
