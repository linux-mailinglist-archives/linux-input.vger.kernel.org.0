Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2C44F12D7
	for <lists+linux-input@lfdr.de>; Mon,  4 Apr 2022 12:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347307AbiDDKOh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 4 Apr 2022 06:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240890AbiDDKOf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Apr 2022 06:14:35 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F3C26106
        for <linux-input@vger.kernel.org>; Mon,  4 Apr 2022 03:12:38 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 358DBC0003;
        Mon,  4 Apr 2022 10:12:36 +0000 (UTC)
Message-ID: <e987204d78c42ab3811d139daef43f9f31e65092.camel@hadess.net>
Subject: Re: Battery indication for Logitech devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
Cc:     Marcos Alano <marcoshalano@gmail.com>,
        HID CORE LAYER <linux-input@vger.kernel.org>
Date:   Mon, 04 Apr 2022 12:12:36 +0200
In-Reply-To: <CAE7qMrrOU4-qZZh_YoDXS__Xhh2cCJsnnJ-G245_ENrEEp0e3g@mail.gmail.com>
References: <CAO3Us=nJbw6haHuCg6ZTwamggRFfKuTncg2r9XwDxjv0-ocZtw@mail.gmail.com>
         <a2ccd37e20b210a1a35188c949d5658314a22c86.camel@archlinux.org>
         <CAE7qMrrOU4-qZZh_YoDXS__Xhh2cCJsnnJ-G245_ENrEEp0e3g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2022-04-04 at 09:10 +0200, Nestor Lopez Casado wrote:
> Hello,
> 
> I've got this from asking internally:
> 
> " The information should be accurate in both BAS and HIDPP
> interfaces.
> However, today the BAS interface is limited. Version  2.0 will be
> better but not yet released. As you have access to the HIDPP, I
> recommend using only this one. Like this, the type of connection can
> be ignored (BLE or USB dongle) "

As per the patch I just sent (HID: logitech-hidpp: Add Signature M650),
it will unfortunately be difficult to disable the battery reporting
directly from bluetoothd.

We can detect whether a Bluetooth device supports HID++, as it has a
GATT attribute with a Logitech specific UUID[1] (more info/specs
welcome), but not all the HID++ capable Bluetooth devices seem to be
detected by the kernel and they need to be added to a list.

Ideally, the kernel could enable HID++ support for all the Bluetooth
HID++-capable devices, and we could easily block reporting in upower or
bluetoothd without having to care at runtime about whether there's a
separate battery reporting interface because we could assume it was
always there.

Any ideas on how to do that?

[1]:
Device DE:1D:F3:3B:E4:B0 (random)
	Name: Logi M650
	Alias: Logi M650
	Appearance: 0x03c2
	Icon: input-mouse
	Paired: yes
	Trusted: yes
	Blocked: no
	Connected: no
	WakeAllowed: yes
	LegacyPairing: no
	UUID: Generic Access Profile    (00001800-0000-1000-8000-00805f9b34fb)
	UUID: Generic Attribute Profile (00001801-0000-1000-8000-00805f9b34fb)
	UUID: Device Information        (0000180a-0000-1000-8000-00805f9b34fb)
	UUID: Battery Service           (0000180f-0000-1000-8000-00805f9b34fb)
	UUID: Human Interface Device    (00001812-0000-1000-8000-00805f9b34fb)
	UUID: Logitech International SA (0000fd72-0000-1000-8000-00805f9b34fb)
	UUID: Vendor specific           (00010000-0000-1000-8000-011f2000046d)
	Modalias: usb:v046DpB02Ad0009
	ManufacturerData Key: 0x0006
	ManufacturerData Value:
  03 00 80                                         ...             
	ServiceData Key: 0000fd72-0000-1000-8000-00805f9b34fb
	ServiceData Value:
  10 01 01 2a b0 02 02 09                          ...*....        

