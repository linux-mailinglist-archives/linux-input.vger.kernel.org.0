Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68EC75F2B9D
	for <lists+linux-input@lfdr.de>; Mon,  3 Oct 2022 10:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbiJCIWj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 3 Oct 2022 04:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbiJCIWD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Oct 2022 04:22:03 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02AD24F65C
        for <linux-input@vger.kernel.org>; Mon,  3 Oct 2022 00:56:37 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 80E1C1BF214;
        Mon,  3 Oct 2022 07:55:55 +0000 (UTC)
Message-ID: <1fa677b0ead9daec4cedfdfe26194463aea043ae.camel@hadess.net>
Subject: Re: [PATCH] hid-logitech-hidpp: holdable_thumb_buttons parameter
 for Logitech MX Anywhere 3
From:   Bastien Nocera <hadess@hadess.net>
To:     Tim Schumacher <tim@tschumacher.net>, linux-input@vger.kernel.org
Cc:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>
Date:   Mon, 03 Oct 2022 09:55:54 +0200
In-Reply-To: <20db9bf2-e901-5021-c4b2-7b1e7759ba9c@tschumacher.net>
References: <20db9bf2-e901-5021-c4b2-7b1e7759ba9c@tschumacher.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.0 (3.46.0-2.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2022-10-03 at 00:36 +0200, Tim Schumacher wrote:
> On the Logitech MX Anywhere 3 the thumb buttons only activate on
> release.
> This is because the mouse also uses those buttons as modifiers to
> enable
> horizontal scrolling with the mouse wheel. This patch adds the
> holdable_thumb_buttons module parameter. Users who don't care about
> horizontal scrolling and want properly functioning thumb buttons can
> set
> this parameter. If it's set we use the feature 0x1b04 (special keys
> and
> mouse buttons) to divert thumb button events and handle them in
> software.
> 
> Signed-off-by: Tim Schumacher <tim@tschumacher.net>
> ---
> 
> Hi,
> 
> this is my first kernel patch, please be nice :)
> The reason this can't be done in user space with a tool like xmodmap
> (exception would be a user space driver) is that without making use
> of
> the 0x1b04 feature the mouse sends nothing whatsoever when the thumb
> buttons are pressed down so we can't handle those events. I
> discovered
> this because the thumb buttons felt unresponsive on my mouse and it's
> been bugging me since.
> 
> I'm not sure if other Logitech devices could benefit from this patch,
> something in the spirit of "thumb buttons only activate on release"
> has
> been said about the MX Master series mice on the Arch wiki but I'm
> not
> sure if this is true or if the patch would work as-is. Hope this is
> not
> too specific to get into the kernel.
> 
> <snip>
> +       { /* Mouse Logitech MX Anywhere 3 */
> +         LDJ_DEVICE(0x4090), .driver_data =
> HIDPP_QUIRK_CLASS_MX_ANYWHERE_3 },

As discussed in recent hid-logitech-hidpp related discussions, new
settings should be gated by asking the hardware whether it supports a
particular feature, rather than hardcoding device IDs.

See:

https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-6.1/logitech&id=908d325e1665b2781085580070554cbbe5fc3c89

As a sidenote, make sure to run your patches through checkpatch.pl, it
should warn you that C++ style comments aren't allowed.

You should also not use magic numbers (0x53/0x56) and define them as
constants instead.

>         { /* Keyboard logitech K400 */
>           LDJ_DEVICE(0x4024),
>           .driver_data = HIDPP_QUIRK_CLASS_K400 },

Looking forward to v2!
