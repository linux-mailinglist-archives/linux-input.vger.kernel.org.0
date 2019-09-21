Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB676B9FB9
	for <lists+linux-input@lfdr.de>; Sat, 21 Sep 2019 23:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfIUVFY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 21 Sep 2019 17:05:24 -0400
Received: from saul.pp3345.net ([163.172.111.124]:46864 "EHLO saul.pp3345.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbfIUVFY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 21 Sep 2019 17:05:24 -0400
X-Greylist: delayed 385 seconds by postgrey-1.27 at vger.kernel.org; Sat, 21 Sep 2019 17:05:23 EDT
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: dev@pp3345.net)
        by saul.pp3345.net (Postcow) with ESMTPSA id 934E69A4053;
        Sat, 21 Sep 2019 22:58:46 +0200 (CEST)
Subject: Re: Synaptic touchpad stopped working
To:     =?UTF-8?B?WG94b9GCINCY0YHQutCw0L3QtNC10YDQvtCy?= 
        <shurrman@gmail.com>, linux-input@vger.kernel.org
References: <CAGLN7_SYeMoGqTJdxR_25o6V+EUsCxkrbQ2=ijCMrd7dOSD9GQ@mail.gmail.com>
From:   Yussuf Khalil <dev@pp3345.net>
Message-ID: <22ba6995-cb2b-9391-4e8c-a7f0c7af61b0@pp3345.net>
Date:   Sat, 21 Sep 2019 22:58:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAGLN7_SYeMoGqTJdxR_25o6V+EUsCxkrbQ2=ijCMrd7dOSD9GQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alex,

have you tried adding psmouse.synaptics_intertouch=1 to your kernel 
command line as suggested in dmesg? Does it help?

What kind of laptop do you have?

Regards
Yussuf

> Hi!
> 
> After some updates (I'm on the recent Fedora 30 with all updates) I
> noticed that touchpad stopped working. dmesg suggested to adress here,
> so doing it :-)
> 
> $ dmesg | grep -i touch
> [    2.334364] psmouse serio1: synaptics: Your touchpad (PNP: SYN3264
> SYN1e00 SYN0002 PNP0f13) says it can support a different bus. If
> i2c-hid and hid-rmi are not used, you might want to try setting
> psmouse.synaptics_intertouch to 1 and report this to
> linux-input@vger.kernel.org.
> [    2.386342] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.16,
> id: 0x1e2b1, caps: 0xf00123/0x840300/0x12e800/0x400000, board id:
> 3386, fw id: 2639617
> [    2.419579] input: SynPS/2 Synaptics TouchPad as
> /devices/platform/i8042/serio1/input/input4
> [    4.468684] input: SYNA7813:00 06CB:1942 Touchscreen as
> /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-SYNA7813:00/0018:06CB:1942.0005/input/input27
> [    4.617023] hid-multitouch 0018:06CB:1942.0005: input,hidraw4: I2C
> HID v1.00 Device [SYNA7813:00 06CB:1942] on i2c-SYNA7813:00
> 
> $ uname -a
> Linux shurrman 5.2.14-200.fc30.x86_64 #1 SMP Tue Sep 10 12:17:24 UTC
> 2019 x86_64 x86_64 x86_64 GNU/Linux
> 
> Any thoughts/suggestions?
> 
> Best regards,
> Alex
> 
