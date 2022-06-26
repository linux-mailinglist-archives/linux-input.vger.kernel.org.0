Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F31A55B289
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 17:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiFZO7z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 10:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbiFZO7y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 10:59:54 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17BAFD06
        for <linux-input@vger.kernel.org>; Sun, 26 Jun 2022 07:59:53 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id d129so6808681pgc.9
        for <linux-input@vger.kernel.org>; Sun, 26 Jun 2022 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v/mk8mKYf2mFucFlfb+4UF3URqadBn89wlNnNj5NvJY=;
        b=D0C1q4lNPKL/0x6kBpkxd7rYzblfqyMcVM2dfy5Fg61Y/YgOa9wEQN1gnjM85fVHqU
         7Uu09SF28YrJZ0Riy5I66GfqUc6z3+MmfDO/88nRV4lZDWUUKZDvkUmf9HAtFZ+ySeZb
         U8QUeORHqAaLd6qQC/Vu1cGHm4/btd4SXmSkhLMn+qpCJkZ10vevWNK4AN0sFG82pNm2
         q4yd+4n1En99GoMrkPc4Y8Z0UbaVFDLLPtoap6QgAJpBPhLg9a5G566zR5A6LbBkRmZr
         RQTtVG9r1ZYrnRpcDYxh1ZgJjdZ9kXNKL0YYykNjfDixSGYK5YKI2ENN5ovnh6Gtw9Xp
         Q2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v/mk8mKYf2mFucFlfb+4UF3URqadBn89wlNnNj5NvJY=;
        b=gqqQb/XBn3Hs/5uM9GL4y/7NFLMZD51ETaDI2WYTDTTckjGwdxQ1MEi2YRZALRx3L0
         9jlL0F5silu91HMGHJ4RNJb8LECj8PBWiT/yZApx6SyvyndABxx1ui5VFEcI2vOxNJD5
         I7Zo43G6/Dc1K7NkFYslDoFaTji1hao8AExHzuLwA0F3IGLDVS1butLDUQFbRdqebayh
         N4kPXihiSYIBhyYgUS8PId1sPVco983t8hc5E+oma+pa0GQWKR3fALoSfAUf2iXNskUB
         ITd4AHrIR/uiSf1mCg447bG2+llme9p2N+yL4582pINkyjXWj46nFlh0utXtOPsrpENF
         0qeg==
X-Gm-Message-State: AJIora8w2fsIkG0+QyMmR9NKvkTJiu3LnADtWZ3O8VyfSih8KvzRNhZp
        1HFIQyKANLL+28/lM5B3zT4=
X-Google-Smtp-Source: AGRyM1vDBWzfaoTtKogelTm0/BxRoKmb0ouVAJIQox6JN1NqlHDrkevvw9cNTiQc3mVIPPPXRQCu2A==
X-Received: by 2002:a63:3ecb:0:b0:40c:a558:89f3 with SMTP id l194-20020a633ecb000000b0040ca55889f3mr8585368pga.277.1656255593095;
        Sun, 26 Jun 2022 07:59:53 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id e21-20020a170902d39500b0016a565febdfsm5285057pld.252.2022.06.26.07.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 07:59:52 -0700 (PDT)
Date:   Sun, 26 Jun 2022 07:59:48 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     Silvan Jegen <s.jegen@gmail.com>
Cc:     erazor_de@users.sourceforge.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: roccat: Fix Use-After-Free in roccat_read
Message-ID: <20220626145948.GA62550@ubuntu>
References: <20220626111330.GA59219@ubuntu>
 <3L3XAQ4FCEIF5.3JIFZ4LHP1KYI@homearch.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3L3XAQ4FCEIF5.3JIFZ4LHP1KYI@homearch.localdomain>
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


On Sun, Jun 26, 2022 at 02:54:47PM +0200, Silvan Jegen wrote:
> Usually for resends one would add something like "RESEND" to the patch
> according to
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Thank you for telling me.
Next time I will attach the RESEND tag.

> Wouldn't we have to protect this assignment with a lock as well? Otherwise
> the copy_to_user may end up with the pointer changing mid-copy which it
> may or may not be able to deal with.
> 
> >  	device->cbuf_end = (device->cbuf_end + 1) % ROCCAT_CBUF_SIZE;

Because device->cbuf_lock is used throughout the roccat_read() function that calls copy_to_user(), 
modifying the value of a "report" member that is already used as copy_to_user() does not cause UAF. 
(Modifying report->value or device->cbuf_end does not affect copy_to_user().)

However, it seems cleaner and safer to include the mutex in all references to 
report, device, and reader in roccat_report_event().

So it seems better to modify the mutex position as above.

Regards,
Hyunwoo Kim.
