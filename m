Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48143BD290
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2019 21:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502059AbfIXTYP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Sep 2019 15:24:15 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:39410 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502027AbfIXTYP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Sep 2019 15:24:15 -0400
Received: by mail-qt1-f194.google.com with SMTP id n7so3564461qtb.6
        for <linux-input@vger.kernel.org>; Tue, 24 Sep 2019 12:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=iIde3UC8y6I1n7ba8lhYD0Bs9hPkUPsPKd2NYdjUKLo=;
        b=dihDYR6FLibsQ1tj94hWwl6EV7s3GE6q86uypXvO248Jol64wBDNuPA7jKCAy080b2
         ugpi4LMDsVrBJwbn93ZnbD0/t/3asI87Rf3e0Jx99XvhxEiy0uDHMkg+Ni0hyepK41I8
         9dJ1vC7bxAKxWnXxWNFsEb9Vsm3tKNoagkQaXnDRRLIJGd7MtZIGPBpclOr14gP1t2eI
         /xEQPLCeCDdWegdxWmJa3+1fveHNMjnlbKJaeV0EfilDqLWEDhm5kNE3/keaCMxQv7wO
         h5WRj131ZSc2D1tdKNzSCDWq4n5af3etXKMrd1Osl24DqHD4uI5khhNZG8ZbAIhlqOeH
         ts+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=iIde3UC8y6I1n7ba8lhYD0Bs9hPkUPsPKd2NYdjUKLo=;
        b=LjAXl3icwU04qWqBPVJS57gUqcU9/O+jJIEYsXbiGeVX9s91gjfU0RPiN1WH+Zsii6
         NslI4ZD1DUWBf0p4W0v95l4Dk8eBwBuSiQr+X7TAWP5+mWuks46qIQh5uc37KIZ2ymb1
         qt4uHPcjkf8z/twSJbliVnE35Hfk+9hLK2HsEMVZ0f/M8o4I3s6GM0/xowi8SG7nCfbX
         1P7T1MdyOib2lOH45i3mWBubPX36pr/bK5iKdYrsq7wVwAg8KQqs7bPzRJS1qbP6gYu3
         SyckOkSgf5m7PUAa1ww9SivcfPIGpO8zEoHkae4yPlhbANoGPNbouSPIBoHH34Be2cay
         hehw==
X-Gm-Message-State: APjAAAUGXzgDRx2s0CZijw2I+Knk4fkYEVCYUq3koL6NLXUd+BWCL7cy
        Ac3QTJ8Wsk3BvJ4mjlQNOGoWGYVA/5Eh+K1sjQP1B3icjUs=
X-Google-Smtp-Source: APXvYqyx07bM3vwL5wtdkpv0GzIr8oSbCqzP7TBbyvYEGlavKRoRWsTGVN4cQ9c4DpVSPcXgklBEXhH9HURzjErZfwE=
X-Received: by 2002:ac8:1cf:: with SMTP id b15mr4509379qtg.56.1569353054057;
 Tue, 24 Sep 2019 12:24:14 -0700 (PDT)
MIME-Version: 1.0
From:   Andrey Melentyev <andrey.melentyev@gmail.com>
Date:   Tue, 24 Sep 2019 21:24:03 +0200
Message-ID: <CAJawrXupRCjOYvm0xCoS-jFpmwMG+tLJ1_pfZzrQ2B1N71PVhw@mail.gmail.com>
Subject: Touchpad LEN0099 PNP0f13 says it can support a different bus
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I have the following message in dmesg output:

psmouse serio1: synaptics: queried max coordinates: x [..5676], y [..4694]
psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1162..]
psmouse serio1: synaptics: Your touchpad (PNP: LEN0099 PNP0f13) says
it can support a different bus. If i2c-hid and hid-rmi are not used,
you might want to try setting psmouse.synaptics_intertouch to 1 and
report this to linux-input@vger.kernel.org.
psmouse serio1: synaptics: Touchpad model: 1, fw: 8.16, id: 0x1e2b1,
caps: 0xf002a3/0x940300/0x12e800/0x400000, board id: 3418, fw id:
2788056
psmouse serio1: synaptics: serio: Synaptics pass-through port at
isa0060/serio1/input0
input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input8
mousedev: PS/2 mouse device common for all mice

After rebooting with psmouse.synaptics_intertouch=1 the touchpad still
works fine and dmesg output is different:

psmouse serio1: synaptics: queried max coordinates: x [..5676], y [..4694]
psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1162..]
psmouse serio1: synaptics: Trying to set up SMBus access
rmi4_smbus 5-002c: registering SMbus-connected sensor
rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics,
product: TM3418-002, fw id: 2788056
input: Synaptics TM3418-002 as /devices/rmi4-00/input/input21
serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
mousedev: PS/2 mouse device common for all mice

Let me know if any additional information could be helpful.

Best regards
Andrey
