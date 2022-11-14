Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAFEB628A3E
	for <lists+linux-input@lfdr.de>; Mon, 14 Nov 2022 21:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbiKNUOT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Nov 2022 15:14:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236205AbiKNUOS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Nov 2022 15:14:18 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AA5B82
        for <linux-input@vger.kernel.org>; Mon, 14 Nov 2022 12:14:17 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id i21so18947872edj.10
        for <linux-input@vger.kernel.org>; Mon, 14 Nov 2022 12:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6CrVBAsYG3f0Q+vC4r8ODjZdeCfqSV7rFMfi/OtifvI=;
        b=k+W63GR8Qv1swU+F4QBTC0skIvfkzBvqIN5NJ+4yo00qcP6yZMN1MqBkzhLxFhhWJB
         MLavmY0DWQTbQ8z3LKdsgzddbSbM9Cn1BprBm3fTB0OtDsHU6Qveqy3JmcYC3NkqE2R/
         2boMB46vxHrjH/pkovlrbleSXbw1mrisD0EaTg1+wcwOYptsNHdQARGM9FDDzyuuzHPQ
         bUHDPCJkMhHSJb6aB/GKfzqtNIlfQDUPefgjnykIoDfScHgDA6jFU0NLGoCCJQvsK6v9
         eV3bY8uED+cvZe/iuHhIzUd6epXSkHjkvGhZOBpaAlGuUKSVVgsHybf7l24+25wbiWBF
         utDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CrVBAsYG3f0Q+vC4r8ODjZdeCfqSV7rFMfi/OtifvI=;
        b=RgQk658OFsSEwRJlm9tkmuOMZJX+fR6IF8xqwpixKq9BPTLycRxJKcRIsSJV0K8uq8
         cwyO8wZG7LoFaDvoDku2DC/6Zo9/kYoMMSy0M/ycR9OyR1cT7Ayzn4elEtfbYIPWYv20
         CiCMTc1qRvFXFJ62Aq6yyYbJlXY2uLnsQtledzrdmcuAti53VELAdmEUB2iRokmY2YUM
         7w2r8v2PfKeODt8uGZfTIynIdbb/w5KB6jxBB8n2tf2nnva5dYbhoPpMosjgRnd07r+3
         ZTyGctZRPABXRXC+huDH6l0maVP2gYJ3BhFqNsIJMHUWJLCEE7pDIHJLBiOlXU2q/G7M
         6a4Q==
X-Gm-Message-State: ANoB5plMWQy7ugPQycrOIGAOFv8TTXDHMF9QRwvjKBPkldk0Z7fYPGDS
        Op3ttu4pnrb43adbTr30CsQJCeuJSZDImtFTjxg7AoL1
X-Google-Smtp-Source: AA0mqf4+oZyxC6W/v+miEiSdXw3IRBoHhxSJkbWDekFObmtJJnOIyuRfxpwKj/fahvKDUZPO5L2NIcNQHUKeyimyJMo=
X-Received: by 2002:aa7:dad8:0:b0:467:3ea1:acdd with SMTP id
 x24-20020aa7dad8000000b004673ea1acddmr12758423eds.96.1668456855926; Mon, 14
 Nov 2022 12:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
 <20221029184851.282366-12-roderick.colenbrander@sony.com> <9d0efafd-43b9-1c3b-4c3e-1add1b03bc3c@redhat.com>
 <CAEc3jaDsacStgnQcAP6Ro-_vAH2Vft+En1mS_joyEq7R-aJtfQ@mail.gmail.com>
In-Reply-To: <CAEc3jaDsacStgnQcAP6Ro-_vAH2Vft+En1mS_joyEq7R-aJtfQ@mail.gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 14 Nov 2022 12:14:03 -0800
Message-ID: <CAEc3jaBVYKjrnn1PU+XVimoCq8HPWW1sf9wcWYO8HJuberfZLA@mail.gmail.com>
Subject: Re: [PATCH 11/13] HID: playstation: add DualShock4 bluetooth support.
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 14, 2022 at 8:53 AM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> On Mon, Nov 14, 2022 at 5:37 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> >
> >
> > On Sat, Oct 29, 2022 at 8:49 PM Roderick Colenbrander <roderick@gaikai.com> wrote:
> > >
> > > Add support for DualShock4 in Bluetooth mode. In Bluetooth, the device
> > > is a bit strange in that after 'calibration' it switches sending all its
> > > input data from a basic report (only containing buttons/sticks) to an
> > > extended report, which also contains touchpad, motion sensors and other
> > > data. The overall design of this code is similar to the DualSense code.
> > >
> > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > ---
> >
> >
> > Hi roderick,
> >
> > Starting with this commit, the hid-tools testsuite is segfaulting:
> >
> > ---
> > hid-tools/tests/test_sony.py::TestPS4ControllerBluetooth::test_creation
> > PASSED [ 70%]
> > hid-tools/tests/test_sony.py::TestPS4ControllerBluetooth::test_buttons
> > PASSED [ 70%]
> > hid-tools/tests/test_sony.py::TestPS4ControllerBluetooth::test_dual_buttons
> > PASSED [ 70%]
> > hid-tools/tests/test_sony.py::TestPS4ControllerBluetooth::test_left_joystick_press_left
> > PASSED [ 70%]
> > hid-tools/tests/test_sony.py::TestPS4ControllerBluetooth::test_left_joystick_press_right
> > PASSED [ 70%][  534.255759] BUG: kernel NULL pointer dereference, address: 0000000000000010
> > [  534.256406] #PF: supervisor read access in kernel mode
> > [  534.256923] #PF: error_code(0x0000) - not-present page
> > [  534.257345] PGD 0 P4D 0
> > [  534.257558] Oops: 0000 [#1] PREEMPT SMP PTI
> > [  534.257897] CPU: 0 PID: 619 Comm: pytest-3 Not tainted 6.1.0-rc1-CI-PIPELINE-4044-g0f01ce929234 #1
> > [  534.258630] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-1.fc36 04/01/2014
> > [  534.259314] RIP: 0010:devres_release_group+0x69/0x160
> > [  534.259714] Code: 49 8b bc 24 98 02 00 00 49 8d b4 24 90 02 00 00 49 89 c7 48 39 fe 75 12 e9 de 00 00 00 48 8b 7f 08 48 39 fe 0f 84 d1 00 00 00 <48> 81 7f 10 f0 da fb 83 75 e9 48 85 db 0f 84 a0 00 00 00 48 3b 5f
> > [  534.261197] RSP: 0018:ffffa145c0887ca8 EFLAGS: 00010082
> > [  534.261618] RAX: 0000000000000246 RBX: ffffffff84153600 RCX: 0000000000000000
> > [  534.262179] RDX: 0000000000000001 RSI: ffff970980ba56c8 RDI: 0000000000000000
> > [  534.262731] RBP: ffff970980ba56c4 R08: 0000000000000001 R09: ffffffff83ad9800
> > [  534.263290] R10: 000000000000001f R11: ffff97098a9186d8 R12: ffff970980ba5438
> > [  534.263835] R13: ffffa145c0887ca8 R14: 0000000000000014 R15: 0000000000000246
> > [  534.264654] FS:  00007f3aae1db740(0000) GS:ffff9709bbc00000(0000) knlGS:0000000000000000
> > [  534.265584] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  534.266265] CR2: 0000000000000010 CR3: 0000000100b4c001 CR4: 0000000000170ef0
> > [  534.267022] Call Trace:
> > [  534.267215]  <TASK>
> > [  534.267391]  power_supply_unregister+0x55/0xc0
> > [  534.267770]  devres_release_all+0xb3/0x100
> > [  534.268100]  device_unbind_cleanup+0x9/0x70
> > [  534.268430]  device_release_driver_internal+0x1da/0x230
> > [  534.268866]  bus_remove_device+0xcd/0x110
> > [  534.269317]  device_del+0x18c/0x4b0
> > [  534.269719]  ? __cancel_work_timer+0xf5/0x190
> > [  534.270167]  hid_destroy_device+0x3d/0x50
> > [  534.270548]  uhid_char_write+0x490/0x540
> > [  534.270978]  vfs_write+0xc2/0x400
> > [  534.271349]  ? kvm_clock_get_cycles+0x14/0x30
> > [  534.271802]  ? ktime_get+0x36/0x90
> > [  534.272072]  ? lapic_timer_set_periodic+0x20/0x20
> > [  534.272492]  ? clockevents_program_event+0x90/0xf0
> > [  534.272942]  ksys_write+0xb2/0xe0
> > [  534.273221]  do_syscall_64+0x3a/0x90
> > [  534.273578]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > [  534.274073] RIP: 0033:0x7f3aae3bd8f7
> > [  534.274404] Code: 0f 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
> > [  534.276478] RSP: 002b:00007ffcbc210348 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> > [  534.277366] RAX: ffffffffffffffda RBX: 00007f3aae1db6c0 RCX: 00007f3aae3bd8f7
> > [  534.278210] RDX: 0000000000000004 RSI: 00007f3aa49b2de0 RDI: 000000000000000b
> > [  534.279086] RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
> > [  534.279969] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f3aa49b2de0
> > [  534.280816] R13: 000000000000000b R14: 0000555a22edb620 R15: 00007f3aac4dc548
> > [  534.281533]  </TASK>
> > [  534.281760] Modules linked in:
> > [  534.282084] CR2: 0000000000000010
> > [  534.282404] ---[ end trace 0000000000000000 ]---
> > [  534.282838] RIP: 0010:devres_release_group+0x69/0x160
> > [  534.283301] Code: 49 8b bc 24 98 02 00 00 49 8d b4 24 90 02 00 00 49 89 c7 48 39 fe 75 12 e9 de 00 00 00 48 8b 7f 08 48 39 fe 0f 84 d1 00 00 00 <48> 81 7f 10 f0 da fb 83 75 e9 48 85 db 0f 84 a0 00 00 00 48 3b 5f
> > [  534.285303] RSP: 0018:ffffa145c0887ca8 EFLAGS: 00010082
> > [  534.285722] RAX: 0000000000000246 RBX: ffffffff84153600 RCX: 0000000000000000
> > [  534.286292] RDX: 0000000000000001 RSI: ffff970980ba56c8 RDI: 0000000000000000
> > [  534.286885] RBP: ffff970980ba56c4 R08: 0000000000000001 R09: ffffffff83ad9800
> > [  534.287629] R10: 000000000000001f R11: ffff97098a9186d8 R12: ffff970980ba5438
> > [  534.288415] R13: ffffa145c0887ca8 R14: 0000000000000014 R15: 0000000000000246
> > [  534.289247] FS:  00007f3aae1db740(0000) GS:ffff9709bbc00000(0000) knlGS:0000000000000000
> > [  534.290184] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  534.290848] CR2: 0000000000000010 CR3: 0000000100b4c001 CR4: 0000000000170ef0
> > [  534.291588] note: pytest-3[619] exited with preempt_count 1
> > ---
> >
> > Would you mind having a look at it?
> >
> > Cheers,
> > Benjamin
> >
>
> Fun, fun... I don't know what it is, but looks like a race condition /
> memory corruption somewhere. I just saw the issue as well, but I had
> to run the test suite a few times as I got some clean runs in as well.
> I must have been luckily to have submitted on a clean run.
>
> [root@localhost hid-tools]# pytest tests/test_sony.py
> ====================================================================
> test session starts
> =====================================================================
> platform linux -- Python 3.10.7, pytest-6.2.5, py-1.11.0, pluggy-1.0.0
> rootdir: /home/roderick/src/hid-tools
> collected 95 items
>
> tests/test_sony.py
> ...........ssss................................................................................
>                                     [100%]
>
> =============================================================== 91
> passed, 4 skipped in 48.68s
> ===============================================================
>
> Thanks,
> Roderick

I now have it happening consistently including for a real DualShock 4
in bluetooth. What the heck. It is something devres related on
cleanup. I disabled some code paths in the driver (e.g. storing
devices in a list and player id) and then the issue jumps around to
then power_supply_unregister as called by devres.

At least I'm glad this issue surfaces now, but I'm not yet sure where
to search. I find it is so weird that Bluetooth patch shows this. USB
is fine and the changes do look fairly straight-forward with nothing
obviously sticking out yet...

Roderick
