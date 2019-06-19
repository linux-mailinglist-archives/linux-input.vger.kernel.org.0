Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 149F44AEF1
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 02:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbfFSAQo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jun 2019 20:16:44 -0400
Received: from mail-pl1-f175.google.com ([209.85.214.175]:42619 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbfFSAQn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jun 2019 20:16:43 -0400
Received: by mail-pl1-f175.google.com with SMTP id ay6so4154980plb.9;
        Tue, 18 Jun 2019 17:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=TjREHwjj3z1VFyQ6jW+2E/lGUqCLnncMsvoGQmWJZTQ=;
        b=Sd+AyjLAsqz5O/hCfGqicfLebqHuu2ACsuM65wZUlt1wQmHSqDeOYo1GxBBhbOusVu
         1fLL8X8Uy8xoRKW6/h7lhVK4e0mbHhcwAbiG9L6BcsWHtxuVVht6yR2XCU8VtT7tuRp3
         /59TDlVyayKkmpHIapS1tHHZo0uQ5iMJrX9b+UZ54pp+wZ2pmazvgR9M9qYy8wba5B+t
         GPeem73i+6f3OQMth5vCCawCT/KDhi0PpTFkJ/fyiUFqOtcNDDBIifggVfDz8xkhJpX5
         AqAix/iX6pNa+gZ6KPJqWU2GMk68gKxPLQ/pIcOJ1PJlw3fKgNmhGC1zC8qWK0EhINTF
         kWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=TjREHwjj3z1VFyQ6jW+2E/lGUqCLnncMsvoGQmWJZTQ=;
        b=a2KYKqfBw44OHXSYYLyrkDWS+dk16nVtuW0ZjpMv8nvcP6R8fpMVVwiqmDfA69fH9O
         iSgE8X3Q0PuvcK4RpvMia0MPIKe5MUTkuhLFlsru1SeknFT6Rkvb+yPAnZyTzlsgWXpk
         oNXcZc38QPLYIDeTs9UnHvcdFB1v8cMJzH9RYKHNwx3Pu2yNTfF1MMWQ7LmXVvN82W5D
         uua9rYg+p5tjZKBnXSe0OPmp/wnDOSrHeMwfoy42A2jo62goyCoN/+f7rORC9YWIqzv6
         cFcPQ9U8C5U9MqbAHiUymAS2D86AEGbLI6+xSmwiidvvMxuhUWtQ/r8IywvRaEO14Vl3
         y07g==
X-Gm-Message-State: APjAAAXfkcG4H+EQ61oku+qBFZIa+CT0wHwQOAIVBP/X8YDt3D7n3eq1
        +nxzlQwSji5JhB3ldde4stZQUByC
X-Google-Smtp-Source: APXvYqw1sa2TXemTj/+wSDlFAHgl4t4cKM5dH6W0qaQ4x4sEhf+kLiw2fI3NHU1dNxKTSyWAyq4btQ==
X-Received: by 2002:a17:902:ba8b:: with SMTP id k11mr14919039pls.107.1560903402785;
        Tue, 18 Jun 2019 17:16:42 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s12sm17625422pfe.143.2019.06.18.17.16.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 17:16:42 -0700 (PDT)
Date:   Tue, 18 Jun 2019 17:16:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.2-rc5
Message-ID: <20190619001640.GA62849@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. Just a few small fixups;
switching a couple of Thinkpads to SMBus for touchpads as PS/2 emulation
is not working well.

Changelog:
---------

Aaron Ma (1):
      Input: elantech - enable middle button support on 2 ThinkPads

Alexander Mikhaylenko (1):
      Input: synaptics - enable SMBus on ThinkPad E480 and E580

Andrey Smirnov (1):
      Input: uinput - add compat ioctl number translation for UI_*_FF_UPLOAD

Anson Huang (1):
      Input: imx_keypad - make sure keyboard can always wake up system

Daniel Smith (1):
      Input: silead - add MSSL0017 to acpi_device_id

Jeff LaBundy (1):
      Input: iqs5xx - get axis info before calling input_mt_init_slots()

Ravi Chandra Sadineni (1):
      Input: elan_i2c - increment wakeup count if wake source

Diffstat:
--------

 drivers/input/keyboard/imx_keypad.c | 18 ++++++++++++++----
 drivers/input/misc/uinput.c         | 22 ++++++++++++++++++++--
 drivers/input/mouse/elan_i2c_core.c |  2 ++
 drivers/input/mouse/elantech.c      |  2 ++
 drivers/input/mouse/synaptics.c     |  2 ++
 drivers/input/touchscreen/iqs5xx.c  | 24 +++++++++++++-----------
 drivers/input/touchscreen/silead.c  |  1 +
 7 files changed, 54 insertions(+), 17 deletions(-)

Thanks.


-- 
Dmitry
