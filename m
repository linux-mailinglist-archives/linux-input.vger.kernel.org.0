Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C53D17ED7B
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 01:57:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgCJA5D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Mar 2020 20:57:03 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:39793 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbgCJA5D (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Mar 2020 20:57:03 -0400
Received: by mail-il1-f197.google.com with SMTP id x2so8670572ila.6
        for <linux-input@vger.kernel.org>; Mon, 09 Mar 2020 17:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=LYm5Iby0moxVQ3MIVViH9TGv1Wc+3G3kH6N8E5ebnTE=;
        b=mtJC3U6xnuBWT6QWk1NRDlzSYgdPq9HtolqMvTPgIyd/jNGMC2rzfwdoL0G4OXti6R
         DXrTUUE62b3z1X41hVjEJ7TviM1XIuEGOJ2JMzZExfI6hre5m9NohjiPhlmCZjHRjBER
         rX/AxzTG2++SCvtFfW4c0x4Na+dgzqThP44oUliEXz0IGcqNrj7fLx6RtAsh/SKrED11
         rmHcCMXQPdqgvXlO0jTVOVeXNCvAqNj19Fxu2pfYPFBMZ+9FQ3EN4oiuZtaNA6IzL7G3
         1wI8AE8siA5oLqBRM7+QAXfNsNDtZQtdPrWYJjD+mB/x9+6ICKMuPwWJv1LBy9oL3EFM
         HtyQ==
X-Gm-Message-State: ANhLgQ3arZnTAKNJEmPX2NWVsq5UFQQWDg2Q6T3xCr8tB5R0i//Sd+VA
        fv2NoSeakisNKSlQfOhNKtk4Pkx9K6+ZUP2pYlB8RCWx+KBk
X-Google-Smtp-Source: ADFU+vsO07X2AYCKTvab5N7cNSC601aCG4vt7PzApUl9ze4ga8n/fz5NIF4Ffi3z5mMRBJnLnNodZUm/iOqnfNwJed5i3tLZZFAN
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:f43:: with SMTP id y3mr17890487ilj.174.1583801822243;
 Mon, 09 Mar 2020 17:57:02 -0700 (PDT)
Date:   Mon, 09 Mar 2020 17:57:02 -0700
In-Reply-To: <000000000000ce8d2305a03b0988@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000002735905a07599be@google.com>
Subject: Re: INFO: trying to register non-static key in uhid_char_release
From:   syzbot <syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, dh.herrmann@googlemail.com,
        ebiggers@kernel.org, hdanton@sina.com, jikos@kernel.org,
        jkorsnes@cisco.com, jkosina@suse.cz, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has bisected this bug to:

commit 84a4062632462c4320704fcdf8e99e89e94c0aba
Author: Johan Korsnes <jkorsnes@cisco.com>
Date:   Fri Jan 17 12:08:36 2020 +0000

    HID: core: increase HID report buffer size to 8KiB

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=113098b1e00000
start commit:   2c523b34 Linux 5.6-rc5
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=133098b1e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=153098b1e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a5295e161cd85b82
dashboard link: https://syzkaller.appspot.com/bug?extid=8357fbef0d7bb602de45
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b439c3e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16dc6fb5e00000

Reported-by: syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com
Fixes: 84a406263246 ("HID: core: increase HID report buffer size to 8KiB")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
