Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E686B64AEB9
	for <lists+linux-input@lfdr.de>; Tue, 13 Dec 2022 05:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233100AbiLMEtq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Dec 2022 23:49:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbiLMEtn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Dec 2022 23:49:43 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A381C92A
        for <linux-input@vger.kernel.org>; Mon, 12 Dec 2022 20:49:41 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id jn7so14367065plb.13
        for <linux-input@vger.kernel.org>; Mon, 12 Dec 2022 20:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Po7qbWkchaA8ToVHh9wdBX19vrTjunJ8/33H4ww5D5s=;
        b=Ip4cRO0c1P5D8O/SNWlzvMEZT398NFEcXHTm6a5l1eKYZiMlItcAM/42hotUfPfjp4
         97M885DYFGT9jHMAB0Hek5O4F8ms1nNaXwabsmiGQ/HF2zqrVuDprAyw7cGSmEVVMxrN
         P9pj4RE3qXq6WxPHTvkZQA7+1ZedWr582bG8rkN4s1Cr36YL4RuxEHGnhOWAayOZDJcc
         qfLK1FNn5h8QOv3WDFsNtbhxCA0jDdDJ6sNu3MkQ2esCJhyhpLr0kmv/FLFsSxT0vYLi
         2HBa6NOm7H7ub0ccuFi6e/g7SYQJDO1gUnlVvt7rSW6e4lEb0+BPndWNxcQLUHojPqqz
         rA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Po7qbWkchaA8ToVHh9wdBX19vrTjunJ8/33H4ww5D5s=;
        b=tkcHJGaydt6b7Ol4X9lhC9V5naDCvwVq/zK/fR5E3KEovWBfH3dh2PkhNKzNW0HTav
         yY6YVZ3oTOCYAJ/6IdGuAnWwl3Xz9T3rP9vIG6b+XlOGnPYH6fSi1DXJZYE1gJBoh4NV
         4oEBnq9JumZ0W3pauM7KCJigH7Hn1oFizuiV1OONJnk/uONDlIqWKS00eZpFlQdli0cL
         4FKyjZzVyWV8DQAUq80oR/XeyHEN3v4VKI4wHV+2XOA5pT1Txq78W6CphFv0IIdiibay
         QnXaNG1z9otseiIBd0LaIp0jBEhzVroA5JBFztFw7u7WjC1zdEW0zwSMFtRbuWY+8Tai
         Fj0w==
X-Gm-Message-State: ANoB5plsLOwhISkPjVccpENHWLhiUPwpFOvSpqXNar9pniSgZcltBCPl
        CwYH6Ecvgy8hCfFL7BKwYxgZfSGByRWcQXIt
X-Google-Smtp-Source: AA0mqf4Xl8I/IEUpWjL9krGQGwcsh380SiewzDLxIu/HivvWJWiBXeXLDptHtMoFcskJx4Xsq0TDow==
X-Received: by 2002:a17:902:b105:b0:189:41c7:693f with SMTP id q5-20020a170902b10500b0018941c7693fmr21129769plr.68.1670906981244;
        Mon, 12 Dec 2022 20:49:41 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id t13-20020a17090340cd00b00176acd80f69sm7280522pld.102.2022.12.12.20.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 20:49:40 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 0/1] HID: playstation: DS4 fixes
Date:   Mon, 12 Dec 2022 20:49:34 -0800
Message-Id: <20221213044935.1775499-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Apparently on some Android ARM platforms, the Bluetooth DS4
path was crashing due to an undefined pointer value.
For some reasons (compile flags, compiler, x86?) I didn't
hit this issue yet. The patch fixes the issue.

Thanks,
Roderick Colenbrander

Roderick Colenbrander (1):
  HID: playstation: fix free of uninialized pointer for DS4 in
    Bluetooth.

 drivers/hid/Kconfig           | 2 +-
 drivers/hid/hid-playstation.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.38.1

