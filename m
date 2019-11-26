Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0DE10A559
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2019 21:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbfKZUVD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Nov 2019 15:21:03 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:43210 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKZUVD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Nov 2019 15:21:03 -0500
Received: by mail-io1-f72.google.com with SMTP id b17so1654216ioh.10
        for <linux-input@vger.kernel.org>; Tue, 26 Nov 2019 12:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Akqz/I3ZQjzJAvOshpOikoMNQL6Gvzwc2tf/r4zF6dU=;
        b=Ounm5+8DJXzG68pRTnW1zrJZLq8rGn4uzHf3ydyMBe+Dq/bXP+7F6S3nPKEt8UtarR
         dXZQ3rYRLa6m4duxrT8sTWbVFHh7/281qEnYMVHD3npUdg8rl4gL5X4w8fzy0X6EAB2X
         DQsnkU4x4+Nlbm6inF1O3qXWQ/r0pbLHhfoyIBXVQdHLfBoqhEAW/2T54pMothZqm5fK
         rfVgkTT/UgElqIKQx6mfJr0Q3d9Ix4lI7k/xy7VkuCDb4uwsecXsB5LBitZEVgov1sLc
         27nLpsCA6Et9BInBdD77LXNkVIET7Cj7z1KmKmvEt2AKJWcVjBz/3j2861R6J1jwjYcg
         TVbw==
X-Gm-Message-State: APjAAAXslEFfcpb7xyi4ZAjtq0MYuEXgDSWm8sO5hddEYDrffaYyb7zo
        uWHtG3dKfQIsThXNrrfP0/L9eyzHaaT+qde7uG5xelNXN4A4
X-Google-Smtp-Source: APXvYqxxt+AtVd7wJwjD/XwA+BiQAFWZyeEQ9AZkTAMgW35eXYOdSR6F9M34n0LFgQjt6IDNtDcVbmhTyrwMkTBoVKAOblxNDQnz
MIME-Version: 1.0
X-Received: by 2002:a02:ce51:: with SMTP id y17mr464455jar.1.1574799661213;
 Tue, 26 Nov 2019 12:21:01 -0800 (PST)
Date:   Tue, 26 Nov 2019 12:21:01 -0800
In-Reply-To: <Pine.LNX.4.44L0.1911251622420.1565-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006630680598459e6e@google.com>
Subject: Re: INFO: rcu detected stall in hub_event
From:   syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com

Tested on:

commit:         46178223 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
dashboard link: https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1177cc0ee00000

Note: testing is done by a robot and is best-effort only.
