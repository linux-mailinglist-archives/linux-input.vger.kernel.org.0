Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D9B7BF9BC
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 13:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjJJL3f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 07:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbjJJL3f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 07:29:35 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A509A94
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 04:29:33 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so54138805e9.0
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696937372; x=1697542172; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+Nf1CNCCgCT3sbRocE4zA9mwzwZvQt3uYx/jW1M43Q=;
        b=mbdUQUA/gNEBLdDTa3rD99fF1zGWVKoquiAEfJrYaBRS+p1F1e7KcgdKGC7GjGUqcb
         XdcyU5TOhoPFZDQB/qzM2MB1S84hGYjSxDvgFQwTOVGtYYgImuHWTtEkwyGwNvwuH9k8
         jnGDJljA7Tghrog81JErzbgaYx0+3EwwAqVpgHUpHh8IuMPXh4mBfG5ZWW+KN8PlHkjz
         4ngrcjEruvmxlgdhjMnvM/2SnJZJ9O+9+R9rn11FxN6UN6UI0C6DZLnNtTnaTAxCCogx
         wvSo4u2XltrDHGUh9Nz4X7C4avMFoMeer5S+0Bsnj79pyOIHe5OH2x14x0aySCHEmL4h
         lBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696937372; x=1697542172;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+Nf1CNCCgCT3sbRocE4zA9mwzwZvQt3uYx/jW1M43Q=;
        b=nrZxDV3FF2MM2iBAKgfJW49a/qI7eQ40TIlsz7SJ1WNDOvusVDoaTUBpLfFbK9oZ2Y
         26X5dhyE0QwINAZZ13M4eJxmvsb7NgQZL4WPohyCQmCrM1AhREjQBqFw+BDzRsIgk1Li
         Jtrsvj51OeJQaBh6MpNBTzddmdmbHO8ZZI/H+yJIT83Xdbb991UEGrIGxp7wJTfAdtuW
         hRRyhqhUnqOPQATFJ82EzJfWM4zHd7hxnH+rWFSDCKbxVM7bCeg30yb87u0k0KBjyG+y
         HqlPO1JIxOUW4+/gVwnUjPI0V6jyRvJfhRzebVScAlhkWRZCZO5XwBr6MWLOXrj8RRER
         hIgw==
X-Gm-Message-State: AOJu0YxJdlFFv1ezg6HV7I/5oF9yoCGNZnrZs2Jsu+me4DQE5R/J5xmn
        b4MLVioz1jWIv8fELEo/+GG7wwC27Fg=
X-Google-Smtp-Source: AGHT+IFkFuWxxtGLkDNXeh7fpogcoz1R3Y8N4aBcxUK5qwxfRTAAZz2x5RWDCjDafOdjfCytpRVEJA==
X-Received: by 2002:adf:f505:0:b0:327:ffef:ba51 with SMTP id q5-20020adff505000000b00327ffefba51mr15741532wro.49.1696937372022;
        Tue, 10 Oct 2023 04:29:32 -0700 (PDT)
Received: from localhost ([2001:171b:c9bb:1ac0:c056:27ff:fec4:81cb])
        by smtp.gmail.com with ESMTPSA id v5-20020a05600c214500b003fbe791a0e8sm13955372wml.0.2023.10.10.04.29.31
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 04:29:31 -0700 (PDT)
Received: from localhost (localhost [local])
        by localhost (OpenSMTPD) with ESMTPA id 1146e448
        for <linux-input@vger.kernel.org>;
        Tue, 10 Oct 2023 11:29:31 +0000 (UTC)
Date:   Tue, 10 Oct 2023 13:29:31 +0200
From:   David =?utf-8?B?TGF6xINy?= <dlazar@gmail.com>
To:     linux-input@vger.kernel.org
Subject: keyboard and touchpad not working on Lenovo V15 G4 AMN
Message-ID: <ZSU1m7OiMMGcBLw5@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

The keyboard and touchpad on the Lenovo V15 G4 AMN laptop (AMD Ryzen 3 7320U) work well in the UEFI setup interface and in the bootloader, but stop working after booting the Linux kernel (Debian's 6.1.55-1). [0][1]

[0] https://bugs.launchpad.net/ubuntu/+source/linux-signed-hwe-6.2/+bug/2034477
[1] https://www.reddit.com/r/archlinux/comments/13kuska/keyboard_trackpad_on_a_v15_g4_amn_not_working/

When booting, the i8042 driver prints the following message:

        i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp

I have disassembled the DSTS ACPI table, and indeed, no mouse device seems to be declared (none of the PNP devices IDs listed in pnp_aux_devids appears, nothing using IRQ 12).  So I booted with the following kernel arguments (inspired by the i8042_dmi_quirk_table):

        i8042.debug=1 atkbd.reset=1 i8042.nomux=1 i8042.reset=1 i8042.nopnp=1 i8042.dumbkbd=1

and this is what  I got:

        i8042: PNP detection disabled
        i8042: [0] aa -> i8042 (command)
        i8042: [0] 55 <- i8042 (return)
        i8042: [0] 20 -> i8042 (command)
        i8042: [0] 67 <- i8042 (return)
        i8042: [0] 20 -> i8042 (command)
        i8042: [0] 67 <- i8042 (return)
        i8042: [0] 60 -> i8042 (command)
        i8042: [0] 76 -> i8042 (parameter)
        i8042: [0] d3 -> i8042 (command)
        i8042: [0] 5a -> i8042 (parameter)
        i8042: [0] 5a <- i8042 (return)
        i8042: [0] a7 -> i8042 (command)
        i8042: [0] 20 -> i8042 (command)
        i8042: [0] 76 <- i8042 (return)
        i8042: [0] a8 -> i8042 (command)
        i8042: [0] 20 -> i8042 (command)
        i8042: [0] 56 <- i8042 (return)
        i8042: [0] 60 -> i8042 (command)
        i8042: [1] 56 -> i8042 (parameter)
        i8042: [1] d3 -> i8042 (command)
        i8042: [1] a5 -> i8042 (parameter)
        i8042: [72]      -- i8042 (aux irq test timeout)
        i8042: [72] a5 <- i8042 (flush, aux)
        i8042: [72] 60 -> i8042 (command)
        i8042: [72] 74 -> i8042 (parameter)
        i8042: [72] 60 -> i8042 (command)
        i8042: [72] 65 -> i8042 (parameter)
        serio: i8042 KBD port at 0x60,0x64 irq 1

To my untrained eyes, this looks like a reasonable PS/2 keyboard initialization sequence, (with the AUX port seemingly unresponsive), but the keyboard still does not work.

I'm running out of ideas on what to try next, so I'd be grateful for any help.  Let me know if you need any other information I might have missed.

Thanks.
