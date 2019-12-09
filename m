Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F65117BB7
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 00:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfLIXqB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 18:46:01 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:36220 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbfLIXqB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 18:46:01 -0500
Received: by mail-il1-f198.google.com with SMTP id v15so13011600iln.3
        for <linux-input@vger.kernel.org>; Mon, 09 Dec 2019 15:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=hWaIex+koh6jdBsw/jvRJQ3HQOaL7kSrdmI8OfB4npk=;
        b=Lq5pArAP7EpDykJyrzSB3BN9/VUF9FGZteHWKh9Tns9kmasYQFxIsdmtrFDLYg2P7g
         Gj0oPor8xt66vs4yCoXNz39/EMc1cNhsvTTDja8moH3AO595+7pmJSQYltRPlwhXLEyW
         mgrNG7YGaCNQZbl/PYEmHykjMT+QaKBEGbBoN6tkhMJPsnzO1qZygmKsUmmylzs7eIOm
         BmRTxerLHLItH91cA0LYhpEJ5WJRoG6tFyA5It1qKCMtKF6qSA5gkchLIUifkmma4UZm
         lA7I2dd5HW99OQNgMdItGygb6G2dYv3llAzezbA320PKOkuJTKNphQVhPK+jtY5YXAGw
         JPvw==
X-Gm-Message-State: APjAAAUqewdeexe+NiNyen+/ga2SSTXBEmfIy/MwLyAtY5FYqsMp+BUr
        e/4743kOh+3BI9H9BTq0AMhDZsc9k6DOupAaFPNurknaVJVM
X-Google-Smtp-Source: APXvYqycbY+HQGkGdjQbePP8cr8ECSXGxrDkL3BMEEnHcpRL29CgV9t9BGQj2mNNgZ2EV+ADomhx9vWT9AVPvaH1ZJgv29P59Yt5
MIME-Version: 1.0
X-Received: by 2002:a5d:96c6:: with SMTP id r6mr9224856iol.236.1575935160916;
 Mon, 09 Dec 2019 15:46:00 -0800 (PST)
Date:   Mon, 09 Dec 2019 15:46:00 -0800
In-Reply-To: <Pine.LNX.4.44L0.1912091448420.1462-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000074a59505994dfff0@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hid_field_extract
From:   syzbot <syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com>
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
syzbot+09ef48aa58261464b621@syzkaller.appspotmail.com

Tested on:

commit:         1f22d15c usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=8ccee2968018adcb
dashboard link: https://syzkaller.appspot.com/bug?extid=09ef48aa58261464b621
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=146cae41e00000

Note: testing is done by a robot and is best-effort only.
