Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A214389A8
	for <lists+linux-input@lfdr.de>; Sun, 24 Oct 2021 17:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbhJXPKc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Oct 2021 11:10:32 -0400
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:38588 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231658AbhJXPKa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Oct 2021 11:10:30 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id eeyWmj6mkdfuoeeyamWXw6; Sun, 24 Oct 2021 16:59:56 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1635087597; bh=UHNp/mjrujGjyEugYBqZOEjeBO4p+fK9OLkSqTnBvO0=;
        h=From;
        b=wzvu1ZHaUk+/eR3exg6g1dJetP9q8up9ZI+OFTQmQGcltCtEn6GR5BL1BqA7AmCeD
         suhVyvU0mRIA9XZE2CBfEzlLz9ZgUuV0aHEx2vvcv3/vpNFudUkK88UfjLLGQHt5kV
         3nLieTO44J+tPOEYQTORhoQppOHf8FrzPB1TWvyIwGTRmoDv5OhpfNCa0keOTZfkdF
         x7bfC2fqepPdC8Zg8sTapwUrg+bd5Y/vIBvojgA1Vs0BdgwcIBlxXRtvCTwdJti3hm
         YBXnGz/f/20h418MW8XwGcvwRQ0vfFKTklH+CJwsNcA0aXOvMIh/+5Rbt8/kPm0krb
         79+4i9Mi9c1zQ==
X-CNFS-Analysis: v=2.4 cv=IrzbzJzg c=1 sm=1 tr=0 ts=617574ed cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=eDEbosCrgEDue1CRdZcA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, Rachna Patil <rachna@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 0/6] input: touchscreen: am335x: fix and improvements
Date:   Sun, 24 Oct 2021 16:59:24 +0200
Message-Id: <20211024145931.1916-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfJVeqVN0AJ9sz/vFjjQaGJ37dfpFQCvJnhuDEu4E4nuGWWR6zPKD47ndH1qfSsrLKgzfV0wY9nDG7jJQuJmyaywDuhc9j+41/KyjXI0rVAYQWCNhrjAK
 rCh+8NWps6g2wM6od2LNZIB0uI0SVXbOlTZbsxshkIWKH7xKX9qA37PIes+TMz6FUc1SRkgpFG2zIQ0T9CT73FpEnZ9ycHch+MkAkxKPjYWEGRwgTGBCB+76
 3sJ+xzn3G9gHs2FnCVHL4Ju/RR0u+AG5BPSRhAAPTIU12WSL3O/nRZ1FTMTBPwdiqJrTRQaj3xhGkkvjoGMKUho1Nu6CQkBMsjWR8JdhlXsC6mngM553qVVU
 WGrktaLzR9YLuRexrQ/p67up0nK9XMIre3Rn+YzQ5P3lviobM3MKtBTzTjkEkHnkT9KrqEFQsXi8Gy1M4NKhBz7Ct8fC+kAKiUJyuj+FqR1EN29Z2GjxnQZ1
 1KIenmjv1OKqov1XoZX6xmuacGr3JPpfcLoz/A==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series grew out of a touchscreen validation activity on a custom
board. Oscilloscope measurements and driver source analysis led to these
patches.

Dario Binacchi (6):
  input: ti_am335x_tsc: set ADCREFM for X configuration
  input: ti_am335x_tsc: fix STEPCONFIG setup for Z2
  input: ti_am335x_tsc: lower the X and Y sampling time
  dt-bindings: input: ti-tsc-adc: fix tsc node example
  mfd: ti_am335x_tscadc: fix reading a tsc property from DT
  mfd: ti_am335x_tscadc: drop the CNTRLREG_8WIRE macro

 .../bindings/input/touchscreen/ti-tsc-adc.txt  |  2 +-
 drivers/input/touchscreen/ti_am335x_tsc.c      | 18 +++++++++++++-----
 drivers/mfd/ti_am335x_tscadc.c                 |  7 ++++++-
 include/linux/mfd/ti_am335x_tscadc.h           |  1 -
 4 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.17.1

