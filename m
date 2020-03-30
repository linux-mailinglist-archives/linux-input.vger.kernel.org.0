Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC621977C8
	for <lists+linux-input@lfdr.de>; Mon, 30 Mar 2020 11:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbgC3JXH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 30 Mar 2020 05:23:07 -0400
Received: from mail.eclipso.de ([217.69.254.104]:46566 "EHLO mail.eclipso.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727841AbgC3JXH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Mar 2020 05:23:07 -0400
Received: from mail.eclipso.de (www1.eclipso.de [217.69.254.102])
        by mail.eclipso.de with ESMTP id 2C4F4B25
        for <linux-input@vger.kernel.org>; Mon, 30 Mar 2020 11:23:05 +0200 (CEST)
Date:   Mon, 30 Mar 2020 11:23:05 +0200
MIME-Version: 1.0
Message-ID: <57b81c3187f78f01e310ee0cde2f9bb7@mail.eclipso.de>
X-Mailer: eclipso / 7.4.0
From:   " " <denk@eclipso.email>
Subject: Re: Error message on shutdown with psmouse.synaptics_intertouch=1 for
        TM3145-006 (Thinkpad T470s)
Reply-To: " " <denk@eclipso.email>
To:     <linux-input@vger.kernel.org>
In-Reply-To: <75c5157fc291c8ef97283cf366036e0f@mail.eclipso.de>
References: <75c5157fc291c8ef97283cf366036e0f@mail.eclipso.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi again,

as I didn't hear anything about my issue, I would like to ask again, if there is anything I can do that the error message doesn't appear anymore?

Thank you very much and best
denk


--- Ursprüngliche Nachricht ---
Von: " " <denk@eclipso.email>
Datum: 28.02.2020 22:29:07
An: <linux-input@vger.kernel.org>
Betreff: Error message on shutdown with psmouse.synaptics_intertouch=1 for 	TM3145-006 (Thinkpad T470s)

Hi,

in dmesg I found the following:
psmouse serio1: synaptics: Your touchpad (PNP: LEN007a PNP0f13) says it can
support a different bus. If i2c-hid and hid-rmi are not used, you might want
to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.


After setting psmouse.synaptics_intertouch=1, touchpad and trackpoint still
work fine. Also no problems with suspending my laptop.

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

Is there anything I can do, that the error messsage doesn't appear anymore?
Should I not use RMI?

If you need further information, please ask.

Best
denk
­

---

________________________________________________________
Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln
und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de


---

________________________________________________________
Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de


