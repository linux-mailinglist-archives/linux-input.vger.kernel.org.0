Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F856D84A0
	for <lists+linux-input@lfdr.de>; Wed,  5 Apr 2023 19:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjDERNU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Apr 2023 13:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDERNT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Apr 2023 13:13:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276A518E;
        Wed,  5 Apr 2023 10:13:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B160C62922;
        Wed,  5 Apr 2023 17:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C005AC433D2;
        Wed,  5 Apr 2023 17:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680714796;
        bh=dR9SWdpKW00rWV/VhdSHnHKFemxp6AH7JYR6NVeQXt0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LIaZ2yzutmGQx0xjggoYeYp3TJlZJRhYxOskHAXPJLzy+A1UFYfew9LRxG3lJBmzT
         r7rW20EyG+hhZP0lNbGVV2cZfpvKD8YO7dYvsJpvzzw/KulLbJ2myhmaPkz9xr3DxD
         B2BGv+q5X3HLCU8Ux69tDbqKQCNF6M1NneYhFki0=
Date:   Wed, 5 Apr 2023 19:13:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] USB: core: Fix docs warning caused by wireless_status
 feature
Message-ID: <2023040554-obscurity-latter-b12b@gregkh>
References: <20230405092754.36579-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405092754.36579-1-hadess@hadess.net>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 05, 2023 at 11:27:54AM +0200, Bastien Nocera wrote:
> Fix wrongly named 'dev' parameter in doc block, should have been iface:
> drivers/usb/core/message.c:1939: warning: Function parameter or member 'iface' not described in 'usb_set_wireless_status'
> drivers/usb/core/message.c:1939: warning: Excess function parameter 'dev' description in 'usb_set_wireless_status'
> 
> And fix missing struct member doc in kernel API, and reorder to
> match struct:
> include/linux/usb.h:270: warning: Function parameter or member 'wireless_status_work' not described in 'usb_interface'
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Link: https://lore.kernel.org/linux-next/20230405114807.5a57bf46@canb.auug.org.au/T/#t
> Fixes: 0a4db185f078 ("USB: core: Add API to change the wireless_status")

I do not see that git commit id anywhere, where is it from?  What tree?

Ah, input tree, not much I can do there...

thanks,

greg k-h
