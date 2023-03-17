Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 593DE6BF53A
	for <lists+linux-input@lfdr.de>; Fri, 17 Mar 2023 23:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCQWgG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 17 Mar 2023 18:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjCQWgF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Mar 2023 18:36:05 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25DC02B2AF
        for <linux-input@vger.kernel.org>; Fri, 17 Mar 2023 15:36:02 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 1F64440004;
        Fri, 17 Mar 2023 22:36:00 +0000 (UTC)
Message-ID: <d261279a47e43b3bc1c546a766a51e423c978066.camel@hadess.net>
Subject: Re: [PATCH] Fix incorrectly applied patch for MAP_PROFILE_BUTTON
From:   Bastien Nocera <hadess@hadess.net>
To:     Matthias Benkmann <matthias.benkmann@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Nate Yocom <nate@yocom.org>
Date:   Fri, 17 Mar 2023 23:36:00 +0100
In-Reply-To: <CAK4gqCBiDiVQ-q8x_JjZ4ZY5UKr81foA_aa5YwZsE0yFarBtzA@mail.gmail.com>
References: <CAK4gqCBiDiVQ-q8x_JjZ4ZY5UKr81foA_aa5YwZsE0yFarBtzA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Fri, 2023-03-17 at 17:00 +0100, Matthias Benkmann wrote:
> Original
>  patch can be seen here:
>  
> https://lore.kernel.org/all/20220908173930.28940-6-nate@yocom.org/ The
>  hunk
>  in question was supposed to go into xpad**ONE**_process_packet(),
> but ended
>  up in xpad_process_packet(). This fix is based on visual inspection
> only. I
>  do not have the hardware to verify that it works. I CAN confidently
> say,
>  however, that the old code could not possibly have worked, because

In the future, please don't use "old code", we don't know what "old
code" you could be referring to.

However you can remove this whole section, and either Nate or I will
test you v2.

> the
>  function xpad_process_packet() is not called for the Microsoft X-Box
> Adaptive
>  Controller since it is tagged as XTYPE_XBOXONE. So at least this fix
> does not
>  break something that worked.

You need to use a Fixes tag, as well as a Signed-off-by tag, as per:
https://docs.kernel.org/process/submitting-patches.html

Please send a v2 with those and make sure to CC: the folks mentioned in
the original patch (that is, Nate and myself), as well as the
maintainers of the tree in question.

Good catch!

Cheers

> 
> ---
>  drivers/input/joystick/xpad.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/joystick/xpad.c
> b/drivers/input/joystick/xpad.c
> index f642ec8e92dd..29131f1a2f06 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -781,9 +781,6 @@ static void xpad_process_packet(struct usb_xpad
> *xpad, u16 cmd, unsigned char *d
>   input_report_key(dev, BTN_C, data[8]);
>   input_report_key(dev, BTN_Z, data[9]);
> 
> - /* Profile button has a value of 0-3, so it is reported as an axis
> */
> - if (xpad->mapping & MAP_PROFILE_BUTTON)
> - input_report_abs(dev, ABS_PROFILE, data[34]);
> 
>   input_sync(dev);
>  }
> @@ -1061,6 +1058,10 @@ static void xpadone_process_packet(struct
> usb_xpad *xpad, u16 cmd, unsigned char
>   (__u16) le16_to_cpup((__le16 *)(data + 8)));
>   }
> 
> + /* Profile button has a value of 0-3, so it is reported as an axis
> */
> + if (xpad->mapping & MAP_PROFILE_BUTTON)
> + input_report_abs(dev, ABS_PROFILE, data[34]);
> +
>   /* paddle handling */
>   /* based on SDL's SDL_hidapi_xboxone.c */
>   if (xpad->mapping & MAP_PADDLES) {

