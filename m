Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB6E13E75
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2019 10:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfEEIpL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 May 2019 04:45:11 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:57924 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfEEIpL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 May 2019 04:45:11 -0400
Received: from fsav402.sakura.ne.jp (fsav402.sakura.ne.jp [133.242.250.101])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x458iRrd026524;
        Sun, 5 May 2019 17:44:27 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav402.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav402.sakura.ne.jp);
 Sun, 05 May 2019 17:44:27 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav402.sakura.ne.jp)
Received: from [192.168.1.8] (softbank126012062002.bbtec.net [126.12.62.2])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x458iMmj026500
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Sun, 5 May 2019 17:44:26 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Subject: Re: KASAN: use-after-free Read in add_uevent_var
To:     syzbot <syzbot+6da9575ba2db4da91831@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com
References: <000000000000559435058813dc8d@google.com>
Cc:     airlied@linux.ie, dmitry.torokhov@gmail.com,
        dri-devel@lists.freedesktop.org, hpa@zytor.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, patrik.r.jakobsson@gmail.com,
        rydberg@bitmath.org, tglx@linutronix.de, wsa@the-dreams.de,
        x86@kernel.org
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <75593427-4777-93ef-a141-5327a8afe75d@I-love.SAKURA.ne.jp>
Date:   Sun, 5 May 2019 17:44:22 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <000000000000559435058813dc8d@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This seems to be triggered by "pkg/report: skip printk and other printing functions " on syzbot side.
The fix should be "kobject: Don't trigger kobject_uevent(KOBJ_REMOVE) twice." in linux-next.git.

#syz dup: KASAN: use-after-free Read in string

