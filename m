Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89AD012C0FB
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2019 08:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfL2HgS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 02:36:18 -0500
Received: from mail-pg1-f181.google.com ([209.85.215.181]:39462 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfL2HgS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 02:36:18 -0500
Received: by mail-pg1-f181.google.com with SMTP id b137so16598260pga.6
        for <linux-input@vger.kernel.org>; Sat, 28 Dec 2019 23:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=dkoo/J6IxQHf3QBjHbXnqRsh88EhnFd6McELfAkntJk=;
        b=dFmHAQp8rIGgKYokQMVun0wAuHwlo9CFiQCcWhIqAeEXHbiOKFG5x/MFSp6SNQrhSp
         Irft5sErSC6IH4QFFCmaV3D+5Oa6BAh2OqlQyyYt3/+75clWv+MD/JyBYDgvHUUyWkGs
         DLZleGMJwqXqZ8HdN3y/4YIiai0C6CyzYJ4yCJ89YtxHWQoQ1bYny2JVRlqHOqQ/pZD5
         vVUqkvTWNEfgrbUP4u1H2ZqqOiL9EtTlxFsa6T7f7ssPK5WZk74NyhmMt4tWxL9Z8E1+
         hXgjl4jRm899QLQrPVHpadRsBi3T5MrHGPtN7BKMeyefEgfF1pCd0qM7kADgipvORGye
         vGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=dkoo/J6IxQHf3QBjHbXnqRsh88EhnFd6McELfAkntJk=;
        b=tPYO3f+XSF3DDpWYO/BNx4tzPoPW86yJ/5JwyulvT3n0xbrgTOB4pphrBdKQ3otcg2
         JutPYcAl1hfM9jtUPAXrG43+QvIA/KQ5CQH/YftJCeq9pV5Y+5cJk5MXGLSWNZO333PP
         CIkMb9Yld7EMsmgUscGL9uo1X+GuOL3YzupwFmzZ7469wqEGuagwumkEmMnioorL0hV+
         VqQ1ZfAhulNlWKyJM8FEj1sDETgfKEQR6ZZrITkwhUHtHfj8hUix2YJJuhPfn5M0hlRe
         uUGEaLnmMqMmGP1wzxq3ok6k/Oo5DEy/V44tQ2l+QVYmifQrfpnDo31622xdvWbsTccY
         2a6g==
X-Gm-Message-State: APjAAAXhc1MJBtC3xeKtJ0axlam6HWH8FkDidTvGXDEoco0IHYraKZEt
        My39WiLePk2NKxpT4COXfFvJ8xD4
X-Google-Smtp-Source: APXvYqyWoCNpbyp0PR36l5ywHvRvF9t8Gxq4LOwhhYPF80q+xM0cPUyukCqllAZQvaU5eH2XUc4Ojg==
X-Received: by 2002:a63:c748:: with SMTP id v8mr63278802pgg.451.1577604977743;
        Sat, 28 Dec 2019 23:36:17 -0800 (PST)
Received: from [192.168.0.26] (pl-768-132.bunbun.ne.jp. [61.7.68.132])
        by smtp.gmail.com with ESMTPSA id z26sm42375866pgu.80.2019.12.28.23.36.16
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2019 23:36:17 -0800 (PST)
From:   "D4rktrick1337@gmail.com" <d4rktrick1337@gmail.com>
X-Google-Original-From: "D4rktrick1337@gmail.com" <D4rktrick1337@gmail.com>
To:     linux-input@vger.kernel.org
Subject: My computer tells me to write to you: "My Touchpad can support a
 different bus"
Message-ID: <a3468bad-4dd1-1363-6943-06f290e2f856@gmail.com>
Date:   Sun, 29 Dec 2019 16:36:14 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Linux-Input Group (?):

Starting my computer from hibernation I get the following message:
"Your touchpad (PNP: SYN1f12 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org"
"psmouse serio2: synaptics: Touchpad model 1, fw: 8.2, id: 0x1e2b1, caps: 0xf00123/0x840300/0x2e800/0x400000, board id: 33-4, fw id 2515328"

I don't know what exactly I should try and if I should. But if it helps development I'm willing to work on it if anyone can give me a hand.


Regards
DarkTrick



____________________________________

My projects:
https://www.youtube.com/channel/UCc8G_u-ugeQUjDWlBuJJ0tg

___________________________________
