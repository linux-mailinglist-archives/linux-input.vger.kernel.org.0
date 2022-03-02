Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B154CADCA
	for <lists+linux-input@lfdr.de>; Wed,  2 Mar 2022 19:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234764AbiCBSqE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 2 Mar 2022 13:46:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236449AbiCBSqE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Mar 2022 13:46:04 -0500
Received: from omta016.useast.a.cloudfilter.net (omta016.useast.a.cloudfilter.net [34.195.253.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC77FD21EE
        for <linux-input@vger.kernel.org>; Wed,  2 Mar 2022 10:45:20 -0800 (PST)
Received: from cxr.smtp.a.cloudfilter.net ([10.0.17.210])
        by cmsmtp with ESMTP
        id PKphnnuMZIL0EPTySnSuwP; Wed, 02 Mar 2022 18:45:20 +0000
Received: from [192.168.1.121] ([68.0.59.20])
        by cmsmtp with ESMTPSA
        id PTyQnQRi6iF79PTyRnGbua; Wed, 02 Mar 2022 18:45:20 +0000
Authentication-Results: cox.net; auth=pass (PLAIN)
 smtp.auth=cameronghall@cox.net
X-Authority-Analysis: v=2.4 cv=W64r6Dak c=1 sm=1 tr=0 ts=621fbb40
 a=YRu6w0iJ0PLxWKpWPKeGRw==:117 a=YRu6w0iJ0PLxWKpWPKeGRw==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=fE2MirWBgZEC4VNGhVIA:9 a=QEXdDO2ut3YA:10
 a=fZcHpAbaKMsA:10 a=uyq5RothENsA:10 a=AjGcO6oz07-iQ99wixmX:22
Date:   Wed, 02 Mar 2022 12:45:17 -0600
User-Agent: K-9 Mail for Android
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Subject: Wrong button mappings reported by evdev with PowerA Nintendo Switch gamepad
To:     linux-input@vger.kernel.org
From:   Cameron <cameronghall@cox.net>
Message-ID: <51E98AD1-6622-4ED2-8C08-18F1AADC3838@cox.net>
X-CMAE-Envelope: MS4xfPjj//BbShm+/++eSEN4xefxpepBqntGOaOYm8Ok5ZAt0WacJI4XZSulnshJcXXlxThphkNqF8O59CLKLiB76sBC4f6F438ES9+Pk6Gb2CL0jGAnkXGs
 Kd0TYSIiNkIjkA0bXrcZWiRZBb1AuozOnSnoR68/drGdFJhFQJmSP9DLUJT5qAGXtfOqhWYFXBmkjg==
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello all,

This is my first time reporting a kernel issue, so please let me know if this is not the right place to report it. I am using a third party PowerA USB wired Switch controller on Void Linux. Games and applications are able to successfully detect and use the controller, however the button mapping is very wrong in every program I have tested. I tested this with evtest-qt to see what button values evdev is reporting. Since there appears to be no way to remap these from userspace, I suspect the problem lies in the kernel driver.

Pressing the two analog sticks (which should be BTN_THUMBL and BTN_THUMBR) incorrectly generate events for BTN_SELECT and BTN_START, and pressing the + and - buttons (which should be mapped to BTN_START and BTN_SELECT) instead result in BTN_TL2 and BTN_TR2 events.

The device in question (as reported by lsusb) is:
Bus 001 Device 003: ID 20d6:a711 Core (Plus) Wired Controller
and I am using kernel version 5.15.26_1 on Void Linux.

I understand that this gamepad is intended to be used with the Nintendo Switch console, so it may not be as HID compliant as, say, a Logitech. However the kernel has a standard for how these buttons are to be mapped, which the driver used for this gamepad appears to violate. https://www.kernel.org/doc/html/v4.13/input/gamepad.html
Section 4.3 states: "All new gamepads are supposed to comply with this mapping. Please report any bugs, if they don’t."

I can provide more info if needed.

Thanks,
Cameron
