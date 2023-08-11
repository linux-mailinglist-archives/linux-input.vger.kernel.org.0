Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF547797D7
	for <lists+linux-input@lfdr.de>; Fri, 11 Aug 2023 21:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbjHKTfr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Aug 2023 15:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjHKTfq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Aug 2023 15:35:46 -0400
X-Greylist: delayed 349 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Aug 2023 12:35:46 PDT
Received: from dd15738.kasserver.com (dd15738.kasserver.com [85.13.151.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB6E30F2
        for <linux-input@vger.kernel.org>; Fri, 11 Aug 2023 12:35:46 -0700 (PDT)
Received: from [192.168.178.53] (ip-005-147-048-170.um06.pools.vodafone-ip.de [5.147.48.170])
        by dd15738.kasserver.com (Postfix) with ESMTPSA id 7E0CA5B00177
        for <linux-input@vger.kernel.org>; Fri, 11 Aug 2023 21:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ka-long.de;
        s=kas202303071036; t=1691782195;
        bh=YJRQ3cgZpgVFqnqD+fBeeL5nHiXy8cRmZCqJ+1e2vq0=;
        h=Date:To:From:Subject:From;
        b=Ij3NJLIG0VOgFOiJs5oki35evw7zLK0fmP1mR0msmZbJY/4EjojHjisedm+B8zeG2
         k38iJu3VIEZwZb0pl4Jm691BT0AZQHkH/GlZqYrAYRJ0cb/hdtvNPMOj9hROmpxhuZ
         nWJDjNl90OhxC6CZZoE6xhAg0MGaXhpriGBFIIh7bpAKhg619wPT6fmyIVaD/IfwRC
         UcEe0T1KVGd9Ic4KeMuq9pt7OfAPxLCRw8J6UReWBnMb62McB/YhFfULpge5vMB8GE
         SXUp9y4CyaIh+CrLxxOheUhLebmd+BtywwSHgkPR1ubuHbOZKoc/goUaN61fogvO/E
         a1euAWPo8HXDA==
Message-ID: <449cbce3-71e1-daab-1673-d6c89738acd0@ka-long.de>
Date:   Fri, 11 Aug 2023 21:29:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To:     linux-input@vger.kernel.org
Content-Language: en-US
From:   Niels Petter <petter@ka-long.de>
Subject: Goodix GT911 - no /dev/input
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi folks,


I have problems driving a spi screen with i2c touch gt911.


I was able to get it working on a raspberry pi. I am familiar with 
device trees, kernel config,compiling kernels, c/c++ etc.

I am working now on a NXP LX2160A headless platform. Using NXP Kernel 
git tag LSDK-21.08 (also tested lf-6.1.1-1.0.0).

Kernel is configured with "make defconfig lsdk.config" and menuconfig 
evdev and goodix touch screen support (and st7789v). Device tree is 
configured.

OS is bootstrapped debian stable, maybe something is missing here ...


dmesg shows that touch is found and registered under /platform/device 
something ...

The console is shown on the display. I know that did not mean anything.

But there is no /dev/input directory.


I double checked everything again. Only thing I am not 100% sure about 
at the moment is if the IRQ pin configured is the right one.

Could this lead to a not under /dev/input registered device ?


Maybe an udev rule is missing (missing debian packet)  ? Or do I need to 
create /dev/input with mknod manually ?


Everything else on I2C / SPI is working as expected.


Any  ideas ?


Thanks

Niels





