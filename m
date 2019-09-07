Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDAE6AC8A3
	for <lists+linux-input@lfdr.de>; Sat,  7 Sep 2019 20:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfIGSFt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Sep 2019 14:05:49 -0400
Received: from smtp-sh2.infomaniak.ch ([128.65.195.6]:44731 "EHLO
        smtp-sh2.infomaniak.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728590AbfIGSFs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Sep 2019 14:05:48 -0400
X-Greylist: delayed 543 seconds by postgrey-1.27 at vger.kernel.org; Sat, 07 Sep 2019 14:05:47 EDT
Received: from smtp5.infomaniak.ch (smtp5.infomaniak.ch [83.166.132.18])
        by smtp-sh2.infomaniak.ch (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id x87HugxI105882
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 7 Sep 2019 19:56:42 +0200
Received: from [IPv6:2a01:e35:2e9c:92b0:f8d0:e7ff:fe86:ff9a] ([IPv6:2a01:e35:2e9c:92b0:f8d0:e7ff:fe86:ff9a])
        (authenticated bits=0)
        by smtp5.infomaniak.ch (8.14.5/8.14.5) with ESMTP id x87Huf6e058147;
        Sat, 7 Sep 2019 19:56:41 +0200
From:   =?UTF-8?Q?St=c3=a9phane_Gr=c3=a9goire?= 
        <stephane.gregoire@mhuu.org>
Organization: http://pasdenom.info
To:     linux-input@vger.kernel.org
Subject: touchpad (PNP: SYN1213 PNP0f13) says it can support a different bus
X-Os:   xUbuntu 18.04 ou Debian Stable
Archive:  no
Message-ID: <0ccd4257-9e34-9da4-ef07-bbce14bc90a5@mhuu.org>
Date:   Sat, 7 Sep 2019 19:56:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 SeaMonkey/2.53
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I sometime lost my mouse and I have this in syslog, so I send this mail... 

 
Sep  7 19:48:49 ldlc kernel: [18552.164608] psmouse serio2: synaptics:
queried max coordinates: x [..5672], y [..4722]
Sep  7 19:48:49 ldlc kernel: [18552.285796] psmouse serio2: synaptics:
queried min coordinates: x [1380..], y [1192..]
Sep  7 19:48:49 ldlc kernel: [18552.285829] psmouse serio2: synaptics:
Your touchpad (PNP: SYN1213 PNP0f13) says it can support a different
bus. If i2c-hid and hid-rmi are not used, you might want to try setting
psmouse.synaptics_intertouch to 1 and report this to
linux-input@vger.kernel.org.
Sep  7 19:48:49 ldlc kernel: [18552.442108] psmouse serio2: synaptics:
Touchpad model: 1, fw: 8.1, id: 0x1e2b1, caps:
0xd00123/0x840300/0x126800/0x0, board id: 2942, fw id: 1524475
Sep  7 19:48:49 ldlc kernel: [18552.487529] input: SynPS/2 Synaptics
TouchPad as /devices/platform/i8042/serio2/input/input601
Sep  7 19:48:59 ldlc kernel: [18561.954942] psmouse serio2: TouchPad at
isa0060/serio2/input0 lost synchronization, throwing 4 bytes away.


lsmod | fgrep -i hid-rmi  #--> no result
lsmod | fgrep -i i2c-hid  #--> no result

Best regards,

-- 
Stéphane 🔗<http://pasdenom.info/fortune/>
Nous avons tous assez de force pour supporter les maux d'autrui.
	-+- François de La Rochefoucauld (1613-1680), Maximes 19 -+-

