Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4038F6B268D
	for <lists+linux-input@lfdr.de>; Thu,  9 Mar 2023 15:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjCIORo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Mar 2023 09:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjCIORo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Mar 2023 09:17:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870EF4215;
        Thu,  9 Mar 2023 06:17:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 430B2B81F05;
        Thu,  9 Mar 2023 14:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDA1C433D2;
        Thu,  9 Mar 2023 14:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678371460;
        bh=U2L9Ekgd4hB+KhnyK9evmyvlEBztsljIX4EP4XtmtI4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tz3/8prC2QiN0cxQCoIE8eyYK1NGSe5d4Sz+8W3evmNRca05Uh61v9XuGLF69Cq6Q
         sASZ5hzjL3xnfngJ5bKp5WpeJGA90jrYCylLDDh0aW6+yiTvcXA//w1lB7YMtRWEjE
         ePJmXIK0l89g8I3tYXhMYXmcqhsuPNoTHK4ZUx/8=
Date:   Thu, 9 Mar 2023 15:17:37 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: [PATCH v3 5/6] USB: core: Add API to change the wireless_status
Message-ID: <ZAnqgWvszcy6nF1I@kroah.com>
References: <20230302105555.51417-1-hadess@hadess.net>
 <20230302105555.51417-5-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302105555.51417-5-hadess@hadess.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 02, 2023 at 11:55:54AM +0100, Bastien Nocera wrote:
> This adds the API that allows device specific drivers to tell user-space
> about whether the wireless device is connected to its receiver dongle.
> 
> See "USB: core: Add wireless_status sysfs attribute" for a detailed
> explanation of what this attribute should be used for.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
> Fixed locking/use-after-free in v2, thanks to Alan Stern
> 
> Fixed ordering of locking/put in v3, thanks to Alan Stern again
> 
>  drivers/usb/core/message.c | 40 ++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h        |  5 +++++
>  2 files changed, 45 insertions(+)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
