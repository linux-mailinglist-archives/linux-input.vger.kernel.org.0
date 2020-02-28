Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558BD174186
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2020 22:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgB1VeL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 28 Feb 2020 16:34:11 -0500
Received: from mail.eclipso.de ([217.69.254.104]:55130 "EHLO mail.eclipso.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725886AbgB1VeL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Feb 2020 16:34:11 -0500
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Feb 2020 16:34:11 EST
Received: from mail.eclipso.de (www1.eclipso.de [217.69.254.102])
        by mail.eclipso.de with ESMTP id 2B541064
        for <linux-input@vger.kernel.org>; Fri, 28 Feb 2020 22:29:07 +0100 (CET)
Date:   Fri, 28 Feb 2020 22:29:07 +0100
MIME-Version: 1.0
Message-ID: <75c5157fc291c8ef97283cf366036e0f@mail.eclipso.de>
X-Mailer: eclipso / 7.4.0
From:   " " <denk@eclipso.email>
Subject: Error message on shutdown with psmouse.synaptics_intertouch=1 for
        TM3145-006 (Thinkpad T470s)
Reply-To: " " <denk@eclipso.email>
To:     <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

in dmesg I found the following:
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

If you need further information, please ask.

Best
denk
­

---

________________________________________________________
Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de


