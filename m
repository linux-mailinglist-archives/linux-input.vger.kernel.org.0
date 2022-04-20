Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84BA7508AB4
	for <lists+linux-input@lfdr.de>; Wed, 20 Apr 2022 16:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379524AbiDTOZv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Apr 2022 10:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379494AbiDTOZs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Apr 2022 10:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7067C443CB
        for <linux-input@vger.kernel.org>; Wed, 20 Apr 2022 07:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650464581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=H5xScA/klqo/u2bg+Qb9rc2tvwNY2OP4Zj405m1vetA=;
        b=G2Mjgmv5pxHh1ZtWuJEbSlAMrq4IPmA6wwzqAGcTMx3KIASs2r5I/o6ooaNCjKwEI8Lu1P
        1KnSdl/VZWvpMVaFrFBm6xs7o8H1+Zh9O4U/MwWpOntqf3Apkxau3/UZ0Zr82LD4yp2cQf
        BFCPrHZpPfc1jAQOsS/4XS37qrDBJM0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-HVVSoGdAPTm1xbmUhnOJSw-1; Wed, 20 Apr 2022 10:23:00 -0400
X-MC-Unique: HVVSoGdAPTm1xbmUhnOJSw-1
Received: by mail-qt1-f198.google.com with SMTP id s9-20020ac87589000000b002e1cfb25db9so1068065qtq.1
        for <linux-input@vger.kernel.org>; Wed, 20 Apr 2022 07:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H5xScA/klqo/u2bg+Qb9rc2tvwNY2OP4Zj405m1vetA=;
        b=1Va0KeQ4rLXoQommyIZ1I2i97ZIiLO68ASQjlEGNcCoB/Nl7B1SDRW0l7Go4Um80/Y
         wD1ZVbg3N/QOhldZBJbswC2+yHZo/kU37KmprRQ6yoRJ8EB24bmQ75QK22LEl7mTDHri
         maQrttHscNm9aSr9TsnJ6IpyIPya6toBy1XiqpOBYXGK4d0oLVPxdkihg6NwNm0Ctkh3
         gOyFAP8BfMVICJxYl/qlFvD3oEDwzLi5V+vjTyxVZBleMyEvAhp5OghyricSo/0Y0pCq
         hmL8LnXsG8wINdRVTwMKkwbkzWdNyrHhxG7MvDzERo3gzuW/i5FlnBpwzFBejv4IdtmW
         Cbtw==
X-Gm-Message-State: AOAM531Jvuo1gc7j3wawblOd6tF+rtXEepsuHj6vwNs/Gb8QAtDAL6dh
        hsmQmec9o8pfCIk5gbSav73qE7kr2bbw+u7ouWNOxzg+1JY8dwyRxRYtdrdnxDP5cgqBlQlc81s
        OkH5jWWvbOjstrpXyynZnTao=
X-Received: by 2002:a05:620a:46a9:b0:69e:dbf1:8200 with SMTP id bq41-20020a05620a46a900b0069edbf18200mr1414626qkb.670.1650464579366;
        Wed, 20 Apr 2022 07:22:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPnhmx5uMU62htWmb7eF6KV5baHZL/w/x0SphhFaGsOOzt0id4ABiRpToBMijTlalYfJhhLQ==
X-Received: by 2002:a05:620a:46a9:b0:69e:dbf1:8200 with SMTP id bq41-20020a05620a46a900b0069edbf18200mr1414611qkb.670.1650464579164;
        Wed, 20 Apr 2022 07:22:59 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id s12-20020a05622a018c00b002f2017d5652sm1788170qtw.40.2022.04.20.07.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:22:58 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, nehal-bakulchandra.shah@amd.com,
        Shyam-sundar.S-k@amd.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] HID: amd_sfh: change global variables to static
Date:   Wed, 20 Apr 2022 10:22:44 -0400
Message-Id: <20220420142244.556429-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Smatch reports this representative issue
amd_sfh_hid_report_desc.h:182:10: warning: symbol 'gyro3_report_descriptor' was not declared. Should it be static?
Similar issues for comp3_report_descriptor and als_report_descriptor.

Global variables should not be defined in header files.
This only works because amd_sfh_hid_report_desc.h in only included by
amd_sfh_hid_desc.c so change the storage-class specifiers to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
index b07dc4bbb858..7a2b4e434e4f 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
@@ -179,7 +179,7 @@ static const u8 accel3_report_descriptor[] = {
 0xC0			/* HID end collection */
 };
 
-const u8 gyro3_report_descriptor[] = {
+static const u8 gyro3_report_descriptor[] = {
 0x05, 0x20,		/* Usage page */
 0x09, 0x76,		/* Motion type Gyro3D */
 0xA1, 0x00,		/* HID Collection (Physical) */
@@ -340,7 +340,7 @@ const u8 gyro3_report_descriptor[] = {
 0xC0,			/* HID end collection */
 };
 
-const u8 comp3_report_descriptor[] = {
+static const u8 comp3_report_descriptor[] = {
 0x05, 0x20,		/* Usage page */
 0x09, 0x83,		/* Motion type Orientation compass 3D */
 0xA1, 0x00,		/* HID Collection (Physical) */
@@ -512,7 +512,7 @@ const u8 comp3_report_descriptor[] = {
 0xC0				/* HID end collection */
 };
 
-const u8 als_report_descriptor[] = {
+static const u8 als_report_descriptor[] = {
 0x05, 0x20,	/* HID usage page sensor */
 0x09, 0x41,	/* HID usage sensor type Ambientlight  */
 0xA1, 0x00,	/* HID Collection (Physical) */
-- 
2.27.0

