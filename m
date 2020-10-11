Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0A828A675
	for <lists+linux-input@lfdr.de>; Sun, 11 Oct 2020 11:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727904AbgJKJAu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Oct 2020 05:00:50 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:47293 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725844AbgJKJAt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Oct 2020 05:00:49 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7698bc4a
        for <linux-input@vger.kernel.org>;
        Sun, 11 Oct 2020 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to
        :content-type; s=mail; bh=vyH3e8FNOpK1pCzhGiGPYB9htns=; b=GOmsCA
        tKiAAkiF6OBhJ/BKWe/3yFey04R2wjKwL2vmCJB6vyhDvUk0SVU8Y72xUDAt/nsT
        QAFIB0Qou5ft0nNQOSjQbOZ3Zm0F5PBNBU5PrvoXpHTdoBe07LqGF78344r8rPgQ
        FjvfjQiZu2s9f4CmcV7euQM2o/NIznSVJYLkmWaVGw+UYsICZ0rsNmScfPABIogo
        xP+yzDv9zSWg5gs/z0iczDaZRrYl8eEhJcon40LZ5drDceQ83ZSH0Wd+kADYwA+T
        GXzPE64qiF259eUhOmOA3nmidIi+rWzrJdJReulI1twDR98cULKyq9lU/YXPEU4U
        Qbmj3SI5Slmt4QCg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a67edd73 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-input@vger.kernel.org>;
        Sun, 11 Oct 2020 08:27:38 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id r10so8281315ilm.11
        for <linux-input@vger.kernel.org>; Sun, 11 Oct 2020 02:00:45 -0700 (PDT)
X-Gm-Message-State: AOAM532qDmvVxK6bvkiKv5eer5OfBFxbD722z3W5ZtacLXht8yG67N22
        QQxjMKQRVckeu9e+AvHWB648jlTEJeLUm7O5ZnY=
X-Google-Smtp-Source: ABdhPJy7bKGFnx/xA/DIoS5CwX0z1oiol/32TdAD+xoZfj/RADRWpVESzCDaW1aGAyunxSvD88cWESKI1zTxHGBkAg0=
X-Received: by 2002:a92:849a:: with SMTP id y26mr15932877ilk.38.1602406844551;
 Sun, 11 Oct 2020 02:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
 <20200930225046.173190-1-Jason@zx2c4.com> <20200930225046.173190-3-Jason@zx2c4.com>
 <CAHmME9rAu0nVTGaQK84MxODuR9Ym3Q1FTyw_sVStmUTs9kmifQ@mail.gmail.com>
In-Reply-To: <CAHmME9rAu0nVTGaQK84MxODuR9Ym3Q1FTyw_sVStmUTs9kmifQ@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Sun, 11 Oct 2020 11:00:33 +0200
X-Gmail-Original-Message-ID: <CAHmME9r4fCw93_48kJzV03GvZOrkr1TZKeh60kTEmacGwCgsBA@mail.gmail.com>
Message-ID: <CAHmME9r4fCw93_48kJzV03GvZOrkr1TZKeh60kTEmacGwCgsBA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Input: synaptics - enable InterTouch for ThinkPad
 P1/X1E gen 2
To:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Lyude Paul <lyude@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>,
        Sultan Alsawaf <sultan@kerneltoast.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

More IRQ grumpiness:

[221465.585227] irq 16: nobody cared (try booting with the "irqpoll" option)
[221465.585228] CPU: 0 PID: 0 Comm: swapper/0 Tainted: P S   U     O
   5.9.0-rc8+ #145
[221465.585229] Hardware name: LENOVO 20QTCTO1WW/20QTCTO1WW, BIOS
N2OET47W (1.34 ) 08/06/2020
[221465.585229] Call Trace:
[221465.585230]  <IRQ>
[221465.585234]  dump_stack+0x57/0x70
[221465.585236]  __report_bad_irq+0x30/0xa2
[221465.585237]  note_interrupt.cold+0xb/0x6b
[221465.585237]  handle_irq_event+0x78/0x7a
[221465.585238]  handle_fasteoi_irq+0x6d/0x190
[221465.585240]  asm_call_irq_on_stack+0xf/0x20
[221465.585241]  </IRQ>
[221465.585242]  common_interrupt+0xa9/0x120
[221465.585243]  asm_common_interrupt+0x1e/0x40
[221465.585245] RIP: 0010:cpuidle_enter_state+0xc5/0x320
[221465.585246] Code: c7 0f 1f 44 00 00 31 ff e8 78 2c b0 ff 80 7c 24
0f 00 74 12 9c 58 f6 c4 02 0f 85 41 02 00 00 31 ff e8 0f a4 b4 ff fb
45 85 e4 <0f> 88 fd 00 00 00 49 63 d4 48 6b ca 68 4c 2b 3c 24 48 6b c2
38 48
[221465.585246] RSP: 0018:ffffffff82003e80 EFLAGS: 00000202
[221465.585247] RAX: ffff888ffc228f00 RBX: ffffe8ffffa37608 RCX:
000000000000001f
[221465.585247] RDX: 0000000000000000 RSI: 00000000378e38e3 RDI:
0000000000000000
[221465.585248] RBP: ffffffff8209fdc0 R08: 0000c96bf989794d R09:
0000000000000008
[221465.585248] R10: 0000000000000005 R11: ffff888ffc228004 R12:
0000000000000001
[221465.585249] R13: ffffffff8209fe40 R14: 0000000000000001 R15:
0000c96bf989794d
[221465.585250]  cpuidle_enter+0x24/0x40
[221465.585252]  do_idle+0x1a4/0x220
[221465.585253]  cpu_startup_entry+0x14/0x20
[221465.585254]  start_kernel+0x48d/0x497
[221465.585256]  secondary_startup_64+0xb6/0xc0
[221465.585257] handlers:
[221465.585258] [<00000000498461dd>] i801_isr
[221465.585258] Disabling IRQ #16
[221480.253990] i801_smbus 0000:00:1f.4: Timeout waiting for interrupt!
[221480.253995] i801_smbus 0000:00:1f.4: Transaction timeout
[221480.256149] rmi4_physical rmi4-00: Failed to read irqs, code=-110
[221484.287300] i801_smbus 0000:00:1f.4: Timeout waiting for interrupt!
[221484.287304] i801_smbus 0000:00:1f.4: Transaction timeout
[221484.289461] rmi4_physical rmi4-00: Failed to read irqs, code=-110
[221484.490637] i801_smbus 0000:00:1f.4: Timeout waiting for interrupt!
[221484.490641] i801_smbus 0000:00:1f.4: Transaction timeout
[221484.492793] rmi4_physical rmi4-00: Failed to read irqs, code=-110
[221484.693965] i801_smbus 0000:00:1f.4: Timeout waiting for interrupt!
[221484.693970] i801_smbus 0000:00:1f.4: Transaction timeout
[221484.696126] rmi4_physical rmi4-00: Failed to read irqs, code=-110
[221484.897307] i801_smbus 0000:00:1f.4: Timeout waiting for interrupt!
[221484.897311] i801_smbus 0000:00:1f.4: Transaction timeout
[221484.899466] rmi4_physical rmi4-00: Failed to read irqs, code=-110
[221485.100643] i801_smbus 0000:00:1f.4: Timeout waiting for interrupt!
[221485.100647] i801_smbus 0000:00:1f.4: Transaction timeout
[221485.102800] rmi4_physical rmi4-00: Failed to read irqs, code=-110
[221485.303911] i801_smbus 0000:00:1f.4: Timeout waiting for interrupt!
[221485.303915] i801_smbus 0000:00:1f.4: Transaction timeout
[221485.306024] rmi4_physical rmi4-00: Failed to read irqs, code=-110
