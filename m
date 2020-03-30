Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 771BD197AC9
	for <lists+linux-input@lfdr.de>; Mon, 30 Mar 2020 13:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729684AbgC3Lew (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Mar 2020 07:34:52 -0400
Received: from saul.pp3345.net ([163.172.111.124]:36150 "EHLO saul.pp3345.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729809AbgC3Lev (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Mar 2020 07:34:51 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: dev@pp3345.net)
        by saul.pp3345.net (Postcow) with ESMTPSA id E6F1C9A4582;
        Mon, 30 Mar 2020 13:34:04 +0200 (CEST)
Subject: Re: Error message on shutdown with psmouse.synaptics_intertouch=1 for
 TM3145-006 (Thinkpad T470s)
To:     denk@eclipso.email, linux-input@vger.kernel.org
References: <75c5157fc291c8ef97283cf366036e0f@mail.eclipso.de>
 <57b81c3187f78f01e310ee0cde2f9bb7@mail.eclipso.de>
From:   Yussuf Khalil <dev@pp3345.net>
Message-ID: <e91d2409-2ac1-1f38-b530-b4175883cac7@pp3345.net>
Date:   Mon, 30 Mar 2020 13:33:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <57b81c3187f78f01e310ee0cde2f9bb7@mail.eclipso.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi denk,

I am neither the maintainer nor the author of the RMI code, however, I 
believe I've seen this message on several devices already and as far as 
I know, it's harmless. If RMI works fine for you apart from this 
message, you should send a commit to add your laptop to the whitelist in 
drivers/input/mouse/synaptics.c (line 164).

Regards
Yussuf Khalil

Am 30.03.20 um 11:23 schrieb denk@eclipso.email:
> Hi again,
> 
> as I didn't hear anything about my issue, I would like to ask again, if there is anything I can do that the error message doesn't appear anymore?
> 
> Thank you very much and best
> denk
> 
> 
> --- Ursprüngliche Nachricht ---
> Von: " " <denk@eclipso.email>
> Datum: 28.02.2020 22:29:07
> An: <linux-input@vger.kernel.org>
> Betreff: Error message on shutdown with psmouse.synaptics_intertouch=1 for 	TM3145-006 (Thinkpad T470s)
> 
> Hi,
> 
> in dmesg I found the following:
> psmouse serio1: synaptics: Your touchpad (PNP: LEN007a PNP0f13) says it can
> support a different bus. If i2c-hid and hid-rmi are not used, you might want
> to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
> 
> 
> After setting psmouse.synaptics_intertouch=1, touchpad and trackpoint still
> work fine. Also no problems with suspending my laptop.
> 
> The only problem is the following error meesage on shutdown:
> rmi4_physical rmi4-00: Failed to read irqs, code=-6
> 
> /proc/bus/input/devices:
> I: Bus=001d Vendor=06cb Product=0000 Version=0000
> N: Name="Synaptics TM3145-006"
> P: Phys=rmi4-00/input0
> S: Sysfs=/devices/rmi4-00/input/input26
> U: Uniq=
> H: Handlers=event18 mouse0
> B: PROP=5
> B: EV=b
> B: KEY=e520 10000 0 0 0 0
> B: ABS=6f3800001000003
> 
> I: Bus=0011 Vendor=0002 Product=000a Version=0000
> N: Name="TPPS/2 IBM TrackPoint"
> P: Phys=rmi4-00.fn03/serio0/input0
> S: Sysfs=/devices/rmi4-00/rmi4-00.fn03/serio2/input/input27
> U: Uniq=
> H: Handlers=event19 mouse1
> B: PROP=21
> B: EV=7
> B: KEY=70000 0 0 0 0
> B: REL=3
> 
> Is there anything I can do, that the error messsage doesn't appear anymore?
> Should I not use RMI?
> 
> If you need further information, please ask.
> 
> Best
> denk
> ­
> 
> ---
> 
> ________________________________________________________
> Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln
> und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de
> 
> 
> ---
> 
> ________________________________________________________
> Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de
> 
> 
