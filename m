Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DB81B486C
	for <lists+linux-input@lfdr.de>; Wed, 22 Apr 2020 17:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgDVPVI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Apr 2020 11:21:08 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:52530 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgDVPVE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Apr 2020 11:21:04 -0400
Received: by mail-il1-f197.google.com with SMTP id a79so2205921ill.19
        for <linux-input@vger.kernel.org>; Wed, 22 Apr 2020 08:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=pz5CUTnf5j/KbXtN31blRs8hszDPf+GoywqGxmL0NSU=;
        b=L6hw+sKTCqWaO/IyOmrb49IHZNtJcqyT8I8k/7T9j3jGe9IAAk82rwTafRJMPqORzx
         9hbZccpZu5h0FOoLGAnMWC08OaEKHr98ZU/4WHFP/fH13Iee2WDS7y8K2znnUo1Kdu8i
         tYCR/78OVvcO7TxtfXDI1ME1eZ9Yt8A7gwHRAJgY+ATmO6wEfsgbt9moU+MFjIk/Ue8H
         cP/sdRGGs5ahbdTdPWCUWG55tKJKDTwB5hrQPVP3RbcTVj1T326bUvhx0WYagUeqd5FD
         9cTF8d2VShG8vAna1TvT0c3RNXrzPy+yrKYDrwsEj50/80gn3fLeycMb22i69ROyEV5d
         YUQg==
X-Gm-Message-State: AGi0Puby0kTpgOackwFh2IwJkc1TZPzzUVc9aN0Hnfxl933meb/NxX4/
        KKCZS47i3WxYj2aEsMZYclbbv/y4RKx8nfcxLdYWRE48lFW/
X-Google-Smtp-Source: APiQypLGfxG+wShvFp6rdfNRJ1n5KuK6e6eGMdujQtoUfdCunfXWlEVxafiQDoC6rEC+Ti0UWFJk3U/4qIqvqPZ78ZYBhiQaXDeB
MIME-Version: 1.0
X-Received: by 2002:a92:d149:: with SMTP id t9mr17233217ilg.213.1587568863606;
 Wed, 22 Apr 2020 08:21:03 -0700 (PDT)
Date:   Wed, 22 Apr 2020 08:21:03 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004221058240.20574-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002bfce805a3e2aec4@google.com>
Subject: Re: KASAN: use-after-free Read in usbhid_close (3)
From:   syzbot <syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        hdegoede@redhat.com, ingrassia@epigenesys.com, jikos@kernel.org,
        julian@cipht.net, killertofu@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, pingc@wacom.com, pinglinux@gmail.com,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com

Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=7bf5a7b0f0a1f9446f4c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14f40acfe00000

Note: testing is done by a robot and is best-effort only.
