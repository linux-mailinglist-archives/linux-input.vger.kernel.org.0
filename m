Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A84555B16D
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 13:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbiFZLNk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 07:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234235AbiFZLNe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 07:13:34 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7AF14083
        for <linux-input@vger.kernel.org>; Sun, 26 Jun 2022 04:13:34 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id c205so6511826pfc.7
        for <linux-input@vger.kernel.org>; Sun, 26 Jun 2022 04:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=J23r5JF6e1+u48iVs0FMnp9YaZd2cOFWaHofxq/e2YA=;
        b=TNUrqT3cL2AmB64dqqu7v85hmoixDaGTiToAwpUFs2JonETQu+gt4PDw/ZR/0nAzCb
         9h47IVEi11cN9j2JmJSrocmiAe0QGMZu6+hKErJGYDZtYr60R3PZzjAHJUUL2Icuw68O
         E0P5QVOZAYLoH+BwFPISNP4wHRzMR9X3uK4+jC0Q4bxY5ekQMSAnBZwoTyq8pNf3yep4
         bugDaVgqQEQoIqoTmLoK2iriDKdzyfeb8L+QwCaLPEx3Nocof333MtSDf+hfej1e+RVx
         Kvxci5PRc6mK8VXxZnZNniwFUllVUVdbIhKuvgI5q8T5nkNIwtYSQwr2LWgr2Q6z3s+N
         8RZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=J23r5JF6e1+u48iVs0FMnp9YaZd2cOFWaHofxq/e2YA=;
        b=W6a6pPgv2Zdb8Cy35nsCdsLTxEgn4o8sTMT+DKye6scSPHVs9r+u4/mkRIO8zLg7cw
         SND6qGS+7lX36faSi0ja7L+bi8/SmlJ/fDbNdSTf5PvRb5Gjl0q9QKBSMPvxATiwreNG
         H5rOIilLrKckHACYGFnnowt2n1+obvQPILfhtE+HTs1IYxmROXCcR0O23DuvWL4mCuMr
         EO1fdN1aK3Q02U7xgLaTf56uhElgayEjhvKSdbfWz5lb6rNTrP7OHAv1vwl4lRoiyvcs
         JbvySzuYJdzM5ZOrIZ/0Mzks2rzfdHuYcRvVZX77NARCdTnT3kmz0aHv/+l6naM9ScPB
         gh4w==
X-Gm-Message-State: AJIora/n2VVdC98psSFQTJY/QsKR5+/QENbQqOJgC2bLxmaussD3VlQL
        agYaS1jTLwAngG5V7MjyOZ3JpdQwdaa+U1gK
X-Google-Smtp-Source: AGRyM1sD5axaTRv4xbW4H5UR847DO1kzjDVB9DmzV3TnI12j8csZOv8tqrgk0B8eIPelUVM00hYrfw==
X-Received: by 2002:a63:8f13:0:b0:40c:f042:13a8 with SMTP id n19-20020a638f13000000b0040cf04213a8mr7738131pgd.619.1656242013699;
        Sun, 26 Jun 2022 04:13:33 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709027c0400b0016a04b577f1sm4994967pll.246.2022.06.26.04.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 04:13:33 -0700 (PDT)
Date:   Sun, 26 Jun 2022 04:13:30 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     erazor_de@users.sourceforge.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org
Subject: [PATCH] HID: roccat: Fix Use-After-Free in roccat_read
Message-ID: <20220626111330.GA59219@ubuntu>
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

Dear all,

I submitted this patch 8 days ago.

Can I get feedback on this patch?

Regards,
Hyunwoo Kim.
