Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACF21598561
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 16:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245676AbiHROHQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 10:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245739AbiHROHA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 10:07:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225C891080
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 07:06:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 73354B821B0
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 14:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5260C433D6;
        Thu, 18 Aug 2022 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660831598;
        bh=T0zbEA0tCUcgghYH0VXCX1X2H+yGbTDrKtev8z058tQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IfTAsWuN/c1HdpdfYST8e+v+TEMDd3LM2PU29HUgAFXe+B9DhWcV2A4FPp5WLKl2e
         Dbe2iJ7cyjpt/tLmonhSq8hy6XYspXthKaKa6aau2S4uUPO7Tpn2Ztl/KDr6D3Hg+a
         G4UR5dVdP+zAOT7t7lZBX/aFhqW/vVoOyo2pW168=
Date:   Thu, 18 Aug 2022 16:06:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Jasper Poppe <jgpoppe@gmail.com>,
        Jeremy Palmer <jpalmer@linz.govt.nz>,
        Ruineka <ruinairas1992@gmail.com>,
        Cleber de Mattos Casali <clebercasali@gmail.com>,
        Kyle Gospodnetich <me@kylegospodneti.ch>
Subject: Re: [PATCH 1/4] Input: xpad - add supported devices as contributed
 on github
Message-ID: <Yv5HaxlBYktLYNl9@kroah.com>
References: <20220818130021.487410-1-rojtberg@gmail.com>
 <20220818130021.487410-2-rojtberg@gmail.com>
 <Yv46RSWwQDaHqE6f@kroah.com>
 <c174669d-8dbe-7849-59af-595f4a16288d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c174669d-8dbe-7849-59af-595f4a16288d@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 18, 2022 at 03:46:29PM +0200, Pavel Rojtberg wrote:
> Am 18.08.22 um 15:10 schrieb Greg KH:
> > On Thu, Aug 18, 2022 at 03:00:18PM +0200, Pavel Rojtberg wrote:
> >> From: Pavel Rojtberg <rojtberg@gmail.com>
> >>
> >> This is based on multiple commits at https://github.com/paroj/xpad
> >>
> >> Signed-off-by: Jasper Poppe <jgpoppe@gmail.com>
> >> Signed-off-by: Jeremy Palmer <jpalmer@linz.govt.nz>
> >> Signed-off-by: Ruineka <ruinairas1992@gmail.com>
> >> Signed-off-by: Cleber de Mattos Casali <clebercasali@gmail.com>
> >> Signed-off-by: Kyle Gospodnetich <me@kylegospodneti.ch>
> >> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> > 
> > Why not just submit the individual commits?
> > 
> > Also, should this be backported to stable kernels?
> > 
> > thanks,
> > 
> > greg k-h
> 
> I thought it would be easier to review them in bulk instead of many one-line patches.
> Nevertheless, I lost the individual commits while rebasing and it would be
> a PITA to reconstruct them from github.
> I will keep this mind for the next patch series though.
> 
> The changes are safe for backporting.

Ok, when you resend, can you mark it with a "cc: stable" tag as the
stable documentation asks for?  You can see how to do that if you read
this file:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

thanks,

greg k-h
