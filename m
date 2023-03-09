Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6256B2690
	for <lists+linux-input@lfdr.de>; Thu,  9 Mar 2023 15:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbjCIORu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Mar 2023 09:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjCIORt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Mar 2023 09:17:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FC31557B;
        Thu,  9 Mar 2023 06:17:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B9CAA61B9D;
        Thu,  9 Mar 2023 14:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B931BC433D2;
        Thu,  9 Mar 2023 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678371467;
        bh=UE+/UL4dnXXHOtu++8BEae2IhFM5xuC6SWKspM78pf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pfr7Yze7JaRPZFFAUpKafOkJGC0L3XDWmBIDU1YFxrjUcbBwm7UwglsTrjK06DxNK
         f7rbzrtgB6ZVhAi643xFDJ/Tw0NuBu6QMOvXbCBI/hjDvDDxmFQDSNJZqTMJLriUIK
         Ndh7VPq+InQ0YW+EWES96vl7XWnqZmEj71nP+V50=
Date:   Thu, 9 Mar 2023 15:17:44 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: [PATCH v3 4/6] USB: core: Add wireless_status sysfs attribute
Message-ID: <ZAnqiPkNYVh0RhvB@kroah.com>
References: <20230302105555.51417-1-hadess@hadess.net>
 <20230302105555.51417-4-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302105555.51417-4-hadess@hadess.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 02, 2023 at 11:55:53AM +0100, Bastien Nocera wrote:
> Add a wireless_status sysfs attribute to USB devices to keep track of
> whether a USB device that's comprised of a receiver dongle and an emitter
> device over a, most of the time proprietary, wireless link has its emitter
> connected or disconnected.
> 
> This will be used by user-space OS components to determine whether the
> battery-powered part of the device is wirelessly connected or not,
> allowing, for example:
> - upower to hide the battery for devices where the device is turned off
>   but the receiver plugged in, rather than showing 0%, or other values
>   that could be confusing to users
> - Pipewire to hide a headset from the list of possible inputs or outputs
>   or route audio appropriately if the headset is suddenly turned off, or
>   turned on
> - libinput to determine whether a keyboard or mouse is present when its
>   receiver is plugged in.
> 
> This is done at the USB interface level as:
> - the interface on which the wireless status is detected is sometimes
>   not the same as where it could be consumed (eg. the audio interface
>   on a headset dongle will still appear even if the headset is turned
>   off), and we cannot have synchronisation of status across subsystems.
> - this behaviour is not specific to HID devices, even if the protocols
>   used to determine whether or not the remote device is connected can
>   be HID.
> 
> This is not an attribute that is meant to replace protocol specific
> APIs, such as the ones available for WWAN, WLAN/Wi-Fi, or Bluetooth
> or any other sort of networking, but solely for wireless devices with
> an ad-hoc “lose it and your device is e-waste” receiver dongle.
> 
> The USB interface will only be exporting the wireless_status sysfs
> attribute if it gets set through the API exported in the next commit.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
> Updated commit message and documentation in v2 so that the commit
> doesn't need to reference older discussions.
> 
> Trimmed the width of the sysfs docs in v3.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
