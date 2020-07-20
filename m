Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9953226ED5
	for <lists+linux-input@lfdr.de>; Mon, 20 Jul 2020 21:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730763AbgGTTRB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jul 2020 15:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgGTTRA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jul 2020 15:17:00 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E735C061794;
        Mon, 20 Jul 2020 12:17:00 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id e12so14100340qtr.9;
        Mon, 20 Jul 2020 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZY4P2StN02i9zxiuCmah02SFOxscsBn3x480+rE92BE=;
        b=F28QR+9Zzm0roouNa+pdVdhRBMtPLP8uaMFAVzvMQkm1Kv0EaR/K6lMQRh9Ri299bS
         ZtsdVBd3SvpaRAG0yMQzvFN32O0GsJ43Gpx7akMZ62K3ddLXXtdlP+NcxCCyU+nTgTKz
         Zjtx2z6EauSPnrEHx2VCb9p28vFxbZvHxu4Er4yWh/bWfdXnC5jgQH1LyxHGTRhuSY6W
         win8CwCqZKHYEPmjahxQh1DgBf/WWK+v5RBRnbB+YUZjyyWKJjgpilizDUf8aja3vQEy
         xrEyJqOOSunZL+CmpMS5H+o0Dnn1qpds9WN+sgBaoK2Goet9+KZdMoeio+nB88U8f7PI
         mP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=ZY4P2StN02i9zxiuCmah02SFOxscsBn3x480+rE92BE=;
        b=rdXR92+75RIEuDv0g8jS597QvGdLzRRu1HJzNFmzRFI0KUht1i1tCf7IrtEWfkUfIY
         cNUMo33FVn8x6XfG5iXvn8blZGLQokBFdoWKqvj8dpWW4UwwhJ646MIHSX0xcEYRWDou
         4wt7BOLwY/SKxP5d5gL4y8dIgbAOhp9V2Oe0Jp1L8RJnyiuHKWuaHbJCV+6wUZ2Cas1s
         cHmwrzpVOYSQIXSiVdxyaynqFE5hVwWO6E3vWuCq3BjfwjniyOE1iNtYkuy/5JNoc3Vg
         X0VtWQTL+FcoUsFcPlxbzV+Bt6wqfDCedSKBWBNe8RbBl+uIjc11qHYZDoxSj9iGAkRr
         wpMg==
X-Gm-Message-State: AOAM532N/STtbr88gdwSdfLzAuZ+KjezNtaQ9OZ7c/dvykn443+dxufF
        JT1hyopGar999BnfWvX5jw==
X-Google-Smtp-Source: ABdhPJy3nesTMpxh3lXG9vD395BscPdn44YrLAJo2RIXxBzNeiY4nr3RSj0p6V0uAyk27kBDJgoSjw==
X-Received: by 2002:ac8:4f13:: with SMTP id b19mr25858680qte.146.1595272619590;
        Mon, 20 Jul 2020 12:16:59 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
        by smtp.gmail.com with ESMTPSA id f41sm21133029qtk.55.2020.07.20.12.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:16:59 -0700 (PDT)
Date:   Mon, 20 Jul 2020 15:16:56 -0400
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
Message-ID: <20200720191656.GA3366@PWN>
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

I made some mistakes in the previous e-mail. Please ignore that. There
are a lot of things going on...Sorry for that.

On Mon, Jul 20, 2020 at 03:12:57PM +0300, Dan Carpenter wrote:
> So another option would be to just add HIDIOCGUSAGE and HIDIOCSUSAGE to
> the earlier check.  That risks breaking userspace.  Another option is to
> just add a check like you did earlier to the HIDIOCGUSAGE case.
> Probably just do option #2 and resend.

Sure, I will just add the same check to the HIDIOCGUSAGE case for the
time being. Thank you for the detailed explanation.

Here's what I found after digging a bit further though:

hid_open_report() calls different functions in order to process
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

In hid_open_report(), `global.report_count` can be set by calling
hid_parser_global().

However, the syzkaller reproducer made hid_open_report() to call
hid_parser_main() __before__ `global.report_count` is properly set. It's
zero. So hid_register_field() allocated `field` with `values` equals to
zero - No room for value[] at all. I believe this caused the bug.

Apparently hid_open_report() doesn't care about which item (main, local,
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
