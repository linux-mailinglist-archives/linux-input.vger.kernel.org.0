Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 785E4100F86
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2019 00:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfKRXvL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Nov 2019 18:51:11 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50103 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726809AbfKRXvL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Nov 2019 18:51:11 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 33C3C21368
        for <linux-input@vger.kernel.org>; Mon, 18 Nov 2019 18:51:10 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute5.internal (MEProxy); Mon, 18 Nov 2019 18:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airpost.net; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm1; bh=VCmNtQjjZ7ffsrA9HgUhc1z1D4PnbybLBu5xH0klM90=; b=WTxs9Utg
        rHUxatt/3mPwbqg+kvy3HjLcvUu9MOTpIhRCVULYpr/ENwmt3BKDA8E9XhR5qiVz
        d6hT+pMm7srRIgxdZMnEVd4S3yS64aUBSbStaBiHqW2Is5scadARl4ejy57UyMSN
        CAdQP19/rrnFSWSWXXbq5exMHu1t/2F3pypbc2dNSlP4cRXQ0+URpRzveDhk4v3x
        io1tLGwbogwCbbAvQOf+ZE9UbHJfpQnfwSks96a6mKh1l0WlvVe1YKPD0HKI12/h
        k98Ig57+iwqT/aT5e08tCEtPk1tf740ftIOCnjupl/WlwcB7ABMKyvE1gakm8jQX
        yUmhmzUG+zphSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=VCmNtQjjZ7ffsrA9HgUhc1z1D4Pnb
        ybLBu5xH0klM90=; b=uGbVV792hc/xiXXJsJjHh4bStTRQlFakQYUV/+2SgfBN6
        GyeBCUZvH+utu7mswWnmwYB2D6pLJBWM69DgKilT0C7MJRxSEBCNMXhS+Kn73mR4
        Ft6OhMGbhdNTO9AyFi4DxFw41VpRbivJLMxXEJN5xbab1wnyIgTzoCZurxLQknRr
        jtZ6Kn2VkeMQZTkL8457jy5it0Es2JtsN8DslfEJHa2sk0AmkI4e3Dw7QYyhj8f3
        /4X4fly5yuJ8EUy7Ci30vfeoUQq3Un+A4VZZ+F/QOlHNUEgPiA0wtorfe86Zr4jJ
        764jUNAG8j7WYBjVzJ9oe3Be/+W0GS4uSxwmeNK/w==
X-ME-Sender: <xms:bi7TXQX9NY3I3VwQPXmM0XubLjvoAON0pK6zBMQ3eiqrjpHIJ888bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegjedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedfuehruhhnohcuffgrnhhtrghsfdcuoehkvghrnhgvlhesuggr
    nhhtrghsrdgrihhrphhoshhtrdhnvghtqeenucfrrghrrghmpehmrghilhhfrhhomhepkh
    gvrhhnvghlsegurghnthgrshdrrghirhhpohhsthdrnhgvthenucevlhhushhtvghrufhi
    iigvpedt
X-ME-Proxy: <xmx:bi7TXbGudyn4cjXt5ma_OYagiD92TzjP79jGQ5Kker78KP7wk7XABg>
    <xmx:bi7TXXkIERfdiFXqtFKVxuKgXYUPts0R1jP4khhMcH_mYaW95VW9sg>
    <xmx:bi7TXZXmyRszb4zgIQcmDwI36aEO8FpyrUozGcVduPfULRuLtRcA8A>
    <xmx:bi7TXRw18cbaX2GO8i2bCE01Bj3e4MDEODJ6SuOuQAbaIN9hxejDdg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E7CE4E00AB; Mon, 18 Nov 2019 18:51:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-562-gfd0633a-fmstable-20191114v1
Mime-Version: 1.0
x-forwarded-message-id: <110a1d5c-5556-4343-9662-2284426a19f4@www.fastmail.com>
Message-Id: <9e11b3c5-dbd4-43c1-922a-bbf8474a6002@www.fastmail.com>
Date:   Mon, 18 Nov 2019 18:50:49 -0500
From:   "Bruno Dantas" <kernel@dantas.airpost.net>
To:     linux-input@vger.kernel.org
Subject: how do unbind ThinkPad touchpad without unbinding trackpoint?
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I have a T400 laptop running Devuan ASCII with linux 4.16.2

Please, this laptop's touchpad generates input "noise" while the lid is shut, which causes applications that should run while system is idle (e.g., xscreensaver) not to run.

I've tried to disable the touchpad via xinput or synaptics, but it does not remedy the issue. The only remedy I've found is to unbind the touchpad with this command:

# echo serio1 /sys/bus/serio/drivers/psmouse/unbind

Unfortunately, the above command also disables my trackpoint ("nipple mouse") which I need to remain functional.

Please, how do I unbind the touchpad without unbinding the trackpoint?

Thanks,
Bruno "GNUser"

P.S. This may be useful:

bruno@thinkpad:~$ cat /proc/bus/input/devices
---snip---
I: Bus=0011 Vendor=0002 Product=0007 Version=01b1
N: Name="SynPS/2 Synaptics TouchPad"
P: Phys=isa0060/serio1/input0
S: Sysfs=/devices/platform/i8042/serio1/input/input6
U: Uniq=
H: Handlers=mouse0 event5 
B: PROP=1
B: EV=b
B: KEY=420 30000 0 0 0 0
B: ABS=11000003

I: Bus=0011 Vendor=0002 Product=000a Version=0000
N: Name="TPPS/2 IBM TrackPoint"
P: Phys=synaptics-pt/serio0/input0
S: Sysfs=/devices/platform/i8042/serio1/serio2/input/input7
U: Uniq=
H: Handlers=mouse1 event6 
B: PROP=21
B: EV=7
B: KEY=70000 0 0 0 0
B: REL=3
