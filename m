Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCBAD5983D4
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 15:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244526AbiHRNLp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 09:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244862AbiHRNLo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 09:11:44 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAA260685
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:11:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7FA2CCE2052
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 13:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5845EC433D6;
        Thu, 18 Aug 2022 13:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660828299;
        bh=UeEBwtYdVcW8MGTiAlm79zj6Pdak+BrQZ+GM+wxaER0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QOyZjqv+Ndr5TdWO152lhD+v3d0kiNxajUsUNYUPUr/bASlSKnk/j3gst9pddXejB
         XuaB556HYhhnMTxX1DzqtuI2iua822O5gpF8yZixTFDZnFinzGRyfocAAs0yHE0KeL
         xiYbzYb7PmZgQGNhBaux5B6z+vAMQ/msRpRKTW5A=
Date:   Thu, 18 Aug 2022 15:11:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Santosh De Massari <s.demassari@gmail.com>
Subject: Re: [PATCH 3/4] Input: xpad - Poweroff XBOX360W on mode button long
 press
Message-ID: <Yv46iY/C8RH/+UIe@kroah.com>
References: <20220818130021.487410-1-rojtberg@gmail.com>
 <20220818130021.487410-4-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818130021.487410-4-rojtberg@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 18, 2022 at 03:00:20PM +0200, Pavel Rojtberg wrote:
> From: Santosh De Massari <s.demassari@gmail.com>
> 
> Newer gamepads turn themselves off when the mode button is held down.
> For XBOX360W gamepads we must do this in the driver.
> 
> Do not use BIT() macro for consistency within the file.

You can fix the file up to properly use the BIT() macro :)

thanks,

greg k-h
