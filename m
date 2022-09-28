Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD8A5EE6D2
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 22:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbiI1UvF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 16:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbiI1Uuj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 16:50:39 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA344205CA
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 13:50:34 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id p202so11135456iod.6
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 13:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9w7xMlJciuPx0Q28K0Wr7VFuYyBfVms7H68EEBmMR04=;
        b=iPGoYV7wAGAGrWob/mRY9UYEhrsUWqjNSio6oIp2TnnMMrguZxETCiesLWE6GdalPB
         Ut7yLtT8K/1wnvBmX5WqwLwfAo1ck6fKHipAkBO9g5u9UaD+dIsTaRK/ROK77lFurD9W
         XE6pWex80huyX1ugs/McFGMlA6gDfKoFBaaL63eEjxIeRjv49PABgcX/ioTFEk0RLObW
         3EfVbrx1kjcJWse9Wg82w9hAecnHe/7/oQQKe8Ebr6MIZnL6iwCOQK6Q2j0RsxpsbBtv
         h7z5vjv5K1oV/ux08o5pU3D79IS+uINndcVML56osI4O+aCDbEndnowx5wNe8X1tVQt2
         boRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9w7xMlJciuPx0Q28K0Wr7VFuYyBfVms7H68EEBmMR04=;
        b=K8RrIn1X0DUa79+1Pu6NcOLZEmMNNqEhhhVyCjo2V8fH2UdjGnyMTtFfSGgGLSpRdH
         IUkpwu2JQBT5jZ8MaeQUB397FhBDzdAB2hGavpBsSZc1FyIAsFr86mgJHKuSFncHQ7w5
         dppoHBGDJ4OLLF0En6qnM9LDEudVOzeWr4V7M7ZrKwt7GG7La5UWX2KjG35qSsLuwWGi
         pmMoBuj6BbebOPhxxxQxDlxwaMszr6SO8qnmU1yTKH/Ae5BBwHxfdKJSi+3sVrHLMN8e
         vN8cyf2/gRk3pBG9VcgcGIbFhoop+WyONjcj2u8eYE7ZKCPT8YXXmB/DC83pUrm3RBrs
         ogRQ==
X-Gm-Message-State: ACrzQf0dYQw+Ya8iJSO7OJzUZQHq3VQAVSq5JJmU/EhkdYHR5lw0DXUs
        1/DDnBYtR07tQXJOLHkDZSXd6mnzO9s=
X-Google-Smtp-Source: AMsMyM5dlL0Jcizrp3i/Lb50sJjMml32BzjZ+vETvK/bz70rQQAKTVl3NilnlSbhOBqk8JjddIYacA==
X-Received: by 2002:a05:6638:3015:b0:341:de68:602c with SMTP id r21-20020a056638301500b00341de68602cmr17965661jak.10.1664398233737;
        Wed, 28 Sep 2022 13:50:33 -0700 (PDT)
Received: from fedora.. ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id t3-20020a92d143000000b002eafe62193asm1995423ilg.36.2022.09.28.13.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 13:50:33 -0700 (PDT)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     linux-input@vger.kernel.org
Cc:     jkosina@suse.cz, Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: wacom: add three styli to wacom_intuos_get_tool_type
Date:   Wed, 28 Sep 2022 13:49:29 -0700
Message-Id: <20220928204929.56157-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We forgot to add the 3D pen ID a year ago. There are two new pro pen
IDs to be added.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
---
 drivers/hid/wacom_wac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 4fc64bd..a04f66a 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -723,11 +723,14 @@ static int wacom_intuos_get_tool_type(int tool_id)
 	case 0x802: /* Intuos4/5 13HD/24HD General Pen */
 	case 0x8e2: /* IntuosHT2 pen */
 	case 0x022:
+	case 0x200: /* Pro Pen 3 */
+	case 0x04200: /* Pro Pen 3 */
 	case 0x10842: /* MobileStudio Pro Pro Pen slim */
 	case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
 	case 0x16802: /* Cintiq 13HD Pro Pen */
 	case 0x18802: /* DTH2242 Pen */
 	case 0x10802: /* Intuos4/5 13HD/24HD General Pen */
+	case 0x80842: /* Intuos Pro and Cintiq Pro 3D Pen */
 		tool_type = BTN_TOOL_PEN;
 		break;
 
-- 
2.37.3

