Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8436226EA8
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 21:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728771AbgGTTFM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 15:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgGTTFM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 15:05:12 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F26C061794;
        Mon, 20 Jul 2020 12:05:12 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id g26so6433808qka.3;
        Mon, 20 Jul 2020 12:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=6xNou+cHACWFvHGNXzPofMh+CBZIQ8xW+dhFT3jGEbo=;
        b=qGH3EGZrbBYJFFXLpy9788889L91tGMGugiOZhBG5mkmuOaHr8qDM4J+IGuyanGPhu
         Vxw9qvA8wjLil9OOQMqcA36LhPMFBJkuR0e9m5fhddTmTp9pHfA5IGt9YTi+3ndcaQuR
         L4iHvaYG3FlYLQNaKPSDnM/F4BFGwLPeEeqHRxhnjrRM0rM5cBpm0jx1vXcUuQGFT8e3
         gDjYTnWK7GtT4p+w6abgKeVqvOO0ncOtFM2MFragZvc27GLYAM0zDQ9xVdCtz4YlFta7
         IhjYfdyVkfF3bEeAeEZ5QtiyT0AN2J4NIEHs561V0bBVGf9tE1zwOcx6W6cHIDxqNI8F
         TQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=6xNou+cHACWFvHGNXzPofMh+CBZIQ8xW+dhFT3jGEbo=;
        b=hyHMdevaBGNI0RExZtvqrNxVzTO56PWJhF1K8eH7vnlyr5in+aMbfqvzGGSHxYb0Nk
         JvVdhzCnhD7m9Cjp3s2Kuk8JpAO5uoJGTkg2PRt6bWFd2KwhqN/nj3VTktM9svpFQEF0
         /8tyv871D3q7z7gtZZBWR4X/sdffvRBd3vYwPvgdEcsGYFCqpky27t2WbfjwYbiMNk44
         kwlzIlHLmDdnvi96QliJ+L1GyFoIPMuLHYCS9QNw9PeRDeHZdULjhqAIldrao95RGjHy
         DfS7+CLnYiF+Gyf35pqMmRDQPbjHXUB+l/EOxZCWeu4KLZpdruWyEwWbPJRXiUn/CyvV
         rC0A==
X-Gm-Message-State: AOAM531QnWJdqdIrzujGLmpTr5qQ55OMUHZSGsCnqsxeT2E07M72ZDML
        1byPTWSaf1jILN8WaDNI1A==
X-Google-Smtp-Source: ABdhPJzrXQwdWF+qa2wzWCIT1nZ5JLyIGIeu284ZR14tqRjIjGzf7/7OV2hINf0xqBRSi/yBapdmYQ==
X-Received: by 2002:a37:80c:: with SMTP id 12mr7349989qki.149.1595271911228;
        Mon, 20 Jul 2020 12:05:11 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
        by smtp.gmail.com with ESMTPSA id r2sm19318751qtn.27.2020.07.20.12.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:05:10 -0700 (PDT)
Date:   Mon, 20 Jul 2020 15:05:08 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] usbhid: Fix slab-out-of-bounds
 write in hiddev_ioctl_usage()
Message-ID: <20200720190508.GA1946@PWN>
Reply-To: 20200720121257.GJ2571@kadam
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720115400.GI2549@kadam>
 <20200720121257.GJ2571@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720121257.GJ2571@kadam>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 20, 2020 at 03:12:57PM +0300, Dan Carpenter wrote:
> So another option would be to just add HIDIOCGUSAGE and HIDIOCSUSAGE to
> the earlier check.  That risks breaking userspace.  Another option is to
> just add a check like you did earlier to the HIDIOCGUSAGE case.
> Probably just do option #2 and resend.

Sure, I will just add the same check to the HIDIOCGUSAGE case for the
time being. Thank you for the detailed explanation.

Here's what I found after digging a bit further though:

hid_parser_main() calls different functions in order to process
different type of items:

drivers/hid/hid-core.c:1193:

	static int (*dispatch_type[])(struct hid_parser *parser,
				      struct hid_item *item) = {
		hid_parser_main,
		hid_parser_global,
		hid_parser_local,
		hid_parser_reserved
	};

In this case, hid_parser_main() calls hid_add_field(), which in turn
calls hid_register_field(), which allocates the `field` object as you
mentioned:

drivers/hid/hid-core.c:102:

	field = kzalloc((sizeof(struct hid_field) +
			 usages * sizeof(struct hid_usage) +
			 values * sizeof(unsigned)), GFP_KERNEL);

Here, `values` equals to `global.report_count`. See how it is being
called:

drivers/hid/hid-core.c:303:

	field = hid_register_field(report, usages, parser->global.report_count);

In hid_parser_main(), `global.report_count` can be set by calling
hid_parser_global().

However, the syzkaller reproducer made hid_parser_main() to call
hid_parser_global() __before__ `global.report_count` is properly set. It's
zero. So hid_register_field() allocated `field` with `values` equals to
zero - No room for value[] at all. I believe this caused the bug.

Apparently hid_parser_main() doesn't care about which item (main, local,
global and reserved) gets processed first. I am new to this code and I
don't know whether this is by design, but this arbitrarity is
apparently causing some issues.

As another example, in hid_add_field():

drivers/hid/hid-core.c:289:

	report->size += parser->global.report_size * parser->global.report_count;

If `global.report_count` is zero, `report->size` gets increased by zero.
Is this working as intended? It seems weird to me.

Thank you,

Peilin Ye
