Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43132FD55D
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 17:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729040AbhATQT2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Jan 2021 11:19:28 -0500
Received: from hypra.fr ([62.210.38.35]:59004 "EHLO hypra.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391509AbhATQRk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Jan 2021 11:17:40 -0500
X-Greylist: delayed 529 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 Jan 2021 11:17:39 EST
Received: from [192.168.1.15] (lfbn-idf2-1-631-249.w86-246.abo.wanadoo.fr [86.246.90.249])
        by hypra.fr (Postfix) with ESMTPSA id 798815856A8;
        Wed, 20 Jan 2021 17:07:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hypra.fr; s=mail;
        t=1611158877; bh=LBz/kx8oNJ1TrGsGRt0MQExqqef5XGXbpdpmkvrCr+0=;
        h=Date:To:Cc:From:Subject:From;
        b=crRGGe9SogJs3vw7gSFXwwd1oylXNkJDeLI5SL53uBQPH9xVQ3uESocqjlu3JS61k
         R2qsJuqYak5det/lN7ECSZfQtXXvMJZFML7PNQ+qq5LkDL5lAUOmIkNgt7zL+vXROQ
         VJzO5ZT34if4d6hEVMDJob3SgjS7xPcGUwiHZKi0=
Message-ID: <6877f117-4558-25f3-461a-873dde09a8d0@hypra.fr>
Date:   Wed, 20 Jan 2021 17:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:86.0) Gecko/20100101
 Thunderbird/86.0a1
Content-Language: en-GB
To:     linux-input@vger.kernel.org
Cc:     Jean-Philippe MENGUAL <jpmengual@hypra.fr>
From:   Alex ARNAUD <aarnaud@hypra.fr>
Subject: Multi-touch gestures not working on a touchpad on a Clevo NL4x_NL5xLU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Linux kernel input team,

I Googled this problem for a full day without finding any solution. I 
suspect the problem I describe below is a issue which should be figured 
out at the kernel level, it's why I'm writing here.

On the Clevo "NL4x_NL5xLU" computer, released in 2020, the touchpad is 
not detected correctly, whereas on older Clevo model it is. I mean I 
could use single gestures on the touchpad but not multi-touch gestures.

I tried on Debian Sid with kernel 5.8, 5.9, 5.10 and 5.11.0-rc4 
(compiled yesterday) and the result is still the same.

When looking at "/proc/bus/input/devices" I see:
> I: Bus=0011 Vendor=0002 Product=0005 Version=0063
> N: Name="ImPS/2 Logitech Wheel Mouse"
> P: Phys=isa0060/serio2/input0
> S: Sysfs=/devices/platform/i8042/serio2/input/input10
> U: Uniq=
> H: Handlers=mouse0 event6
> B: PROP=1
> B: EV=7
> B: KEY=70000 0 0 0 0
> B: REL=103

On another Clevo model, where the touchpad is detected I get this:
> I: Bus=0011 Vendor=0002 Product=0007 Version=01b1
> N: Name="SynPS/2 Synaptics TouchPad"
> P: Phys=isa0060/serio2/input0
> S: Sysfs=/devices/platform/i8042/serio2/input/input10
> U: Uniq=
> H: Handlers=mouse1 event7
> B: PROP=1
> B: EV=b
> B: KEY=e520 30000 0 0 0 0
> B: ABS=66080001100000
What can I do to help you making this touchpad working properly with the 
Linux kernel? (I don't know a lot about hardware and Linux kernel 
related stuff)

Thanks in advance.
