Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18BD9E6C06
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2019 06:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbfJ1FjI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Oct 2019 01:39:08 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33543 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfJ1FjI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Oct 2019 01:39:08 -0400
Received: by mail-pf1-f196.google.com with SMTP id c184so6139255pfb.0;
        Sun, 27 Oct 2019 22:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4TLpVWf2CVPtyv8muRNOfqy/oxK+saaX3jSceO7ujLs=;
        b=oZVEgl5I+XusKxKa+xY4nYK7sD66jVdrJs27Ogmpwsdcz6uQwAa81c716UmcsjQoHT
         LJvXK6RZ8LpQGeiNsl2UvFkbYbLV6lvRDZ2CvnjAcHL6ZTjp4gIi/nRR/wUKCI6n3gKj
         nrszOz5PD4X8t0T1vui0e/jvUA16Pd+vEbP1sTpCQ+mdmKO6VXbGBNHxhx5QT4UZ/F9s
         HyuZ7/AF9LWwr3HoPkTT31q84Z2uovUt/VnE9RlCbweFrMcwf/pU5LxwKmQz9s58N1BQ
         Syv413sOBtU3J8bOH7+JC2nPpC0wvNE/d7HexwdWVVzqlqMtn4LwVExzpufy/YwEZwFR
         /scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4TLpVWf2CVPtyv8muRNOfqy/oxK+saaX3jSceO7ujLs=;
        b=OMbyRQIu76TF8qzFvH5mmGg0jGP0px2Ex7jx91wuynuN7yhdzq25Lgz1NAafQhv/2a
         JNwxEHk2FZu/lQXmPCdSwI/F42HqSxk8XizoE1yWHtdObCyx+HKXg0YG1PYUTGFdNI1o
         ACKfpYY9u7fdK/LHDxiTPaXHeNonkLLLeluSqxARh71seRmQtKRuZ2yxsIFovBmXP746
         jS6y9jwutjYdXI9DoGje3dctS3qLDNSQTUXVyYrgEpHHFZVRzC2txn1t/VsM3O6sG/vE
         oy5H4J6kvIfzRQE2OsJS+tfH+xCDfnPA25QMZiM6oluSr9oEF2+oi220pkO3bhQ6GbH3
         6TPQ==
X-Gm-Message-State: APjAAAW6rAgVJPmxS4hVBtZ8rAAX3sbYFMPeybDZrSEc/7jwP98RaDbT
        /4YjsDYYbZs18avrxZfLJa8=
X-Google-Smtp-Source: APXvYqznWT2B8o3TXTpO5S61wCXRH+CISbuywggih+NT11L9qppGsMrPmOHGdacuRlsUQSe4ZI1Bsw==
X-Received: by 2002:a17:90a:24ca:: with SMTP id i68mr20825227pje.11.1572241147645;
        Sun, 27 Oct 2019 22:39:07 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 22sm9354320pfo.131.2019.10.27.22.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 22:39:06 -0700 (PDT)
Date:   Sun, 27 Oct 2019 22:39:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrew Duggan <aduggan@synaptics.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Christopher Heiny <Cheiny@synaptics.com>,
        Simon Wood <simon@mungewell.org>,
        Nick Dyer <nick@shmanahar.org>
Subject: Re: [PATCH 1/3] Input: synaptics-rmi4 - disable the relative
 position IRQ in the F12 driver
Message-ID: <20191028053904.GG163068@dtor-ws>
References: <20191025002527.3189-1-aduggan@synaptics.com>
 <20191025002527.3189-2-aduggan@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191025002527.3189-2-aduggan@synaptics.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrew,

On Fri, Oct 25, 2019 at 12:25:56AM +0000, Andrew Duggan wrote:
> This patch fixes an issue seen on HID touchpads which report finger
> positions using RMI4 Function 12. The issue manifests itself as
> spurious button presses as described in:
> https://www.spinics.net/lists/linux-input/msg58618.html
> 
> Commit 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution
> to irq_domain") switched the RMI4 driver to using an irq_domain to handle
> RMI4 function interrupts. Functions with more then one interrupt now have
> each interrupt mapped to their own IRQ and IRQ handler. The result of
> this change is that the F12 IRQ handler was now getting called twice. Once
> for the absolute data interrupt and once for the relative data interrupt.
> For HID devices, calling rmi_f12_attention() a second time causes the
> attn_data data pointer and size to be set incorrectly. When the touchpad
> button is pressed, F30 will generate an interrupt and attempt to read the
> F30 data from the invalid attn_data data pointer and report incorrect
> button events.

Maybe we should create only 1 interrupt per function instead of
multiple? It looks like the functions read their entire block of data on
any interrupt received.

> 
> This patch disables the F12 relative interrupt which prevents
> rmi_f12_attention() from being called twice.

Don't we have similar issue with F11, and maybe others?

Also, as far as F12 goes, I see that it may mark sensor as reporting
relative coordinates, but I do not see where it would actually emit
relative events. I must be missing something here...

Thanks.

-- 
Dmitry
