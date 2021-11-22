Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30C1458D6A
	for <lists+linux-input@lfdr.de>; Mon, 22 Nov 2021 12:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239132AbhKVLb3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Nov 2021 06:31:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235683AbhKVLb2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Nov 2021 06:31:28 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BF5C061748
        for <linux-input@vger.kernel.org>; Mon, 22 Nov 2021 03:28:21 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id z5so75419389edd.3
        for <linux-input@vger.kernel.org>; Mon, 22 Nov 2021 03:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=+IBmi2cX4iRBHo3biKRXD6HcyPhAaBARNO/tKxEJXcU=;
        b=Y6Y4l6vmmkDolF4nNZD6hablZdkjeclmbigG5cdmNG9KOUkm90jlr36ZZc2/xwGr8v
         yM2B9tEBYF25xPnbtzy7+cabxxiJ9JYhfzRnx8lU/2fI68yVCKO3W5TuJc399R6EUxCo
         fypkdoHCjjTcta8pS9/ZBNPFszNVjo+JRCuRkZ4IJDqYJeXHFnsX5lmQi4/8s7A25I5p
         Pg58GIlWYEhr85xeUt5C+HPhQn7vrchaCm0U1WO570698zr5PL9P//u3qQSe/PXdzLi/
         L1LY5eXCUAQwwfaoDAFNVmtcEWWe1rwLK1ZpDBkmyLqzQbGl238r9HnxtpJifFW0R609
         JOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+IBmi2cX4iRBHo3biKRXD6HcyPhAaBARNO/tKxEJXcU=;
        b=SWkmC9E+2fVwVbggU6K0CS4qzscXxuCjyaeu/FFSLU2dALMqdVPiFGz7b8lpD7B4VK
         igm3mtpKJeWmEvdOkI8kZ+qx0ts3SVK0SEEaqROOPimy1lePTbnIcbKtcS+LN5YuAm0E
         UQYEajVpDhkyHI/ilBkfcw2diwS/NL3Zrj0YUO05JaXifHBgQZtrrc9CWNOfe9naKVWP
         Wzpl7nqeUn/UDspPRRp2vdE7+BQKAffXRiYBgkytAnQsOjgIORVoaYCH7BKbu2IRRgqO
         mgW60TLql3JpcZPV0K0KeG7S9vMDXB0ncQGcwifkP2ZMXS12A3H4Ga33Lca7281p24dr
         h1Sw==
X-Gm-Message-State: AOAM531tpTxV0jNVumnCBg3EkvwTlT/53NEcCwNTSKgQY/rlGPPGxeQd
        Q6A6O8qV8QVjfQaCbNOZi4xOQW8B3sicBAPzZMw/UKzTG2A=
X-Google-Smtp-Source: ABdhPJzr9BS2lmaMcUfeW3GCTx+Fejt5m21IVnYnGsWe6ffmoXsCHrhrxTUfNLNgX7I3U8yg/XKGFbcN44XOI38gWik=
X-Received: by 2002:a17:906:d92f:: with SMTP id rn15mr39203382ejb.557.1637580500038;
 Mon, 22 Nov 2021 03:28:20 -0800 (PST)
MIME-Version: 1.0
From:   John Anderson <gjon.anderson@gmail.com>
Date:   Mon, 22 Nov 2021 17:28:09 +0600
Message-ID: <CABSxm5pyonw6RY-6-D+azupC2EGjE9sQ29HfJPaA-f5C_=9Dqg@mail.gmail.com>
Subject: Touchpad error messages and behaviour
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear sir or madam:

My computer has been reporting this error message in Debian 11, #1 SMP
Debian 5.14.9-2~bpo11+1 (2021-10-10).  I set the kernel parameter as
suggested and will see if this
 helps.

 serio1: synaptics: queried min coordinates: x [1306..], y [1156..]
[    3.256058] psmouse serio1: synaptics: Your touchpad () says it can
support a different bus. If i2c-hid and hid-rmi are not used, you
might want to try setting psmouse.synaptics_intertouch to 1 and report
this to linux-input@vger.kernel.org.
[    3.327344] psmouse serio1: synaptics: Touchpad model: 1, fw:
10.16, id: 0x1e2a1, caps: 0xf00923/0x840300/0x12e800/0x500000, board
id: 3408, fw id: 3197945
[    3.372719] input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio1/input/input4
[    3.724613] scsi 0:0:0:0: Direct-Access     Multiple Card  Reader
  1.00 PQ: 0 ANSI: 4


Additional hardware information:

input: SYNA3296:00 06CB:CD50 Mouse as
/devices/pci0000:00/0000:00:17.1/i2c_designware.3/i2c-4/i2c-SYNA3296:00/0018:06CB:CD50.0001/input/input6
[    2.536640] input: SYNA3296:00 06CB:CD50 Touchpad as
/devices/pci0000:00/0000:00:17.1/i2c_designware.3/i2c-4/i2c-SYNA3296:00/0018:06CB:CD50.0001/input/input7
[    2.536697] hid-generic 0018:06CB:CD50.0001: input,hidraw0: I2C HID
v1.00 Mouse [SYNA3296:00 06CB:CD50] on i2c-SYNA3296:00


Any questions please let me know, thank you for your time,

John Anderson
