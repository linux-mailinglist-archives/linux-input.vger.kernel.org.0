Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F2031D410
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 03:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhBQCwR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Feb 2021 21:52:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhBQCwF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Feb 2021 21:52:05 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648D6C061756
        for <linux-input@vger.kernel.org>; Tue, 16 Feb 2021 18:51:25 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id l8so12387588ybe.12
        for <linux-input@vger.kernel.org>; Tue, 16 Feb 2021 18:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=hFixI9GqxBGkILczKHu+MKByGlW+Bb1I6hlZsCkJueg=;
        b=BjpVcYkGU58w1IVSpaYYV/1GJ2K1WJn68MMb6+JImLDt859Wj0DixMejXivinwoV+R
         B4nWHfokvbvmQEMJnZIfRvUchVsBp323kGbsV5LSEmq8N57lB+qmz9b6NlmELezfCenZ
         B3YTESn4CXKcT+ENRpl+2hqVpwzFhkIZVw0GlhroKB+6aMP1mizhiczaz1+sk/ssz6ak
         p19L0uw3Zmi5LrE/kyGsZmlNBrjQOvQMqK+bJLK/JBEfrovkyAcd6cMDjNE0mCj8m7dT
         R3Eqt0QjPwFxgRwOu4J5ozr1DrYgAyvo3/B2aDK90ECZnKtErX575huFMZ0O0IytfCU0
         SSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=hFixI9GqxBGkILczKHu+MKByGlW+Bb1I6hlZsCkJueg=;
        b=Lw5GLiSagDNVQxnQxmXrC6IP6A/U0VbxTkzksXNi7fYJ5MsWuhOgkfajQxnHb379S4
         De24P8W7HF8NrtX4BB7/S4Tq+mGA948apuKFHkJ67FqtJVNNo0VbHJkqD8FUmgjvz+Bu
         SLsfawnnxohp7nDoa5xe8LzHjOSJwqamFZykTz4sCCTbDTmAIEJ8NmalTMZQE5kS7CuS
         758u5/5LyF40vCou7bFP7+qqoHn21i+A2I5hcdO9OO6nkv0vWuk2tHRlRF5/9w4IjINx
         XMYxNKdX5AOzt9Hh6G6/2x5tapBIJ70erAJPvwl44CYI7rE9GjcLSt5c3/NuzI+eIG/V
         FQUA==
X-Gm-Message-State: AOAM530V2+2DFhgHiU5jFKMuAlErr/33iETpvCwAbCpU5EcJ0feLLWAR
        WEqH80GJGHXY1xLTJWHOmFdTkmblHOZ00fp8bCnW3RxtO35//A==
X-Google-Smtp-Source: ABdhPJxzJBMvcjzmTK56FNoB4dkeHmNCKH95PXg395K/69r82LqtBsjaaTI9MTpjy9ZYiFhV1/CEs78RaSFEaURtPqw=
X-Received: by 2002:a25:9887:: with SMTP id l7mr35387590ybo.319.1613530283833;
 Tue, 16 Feb 2021 18:51:23 -0800 (PST)
MIME-Version: 1.0
From:   Koopa Koopa <codingkoopa@gmail.com>
Date:   Tue, 16 Feb 2021 21:51:13 -0500
Message-ID: <CAM1wO0=2zM=WNmGyDJETLa4wsECE_Nxvq-gAa6_Wb_cMH43K9w@mail.gmail.com>
Subject: PROBLEM: Error logged when pressing mouse button
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Every time I press a button on my mouse, an error is logged in my
system journal.

Starting recently, every time I press any button on my Logitech G602
mouse, the following is logged to my journal:

    kernel: logitech-djreceiver 0003:046D:C537.0005: Unexpected input
report number 128

This includes both primary mouse buttons, the middle mouse buttons,
the buttons on the side, and the buttons on the top controlling the
DPI. It seems that, with commit
e400071a805d6229223a98899e9da8c6233704a1
(https://github.com/torvalds/linux/commit/e400071a805d6229223a98899e9da8c6233704a1),
this driver was enabled for my mouse.

My /proc/version:

    Linux version 5.10.16-arch1-1 (linux@archlinux) (gcc (GCC) 10.2.0,
GNU ld (GNU Binutils) 2.36) #1 SMP PREEMPT Sat, 13 Feb 2021 20:50:18
+0000

My kernel .config file: See here
(https://github.com/archlinux/svntogit-packages/blob/packages/linux/trunk/config).

Thanks!
