Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C99B4EEA
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 15:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfIQNNv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 09:13:51 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35526 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfIQNNv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 09:13:51 -0400
Received: by mail-lj1-f194.google.com with SMTP id m7so2798533lji.2
        for <linux-input@vger.kernel.org>; Tue, 17 Sep 2019 06:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=htPi2JarsqceTDxOlAyjSDfaFKhu0r5DgkfxmH733Nk=;
        b=a7P5Y9kmyzEIYOLmwF1qghrXkSH45/pdodcRkPFff5et+tKqxa+BFtOQ7Cr3GVyMBp
         UjEX699ZbaCDx7sbUB2pNR9ehPg8M3Ztk1EF4lY1RZTSnfqQvWRw8YFm3mTvlRWfyq3d
         IXkIvjQc4eiII/oJkvCXRIQS2o8PTj8ldbLAmOLqlJfFFKreee2SExT6t2DQtMwoltKa
         nRWMMGP6VbGsGhU0/yr0PWpauK5qp5d7xYFLAasjqLAdqcvCiMcCJAgVnRaj6Umji9dg
         HFha9fogwokHfej3S/gbfNDrZlzrYiaQ8WySme2sKq8ss8g19K0s1St6khB0gz5HjCZV
         /xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=htPi2JarsqceTDxOlAyjSDfaFKhu0r5DgkfxmH733Nk=;
        b=OA/jdWsCi305/O9yIQOClbxCXyqZjSKLd3StH6d4hmreZGVA4wu65yTql4Lpc1bRFj
         QmV93gr4B4+KfGmh0yzUH0YmEnNvIQX0lKsAO9PmdqMvF9OJ8M7KUT/pheIX76bT/9sk
         nLZLdr1N3a4FcTyMv5fAAcIljnzNVqSh6PVWjaNpSuyflLtrMdZd7DYDwFEQgTOPKhRd
         4NcFTGxL5pX67y13NLT29FWKB6Eza7x5AN5ZALxr2rxpYJPcNkG9tqP9+EGrgK4qFEYm
         CU0WJ3tm7qOAoUIvcIovn2sqP8Mu0IB7qwyMtZ4Yhazbw66wFk5MWYV+zMJIca4Tpjzm
         S63g==
X-Gm-Message-State: APjAAAVQoq9ADQ6ioW+ZI9jT6RnoGQiUdpco4pIOREKKxiJ0YHFjfF0o
        /RjPr3n76cTeY0rWSXrTw95OHtbAkVgi21EX2fn/X2f7uX8=
X-Google-Smtp-Source: APXvYqwZywQ1f0qOjwbHzLl1NpaSxd6plYzv6C5fJwskXZJ28ybmYJPNXvcJk0qYofjcFcJTo65hROHCTHzYoBP+AjQ=
X-Received: by 2002:a2e:9586:: with SMTP id w6mr1796797ljh.47.1568726028927;
 Tue, 17 Sep 2019 06:13:48 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?WG94b9GCINCY0YHQutCw0L3QtNC10YDQvtCy?= 
        <shurrman@gmail.com>
Date:   Tue, 17 Sep 2019 16:13:37 +0300
Message-ID: <CAGLN7_SYeMoGqTJdxR_25o6V+EUsCxkrbQ2=ijCMrd7dOSD9GQ@mail.gmail.com>
Subject: Synaptic touchpad stopped working
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

After some updates (I'm on the recent Fedora 30 with all updates) I
noticed that touchpad stopped working. dmesg suggested to adress here,
so doing it :-)

$ dmesg | grep -i touch
[    2.334364] psmouse serio1: synaptics: Your touchpad (PNP: SYN3264
SYN1e00 SYN0002 PNP0f13) says it can support a different bus. If
i2c-hid and hid-rmi are not used, you might want to try setting
psmouse.synaptics_intertouch to 1 and report this to
linux-input@vger.kernel.org.
[    2.386342] psmouse serio1: synaptics: Touchpad model: 1, fw: 8.16,
id: 0x1e2b1, caps: 0xf00123/0x840300/0x12e800/0x400000, board id:
3386, fw id: 2639617
[    2.419579] input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio1/input/input4
[    4.468684] input: SYNA7813:00 06CB:1942 Touchscreen as
/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-8/i2c-SYNA7813:00/0018:06CB:1942.0005/input/input27
[    4.617023] hid-multitouch 0018:06CB:1942.0005: input,hidraw4: I2C
HID v1.00 Device [SYNA7813:00 06CB:1942] on i2c-SYNA7813:00

$ uname -a
Linux shurrman 5.2.14-200.fc30.x86_64 #1 SMP Tue Sep 10 12:17:24 UTC
2019 x86_64 x86_64 x86_64 GNU/Linux

Any thoughts/suggestions?

Best regards,
Alex
