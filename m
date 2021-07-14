Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3FF3C8240
	for <lists+linux-input@lfdr.de>; Wed, 14 Jul 2021 11:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238955AbhGNKB4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jul 2021 06:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238865AbhGNKB4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jul 2021 06:01:56 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2959C061760
        for <linux-input@vger.kernel.org>; Wed, 14 Jul 2021 02:59:04 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso1370104pjp.5
        for <linux-input@vger.kernel.org>; Wed, 14 Jul 2021 02:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8lLNNEBXipzFjM6oYKh/DG0Ts7lFEnxTEfTDS3lh1b0=;
        b=RLaKgVrkhNuzRvlJreV+BkEu6ZKWaGiqK3IgROPVZ6OfN87Ch9vPsbvWBcPmZJ4ED2
         I4Fc9EkqREYdZ3iMKvOmy9AkL4RzzNJEgbWcyo0oYtMN5sJ13YiKHxWcQzfbEoMbkr/s
         JLdxxi2i/QF33287jHei0GePY1TJzDAjDwyWtGOkQ6zqgJkqzrYdXqCvGe+o8ml18Wth
         tHYVEiTX0mwF41ZQBE2duHY+urPxBOjqSutX3qQJd+sSYYtdkiNrm8MV3dDHdD4Kb3tc
         Eaa6dH2xu2841VfD8e01HUKGZXSPOk8jabavOSMFuvxmjaDSDTqM21mHfvw67ZulYVP+
         Iy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8lLNNEBXipzFjM6oYKh/DG0Ts7lFEnxTEfTDS3lh1b0=;
        b=Q1y09htgqmNogdXirXT6GvTb8Uu7i+Dj7meiabAaHSHCE5+JfH9WVP63ISeuryv5Wr
         jnEvHorJUu8ag2yyWf5IYcw5dUq1gKf9sJS82+FF8cWMLulnRd5AMmSfQn2tEaPv4dhR
         1yj0pM+FpvuMS5+6/SaL5qTaTgr/r0V3pwTRgP2oi8KnqHdh94TMKmRn4orlf3D13lmh
         DP0i/jGwSflO/pG9qDZxZUP2ZojZWpOTYPYfN4NeY/PHzEZkKlKte9ZlQ/iUd+pJhjbq
         mZxGxyGB8J6mvKpYDGI+UeLfrO7RBgUnHgGypre9qUzJICbXJnv+W473qyIty7/qGKp9
         p/3g==
X-Gm-Message-State: AOAM531SAc1SQNZ1d9bbmfu5aDEmxpLncBWCgyTvvqeiaDbE7APSk91W
        mXYwHCDjLZ/WVOHqxbR58SU5iA==
X-Google-Smtp-Source: ABdhPJwXN76X2Hf9Im49QQozxL76oSZCSeuSaoGCkS4doUSLRoZ9QlQErqMWhAce8ZzycPt9fDmdSw==
X-Received: by 2002:a17:90a:764d:: with SMTP id s13mr9038381pjl.71.1626256744307;
        Wed, 14 Jul 2021 02:59:04 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g1sm2283304pgs.23.2021.07.14.02.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 02:59:03 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matteo Croce <mcroce@microsoft.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Warm reset support for pm8941-pwrkey
Date:   Wed, 14 Jul 2021 17:58:47 +0800
Message-Id: <20210714095850.27185-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It adds warm reset support for pm8941-pwrkey driver.

Changes for v2:
- Export symbol 'reboot_mode' to fix the build error with pm8941-pwrkey
  being module.  (Thanks Luca Weiss for reporting)

Shawn Guo (2):
  reboot: Export symbol 'reboot_mode'
  Input: pm8941-pwrkey - Respect reboot_mode for warm reset

 drivers/input/misc/pm8941-pwrkey.c | 6 +++++-
 kernel/reboot.c                    | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.17.1

