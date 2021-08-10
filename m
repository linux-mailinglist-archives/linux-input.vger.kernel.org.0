Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9EC3E5288
	for <lists+linux-input@lfdr.de>; Tue, 10 Aug 2021 07:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbhHJFEw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Aug 2021 01:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234999AbhHJFEv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Aug 2021 01:04:51 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DE6C0613D3
        for <linux-input@vger.kernel.org>; Mon,  9 Aug 2021 22:04:30 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id a93so34023245ybi.1
        for <linux-input@vger.kernel.org>; Mon, 09 Aug 2021 22:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=QBSUG5w2ak2it4+JFgrMfKVFKtH05TzpJ99AR4KDJLE=;
        b=kKBxGjcE3J5RsWuB4rTRUA0HSnQ9lxbjyCLCwCpY49e+xTlnDxOGTblfGMrmqKr8Zu
         l02MgikPyhf+ptNs90c4OS/3vyBHmKsJFzWNBY+aQIWJTNdiw0toUJ8ntRVsCcJE2IsK
         NRwdhfxOp48PxK823BWWzTk+nlm3X2ULobXmBbCRHMlhtzkuoAGANG/N5jFoaIME3BFq
         eqjjCDK3084e5Mi633Dw4dg1hhhh6h1kbhioYrGoTE6ub6k0S08M086z1kiHycaMaeMf
         Ia9pEiBGkrpEADhl5ZzS1ZjVnqVivhk8CreVSyHKDLU5j0AjBrxexHkknJm5s1bgWxi8
         No6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=QBSUG5w2ak2it4+JFgrMfKVFKtH05TzpJ99AR4KDJLE=;
        b=hO7uEpuO77H2vA+gCfDpeSuPNrPsp3qcHkmUn8f4gEvSWIo1Vb18xBcuYNHrdyspAE
         EraHVlallS1sexQ+WWNlZhukAmAC+gQTqD6DDtRyLeDL3E40NSvXCMv+tvY2RX+hW1cr
         U1kuveBPUDlXjlo7qTe/NLngS7Y3PhqG9tPcLS3VnEtUxfHS6GBEBRdGB4r3K5Wn640b
         IZFDt0hIW+82VCPqnP0dttb+ekVUDOJjSyT8/9u+hOmPwfc+Ti9TOhfmEgxqRbjoWby9
         S651yaArz/SJ00lhxH290EJNkaHVyooZL6mZHrwLkZbS5aCsdVZVlIUSeqMiK4Lo3WVf
         GX5g==
X-Gm-Message-State: AOAM531a8Q2l5caQcqAVMkkZuRIiP72pe+u6CaqR3xEufs3tk7qHXGaM
        4uFRl0EV66IZbGDUl7MEiZO2fpP6+VBpqHQAcGU=
X-Google-Smtp-Source: ABdhPJziSRYwMz5aOCXkYoSGUpjnKWg4EPGmOskrmJDDS7/AAHSjrJI7g+uTaQZu3OCaByc5i+Z3ltzKiJpZYKzFtgA=
X-Received: by 2002:a25:842:: with SMTP id 63mr35990452ybi.518.1628571869436;
 Mon, 09 Aug 2021 22:04:29 -0700 (PDT)
MIME-Version: 1.0
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Tue, 10 Aug 2021 07:04:18 +0200
Message-ID: <CAKXUXMx6dByO03f3dX0X5zjvQp0j2AhJBg0vQFDmhZUhtKxRxw@mail.gmail.com>
Subject: Kconfig issue in commit c49c33637802 ("HID: support for
 initialization of some Thrustmaster wheels")
To:     Dario Pagani <dario.pagani.146@gmail.com>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Dario, dear Kim, dear Jiri,

In commit c49c33637802 ("HID: support for initialization of some
Thrustmaster wheels"), you have added in ./drivers/hid/Makefile:

obj-$(CONFIG_HID_TMINIT)       += hid-tminit.o

and drivers/hid/hid-quirks.c:

+#if IS_ENABLED(CONFIG_HID_TMINIT)
+       { HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb65d) },
+#endif

However, there is no config HID_TMINIT defined in Kconfig, nor a file
hid-tminit.c.

So, this above is all dead code.

Is this just some unintended leftover from refactoring, or are we
missing a config and the hid-tminit file?

I am happy to provide a patch, once it is what was intended here.

E.g., just drop the line in the Makefile and add the HID_USB_DEVICE
declaration to the CONFIG_HID_THRUSTMASTER ifdef block---if that
works?

Best regards,

Lukas
