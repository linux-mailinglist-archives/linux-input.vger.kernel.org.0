Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A6057C6E7
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 10:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232653AbiGUIxq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 21 Jul 2022 04:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbiGUIxq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 04:53:46 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4B37E836
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 01:53:44 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 8260710000B;
        Thu, 21 Jul 2022 08:53:42 +0000 (UTC)
Message-ID: <28d18d2f39fef4da00021d21cf2ccd7eb4a29ac9.camel@hadess.net>
Subject: Re: Stylus battery reported as having 1% charge even though fully
 charged
From:   Bastien Nocera <hadess@hadess.net>
To:     Sebastian Arnhold <sebastian.arnhold387@gmail.com>,
        linux-input@vger.kernel.org
Date:   Thu, 21 Jul 2022 10:53:41 +0200
In-Reply-To: <5d775fec-1c42-927b-affd-c9f7d3c602a8@gmail.com>
References: <5d775fec-1c42-927b-affd-c9f7d3c602a8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2022-07-19 at 11:38 +0200, Sebastian Arnhold wrote:
> Dear developers,
> 
> when using GNOME 42.3 on Wayland on my ASUS ExpertBook B5 Flip, it 
> reports my stylus battery to be stuck at 1% all the time, independent
> of 
> its actual charging status. This is also independent from the stylus
> I 
> use, as I've tried with two different ones.
> 
> The battery device registers as ELAN9008:00 04F3:2E12 in GNOME energy
> settings.
> 
> The GNOME developers helped me track the bug down to upower, as
> upower 
> itself shows the charging status to be stuck at 1%. The upower 
> developers then sent me here.
> 
> My kernel version is 5.18 on an x86_64 architecture on Fedora 36. My 
> upower version is 0.99.19.
> 
> Observed behaviour: Kernel reports 1% after pen is switched on and 
> touches the touchscreen for the first time. upower reports this to
> GNOME 
> which then throws a "Battery low"-warning message.
> Expected behaviour: Kernel reporting the correct charging percentage 
> from the pen to upower, or 0% if charging status cannot be
> determined. 
> The latter would be a workaround since 0% seems to be ignored by
> GNOME.
> 
> Can you help me to resolve this bug?

You'll probably want to implement a patch similar to this one:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3193ea1b6779023334faa72b214ece457e02656

Cheers
