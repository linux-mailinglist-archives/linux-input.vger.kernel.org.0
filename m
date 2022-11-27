Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7BF639B5C
	for <lists+linux-input@lfdr.de>; Sun, 27 Nov 2022 15:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiK0O24 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Nov 2022 09:28:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbiK0O24 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Nov 2022 09:28:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A15DFEA
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 06:28:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6BB7AB80937
        for <linux-input@vger.kernel.org>; Sun, 27 Nov 2022 14:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E06C433D6;
        Sun, 27 Nov 2022 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669559332;
        bh=SUfkTCjmddHQS1Ae8/38ICWYV5AzELyNJzsWbGO+hQM=;
        h=From:To:Cc:Subject:Date:From;
        b=h03ImGjy57YVY5HfkOSMe/HcCtpe98w+E5ucBGHAmgk4RzQUZX8rfA5hnLjPs0EXY
         /1thdYGqhsxR4+JonqlpntDiuout+Sy+NL9RAALQC//qcsjPHm6t404bmdLYG11aOJ
         PrG46Poe5EtpUheyN5Wju1sAtVJciQxgKvEIn1nA2XTmEgQjD49kDnpLqdHN+tSSdk
         xYMvW6ESEQQp5tCMOq25yFwzC1K9vd5Wlc5BhHwEqCgbCD8JLhk3M08Uve2VjIO21A
         jhKPSWnI+AS88EBNU4T2cwW6f6PRFL3lfHCem4P/yG2NA4GDm9TbdTknnTJlnJTFJl
         AVqTf2+7UaiQw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Daniel Mack <daniel@zonque.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Tomohiro Yoshidomi <sylph23k@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Lauri Kasanen <cand@gmx.com>,
        Daniel Hung-yu Wu <hywu@google.com>
Subject: [PATCH 0/9] Input: Fix insufficent DMA alignment.
Date:   Sun, 27 Nov 2022 14:41:07 +0000
Message-Id: <20221127144116.1418083-1-jic23@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This problem was discovered in IIO as a side effect of the discussions about
relaxing kmalloc alignment on arm64 and resulted in a series of large
patch sets.

https://lore.kernel.org/linux-iio/20220508175712.647246-1-jic23@kernel.org/

Unsurprisingly there are cases of it in other subsystems.

The short version of this is that there are a few known arm64 chips where
___cacheline_aligned enforces 64 byte alignment which is what we typically
want for performance optimization as the size of the L1 cache lines.
However, further out in the cache hierarchy we have caches with 128 byte
lines.  Those are the ones that matter for DMA safety.
So we need the larger alignment guarantees of ARCH_KMALLOC_MINALIGN which
in this case is 128 bytes.

There is one other use of ____cacheline_aligned in input:
joystick/iforce/iforce-usb.c

Whilst suspicious I'm not sure enough of the requirements of USB to
know if they are there for DMA safety or some other constraint.

Jonathan

Cc: Daniel Mack <daniel@zonque.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>
Cc: Tomohiro Yoshidomi <sylph23k@gmail.com>
Cc: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Lauri Kasanen <cand@gmx.com>
Cc: Daniel Hung-yu Wu <hywu@google.com>

Jonathan Cameron (9):
  Input: psxpad - Fix padding for DMA safe buffers.
  Input: ad714x - Fix padding for DMA safe buffers.
  Input: ad7887 - Fix padding for DMA safe buffers.
  Input: ads7846 - Fix padding for DMA safe buffers.
  Input: cyttsp - Fix padding for DMA safe buffers.
  Input: surface3 - Fix padding for DMA safe buffers.
  Input: n64joy - Fix DMA buffer alignment.
  Input: atmel_captouch - Avoid suspect DMA buffer alignment.
  Input: elants - Fix suspect DMA buffer alignment

 drivers/input/joystick/n64joy.c          | 6 +++---
 drivers/input/joystick/psxpad-spi.c      | 4 ++--
 drivers/input/misc/ad714x.h              | 2 +-
 drivers/input/misc/atmel_captouch.c      | 2 +-
 drivers/input/touchscreen/ad7877.c       | 4 ++--
 drivers/input/touchscreen/ads7846.c      | 4 ++--
 drivers/input/touchscreen/cyttsp_core.h  | 2 +-
 drivers/input/touchscreen/elants_i2c.c   | 2 +-
 drivers/input/touchscreen/surface3_spi.c | 2 +-
 9 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.38.1

