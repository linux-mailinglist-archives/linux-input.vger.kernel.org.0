Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02AD15983DB
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 15:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244913AbiHRNM4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 09:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244976AbiHRNMr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 09:12:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32587B2495
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:12:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B79E061614
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 13:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4AEC433D6;
        Thu, 18 Aug 2022 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660828363;
        bh=NBMuhqBxSxl/YKEgxBhz//gZLoVMytEAnfqunbq/CVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aHbdMJ2Lp3V70hKCPVspo4fHabzUPZtZbLOieuf3Vt2bAYFQYpbBBvuiTKUcZl+P1
         mpBxyn36vb9dPXwl39KyxvsClP/wPAqbpodAu22FjvaG3GWCNmkdALsvryBt/4CVwa
         fejHV95Cna3PVFvdSlnsa77CRD36h8EcOw3a3rf0=
Date:   Thu, 18 Aug 2022 15:12:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Christopher Crockett <chaorace@gmail.com>
Subject: Re: [PATCH 4/4] Input: xpad - add support for XBOX One Elite paddles
Message-ID: <Yv46yMHIi+utt7Xf@kroah.com>
References: <20220818130021.487410-1-rojtberg@gmail.com>
 <20220818130021.487410-5-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818130021.487410-5-rojtberg@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 18, 2022 at 03:00:21PM +0200, Pavel Rojtberg wrote:
> From: Christopher Crockett <chaorace@gmail.com>
> 
> An effort has been made to support every official model and firmware
> version I could track down info on. The following controllers _should_
> have working paddles with this PR:
> - Xbox Elite (**untested**)
> - Xbox Elite Series 2 on early firmwares (**untested**)
> - Xbox Elite Series 2 on v4 firmwares (Tested v4.8.1908.0)
> - Xbox Elite Series 2 on v5 pre-BLE firmwares (**untested**)
> - Xbox Elite Series 2 on v5 post-BLE firmwares (Tested v5.13.3143.0)
> 
> This patch also introduces correct handling for the Elite 1 controller
> and properly suppresses paddle inputs when using a custom profile slot.
> 
> Starting with firmware v5.11, certain inputs for the Elite 2 were moved
> to an extra packet that is not enabled by default.
> 
> We must first manually enable this extra packet in order to correctly
> process paddle input data with these later firmwares.
> 
> Signed-off-by: Christopher Crockett <chaorace@gmail.com>
> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 254 +++++++++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 193 insertions(+), 61 deletions(-)

Nice work, that's messy to figure out.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
