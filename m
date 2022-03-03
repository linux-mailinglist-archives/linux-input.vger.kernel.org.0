Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23B204CBF44
	for <lists+linux-input@lfdr.de>; Thu,  3 Mar 2022 14:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbiCCN6j convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 3 Mar 2022 08:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbiCCN6h (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Mar 2022 08:58:37 -0500
Received: from omta013.useast.a.cloudfilter.net (omta013.useast.a.cloudfilter.net [34.195.253.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA5B1262D
        for <linux-input@vger.kernel.org>; Thu,  3 Mar 2022 05:57:46 -0800 (PST)
Received: from cxr.smtp.a.cloudfilter.net ([10.0.17.148])
        by cmsmtp with ESMTP
        id Pl0KnXkllpH1APlxhneO5G; Thu, 03 Mar 2022 13:57:45 +0000
Received: from cameron-pc ([68.0.59.20])
        by cmsmtp with ESMTPA
        id PlxdnYBHeCmoTPlxhnKTpk; Thu, 03 Mar 2022 13:57:45 +0000
Authentication-Results: cox.net; auth=pass (LOGIN)
 smtp.auth=cameronghall@cox.net
X-Authority-Analysis: v=2.4 cv=BbbLb5h2 c=1 sm=1 tr=0 ts=6220c959
 a=YRu6w0iJ0PLxWKpWPKeGRw==:117 a=YRu6w0iJ0PLxWKpWPKeGRw==:17
 a=IkcTkHD0fZMA:10 a=kviXuzpPAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=7yEQ1vLx07_7ltKuTs0A:9 a=QEXdDO2ut3YA:10 a=fZcHpAbaKMsA:10
 a=uyq5RothENsA:10 a=qrIFiuKZe2vaD64auk6j:22 a=AjGcO6oz07-iQ99wixmX:22
Date:   Thu, 3 Mar 2022 07:57:36 -0600
From:   Cameron <cameronghall@cox.net>
To:     linux-input@vger.kernel.org
Subject: Update: Wrong button mappings reported by evdev with PowerA
 Nintendo Switch gamepad
Message-ID: <20220303075736.5ea97dde@cameron-pc>
In-Reply-To: <51E98AD1-6622-4ED2-8C08-18F1AADC3838@cox.net>
References: <51E98AD1-6622-4ED2-8C08-18F1AADC3838@cox.net>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-CMAE-Envelope: MS4xfM9o+36ei/xM//d7Tbgr59+O3oYsjIju87MZG1YY4Yi2UMG+XoH+SitRFQb64AER5IoryP7AJmNDXeHL7+a3cauc6N0SQJGgDFNBAFYQJqPTSN+0lDoO
 aww3BAIpOx6Jvq/3vpSfsje5Mc+r/I9qXrUMD+yal5cENo2jf8RsFFl+Akc020MmLqqb8DoponvQiA==
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 02 Mar 2022 12:45:17 -0600
Cameron <cameronghall@cox.net> wrote:

> Hello all,
> 
> This is my first time reporting a kernel issue, so please let me know
> if this is not the right place to report it. I am using a third party
> PowerA USB wired Switch controller on Void Linux. Games and
> applications are able to successfully detect and use the controller,
> however the button mapping is very wrong in every program I have
> tested. I tested this with evtest-qt to see what button values evdev
> is reporting. Since there appears to be no way to remap these from
> userspace, I suspect the problem lies in the kernel driver.
> 
> Pressing the two analog sticks (which should be BTN_THUMBL and
> BTN_THUMBR) incorrectly generate events for BTN_SELECT and BTN_START,
> and pressing the + and - buttons (which should be mapped to BTN_START
> and BTN_SELECT) instead result in BTN_TL2 and BTN_TR2 events.
> 
> The device in question (as reported by lsusb) is:
> Bus 001 Device 003: ID 20d6:a711 Core (Plus) Wired Controller
> and I am using kernel version 5.15.26_1 on Void Linux.
> 
> I understand that this gamepad is intended to be used with the
> Nintendo Switch console, so it may not be as HID compliant as, say, a
> Logitech. However the kernel has a standard for how these buttons are
> to be mapped, which the driver used for this gamepad appears to
> violate. https://www.kernel.org/doc/html/v4.13/input/gamepad.html
> Section 4.3 states: "All new gamepads are supposed to comply with
> this mapping. Please report any bugs, if they don’t."
> 
> I can provide more info if needed.
> 
> Thanks,
> Cameron

So, here's an update on this situation. I managed to hack around
this situation by writing a simple kernel module to override the button
mapping for this device. The code for the module can be found on my
GitHub here:
https://gist.github.com/camthesaxman/af7099505103a555518741b4083eaea8
I have almost zero experience with kernel development, so I don't know
how this kind of thing would be properly fixed in-tree (perhaps
something with hid-quirks.c?) and make a proper patch for the kernel.

Thanks,
Cameron
