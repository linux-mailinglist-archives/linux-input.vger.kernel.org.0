Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84478598569
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 16:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245666AbiHROI1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 10:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245692AbiHROIC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 10:08:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59754B95BB
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 07:07:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D8B01B821B9
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 14:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E91C433C1;
        Thu, 18 Aug 2022 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660831673;
        bh=wwQbPzxmM1FMN0pQRZ791Q6ShIDuY/89gExkK73VhCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JWCHrYxnwEM8prcxstPUzPLvTyP/cD/jfZ4xOnc5aqkucrDEXNTsSaRROfVQaFU8a
         yHpervOosaSNj3QRVmVUPKoQWzn0+cGDkWCJ+ghUyNYwGCckCNH2e+cuxrAqJ44X6c
         MJtXsvFYNDq6fMug7B6xWnJGERyyf32kdrfg7faM=
Date:   Thu, 18 Aug 2022 16:07:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Santosh De Massari <s.demassari@gmail.com>
Subject: Re: [PATCH 3/4] Input: xpad - Poweroff XBOX360W on mode button long
 press
Message-ID: <Yv5HtxHENy68jZ1F@kroah.com>
References: <20220818130021.487410-1-rojtberg@gmail.com>
 <20220818130021.487410-4-rojtberg@gmail.com>
 <Yv46iY/C8RH/+UIe@kroah.com>
 <081aefd6-9f79-a4ca-920d-7ebb7e5f9030@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <081aefd6-9f79-a4ca-920d-7ebb7e5f9030@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 18, 2022 at 03:53:01PM +0200, Pavel Rojtberg wrote:
> Am 18.08.22 um 15:11 schrieb Greg KH:
> > On Thu, Aug 18, 2022 at 03:00:20PM +0200, Pavel Rojtberg wrote:
> >> From: Santosh De Massari <s.demassari@gmail.com>
> >>
> >> Newer gamepads turn themselves off when the mode button is held down.
> >> For XBOX360W gamepads we must do this in the driver.
> >>
> >> Do not use BIT() macro for consistency within the file.
> > 
> > You can fix the file up to properly use the BIT() macro :)
> > 
> > thanks,
> > 
> > greg k-h
> 
> That change should be a separate patch anyway, no?

Yes.

> Can we postpone this to the next patch series?

Sure, it's just not good to keep postponing it to allow you to keep
having to justify not using it in new changes.

thanks,

greg k-h
