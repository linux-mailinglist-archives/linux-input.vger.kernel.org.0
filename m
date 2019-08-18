Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6B491760
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2019 16:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfHROkc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Aug 2019 10:40:32 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:3065 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbfHROkc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Aug 2019 10:40:32 -0400
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Sun, 18 Aug 2019 10:40:31 EDT
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 99C2E3F704;
        Sun, 18 Aug 2019 16:33:52 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=RgZ/At3U;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
        dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 4o-Y4DHE2yo3; Sun, 18 Aug 2019 16:33:50 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        (Authenticated sender: mb878879)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 27F073F766;
        Sun, 18 Aug 2019 16:33:49 +0200 (CEST)
Received: from localhost.localdomain.localdomain (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        by mail1.shipmail.org (Postfix) with ESMTPSA id 4B2DB360075;
        Sun, 18 Aug 2019 16:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1566138829; bh=wkJMVBlZ0PyRFgH+Srj78AX7mlPSsr+a+WbJ1QZbC/E=;
        h=From:To:Cc:Subject:Date:From;
        b=RgZ/At3UqAv/kz16nPxZPjfjBRfRUcuFoKkZhbO5cOSf7HtWiwd4/YgsmGMwXwxzZ
         J+VcINxMYZFKUF9w/Dyb9v1umzs5if1g3MEnfnqWZiy7cobSEKee/rk7KSaJaKhU7k
         OXM+TjXfs13NfufzK8Pt3DUwuNua5WKaLrxo/qeg=
From:   =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?= 
        <thomas_os@shipmail.org>
To:     linux-kernel@vger.kernel.org, pv-drivers@vmware.com
Cc:     =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 0/4] Add support for updated vmware hypercall instruction
Date:   Sun, 18 Aug 2019 16:33:12 +0200
Message-Id: <20190818143316.4906-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: <x86@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: <linux-input@vger.kernel.org>

VMware has started using "vmcall" / "vmmcall" instead of an inl instruction
for the "backdoor" interface. This series detects support for those
instructions.
Outside of the platform code we use the "ALTERNATIVES" self-patching
mechanism similarly to how this is done with KVM.
Unfortunately we need two x86 cpu feature flags for this, since we need
the default instruction to be "inl". IIRC the vmmouse driver is used by
other virtualization solutions than VMware, and those might break if
they encounter any of the other instructions.

