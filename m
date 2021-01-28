Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F947307412
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 11:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbhA1Ks4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 05:48:56 -0500
Received: from mail-ej1-f52.google.com ([209.85.218.52]:46597 "EHLO
        mail-ej1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbhA1Ksx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 05:48:53 -0500
Received: by mail-ej1-f52.google.com with SMTP id rv9so6986852ejb.13
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 02:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EdU5oY7qGZorL60Dbwvcp5OevbtQQ+Pg0G93EWXJPZQ=;
        b=S7eAr2EzGhehCU9sbw5h48AMgb1LKAPe8tfVknQNTiNE8gyQHxxwN67LJ+EV8tl/+J
         wFEcTY51Olc+NOEdMc08cieMmvUTBrQGURgQhYzUWIOPQyjek54zILmh1mscMk2aB14o
         2s7fH0TITXFcgTU08vSnilLe2LHZqC3D3I1FRkEtNsK8ENPpYITalBSzxDCwi3ynGfRm
         A30I1uWHIod5uwuf7vzUMlz6961da36Pr2oWEcDPu7XrD/OW/R+1GixA2rauYjy9un8Y
         qGkIYB5NLXeepymlvXpLMK99jax7U5VQC7h7fq8qHkldcXtnbpDD8BFCzalpmva0NZIK
         U+QA==
X-Gm-Message-State: AOAM532TAWuXSb+AesvZUGXUz5iBOJxnVS8VJk0MEfOIHc8KiCHSg1SB
        nGjy+P+6vfM4bITp0ui7+bsYRm2joGeBdQ==
X-Google-Smtp-Source: ABdhPJzg+snMNuMTa06JDQRvSEdXg9ttuZsQjBpGVlaKytEdevclaIj5NKxuXeEyIqC5XxXDFc/AZg==
X-Received: by 2002:a17:906:4e47:: with SMTP id g7mr9259892ejw.480.1611830891485;
        Thu, 28 Jan 2021 02:48:11 -0800 (PST)
Received: from anvil.localnet (p4fc50f7d.dip0.t-ipconnect.de. [79.197.15.125])
        by smtp.googlemail.com with ESMTPSA id x25sm2765987edv.65.2021.01.28.02.48.10
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 02:48:10 -0800 (PST)
From:   Christopher Lee Thomas <christopherlee.thomas@a08.net>
To:     linux-input@vger.kernel.org
Subject: Dell G5 15 5590 | Touchpad apparently not recognized correctly
Date:   Thu, 28 Jan 2021 11:48:09 +0100
Message-ID: <24826546.1r3eYUQgxm@anvil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I've got a *Dell G5 15 5590* Notebook with a Touchpad which apparently is not recognized correctly:

$ dmesg | grep touch -i
psmouse serio1: synaptics: Your touchpad (PNP: DLL08ed PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
psmouse serio1: synaptics: Touchpad model: 1, fw: 9.16, id: 0x1e2a1, caps: 0xf00123/0x840300/0x12e800/0x500000, board id: 3240, fw id: 2749858
input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input8

Modules are loaded but not used:

$ lsmod | grep -i hid
i2c_hid                28672  0
hid_rmi                16384  0
usbhid                 32768  0

Kernel used is *5.4.92*:

$ uname -a
Linux anvil 5.4.92-gentoo-x86_64 #1 SMP Thu Jan 28 10:57:08 CET 2021 x86_64 Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz GenuineIntel GNU/Linux

Any other information I can give you or any hint on how to fix this?


Thank you,
Christopher Lee Thomas


