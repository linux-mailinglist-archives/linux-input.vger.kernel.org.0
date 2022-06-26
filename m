Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 568DA55B202
	for <lists+linux-input@lfdr.de>; Sun, 26 Jun 2022 14:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234345AbiFZMyw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Jun 2022 08:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiFZMyv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Jun 2022 08:54:51 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7EDFD28
        for <linux-input@vger.kernel.org>; Sun, 26 Jun 2022 05:54:50 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id q6so13638450eji.13
        for <linux-input@vger.kernel.org>; Sun, 26 Jun 2022 05:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent;
        bh=kOtizkUhx26TCIK4uuJZEK8BgjPqUDR+VJZ3tSk0le4=;
        b=MiNI3GB1JJ13v9p3KBlwWuGaFvLjngKEP4qnbACa02tilb7bxt861ljywkMxOdFUYC
         4CdGW0GftSaV9e7lm+oaFZLdGQdmJQqpQ6Hw7/E5FWMUDYwCpicHeDuJzhBTa2P8nccL
         fs/hpy99I9BKM+EILf97gqOysTK8/cePdkK4huXzcfBpjyno4+GvHN4GlKhmf+ZqXLpl
         wTB5PeLMLT5np/ZG08cSlw0RTYN8X1wYfmiTEIrj0hz29SPBYscULAHJXF9m515Rx/p3
         9gOKCzqTFzsTA7NNYhmBlxQ7a8c6yG6De4TmFLWRfPoczKdvNkFzoNjgUjZ77XgrigER
         FAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent;
        bh=kOtizkUhx26TCIK4uuJZEK8BgjPqUDR+VJZ3tSk0le4=;
        b=St/HjHv45tgVB6U6+WNx+sIEYviP1BrMNG81KbUaXhVVJeTa0WOZxK6/3Zgv4/keYs
         IF8eEudIiX1VM14eKj/91Z+gwP9fbPD2XuYF0R9oHbUzxWHwuSTmODH9fxsez7Ki0gAL
         xjPGhxygiJ5cT+6OpWsOXdxFTyUdIXz/HkWX1c2x8WrZW5GU3jbtmvbJJcEYlpsPuPw4
         15LvMdlySAiZU+m6hY0Gv9EGcXYphUVh6GqQh9FyaFN3hrScPeW5v37hl4xfZNhKvCVa
         /adCVdR/CrXO4+TZqHjq/GjR5ZIRwf6gFKbrZya21jhbv7c1KyTv6Lsaydliv9Yn1Uju
         +TrQ==
X-Gm-Message-State: AJIora+Y4f8+i4PjfxVDajEjCAf3S1WUOYSmtBxaKRLf0LvBRxXRLf19
        1xHR0loKd3qIDa9vcQz7d8k=
X-Google-Smtp-Source: AGRyM1uh8oNOz5XYrU+9rhI1ubNcYA5AJKjbFhxayNN9/4DEK57dzwqGG8w5d861HWF2kIXHAsZBKg==
X-Received: by 2002:a17:907:60d1:b0:726:a049:7740 with SMTP id hv17-20020a17090760d100b00726a0497740mr925876ejc.215.1656248088886;
        Sun, 26 Jun 2022 05:54:48 -0700 (PDT)
Received: from localhost ([2a02:169:1e9::acc])
        by smtp.gmail.com with ESMTPSA id bq15-20020a056402214f00b00435a742e350sm5898238edb.75.2022.06.26.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 05:54:48 -0700 (PDT)
Date:   Sun, 26 Jun 2022 14:54:47 +0200
To:     Hyunwoo Kim <imv4bel@gmail.com>
Cc:     erazor_de@users.sourceforge.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: roccat: Fix Use-After-Free in roccat_read
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20220626111330.GA59219@ubuntu>
In-Reply-To: <20220626111330.GA59219@ubuntu>
Message-Id: <3L3XAQ4FCEIF5.3JIFZ4LHP1KYI@homearch.localdomain>
User-Agent: mblaze/1.2 (2022-06-21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

Usually for resends one would add something like "RESEND" to the patch
according to

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

One question about the patch below (note that I am not very familiar
with Linux Kernel driver code).

Hyunwoo Kim <imv4bel@gmail.com> wrote:
> roccat_report_event() is responsible for registering
> roccat-related reports in struct roccat_device.
> 
> int roccat_report_event(int minor, u8 const *data)
> {
> 	struct roccat_device *device;
> 	struct roccat_reader *reader;
> 	struct roccat_report *report;
> 	uint8_t *new_value;
> 
> 	device = devices[minor];
> 
> 	new_value = kmemdup(data, device->report_size, GFP_ATOMIC);
> 	if (!new_value)
> 		return -ENOMEM;
> 
> 	report = &device->cbuf[device->cbuf_end];
> 
> 	/* passing NULL is safe */
> 	kfree(report->value);
> 	...
> 
> The registered report is stored in the struct roccat_device member
> "struct roccat_report cbuf[ROCCAT_CBUF_SIZE];".
> If more reports are received than the "ROCCAT_CBUF_SIZE" value,
> kfree() the saved report from cbuf[0] and allocates a new reprot.
> Since there is no lock when this kfree() is performed,
> kfree() can be performed even while reading the saved report.
> 
> static ssize_t roccat_read(struct file *file, char __user *buffer,
> 		size_t count, loff_t *ppos)
> {
> 	struct roccat_reader *reader = file->private_data;
> 	struct roccat_device *device = reader->device;
> 	struct roccat_report *report;
> 	ssize_t retval = 0, len;
> 	DECLARE_WAITQUEUE(wait, current);
> 
> 	mutex_lock(&device->cbuf_lock);
> 
> 	...
> 
> 	report = &device->cbuf[reader->cbuf_start];
> 	/*
> 	 * If report is larger than requested amount of data, rest of report
> 	 * is lost!
> 	 */
> 	len = device->report_size > count ? count : device->report_size;
> 
> 	if (copy_to_user(buffer, report->value, len)) {
> 		retval = -EFAULT;
> 		goto exit_unlock;
> 	}
> 	...
> 
> The roccat_read() function receives the device->cbuf report and
> delivers it to the user through copy_to_user().
> If the N+ROCCAT_CBUF_SIZE th report is received while copying of
> the Nth report->value is in progress, the pointer that copy_to_user()
> is working on is kfree()ed and UAF read may occur. (race condition)
> 
> Since the device node of this driver does not set separate permissions,
> this is not a security vulnerability, but because it is used for
> requesting screen display of profile or dpi settings,
> a user using the roccat device can apply udev to this device node or
> There is a possibility to use it by giving.
> 
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> ---
>  drivers/hid/hid-roccat.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-roccat.c b/drivers/hid/hid-roccat.c
> index 26373b82fe81..abe23ccd48e8 100644
> --- a/drivers/hid/hid-roccat.c
> +++ b/drivers/hid/hid-roccat.c
> @@ -260,7 +260,9 @@ int roccat_report_event(int minor, u8 const *data)
>  	report = &device->cbuf[device->cbuf_end];
>  
>  	/* passing NULL is safe */
> +	mutex_lock(&device->cbuf_lock);
>  	kfree(report->value);
> +	mutex_unlock(&device->cbuf_lock);
>  
>  	report->value = new_value;

Wouldn't we have to protect this assignment with a lock as well? Otherwise
the copy_to_user may end up with the pointer changing mid-copy which it
may or may not be able to deal with.


Cheers,
Silvan

>  	device->cbuf_end = (device->cbuf_end + 1) % ROCCAT_CBUF_SIZE;


