Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4771B83E8
	for <lists+linux-input@lfdr.de>; Sat, 25 Apr 2020 08:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgDYGNd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Sat, 25 Apr 2020 02:13:33 -0400
Received: from mail.eclipso.de ([217.69.254.104]:40286 "EHLO mail.eclipso.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbgDYGNc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Apr 2020 02:13:32 -0400
Received: from mail.eclipso.de (www1.eclipso.de [217.69.254.102])
        by mail.eclipso.de with ESMTP id 6133A858
        for <linux-input@vger.kernel.org>; Sat, 25 Apr 2020 08:13:31 +0200 (CEST)
Date:   Sat, 25 Apr 2020 08:13:31 +0200
MIME-Version: 1.0
Message-ID: <1a56dbaf4c20a4a375da9a6d281b865b@mail.eclipso.de>
X-Mailer: eclipso / 7.4.0
From:   " " <denk@eclipso.email>
Subject: Re: Re: Add a second working PNP_ID for a T470s
Reply-To: " " <denk@eclipso.email>
To:     "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc:     <linux-input@vger.kernel.org>
In-Reply-To: <20200424222546.GK125362@dtor-ws>
References: <ff770543cd53ae818363c0fe86477965@mail.eclipso.de>
        <20200424222546.GK125362@dtor-ws>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

thanks for your reply. In the following I just add the content of my first email to this list:
#####
In dmesg I found the following:
psmouse serio1: synaptics: Your touchpad (PNP: LEN007a PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.

After setting psmouse.synaptics_intertouch=1, touchpad and trackpoint still work fine. Also no problems with suspending my laptop.

The only problem is the following error meesage on shutdown:
rmi4_physical rmi4-00: Failed to read irqs, code=-6

/proc/bus/input/devices:
I: Bus=001d Vendor=06cb Product=0000 Version=0000
N: Name="Synaptics TM3145-006"
P: Phys=rmi4-00/input0
S: Sysfs=/devices/rmi4-00/input/input26
U: Uniq=
H: Handlers=event18 mouse0
B: PROP=5
B: EV=b
B: KEY=e520 10000 0 0 0 0
B: ABS=6f3800001000003

I: Bus=0011 Vendor=0002 Product=000a Version=0000
N: Name="TPPS/2 IBM TrackPoint"
P: Phys=rmi4-00.fn03/serio0/input0
S: Sysfs=/devices/rmi4-00/rmi4-00.fn03/serio2/input/input27
U: Uniq=
H: Handlers=event19 mouse1
B: PROP=21
B: EV=7
B: KEY=70000 0 0 0 0
B: REL=3

Is there anything I can do, that the error messsage doesn't appear anymore? Should I not use RMI?
#####

As far as I can see, there is no issue running the touchpad with RMI4. The only difference to running it in PS/2 mode is the mentioned error message during shutdown. Is that error message only cosmetic, or a real issue? Can something be done to omit this error message?
Regarding the touchpad, is the above pasted information sufficient, or do you need anything else?

Thanks and best
Dennis


--- Ursprüngliche Nachricht ---
Von: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Datum: 25.04.2020 00:25:46
An: <denk@eclipso.email>
Betreff: Re: Add a second working PNP_ID for a T470s

Hi Dennis,

On Mon, Mar 30, 2020 at 06:21:47PM +0200,   wrote:
> The Lenovo Thinkpad T470s I own has a different touchpad with
> "LEN007a" instead of the already included PNP ID "LEN006c".
However,
> my touchpad seems to work well without any problems using RMI. So this

> patch adds the other PNP ID.

So there are no visible issues when running the touchpad in PS/2 mode
compared to RMI4? (Just trying to figure out if it needs to go into
stable releases).

Do you know what trackpoint does the device have? 

Thanks.

-- 
Dmitry



---

________________________________________________________
Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de


