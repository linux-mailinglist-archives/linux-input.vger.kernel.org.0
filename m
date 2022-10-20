Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C7C606487
	for <lists+linux-input@lfdr.de>; Thu, 20 Oct 2022 17:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbiJTPat (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Oct 2022 11:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbiJTPad (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Oct 2022 11:30:33 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C865613C1F3
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 08:30:18 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so3433042pjl.3
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 08:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xw/wzzxFoJzqgkrmVz3/8prD9U8W2m/3Mf/184NLppo=;
        b=ULRlJ/4pac1Ig06J85oQtja3WTUQNdt6dlsgOQtv55nJF4tV75nzPw3j1d9TQZiWqa
         SCX3IUbID4vVEGFHrBzwS8wEc7r/3UB6IOG2F2n69JjbWCORoXgIIcu0NfwVZ297MKYE
         ojwbfcXDfwwk/61bi3HS8qj9uHh9GNhCGiq0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xw/wzzxFoJzqgkrmVz3/8prD9U8W2m/3Mf/184NLppo=;
        b=dGJhRNSjQLuvH4ToFZbifx07rReYtug19z2HMF/2wGPZH/8K7QDp0HBU/ZFjmKyDB9
         m86pg+8MAkaCn6iU3rG2TGB7C/Gxxob6cmoWcdq0Sy33RoGtncBYu6HbomG0m7fSPoED
         da+4h2j9XCBNAK7ZYfU6dI0fVZYKUna9vfpPJmZmK62GTrTIy0XpKZUZIXE6H3hqoBzz
         XWnLI3FGiDJ0p/cv+/f3zK6tGdYn97/uFSuQEma+oZ8+8jl322MbdfWg3UJb8Im9r+Q2
         2McdRQDtNApecvjMjeGLhYn3LsDnnAPUVQ9HzmODSnCe1CKRMo/iJtYRQ64vVzqBaQcW
         oOew==
X-Gm-Message-State: ACrzQf2Ec3BJUugXyARhMSMXXEeZ04KZ2mJOWLGHauOsz8jkxbYHMco3
        ox9cMX70876GT+y6PfWfz8uc3g==
X-Google-Smtp-Source: AMsMyM4ljqNx0GL1dsL74zLjNrunF0bMqLw9FWYYVocr30rKCBDBlDCMdXmpCglMMS0tYqGELyXo4w==
X-Received: by 2002:a17:902:7297:b0:17f:93b5:5ecc with SMTP id d23-20020a170902729700b0017f93b55eccmr14228010pll.93.1666279807019;
        Thu, 20 Oct 2022 08:30:07 -0700 (PDT)
Received: from roguebox.lan ([164.92.70.235])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090264d000b0016c50179b1esm12965573pli.152.2022.10.20.08.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 08:30:06 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jikos@kernel.org, jic23@kernel.org
Cc:     linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH 0/2]  HID: mcp2221: fixes related to IIO additions
Date:   Thu, 20 Oct 2022 23:29:58 +0800
Message-Id: <20221020153000.30874-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series resolves sparse warnings, and undefined references errors when
GPIOLIB isn't enabled.

Matt Ranostay (2):
  HID: mcp2221: fix 'cast to restricted __le16' sparse warnings
  HID: mcp2221: correct undefined references when CONFIG_GPIOLIB isn't
    defined

 drivers/hid/hid-mcp2221.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.30.2

