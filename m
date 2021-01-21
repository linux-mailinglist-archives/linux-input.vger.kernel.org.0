Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90D0C2FF04F
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 17:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387915AbhAUQaX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 11:30:23 -0500
Received: from hypra.fr ([62.210.38.35]:56476 "EHLO hypra.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387892AbhAUQaK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 11:30:10 -0500
Received: from [192.168.1.15] (lfbn-idf2-1-631-249.w86-246.abo.wanadoo.fr [86.246.90.249])
        by hypra.fr (Postfix) with ESMTPSA id 558035856E3;
        Thu, 21 Jan 2021 17:29:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hypra.fr; s=mail;
        t=1611246564; bh=fmce2cWkKrP+xmtjHM0ZWFK9MYvc4YuuN0Pp3ZvsBFU=;
        h=Date:From:Subject:To:Cc:From;
        b=hjZTPrXpxQrUKkRCT8odAuNPCCyr6LCVXyXiK3IXJnCOTWDfMjzvv1vVSSwbuR4/P
         O3oVPpEnmZPRne6ataLlWa0lhSTyN/h66Yq3K75528ieQOKmrbVfGbYhl6/tLgMKVV
         w9nm732D4iOLk88otxBHH0JU475+GcNmIF+uLfKk=
Message-ID: <b9840c3e-9df0-573e-b73a-f47020dc3367@hypra.fr>
Date:   Thu, 21 Jan 2021 17:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:86.0) Gecko/20100101
 Thunderbird/86.0a1
From:   Alex ARNAUD <aarnaud@hypra.fr>
Subject: Touchpad multi-touch gestures not working without pci=nocrs on a
 Clevo NL4x_NL5xLU
To:     linux-input@vger.kernel.org
Cc:     Colomban Wendling <cwendling@hypra.fr>,
        Jean-Philippe MENGUAL <jpmengual@hypra.fr>,
        Valentin Villenave <vvillenave@hypra.fr>
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Linux kernel input team,

On the 2020 Clevo "NL4x_NL5xLU" computer, the touchpad is not detected 
correctly by default. I mean I could use touchpad single gestures but 
not multi-touch gestures.
Adding "pci=nocrs" boot parameter solves the problem, details below.

This issue has been reported few months ago by another users on Ubuntu 
Launchpad, see https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1904052

I tried on Debian Sid with kernel 5.8, 5.9, 5.10 and 5.11.0-rc4 
(compiled two days ago) and the result is still the same.

When looking at "/proc/bus/input/devices" I don't see my touchpad but I 
only see:
> I: Bus=0011 Vendor=0002 Product=0005 Version=0063
> N: Name="ImPS/2 Logitech Wheel Mouse"
> P: Phys=isa0060/serio1/input0
> S: Sysfs=/devices/platform/i8042/serio1/input/input6
> U: Uniq=
> H: Handlers=mouse2 event6
> B: PROP=1
> B: EV=7
> B: KEY=70000 0 0 0 0
> B: REL=103

After adding the boot parameter "pci=nocrs" via grub I see in addition 
two new devices:
> I: Bus=0018 Vendor=2808 Product=0101 Version=0100
> N: Name="FTCS1000:01 2808:0101 Mouse"
> P: Phys=i2c-FTCS1000:01
> S: Sysfs=/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-FTCS1000:01/0018:2808:0101.0001/input/input17
> U: Uniq=
> H: Handlers=mouse0 event7
> B: PROP=0
> B: EV=17
> B: KEY=30000 0 0 0 0
> B: REL=903
> B: MSC=10
> 
> I: Bus=0018 Vendor=2808 Product=0101 Version=0100
> N: Name="FTCS1000:01 2808:0101 Touchpad"
> P: Phys=i2c-FTCS1000:01
> S: Sysfs=/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-FTCS1000:01/0018:2808:0101.0001/input/input18
> U: Uniq=
> H: Handlers=mouse1 event8
> B: PROP=5
> B: EV=1b
> B: KEY=e520 10000 0 0 0 0
> B: ABS=2e0800000000003
> B: MSC=20

In "The kernel's command-line parameters", it is requested to report a 
bug if "pci=nocrs" is needed, here it is.

What can I do to help you making this touchpad working by default with 
the Linux kernel?
(I don't know a lot about hardware and Linux kernel related stuff)

Thanks in advance.
