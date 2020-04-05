Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6038519EC7A
	for <lists+linux-input@lfdr.de>; Sun,  5 Apr 2020 18:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgDEQFo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Apr 2020 12:05:44 -0400
Received: from mail.skyhub.de ([5.9.137.197]:34166 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgDEQFo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 5 Apr 2020 12:05:44 -0400
Received: from zn.tnic (p200300EC2F26B7000C5E3296959EF3E4.dip0.t-ipconnect.de [IPv6:2003:ec:2f26:b700:c5e:3296:959e:f3e4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4D42E1EC0C25;
        Sun,  5 Apr 2020 18:05:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1586102743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:references;
        bh=BvWVoDSvyDU5IwC/rVzlp7lK2dIT+CdMbODaVhKoG4U=;
        b=lBhPGgkaiT80te1e5wstWUF/+wCWbLivS03Tqk0hk3NDJuxWxxYfntJE4/W69ByyGMXd0C
        rV8XGCuifuoZgeYyD4GvYSISKnc7yxENVvwCaurcIA9Qf4zmzp1LYdDb+greaBLYoaLl5i
        h4ShByA2h+fFOHcKtmp0pRKMzFnGi14=
Date:   Sun, 5 Apr 2020 18:05:38 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     linux-input@vger.kernel.org
Subject: [bugzilla-daemon@bugzilla.kernel.org: [Bug 207039] Mouse button
 doesn't work]
Message-ID: <20200405160538.GA17293@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Builtin trackpad buttons on a Dell Latitude XT2 don't work.

In case someone wants to take a look, dmesg is from 5.6.

----- Forwarded message from bugzilla-daemon@bugzilla.kernel.org -----

Date: Sun, 05 Apr 2020 15:05:08 +0000
From: bugzilla-daemon@bugzilla.kernel.org
To: bp@alien8.de
Subject: [Bug 207039] Mouse button doesn't work
Message-ID: <bug-207039-6385-cvbLeE9KzQ@https.bugzilla.kernel.org/>

https://bugzilla.kernel.org/show_bug.cgi?id=207039

--- Comment #7 from eagleforce@gmx.ch ---
Output of dmesg is listed here:
https://pastebin.com/raw/HT7aZzKA

-- 
You are receiving this mail because:
You are on the CC list for the bug.
You are watching the assignee of the bug.

----- End forwarded message -----

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
