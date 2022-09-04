Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3656C5AC62B
	for <lists+linux-input@lfdr.de>; Sun,  4 Sep 2022 21:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234561AbiIDTbV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Sep 2022 15:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234318AbiIDTbU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Sep 2022 15:31:20 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078C72EF22
        for <linux-input@vger.kernel.org>; Sun,  4 Sep 2022 12:31:20 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id l3so6607256plb.10
        for <linux-input@vger.kernel.org>; Sun, 04 Sep 2022 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=dhghe/zYVZi/SqWmcAzPxHuqsvlYhZEJnLpBLnOTpa8=;
        b=g1zaKKILhtoYEPbvWNHZa3b7q4nG16NU3VDZGyvjW5bCA1eYikmdSQYKljkaRFBqLb
         3ozvAG0t34CtTUi9dRBlrM3EO2MsKRmeoRKanE18qB6y72L1h0sYnXe5OvFGF5lc2FQB
         bGsx8Idn3QOzrcWDTZS0GE1l5TgzhaNp2IOZ+oVINaGjKAzd6LBzdvC06Ywvrb0prgLu
         fzOvVv/smM5Gx3N5IQIZh3U4+1B6EtBJhxPsKJy3hUYNILPsqwONUaoXbUwSxSnXUFwm
         ocKcIrxAn89MC5BH7aJ3LJSl6pzDMKVneqrPI219z5IYl/BJWHwUExD20p0McQbZuQ7T
         NNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dhghe/zYVZi/SqWmcAzPxHuqsvlYhZEJnLpBLnOTpa8=;
        b=kcIpinafNzB6qfmRZbsIIuluPKP59ljbdw5GPMYZf+i2sA1FHFj8SLowjTTb0SuhFm
         Mg5orofTdRh+CN8UPy37ay3TAbWu2s+RDFPkWLufC6U8xTRH5Csta2YH4iJ46o/b73qy
         GkEffmgSjXYkYS+ahWBYUPaC+v1TpFi1a7C8SHb2EbqRwDtmIC8OCJxR0s+JF301aeuu
         vl4XSbvS/pN8aoAxu8OnyRQTe4Np57fC5ukCqmjvS0iHuzaaD5O3hfobSEu9aH3Khulf
         yA1acfgSCzNH8RJB/9Y3jVzYeHNjuwGWppdB9UBVk6eXwoxX6freH4XdW/XCkg0zpE9V
         PSNw==
X-Gm-Message-State: ACgBeo1k1yvZkxdiIEx+P1NcqRSvDZ+ZCqTkYGzJZJ376DI0A/B+iyBI
        M4KFY/M41RmW5eVvqu/lHTU=
X-Google-Smtp-Source: AA6agR6k5Be92w0pY7iJzakeZ7jV9UFVX5drMFHi3XlMERochcDsumK5nnOqQrcdWZbVyJ47VBID6g==
X-Received: by 2002:a17:902:ecc6:b0:174:90c5:613b with SMTP id a6-20020a170902ecc600b0017490c5613bmr35667058plh.28.1662319879371;
        Sun, 04 Sep 2022 12:31:19 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id i125-20020a636d83000000b0042c60bef7b5sm4947511pgc.85.2022.09.04.12.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 12:31:19 -0700 (PDT)
Date:   Sun, 4 Sep 2022 12:31:15 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     erazor_de@users.sourceforge.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, imv4bel@gmail.com
Subject: [PATCH v2] HID: roccat: Fix Use-After-Free in roccat_read
Message-ID: <20220904193115.GA28134@ubuntu>
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
 drivers/hid/hid-roccat.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
index 26373b82fe81..6da80e442fdd 100644
--- a/drivers/hid/hid-roccat.c
+++ b/drivers/hid/hid-roccat.c
@@ -257,6 +257,8 @@ int roccat_report_event(int minor, u8 const *data)
 	if (!new_value)
 		return -ENOMEM;
 
+	mutex_lock(&device->cbuf_lock);
+
 	report = &device->cbuf[device->cbuf_end];
 
 	/* passing NULL is safe */
@@ -276,6 +278,8 @@ int roccat_report_event(int minor, u8 const *data)
 			reader->cbuf_start = (reader->cbuf_start + 1) % ROCCAT_CBUF_SIZE;
 	}
 
+	mutex_unlock(&device->cbuf_lock);
+
 	wake_up_interruptible(&device->wait);
 	return 0;
 }
-- 
2.25.1

