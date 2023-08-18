Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF514781554
	for <lists+linux-input@lfdr.de>; Sat, 19 Aug 2023 00:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241380AbjHRWQf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Aug 2023 18:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241681AbjHRWQR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Aug 2023 18:16:17 -0400
Received: from MTA-13-4.privateemail.com (mta-13-4.privateemail.com [198.54.127.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643753C10
        for <linux-input@vger.kernel.org>; Fri, 18 Aug 2023 15:16:16 -0700 (PDT)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
        by mta-13.privateemail.com (Postfix) with ESMTP id DEDB418000A0
        for <linux-input@vger.kernel.org>; Fri, 18 Aug 2023 18:16:15 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=sewer56.dev;
        s=default; t=1692396975;
        bh=Ftd+jWKF7YeGaNgA9n7TbIcXJHFuCbPJg6uLQpnkbGc=;
        h=Date:To:From:Subject:From;
        b=lpd279xWDod9JkZ5RwbSDzNWfnUy2izuKPKr3AuoEw8MO2bO1AFQyPt86Zn9JTv6k
         tXVJmU5wSnz/zesvXSCJHH6cNcSaeQmf3NW2ZF5pe9iInz6JJ1AIuhG1H1NcsgZq6J
         HRra9o2vL0b6hp4a2cARuwrMUnhuVyrsKkQ+gB5FtyTJrA8XxKmj1WhssKz/x5I0bs
         LUxu/0GAGwI9d4O4rLZNijgI7HqFHhOSlhZ9vuZInsWLBUoAXciLVASaQzItmc47aB
         q8hYaq2oJ7O1fEA7pvEocMC7nKqV8HkAh1dnxbrhnfA2MwWjp20hwfz9ZjXeEk1bso
         86YFlq5B2fKcQ==
Received: from [192.168.1.68] (host86-149-71-85.range86-149.btcentralplus.com [86.149.71.85])
        by mta-13.privateemail.com (Postfix) with ESMTPA
        for <linux-input@vger.kernel.org>; Fri, 18 Aug 2023 18:16:15 -0400 (EDT)
Content-Type: multipart/mixed; boundary="------------w1TsAC045nPBYujOV0er7YwR"
Message-ID: <5f45c1b7-cf6c-4949-9839-db28f38bd490@sewer56.dev>
Date:   Fri, 18 Aug 2023 23:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     linux-input@vger.kernel.org
From:   Sewer56 <admin@sewer56.dev>
Subject: Re: [hid-logitech-dj] Inaccurate Mouse Wheel Behaviour using G502
 with Logitech Lightspeed Receiver
 (USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,GB_FAKE_RF_SHORT,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.
--------------w1TsAC045nPBYujOV0er7YwR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

When scrolling with a Logitech G502 Lightspeed mouse (046d:c08d) in wireless mode
with the official wireless receiver (046d:c539, i.e. USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1
in `hid-logitech-dj.c`), the REL_WHEEL event is not fired consistently on mouse wheel notch/tick.

[Note: This only affects wireless through receiver; wired works as expected]

Rather than the event being fired when the mouse skips a notch/tick on the scroll
wheel, it feels like the REL_WHEEL event is fired somewhere roughly around the middle
point of the last notch/tick and the next notch/tick.

I recorded a quick video to demonstrate this:
https://youtu.be/IwaQAMDkotg

In this clip I scroll the mouse wheel gently up and down, back and forth. Notice the
appearance of REL_WHEEL_HI_RES with the value changing from 15 to -15 as the direction
is changed; the wheel is being scrolled past the notch, but the REL_WHEEL event is not fired.

When the hid-logitech-dj module is blacklisted, and linux defaults to a more generic
driver (usbhid); this issue is not present; which can be seen here: https://youtu.be/8AkVWHUe88M

To put this into a realistic end user perspective: If you try to play a game on Linux
with the current behaviour; and perform an action that requires the use of a scroll wheel
[for example; changing the current weapon in a shooter], the input is often 'dropped' from
the user perspective, leading to frustration.

I'm not exactly sure what further sort of information I could provide; I've only got back
to using Linux on the desktop after 7 years; and it's my first time raising a kernel issue.
That said, I'm happy to provide any further feedback, or even play with the kernel sources
if someone could give me ideas of what I should experiment with.

--------------w1TsAC045nPBYujOV0er7YwR
Content-Type: application/zip; name="evtest samples.zip"
Content-Disposition: attachment; filename="evtest samples.zip"
Content-Transfer-Encoding: base64

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
AAB+CQAAAAA=

--------------w1TsAC045nPBYujOV0er7YwR--
