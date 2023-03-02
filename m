Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE616A851D
	for <lists+linux-input@lfdr.de>; Thu,  2 Mar 2023 16:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjCBP16 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Mar 2023 10:27:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjCBP1k (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Mar 2023 10:27:40 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0D08330EA9
        for <linux-input@vger.kernel.org>; Thu,  2 Mar 2023 07:27:38 -0800 (PST)
Received: (qmail 251323 invoked by uid 1000); 2 Mar 2023 10:27:38 -0500
Date:   Thu, 2 Mar 2023 10:27:38 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: [PATCH v3 4/6] USB: core: Add wireless_status sysfs attribute
Message-ID: <ZADAamF1S7OrwRIO@rowland.harvard.edu>
References: <20230302105555.51417-1-hadess@hadess.net>
 <20230302105555.51417-4-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302105555.51417-4-hadess@hadess.net>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
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

For parts 4 and 5:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

