Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA43F74F46
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 15:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfGYNZ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 09:25:26 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:33948 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfGYNZ0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 09:25:26 -0400
Received: by mail-io1-f69.google.com with SMTP id u84so55046745iod.1
        for <linux-input@vger.kernel.org>; Thu, 25 Jul 2019 06:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=PkiEcDOK8OA4Va03g5uJ4AVkphP2WNyH087hSbHOvKg=;
        b=ZN5U5LLyTAOCTALgs9SoeAWqYyPMgKOnIBsCrjo+X4r2rKTBPY9nuxEZ9bBeRjPRPc
         Sebpqa04h6zB930h5xeGVCvrQ2pfWjYaE0aEq39Xg+HISnpnLqz2TLKGIv0Ppg3Yx7eM
         sC1rPk7nMNIVXfgdkrNPTmtAHl3iGM+r2v+6U6XWL6qbxOLrHBPT5lbmXfBw7P6y0ZR/
         yZEi1yZiIW50XR4Ik9H1noUllfr4x+Pz4ML4M0xvIYlCf/uzDdGwuYq/AQ11SD49d13b
         gh6aA60vnjEohA9Wm7yALpJYin/afc0vO8ObKh9AkRIxu9sduCeDxsBIpJ+INFqusi5s
         RhSQ==
X-Gm-Message-State: APjAAAV/a8iy2VpS+QppKMhfxZNKhF1/fkOIJPZ5cFMxUgHUwd5IKEZh
        gMCYIxmmwPMxFzTutWmHcTYkxGtSLvB+JOpidbBT7hgXeOGo
X-Google-Smtp-Source: APXvYqz1Ndkw/UtbSazlpG7AKbE/TAniiLCL89AZe6pdDEyx3gdHbC+1SrEidwFkH1pnxzKBEcV9O8kLzRSkb1P8UJao1PqH+4mO
MIME-Version: 1.0
X-Received: by 2002:a6b:7909:: with SMTP id i9mr50502473iop.8.1564059720532;
 Thu, 25 Jul 2019 06:02:00 -0700 (PDT)
Date:   Thu, 25 Jul 2019 06:02:00 -0700
In-Reply-To: <1564058593.14544.3.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000cd1ca058e8108d3@google.com>
Subject: Re: general protection fault in holtek_kbd_input_event
From:   syzbot <syzbot+965152643a75a56737be@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+965152643a75a56737be@syzkaller.appspotmail.com

Tested on:

commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git  
usb-fuzzer-usb-testing-2019.07.11
kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=135edb68600000

Note: testing is done by a robot and is best-effort only.
