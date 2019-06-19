Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 939284B08E
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 06:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbfFSEFJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 00:05:09 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:33750 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfFSEFJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 00:05:09 -0400
Received: by mail-wr1-f52.google.com with SMTP id n9so1743847wru.0
        for <linux-input@vger.kernel.org>; Tue, 18 Jun 2019 21:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorremedies-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=PhSC5z/qhDUXYm32vUpgu0y51bYOaIED0wzUzn2tSEQ=;
        b=NJJ9pCbzUzPj2lU+O+hMisDWDjKQHeRZaKCvLc80xOt+A0y+2TZCM0FMvM1x8YB+/n
         2HtyKvlE24kxSZOq+TK52PCQTrZ8XICZeDGhUv28FEdEGTnEXVjU1ye0BMPo9/vGHlku
         MiEqyKWXWb35XR6Q+qoM+6y+Taq+B9grEaUW5khS9K0T7DfsT/5m5CBUvUlCMXR7ZDAA
         LczDx9VEEg4L3K72hHAlj4o1UiSZVc70qtHKEQpC9prcNjh1STq9CRWCTApoBAAhxFjy
         FbPykQQm4FipQamHYHhMfdk6dqG9DuzxLjSfQh20CE6rlNCGt8YUfpnb/hbkdpeIrb49
         7Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=PhSC5z/qhDUXYm32vUpgu0y51bYOaIED0wzUzn2tSEQ=;
        b=N/30RCR/e17ERrJNrOLEW+WT8ftkvSRzHDnVhwAFdp0qbBZuryc6OfUz36CJW2fgxP
         Xang9yeT3ERmdbax3gmAy7kvwfeNcrL+Oc4TSXKYqkxL5QJNDOiHihrbm2yFmj1SOvCO
         ViBPeNaQczWwz7RRdyzgvpa1/vBK/Ecc3ycNjuVdZTAkBEm6zJY2TpE0YOBjZNWBsahg
         yMaoLaU0TNRWGa6W4iIcEOuuU14SUclEEalig6nJ2t8esumOTCdspx88QsaB7Ggk0AUF
         /lhZuJxWDJVzEYU7skrbdTIS3WJNHforPWDgmN+IzCVWueIq5OgNMF2+e0QGZxMTbmoE
         /GcQ==
X-Gm-Message-State: APjAAAWe326tzKpXwaoMxzmHh1haBru4Mg4p52K764EqNOWgEOEDu/xQ
        Ozz6tXb636QnJFvtDtxss8HPDNVnM/3zBX9pmrdxyqY4tDs=
X-Google-Smtp-Source: APXvYqxs+aK0rOGukaXIhp9pGoxwiWwkzywxPSu7sumEzl0UEtdg02HkSGqNGVKPB6wRta227Qm4SA21IKzhy92laZw=
X-Received: by 2002:a05:6000:4b:: with SMTP id k11mr5905693wrx.82.1560917107049;
 Tue, 18 Jun 2019 21:05:07 -0700 (PDT)
MIME-Version: 1.0
From:   Chris Murphy <lists@colorremedies.com>
Date:   Tue, 18 Jun 2019 22:04:56 -0600
Message-ID: <CAJCQCtTU+epLv7BpwF8tfz3nSM8y1Ls8orj01D73aXBG+iTWSQ@mail.gmail.com>
Subject: Apple magicmouse, frequent disconnects
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I've got an Apple Magicmouse, bluetooth mouse, and it frequently
disconnects on linux, more than a dozen times per day, even more than
a dozen times per hour sometimes. This happens on an hp laptop, and a
Mac laptop running linux (specifically Fedora). When rebooted to
Windows 10 and macOS respectively, the mouse works as expected without
disconnects.

It happens on kernels going back before 4.9 and up to current 5.2rc5
kernels, and is not a regression near as I can tell.

Someone else discovered that if CONFIG_HID_BATTERY_STRENGTH is not
set, the problem doesn't happen. I can confirm this, but as a
consequence I no longer get any battery remaining information which is
suboptimal.
https://bugzilla.kernel.org/show_bug.cgi?id=103631

So I'm wondering what more information I can provide to figure out why
polling the mouse (apparently) causes these disconnects. I never see a
kernel message related to the disconnect, only after the reconnect
happens.

[ 1367.387984] flap.local kernel: magicmouse 0005:05AC:030D.0004:
unknown main item tag 0x0
[ 1367.388472] flap.local kernel: input: mouses as
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/bluetooth/hci0/hci0:512/0005:05AC:030D.0004/input/input20
[ 1367.391109] flap.local kernel: magicmouse 0005:05AC:030D.0004:
input,hidraw2: BLUETOOTH HID v3.06 Mouse [mouses] on 00:c2:c6:f0:52:57

Hp test system:

hci0:    Type: Primary  Bus: USB
    BD Address: 00:C2:C6:F0:52:57  ACL MTU: 1021:4  SCO MTU: 96:6
    UP RUNNING PSCAN
    RX bytes:15083 acl:0 sco:0 events:2439 errors:0
    TX bytes:600912 acl:0 sco:0 commands:2437 errors:0
    Features: 0xbf 0xfe 0x0f 0xfe 0xdb 0xff 0x7b 0x87
    Packet type: DM1 DM3 DM5 DH1 DH3 DH5 HV1 HV2 HV3
    Link policy: RSWITCH SNIFF
    Link mode: SLAVE ACCEPT
    Name: 'flap.local'
    Class: 0x0c010c
    Service Classes: Rendering, Capturing
    Device Class: Computer, Laptop
    HCI Version: 4.2 (0x8)  Revision: 0x100
    LMP Version: 4.2 (0x8)  Subversion: 0x100
    Manufacturer: Intel Corp. (2)

Apple Magic Mouse (original, not the 2)


Originally sent to linux-bluetooth, suggestion made to post here instead.
https://lore.kernel.org/linux-bluetooth/61972141474cad5b43af0808fa701b0adff12971.camel@hadess.net/T/#t


--
Chris Murphy
