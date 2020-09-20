Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DA82711FC
	for <lists+linux-input@lfdr.de>; Sun, 20 Sep 2020 06:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgITEKD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Sep 2020 00:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgITEKD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Sep 2020 00:10:03 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12255C061755;
        Sat, 19 Sep 2020 21:10:03 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f18so6167519pfa.10;
        Sat, 19 Sep 2020 21:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=iVZZCW0Q20YwtnqRpz5fHXWAFsGsghxnEHFSoHHWKok=;
        b=CavDZFttb/gUf99uBpf9pfSNDm02GOxgz3Suw/4DjxSkSsb7AiD0ERNZsOp8othQBM
         GYgZXmV6MXKRX4bvHmDDEa51rE+99UD+8JEYUMa7EqMghIjIGJSHwWqTAGhB+Fuw7vyD
         T0uZSX7aGlkXALg+zyNTWyXLxxDJ+mb+r5WONxgsp16+MsBdT4QYs4NxFMqyXpGPUGUP
         DtJ3VR2WnxYgDJZO4qz1U+OtNqFnjeJMKzhqaBCuEkiyQztL0N++I1IPTNHo6QGez70Y
         5ET1S4Y8ZCJpw1oklHsrA2kYW+t5W/ziwKwD1PqYfs27Mr52SJQwdzCqRo716rdXLmtL
         njWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=iVZZCW0Q20YwtnqRpz5fHXWAFsGsghxnEHFSoHHWKok=;
        b=Z+WH0yPjGFAHHqYeK05zCM6VhSCWy5VceRilzZ1xLI8/VvlcjNJaUrxD6pzQkX3gZ4
         TCaaJ7EMlwErdxH1brPdRONcnYC3211ciT5/v0euAwmlxrngE832fZP48Ik48dfmAaT0
         URyxZBC1OirT6ffr3D1kGEGBfHKsY10OcGa8yUPD/A6w+ekeXPS3g9N3ljB5d70L+SBE
         sKdj7HEesbO3Ktw7t0KZVB8KBoSd04bSPGrBNZOWmgcGjxZvIEjZqhrnb+bO77s2PANL
         otn8ZgaLxb+1++eokg65KqLYaV7eoLtRs5OTOqoUYAK8el34XvyWvi8cMoaaaLWVV6MW
         I19Q==
X-Gm-Message-State: AOAM533yIpivkT1aROXYpnRSHfA6HDcpsTqynQbM2JZuB2Hh4bo18Zxj
        GKiyUis77qgMjbR8Q+Mjgg8=
X-Google-Smtp-Source: ABdhPJzRmSPfpDwouZKRpY/bWsVcTkdZ756mwTwEgHqQs4AFD7Eg+Dian3nrrsKDk6t2uUg6rvtXFQ==
X-Received: by 2002:a63:204c:: with SMTP id r12mr32633300pgm.262.1600575002389;
        Sat, 19 Sep 2020 21:10:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 141sm8240642pfb.50.2020.09.19.21.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 21:10:01 -0700 (PDT)
Date:   Sat, 19 Sep 2020 21:09:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.9-rc5
Message-ID: <20200920040959.GA5175@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. Just a couple of driver
quirks.

Changelog:
---------

Hans de Goede (1):
      Input: i8042 - add Entroware Proteus EL07R4 to nomux and reset lists

Vincent Huang (1):
      Input: trackpoint - add new trackpoint variant IDs

Diffstat:
--------

 drivers/input/mouse/trackpoint.c      | 10 ++++++----
 drivers/input/mouse/trackpoint.h      | 10 ++++++----
 drivers/input/serio/i8042-x86ia64io.h | 16 ++++++++++++++++
 3 files changed, 28 insertions(+), 8 deletions(-)

Thanks.


-- 
Dmitry
