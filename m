Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89AEB2D5C10
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 14:39:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388344AbgLJNi4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 08:38:56 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:39557 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389583AbgLJNio (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 08:38:44 -0500
Received: by mail-io1-f72.google.com with SMTP id n9so3895051iog.6
        for <linux-input@vger.kernel.org>; Thu, 10 Dec 2020 05:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=kgFGcmgPC8j3KRHWZ4y5Gyk/Fnf8f4ATjgdtBg1RD1A=;
        b=lb6fX7tnaYaEN6liuj8EvDvsX7OMDnL1Ca+WBonSrEyPPRLMwJrxzxlAp7WT4clAlp
         T4ciFs39paemHxlmrB+u8XbKo9YcSXGl3vYUvnL54wRBuXw1iJZFrjX5dB0zEmgcm1++
         hdYmDjKxvfhQskrG+YbZ03pUlsKXuYL2kGdYX8cKSOu24FR6uLGxyIu/W1AuAgSy7jm5
         LQIBD1ec0cNGlqgFW+d0fnLd/42+S1dnNU47Z5eKGqqD7rS6GgbnkAt/MNvwj0wslImf
         WEEB4SjZkL5BQUUi+XTTAz3fUlMNc/zpUlU6lXd9UCg4fuv0YNpoF3jpXPYlwVaEGDOb
         316g==
X-Gm-Message-State: AOAM532gR7wt5t6y/L4DarLiYRb8G1uu1YgG4xoNZQfT9DNRH6SF1GFR
        C/8TtOYwbfpFK5nwzl1dFWXp+yNsKsA3OPTmjTV0rTcANXTc
X-Google-Smtp-Source: ABdhPJzKakhL76WLvBKzOxJhMiSEhpIghvxAoWZtBw/Qc29GbG//xqYBqwgWc4mVrw77xaQMi6jiEciSsZGZBgCigzE046DPqG0C
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1653:: with SMTP id y19mr8510977iow.90.1607607483982;
 Thu, 10 Dec 2020 05:38:03 -0800 (PST)
Date:   Thu, 10 Dec 2020 05:38:03 -0800
In-Reply-To: <X9GiwQsABTa/zC/t@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000056a2905b61c496c@google.com>
Subject: Re: WARNING in cm109_input_ev/usb_submit_urb
From:   syzbot <syzbot+150f793ac5bc18eee150@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, eli.billauer@gmail.com,
        gregkh@linuxfoundation.org, gustavoars@kernel.org,
        ingrassia@epigenesys.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        vulab@iscas.ac.cn
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+150f793ac5bc18eee150@syzkaller.appspotmail.com

Tested on:

commit:         f6d088b4 Input: cm109 - do not stomp on control URB
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=af17f186e004b5ef
dashboard link: https://syzkaller.appspot.com/bug?extid=150f793ac5bc18eee150
compiler:       clang version 11.0.0 (https://github.com/llvm/llvm-project.git ca2dcbd030eadbf0aa9b660efe864ff08af6e18b)

Note: testing is done by a robot and is best-effort only.
