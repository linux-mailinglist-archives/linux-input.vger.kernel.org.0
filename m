Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E79CA1A537
	for <lists+linux-input@lfdr.de>; Sat, 11 May 2019 00:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfEJWb3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 May 2019 18:31:29 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39919 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfEJWb3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 May 2019 18:31:29 -0400
Received: by mail-pl1-f195.google.com with SMTP id g9so3449714plm.6
        for <linux-input@vger.kernel.org>; Fri, 10 May 2019 15:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4IcYsJxpvj820KlmBgC85NAfD8Ccj2lGM5LCd1Jae58=;
        b=CTR2TSwmxpTN/w/L05ivLbQWJ3PhF6Vmz0DH1zv4sTYuoVEG0Vex7fcbVszPNiPJxx
         zltu7M29qrJjrr0Y68HQoy/ogj9DjTLmaJHJyYXaFiVkBDK0fG2Yuj7cNHUIHazE4mFU
         R2bfIm74EauJmT/KAb3XqpWaYxgzXTTMIxa7SG3ad7Yrd3vOkrjtIfN7C1gIAbKCtTCK
         4JlzlhyTlM+evKroXZNn2EXdl6y/XG63U/iGFCZDl+Kmy1vW41StoJAewNGIQpLrO/QW
         TkX6IinJugjgElzEEd2Ib7MrSLwJtwe5dIIx+tNjSQp7+aUaDaJl3YzyVKSOD58Qg30A
         q/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4IcYsJxpvj820KlmBgC85NAfD8Ccj2lGM5LCd1Jae58=;
        b=f2wpnF6NVGqSTM39trnAzv/6BFbRL1rtmvT0VX2tr2J2MJ5zbWY2gdbj8KnUw4rKiz
         y0M+crBgzRM1myhluTEhH41/JAnPydpelbNdV5lJGyj8bvLAvrdHhS2dfwFJPdQOr578
         gpse5dzbcsAQ/8K7iKdi2xkHfcxEsZDJa2bOZgUQpneJTcLOjPwoJae1yoPyHWNWAwMH
         3kfu/3VxGLNKtLVICUJ7dxndJfnCPB94iQHp4AHGZ4QAc/Uh3Ytu4sNSGh0wGVsHVgwL
         /KiMXe00UBDInJ+Z9lazxEg1jt7Q6hFQnXQUHX2kQeQ5j6sXNC8qIF9aIf8429JFiVeV
         DJgw==
X-Gm-Message-State: APjAAAV4joWHSlzkiJ/OUWyy4I+PZowzDW6nybpCQDaX9O/asCF8BQGD
        s2aJud+kwR0KrTSL7mJbGPKK/TAx
X-Google-Smtp-Source: APXvYqyD88953VyhHsatfX6gEIs+kk8LMKf8hRS5potSzcw+28FRxyzsCnx0o1iRc/f8w6h/qzltrw==
X-Received: by 2002:a17:902:da4:: with SMTP id 33mr15968889plv.20.1557527488305;
        Fri, 10 May 2019 15:31:28 -0700 (PDT)
Received: from west.Home ([97.115.133.135])
        by smtp.googlemail.com with ESMTPSA id i15sm14601205pfj.167.2019.05.10.15.31.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 10 May 2019 15:31:27 -0700 (PDT)
From:   Aaron Armstrong Skomra <skomra@gmail.com>
X-Google-Original-From: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, pinglinux@gmail.com,
        jason.gerecke@wacom.com
Cc:     Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH 0/4] Intuos Pro 2nd Gen Small
Date:   Fri, 10 May 2019 15:31:15 -0700
Message-Id: <1557527479-9242-1-git-send-email-aaron.skomra@wacom.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the Inutos Pro 2nd Generation Small.

This patch set is based on top of Jason's two existing patch 
sets sent Apr 24th and May 7th.

Aaron Armstrong Skomra (4):
  HID: wacom: generic: only switch the mode on devices with LEDs
  HID: wacom: generic: Correct pad syncing
  HID: wacom: correct touch resolution x/y typo
  HID: wacom: Add 2nd gen Intuos Pro Small support

 drivers/hid/wacom_sys.c |  3 +++
 drivers/hid/wacom_wac.c | 49 ++++++++++++++++++++++++++++++++++---------------
 drivers/hid/wacom_wac.h |  2 ++
 3 files changed, 39 insertions(+), 15 deletions(-)

-- 
2.7.4

