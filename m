Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16978101122
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2019 03:13:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfKSCNu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Nov 2019 21:13:50 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49521 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726761AbfKSCNu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Nov 2019 21:13:50 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 70BBA2205E;
        Mon, 18 Nov 2019 21:13:48 -0500 (EST)
Received: from imap2 ([10.202.2.52])
  by compute5.internal (MEProxy); Mon, 18 Nov 2019 21:13:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airpost.net; h=
        mime-version:message-id:in-reply-to:references:date:from:to
        :subject:content-type; s=fm1; bh=bbxwBFhaggC+WF5ekTGdqfpFe8DUHCF
        Geip3roHeL0c=; b=XmdAafb+n/Bg/dK0wjs9o0zCujRwYA+cPx2urG9Hb2DU4yo
        p3rnhpi5huznHwxpeZkIW5kC9mm7sUlNDhdAeB4ULLpRm025heO6nbGtOGizHUJG
        ADKx86+h5HIDZBnM9n+W957MfJeb2y/8q6WpEOCX2Y6IybABo6Ff0mYBChf8q+lC
        KFanrg6s1wC3LwDpzKM91pDNYD0W5tQvXQdDGgOuOStXSWZjq0PY/o1TDjA3qdva
        1ZRTUPVekRhm8+DoHcU954nHOUgNcCt0lCfAPsOwjAdDTyQUK0JLDg8NhVlVO0r4
        D/OE3YT720YLX/rD8nY+9nWJQOcxpv0oo51caIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bbxwBF
        haggC+WF5ekTGdqfpFe8DUHCFGeip3roHeL0c=; b=rTMAAHsgmA6TjBiaKw+aIS
        0s7RCkKfksMac2lNCCDsCsVaN7nAllwBjRIOp4n/FezZ2tmddNA6C+MLqXNSr98a
        k4yoHkKUYMai9i9Esl3CcjnIUgJNCsdNetgWNyRTKvcruVZJxvMUzt/8FzK4DXX6
        jzKC+rTAdCpSPnIaiQ5soZY1VU93K6UyPyZkLVQZVgjxESVB8OJEMIetmhMb045O
        zfFZJVZHw6JLl6uo8h64QBSfgrIpY3QdXaOn6vPl2Y/3Gy55SMPkHsoXdBMPsZ4J
        BrdDoBk52q+XxUgjMnHKk4xOR2AWs3qJRd1MKZu9BYYozDEmnS+OgtResvFoEmJQ
        ==
X-ME-Sender: <xms:3E_TXXUsrYr0Zir3O0WQ6ro__4a01gbvaT26x4XB42zrauvZnIuASA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfuehruhhnohcuffgrnhhtrghsfdcuoehkvghrnhgvlhes
    uggrnhhtrghsrdgrihhrphhoshhtrdhnvghtqeenucfrrghrrghmpehmrghilhhfrhhomh
    epkhgvrhhnvghlsegurghnthgrshdrrghirhhpohhsthdrnhgvthenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:3E_TXT0BrrRaSeZzQTOth_YVBltgBj8JGHRzVlabP6qGnb10GEcriQ>
    <xmx:3E_TXeZBGg-dXqCMna1KDzt6Xy3pHlUIQBMRdfpl0DlKTl5DN71XnA>
    <xmx:3E_TXWq8aUjh1DcgkOY1sOfjl8k_Yc0rQBhBkQcCmwwfuaf-cBCOYg>
    <xmx:3E_TXeiDfWigX6AWYzkjMdPf5XGd21ELDvI_YuUQpvswfDFZUt0AEg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 219D1E00A3; Mon, 18 Nov 2019 21:13:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-562-gfd0633a-fmstable-20191114v1
Mime-Version: 1.0
Message-Id: <8fbee3e7-c17e-4568-843a-fbeb9ba357ad@www.fastmail.com>
In-Reply-To: <9e11b3c5-dbd4-43c1-922a-bbf8474a6002@www.fastmail.com>
References: <9e11b3c5-dbd4-43c1-922a-bbf8474a6002@www.fastmail.com>
Date:   Mon, 18 Nov 2019 21:13:26 -0500
From:   "Bruno Dantas" <kernel@dantas.airpost.net>
To:     "Bruno Dantas" <kernel@dantas.airpost.net>,
        linux-input@vger.kernel.org
Subject: Re: how do unbind ThinkPad touchpad without unbinding trackpoint?
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The command should have been this:

# echo serio1 >/sys/bus/serio/drivers/psmouse/unbind

Sorry about the typo (missing stdout redirect).

The above command *completely* disables the touchpad as desired, but has the undesired side effect of unbinding serio2 (which disables the trackpoint).

-Bruno


On Mon, Nov 18, 2019, at 6:50 PM, Bruno Dantas wrote:
> I have a T400 laptop running Devuan ASCII with linux 4.16.2
> 
> Please, this laptop's touchpad generates input "noise" while the lid is 
> shut, which causes applications that should run while system is idle 
> (e.g., xscreensaver) not to run.
> 
> I've tried to disable the touchpad via xinput or synaptics, but it does 
> not remedy the issue. The only remedy I've found is to unbind the 
> touchpad with this command:
> 
> # echo serio1 /sys/bus/serio/drivers/psmouse/unbind
> 
> Unfortunately, the above command also disables my trackpoint ("nipple 
> mouse") which I need to remain functional.
> 
> Please, how do I unbind the touchpad without unbinding the trackpoint?
> 
> Thanks,
> Bruno "GNUser"
> 
> P.S. This may be useful:
> 
> bruno@thinkpad:~$ cat /proc/bus/input/devices
> ---snip---
> I: Bus=0011 Vendor=0002 Product=0007 Version=01b1
> N: Name="SynPS/2 Synaptics TouchPad"
> P: Phys=isa0060/serio1/input0
> S: Sysfs=/devices/platform/i8042/serio1/input/input6
> U: Uniq=
> H: Handlers=mouse0 event5 
> B: PROP=1
> B: EV=b
> B: KEY=420 30000 0 0 0 0
> B: ABS=11000003
> 
> I: Bus=0011 Vendor=0002 Product=000a Version=0000
> N: Name="TPPS/2 IBM TrackPoint"
> P: Phys=synaptics-pt/serio0/input0
> S: Sysfs=/devices/platform/i8042/serio1/serio2/input/input7
> U: Uniq=
> H: Handlers=mouse1 event6 
> B: PROP=21
> B: EV=7
> B: KEY=70000 0 0 0 0
> B: REL=3
>
