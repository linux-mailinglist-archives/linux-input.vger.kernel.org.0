Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE573AFA1D
	for <lists+linux-input@lfdr.de>; Tue, 22 Jun 2021 02:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhFVARz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 20:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbhFVARy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 20:17:54 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEDAC061574;
        Mon, 21 Jun 2021 17:15:40 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id n12so6798641pgs.13;
        Mon, 21 Jun 2021 17:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u4+h1qhNDQZtf5NqTjGD0Wq0YvnIdaEK1UZKRxjIdig=;
        b=B0dTimqBbJxoHFe4S5K7j3qw+Lrmjcsk3zKiifjyBrw9NAWO1pNsi+p7gf9Zf2fdKj
         q0X6qDLhgv91FuGh8I6Xd7tT4FE9P0RH/A9ed5w5KJFMLuV87sSIvkhMtyTH2Z0DeW1T
         p43k4Vvk1QbeG0MITDKfl9hzqM0JlD+HKg0lQknNikzrKvieK7TeC6de/ID5xdP7PHQx
         bsjt+nAs6htev+zO8MPpiEGx1N77wOnhHQxsgu+HMLqVH1m2FWuQPTLIntjiJVgqlilu
         efq0xBX+b5ilvSbxEv3/szi1pn2XrGiNaccn7qo3G6MgPn67DElPgLGUQo0M8lLV4378
         aNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u4+h1qhNDQZtf5NqTjGD0Wq0YvnIdaEK1UZKRxjIdig=;
        b=t8HeMSdnQN28O3SmQaLIwFtZD0/wYqKu/oiqznju+1v7xvvtt5SVfXiwjI0YHYnsJA
         bilFtAwiON27R5E7qap2wHhRYEVRsB5yE5CnlQ8nuML387wvhx9uk1FaDT5xg4E2oA+6
         oOw2hMK/fQH+LfPJchzvYUjjXfLd+01aSf06U7A7F7wuhDo97Re0I4xuuFwju7SNvGhN
         Up6oFyLLU2o79nBvB/kEaVF7NSq7oVrmlh6Hp7Zf8MnM07C+bgT1gD7Y9YlW0VJlArZt
         BWkVdcVEd9IPIU0AlAwq5lg96kAdPE/6FBKxSuiDyYb8ayZoEcll2LBFhbB9PSHDJElw
         3nNQ==
X-Gm-Message-State: AOAM530iSI8/OUAgBvHWVVSSQbaU6CGzoww30Ug5pzYflZYHQToMEzgX
        obIqLf8yky/rr1J6ZSDaH4M=
X-Google-Smtp-Source: ABdhPJwoE0184MrSJhm4YjEooAdRVfn1keqcNQpzM24RWm5Dy6+HFc9jaXd5XfNK6o6k6YjJJCXpdw==
X-Received: by 2002:a63:2d46:: with SMTP id t67mr1013937pgt.307.1624320939689;
        Mon, 21 Jun 2021 17:15:39 -0700 (PDT)
Received: from envious.. (c-71-236-190-222.hsd1.or.comcast.net. [71.236.190.222])
        by smtp.gmail.com with ESMTPSA id n63sm11142432pfn.140.2021.06.21.17.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 17:15:39 -0700 (PDT)
From:   Dylan MacKenzie <ecstaticmorse@gmail.com>
Cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] HID: amd_sfh: Minor DMA mapping bugfixes
Date:   Mon, 21 Jun 2021 17:15:00 -0700
Message-Id: <20210622001503.47541-1-ecstaticmorse@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

While preparing to investigate
https://bugzilla.kernel.org/show_bug.cgi?id=212615, I read through the amd_sfh
driver and saw two (unrelated) bugs in the logic that sets the DMA mask.
Ultimately these are harmless, but they should probably get fixed.

FYI, this is my first time submitting a kernel patch. If I've done something
wrong in formatting this email, it is likely due to incompetence rather than
malice.

Dylan MacKenzie (2):
  HID: amd_sfh: Set correct DMA mask
  HID: amd_sfh: Continue if fallback DMA mask is accepted

 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--
2.31.1

