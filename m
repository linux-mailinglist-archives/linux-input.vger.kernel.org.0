Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A6D54FD03
	for <lists+linux-input@lfdr.de>; Fri, 17 Jun 2022 20:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbiFQSi7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jun 2022 14:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbiFQSi7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jun 2022 14:38:59 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C97C35248
        for <linux-input@vger.kernel.org>; Fri, 17 Jun 2022 11:38:57 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id f16so3589283pjj.1
        for <linux-input@vger.kernel.org>; Fri, 17 Jun 2022 11:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=wjpcX+d8R4YrJctwcrg/4ZckWkQeLXo50oKnFbv+rBo=;
        b=KGYpy/34zroRUzMcBrhgF3LHPryT2pFMibAIRZHSYCt1xJHTW0Bzm5yWGyr3+hcP4o
         KHg//5pAzbirFUw6KzURc3qyyCfh5Os1aNHnjSXA662NhRVgO4pjVEnOT9YMQxuvqYiN
         MQgbT1SRBNq5tGJ6ggboNFNsxPLSxSfkH4cYwgPOW3hl5PpmPY4Aho778M/Tj4K8q57b
         OftgqRSneEu9pG261MT9sexDkv0cTdiflTzwybemFGG/FeYTVwXZLkf8BmGb3QwjxycD
         FOu7nqD/PL3z+n06Z1akTL5hOrFhYp8Yt7/M+N0413g+IOaz1dvd8eh/NcZBXPxJq3Z3
         ZwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=wjpcX+d8R4YrJctwcrg/4ZckWkQeLXo50oKnFbv+rBo=;
        b=ArUOHR2+sP6ph0hX4Cvp/Uu+xabn6/bezrr0/wrbFwpsyigdBhILskGEnogv/OwdEg
         erdFlYtN0GXltA73ctiVYK+SsfpyVsSlyCXYiaWxv4WuPnhGUM1zk4IjXywDjugOPsmG
         mbSacV15Cmc6GEeu4gR9jLfg/5weBDgAgSviUxbNksfXkAP6CqxfgS3oV/bd6yvt4x2S
         Yc7BAuCVLSGF3V4Xf5Sa6063aJxtCDAfzvghk4T4w4BRm4+AP1O3Pj43k57ClabdnwgH
         UyEJG8qn5UMo7Z6bVTihfHbZkRR0pEPmTvhdYlt22ZCuDx4hOvMx5Q842ut/r2o5di6L
         mR6w==
X-Gm-Message-State: AJIora+TJ7ykbULwpUeDyKe5ln45gBImjPZ0Scr7nYZRSy/YLeTFbiOF
        8ETm9Gmt7kElmebxz4FPucM=
X-Google-Smtp-Source: AGRyM1vWSOpxze2kuaa9hfh0eY3AHGbXDMKn0NAlgyvD4XWrZzI1RaGZRDMNEcLKZ2saDyJ2726INQ==
X-Received: by 2002:a17:902:db0f:b0:166:42b5:c819 with SMTP id m15-20020a170902db0f00b0016642b5c819mr10817481plx.96.1655491137095;
        Fri, 17 Jun 2022 11:38:57 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id u22-20020a62d456000000b0051c70fd5263sm4025672pfl.169.2022.06.17.11.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 11:38:56 -0700 (PDT)
Date:   Fri, 17 Jun 2022 11:38:52 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     erazor_de@users.sourceforge.net, jikos@kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH] HID: roccat: Fix Use-After-Free in roccat_read
Message-ID: <20220617183852.GA639974@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

roccat_report_event() is responsible for registering
roccat-related reports in struct roccat_device.

int roccat_report_event(int minor, u8 const *data)
{
	struct roccat_device *device;
	struct roccat_reader *reader;
	struct roccat_report *report;
	uint8_t *new_value;

	device = devices[minor];

	new_value = kmemdup(data, device->report_size, GFP_ATOMIC);
	if (!new_value)
		return -ENOMEM;

	report = &device->cbuf[device->cbuf_end];

	/* passing NULL is safe */
	kfree(report->value);
	...

The registered report is stored in the struct roccat_device member
"struct roccat_report cbuf[ROCCAT_CBUF_SIZE];".
If more reports are received than the "ROCCAT_CBUF_SIZE" value,
kfree() the saved report from cbuf[0] and allocates a new reprot.
Since there is no lock when this kfree() is performed,
kfree() can be performed even while reading the saved report.

static ssize_t roccat_read(struct file *file, char __user *buffer,
		size_t count, loff_t *ppos)
{
	struct roccat_reader *reader = file->private_data;
	struct roccat_device *device = reader->device;
	struct roccat_report *report;
	ssize_t retval = 0, len;
	DECLARE_WAITQUEUE(wait, current);

	mutex_lock(&device->cbuf_lock);

	...

	report = &device->cbuf[reader->cbuf_start];
	/*
	 * If report is larger than requested amount of data, rest of report
	 * is lost!
	 */
	len = device->report_size > count ? count : device->report_size;

	if (copy_to_user(buffer, report->value, len)) {
		retval = -EFAULT;
		goto exit_unlock;
	}
	...

The roccat_read() function receives the device->cbuf report and
delivers it to the user through copy_to_user().
If the N+ROCCAT_CBUF_SIZE th report is received while copying of
the Nth report->value is in progress, the pointer that copy_to_user()
is working on is kfree()ed and UAF read may occur. (race condition)

Since the device node of this driver does not set separate permissions,
this is not a security vulnerability, but because it is used for
requesting screen display of profile or dpi settings,
a user using the roccat device can apply udev to this device node or
There is a possibility to use it by giving.

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 drivers/hid/hid-roccat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 26373b82fe81..abe23ccd48e8 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -260,7 +260,9 @@ int roccat_report_event(int minor, u8 const *data)
 	report = &device->cbuf[device->cbuf_end];
 
 	/* passing NULL is safe */
+	mutex_lock(&device->cbuf_lock);
 	kfree(report->value);
+	mutex_unlock(&device->cbuf_lock);
 
 	report->value = new_value;
 	device->cbuf_end = (device->cbuf_end + 1) % ROCCAT_CBUF_SIZE;
-- 
2.25.1

