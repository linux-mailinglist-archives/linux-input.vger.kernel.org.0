Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E11394547
	for <lists+linux-input@lfdr.de>; Fri, 28 May 2021 17:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbhE1PmT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 May 2021 11:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234187AbhE1PmT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 May 2021 11:42:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90124C061574;
        Fri, 28 May 2021 08:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=503wkZ3DlvlY4Y8EY+Q5/D1mUjIWO6H/MPUZipK2qqE=; b=LE9DD0egM2xbJK5TNomN9wnQLJ
        0RG1i9hFRDhV+tYxGd4y1JQlYuGetrk6idz4oneZG8UkJCWVOdsn0HuIY8H4LqkkNvfmPf82j2lTj
        n79svWRT0OEysMYL2o6qaVLZiR2+D9q+sRYFvCBZBhYKtRejfsP8YUOAOGrqXFLjXVXqzytNBeNJ0
        3xzUZZ6Eh12AmTd8Qyle4hpcuSWU9jVzorsaJS92pwtftzcMdt85tbIf9lOvduaSYvKbKOsYvCt9c
        lpqNwyW5+/97g1rFJe8A574LqX/jxFEJMRi6YUhZQLdYVYnv0M/41fV+XxFM1oksOgBCN8FPFSQYC
        Nx6uoV2g==;
Received: from [2601:1c0:6280:3f0::ce7d]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lmebL-00GepZ-KF; Fri, 28 May 2021 15:40:43 +0000
Subject: Re: Problem with i8042 and PS/2 keyboard on HP laptop
To:     Egor Ignatov <egori@altlinux.org>, Vojtech Pavlik <vojtech@suse.cz>
Cc:     linux-kernel@vger.kernel.org,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <f586401d-73af-097f-812c-f033a922bfc2@altlinux.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f7034673-5bb4-1503-d494-3321ecaa35d5@infradead.org>
Date:   Fri, 28 May 2021 08:40:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f586401d-73af-097f-812c-f033a922bfc2@altlinux.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[add linux-input mailing list]

On 5/28/21 7:02 AM, Egor Ignatov wrote:
> Hi Vojtech,
> 
> I have a problem with the PS/2 keyboard on an HP laptop
> (15s-fq2020ur).  The problem is that after booting the
> system, the keyboard does not work.  But it starts working
> about 10 seconds after pressing any key.
> 
> I looked at the i8042 log and it seems to me that the
> problem is that the driver does not wait for a response to
> the GETID. It receives ACK and immediately sends the
> 0xed command without waiting for ID.
> 
> [    0.460964] i8042: [1] f2 -> i8042 (kbd-data)
> [    0.471708] i8042: [12] fa <- i8042 (interrupt, 0, 1)
> [    0.977581] i8042: [518] ed -> i8042 (kbd-data)
> [    1.185586] i8042: [726] 60 -> i8042 (command)
> [    1.185686] i8042: [726] 64 -> i8042 (parameter)
> [    1.185842] i8042: [726] 60 -> i8042 (command)
> [    1.185935] i8042: [726] 65 -> i8042 (parameter)
> [    1.185975] i8042: [726] ab <- i8042 (interrupt, 0, 0)
> [    1.189909] i8042: [730] 83 <- i8042 (interrupt, 0, 1)
> [    1.189952] i8042: [730] f2 -> i8042 (kbd-data)
> [    1.200096] i8042: [740] fa <- i8042 (interrupt, 0, 1)
> [    1.204012] i8042: [744] fa <- i8042 (interrupt, 0, 1)
> [    1.204031] i8042: [744] 60 -> i8042 (command)
> [    1.204124] i8042: [744] 64 -> i8042 (parameter)
> [    1.204272] i8042: [744] 60 -> i8042 (command)
> [    1.204364] i8042: [744] 65 -> i8042 (parameter)
> 
> At this point it doesn't do anything until you press a key.
> Then the driver starts sending GETID repeatedly until at
> some point it gets the correct answer, after which the
> keyboard starts working. As I sad it takes about 10 secs.
> 
> Here is a part of the log after pressing a key:
> 
> [   11.103249] i8042: [10643] 1d <- i8042 (interrupt, 0, 1)
> [   11.103287] i8042: [10643] f2 -> i8042 (kbd-data)
> [   11.113673] i8042: [10654] fa <- i8042 (interrupt, 0, 1)
> [   11.113719] i8042: [10654] ab <- i8042 (interrupt, 0, 1)
> [   11.617485] i8042: [11158] ed -> i8042 (kbd-data)
> [   11.825485] i8042: [11366] 60 -> i8042 (command)
> [   11.825778] i8042: [11366] 64 -> i8042 (parameter)
> [   11.825924] i8042: [11366] 60 -> i8042 (command)
> [   11.826016] i8042: [11366] 65 -> i8042 (parameter)
> [   11.826049] i8042: [11366] 83 <- i8042 (interrupt, 0, 0)
> [   11.830084] i8042: [11370] fa <- i8042 (interrupt, 0, 1)
> [   11.830107] i8042: [11370] f2 -> i8042 (kbd-data)
> [   11.840241] i8042: [11380] fa <- i8042 (interrupt, 0, 1)
> [   11.844063] i8042: [11384] 38 <- i8042 (interrupt, 0, 1)
> [   11.844083] i8042: [11384] 60 -> i8042 (command)
> [   11.844174] i8042: [11384] 64 -> i8042 (parameter)
> [   11.844320] i8042: [11384] 60 -> i8042 (command)
> [   11.844413] i8042: [11384] 65 -> i8042 (parameter)
> [   11.849039] i8042: [11389] 3c <- i8042 (interrupt, 0, 1)
> [   11.849059] i8042: [11389] f2 -> i8042 (kbd-data)
> [   11.859198] i8042: [11399] fa <- i8042 (interrupt, 0, 1)
> [   12.361490] i8042: [11902] ed -> i8042 (kbd-data)
> ...
> [   27.516138] i8042: [27455] f2 -> i8042 (kbd-data)
> [   27.526395] i8042: [27466] fa <- i8042 (interrupt, 0, 1)
> [   27.531044] i8042: [27471] fa <- i8042 (interrupt, 0, 1)
> [   27.531080] i8042: [27471] 60 -> i8042 (command)
> [   27.531183] i8042: [27471] 64 -> i8042 (parameter)
> [   27.531336] i8042: [27471] 60 -> i8042 (command)
> [   27.531713] i8042: [27471] 65 -> i8042 (parameter)
> [   27.536215] i8042: [27476] 1d <- i8042 (interrupt, 0, 1)
> **HERE IT FINALLY RECEIVES THE CORRECT RESPONSE**
> [   27.536290] i8042: [27476] f2 -> i8042 (kbd-data)
> [   27.546882] i8042: [27487] fa <- i8042 (interrupt, 0, 1)
> [   27.546940] i8042: [27487] ab <- i8042 (interrupt, 0, 1)
> [   27.546997] i8042: [27487] 83 <- i8042 (interrupt, 0, 1)
> [   27.547018] i8042: [27487] f5 -> i8042 (kbd-data)
> [   27.557566] i8042: [27497] fa <- i8042 (interrupt, 0, 1)
> [   27.557615] i8042: [27497] ed -> i8042 (kbd-data)
> [   27.568242] i8042: [27508] fa <- i8042 (interrupt, 0, 1)
> [   27.568294] i8042: [27508] 00 -> i8042 (kbd-data)
> [   27.578730] i8042: [27518] fa <- i8042 (interrupt, 0, 1)
> [   27.578785] i8042: [27518] f3 -> i8042 (kbd-data)
> [   27.589151] i8042: [27529] fa <- i8042 (interrupt, 0, 1)
> [   27.589206] i8042: [27529] 00 -> i8042 (kbd-data)
> [   27.599602] i8042: [27539] fa <- i8042 (interrupt, 0, 1)
> [   27.599676] i8042: [27539] f4 -> i8042 (kbd-data)
> [   27.609986] i8042: [27550] fa <- i8042 (interrupt, 0, 1)
> 
> Any idea what to do about this?
> 
> Best regards,
> Egor


-- 
~Randy

