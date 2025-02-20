Return-Path: <linux-input+bounces-10205-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F9AA3D159
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2025 07:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC0D21753B5
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2025 06:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3C01DE896;
	Thu, 20 Feb 2025 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpDVkIfG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EABD1632DF;
	Thu, 20 Feb 2025 06:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740032624; cv=none; b=BhltIu2d1B+yJ2byBdc80JZn9zfz6zCFNCBTp968YYUVbCFy+PcGKRe+FAlnYgx++t0yfYbMF4QNYMyKvKSWCrJW7MAvhURBdvrLj8Sl55gqOVTSl7gzlE4So7jqvTSDa7ZUul0dyeyfDW70s+uJMswxFqa6BWdkT5nD2swHi2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740032624; c=relaxed/simple;
	bh=OeAKObEC1ELmSic1Gmxo/Jpyvka7NFTArvvfEjMLtaQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=G9cSW+erXrRbIzI59RYVq3JunqAm2l0okDAxmCHVWD5Md7VVNVsoExgLD24XoemO8HHhaPqueV7qlTfUPbzhMxgtrxN8SSj/bCrubSrAcxp8An02e81nEGoVaW/Kk6QgJ1twbvGYWJAwfWIKB269z/ZCePKn0g/CEmq0Rxcz8Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpDVkIfG; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f88509dad2so4707167b3.3;
        Wed, 19 Feb 2025 22:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740032620; x=1740637420; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XlUZDiO9LUz4j6hPlY1toz2JqwWzQZnCcPciqsBFfS8=;
        b=dpDVkIfG6cxe6THMe/qSZ7Qqn9bdQCYgh8OJ2xBnuZxVak2PcR6Au3eMwb1pijI8B7
         KGvD58M9fM7E052RUcPkzBvnWomIIivKLGOLdDXluSVV9UZAeGcuRjLGnmjvScR1uC+m
         bVDxNIsPFrLsCqC1XjtB7zYXnC8ojs5RQri0h7xWfmzb0ZMRwvlqrFKdPVuBGSijLcvA
         BHf0XWlH08jPRhkthEGu9AeS2h/ZMzo3PTvgTqy8wPzID6NRcGXUJYSfWP7A2uByMNXi
         xaeCuRCwzXJMcsJVGpORybLxj2SB+SUUoH+577xily4GOHzFMEj2StbYlLDkeo66EIgp
         VwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740032620; x=1740637420;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlUZDiO9LUz4j6hPlY1toz2JqwWzQZnCcPciqsBFfS8=;
        b=blQuzCG4SOD5AzJ+YgtYD5eTIn+06eH1I+trtPKE6cTXexcIZbiX8IaaVvXW+hMjBK
         a0AuallSRqZomJBezCLF/xg4V489Y+rNcirJHNQ5sE5xJ8PXw78ZqYO7TNSM3MWZWELG
         xendnneJTqnhjDGjF3ttuzqLsMGiagmjw4kttfd3/eupPkmw6LApPWLGkxokZsIKQz1U
         8TjnbLS5yvGrR67W07fCGtd92lYAYHufG3awoADqfVblE8VjEIkdJh0QJyFTU71wjg5o
         g1tboE4ff37tiYj5ycavwyJM1KhipjBKr1IxUmt3AyvYnxBLM8RcOORF19fXmYun2Sfm
         xkig==
X-Forwarded-Encrypted: i=1; AJvYcCWnY+9q6gmnF5ADnHakTwLlVp0j+Grhxgl44NsDJTXZYQO41GJD4Q7bftU8rDe0ZizHNhICAZq2iLkCCYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCALTpAbCDg5N/KOkIzS185KxQ4V2uvBeGgAR20Rx/sFUeJm0A
	XNm/v0u2kdk2ztLf8TaYGByTZBkg3tzDvPHX+6Nj4Vku72utW6exfrgGpxceZ/THf4kHo68Qr5m
	BcvmcE0lN/Vh+0iexzJ9EpNIQarw0t2Ux5+djeA==
X-Gm-Gg: ASbGnctLyTETpTg6SvL1xZKYu9rW5TXHss+GQR895usqdyw0+scQ1r3gBLzRvdgoavI
	F8Nwj/oKUA5sLRBpalCnYAd1Czu65O8jONOHHe55Jye1hk9YyQsr+w7blN3tPY+0zJvFzmY1rec
	8zh/wZ8QSs9OA=
X-Google-Smtp-Source: AGHT+IEAM9/39/mv6i/s+rtgJIVunf+g3NtbpiKTGslQI7o0dw9TYGS5OkXNIswUKaBXOAxnBBX+kinMKdiYx5W2a/Y=
X-Received: by 2002:a05:690c:4447:b0:6ef:a4ec:f698 with SMTP id
 00721157ae682-6fb58275a6dmr182728607b3.3.1740032619757; Wed, 19 Feb 2025
 22:23:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Eliah Reeves <ereeclimb@gmail.com>
Date: Wed, 19 Feb 2025 22:23:27 -0800
X-Gm-Features: AWEUYZlNkH6Ro-o2g0nBz_seXpbdBzE5rMTy5lpntrhylez0_BRmgectToTxQXY
Message-ID: <CAEvyrHnEY-ppdAN8gXPZu89_mqVvQgf3HLm16mF901Qp2kSoaQ@mail.gmail.com>
Subject: [PATCH] input: revert commit 9140ce4 to fix ELAN1206 touchpad issues
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Eliah Reeves <ereeclimb@gmail.com>
From dd4478d63b6a2b6891fcc1800eb26ce3f1ead1d4 Mon Sep 17 00:00:00 2001
Date: Wed, 19 Feb 2025 20:58:52 -0800
Subject: [PATCH] input: revert commit 9140ce4 to fix ELAN1206 touchpad issues

Reverting commit 9140ce47872bfd89fca888c2f992faa51d20c2bc fixes a
regression that caused touchpad malfunctions. The original change
introduced unintended behavior affecting touchpad input.
---
 drivers/dma/idma64.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
index d147353d47ab..afcce6f5a636 100644
--- a/drivers/dma/idma64.c
+++ b/drivers/dma/idma64.c
@@ -171,9 +171,10 @@ static irqreturn_t idma64_irq(int irq, void *dev)
        u32 status_err;
        unsigned short i;

+       /* Commented to restore ELAN1206 Touchpad functionality */
        /* Since IRQ may be shared, check if DMA controller is powered on */
-       if (status == GENMASK(31, 0))
-               return IRQ_NONE;
+       /* if (status == GENMASK(31, 0))
+             return IRQ_NONE; */

        dev_vdbg(idma64->dma.dev, "%s: status=%#x\n", __func__, status);

--
2.48.1

1: Description
===========

Reverting commit 9140ce47872bfd89fca888c2f992faa51d20c2bc fixes a
regression that caused touchpad malfunctions. The original change
introduced unintended behavior affecting touchpad input with the
ELAN1206.

2: Touchpad Behavior with 9140ce47872bfd89fca888c2f992faa51d20c2bc
===========
The touchpad appears to send an event indicating touch up immediately
after each touch down event. This prevents libinput from moving the
cursor rendering the touchpad useless. It is also worth noting that in
addition to incorrect events the touchpad also appears to send events
much less frequently.

evtest output:

  Event: time 1738819278.422243, type 3 (EV_ABS), code 57
(ABS_MT_TRACKING_ID), value 73
  Event: time 1738819278.422243, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 1264
  Event: time 1738819278.422243, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 860
  Event: time 1738819278.422243, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 1
  Event: time 1738819278.422243, type 1 (EV_KEY), code 325
(BTN_TOOL_FINGER), value 1
  Event: time 1738819278.422243, type 3 (EV_ABS), code 0 (ABS_X), value 1264
  Event: time 1738819278.422243, type 3 (EV_ABS), code 1 (ABS_Y), value 860
  Event: time 1738819278.422243, type 4 (EV_MSC), code 5
(MSC_TIMESTAMP), value 0
  Event: time 1738819278.422243, -------------- SYN_REPORT ------------
  Event: time 1738819278.526021, type 3 (EV_ABS), code 57
(ABS_MT_TRACKING_ID), value -1
  Event: time 1738819278.526021, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
  Event: time 1738819278.526021, type 1 (EV_KEY), code 325
(BTN_TOOL_FINGER), value 0
  Event: time 1738819278.526021, -------------- SYN_REPORT ------------
  Event: time 1738819278.630874, type 3 (EV_ABS), code 57
(ABS_MT_TRACKING_ID), value 74
  Event: time 1738819278.630874, type 3 (EV_ABS), code 53
(ABS_MT_POSITION_X), value 1415
  Event: time 1738819278.630874, type 3 (EV_ABS), code 54
(ABS_MT_POSITION_Y), value 799

3: Touchpad Behavior without 9140ce47872bfd89fca888c2f992faa51d20c2bc
===========
The touchpad functions smoothly and consistently.

4: Fixes
===========
closes: https://bugzilla.kernel.org/show_bug.cgi?id=219799

5: Impacts
===========
Reverting 9140ce47872bfd89fca888c2f992faa51d20c2bc would theoretically
reopen https://lore.kernel.org/r/700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com

6: Methods
===========
I bisected the Linux kernel and found that
9140ce47872bfd89fca888c2f992faa51d20c2bc was the first commit where my
touchpad didn't work. Building the latest kernel with 9140ce4 removed
resulted in a working touchpad.

Let me know if I can help.
Signed-off-by: Eliah Reeves <ereeclimb@gmail.com>

