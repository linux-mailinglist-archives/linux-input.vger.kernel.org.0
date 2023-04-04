Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754CA6D650C
	for <lists+linux-input@lfdr.de>; Tue,  4 Apr 2023 16:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234858AbjDDOTt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Apr 2023 10:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235174AbjDDOTs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Apr 2023 10:19:48 -0400
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2502710C2
        for <linux-input@vger.kernel.org>; Tue,  4 Apr 2023 07:19:47 -0700 (PDT)
Received: by mail-il1-f199.google.com with SMTP id d5-20020a923605000000b003232594207dso21451306ila.8
        for <linux-input@vger.kernel.org>; Tue, 04 Apr 2023 07:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680617986; x=1683209986;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ot0KYur+8nLVH0WRSyoEfyDfQEVy44kpAPp7VjgrfEU=;
        b=FmAjWSvwy55Q/YsmTWiJd5M2GMSni65MAnHScyzwfBsrEv+pfqXseVrs6cHfiK9W6b
         UfUHBOMU9gdT7Jx2+yVAs665UvtJFMvGQR4szrtqY8WrEkOMA2g+wMIncsinMcx52TkK
         qrPLKOpVtYeBTPfk3r47btn+8LdAHjyxuN4M9jYTCS8G67aTkMztI+x3yoLdGDczuc5q
         2Uf2x1v0f17MKr+sv/NzKP1LQzVF9wuK65NlWattfd/aIMC1w9wnzIG3lK8PUH/y6zWT
         kfs9chGbPAtRa4OsyDNRJD2X3rLmtnX2mxrYgX6Fxg9dj/NHoyDxAyOCuUFGt4HxiR2E
         pgVA==
X-Gm-Message-State: AAQBX9d1Rgi5unn6XA3q4W/eCDxL6hiOgHVkEEaG3Ky8NDp/GWlki2Vw
        6+pgpywbgPUen97+jjxMR1xGDLvZ091P3Zr1lrbQPN8cde+V9DU=
X-Google-Smtp-Source: AKy350Z7MFpp1VYeHsipLm/zlefsLydHgYGG92vadQj4ytQIm8IVdQw4igVowqFeUN432AECcHqyb5WeKolpVmSalIiw1rzGqE8R
MIME-Version: 1.0
X-Received: by 2002:a02:94eb:0:b0:40a:dc7f:7715 with SMTP id
 x98-20020a0294eb000000b0040adc7f7715mr1538706jah.4.1680617986468; Tue, 04 Apr
 2023 07:19:46 -0700 (PDT)
Date:   Tue, 04 Apr 2023 07:19:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001632e305f8835e90@google.com>
Subject: [syzbot] Monthly input report
From:   syzbot <syzbot+list8e8dead94ef997c19522@syzkaller.appspotmail.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello input maintainers/developers,

This is a 30-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 0 new issues were detected and 0 were fixed.
In total, 14 issues are still open and 42 have been fixed so far.

Some of the still happening issues:

Crashes Repro Title
2162    Yes   WARNING in input_mt_init_slots
              https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
93      Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
              https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
67      Yes   general protection fault in hidraw_release
              https://syzkaller.appspot.com/bug?extid=953a33deaf38c66a915e
49      Yes   inconsistent lock state in find_vmap_area
              https://syzkaller.appspot.com/bug?extid=8d19062486784d15dda9
32      Yes   WARNING in bcm5974_start_traffic/usb_submit_urb
              https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.
