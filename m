Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88CEF7BCF60
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 19:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbjJHRV1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 13:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjJHRV1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 13:21:27 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6B8A6
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 10:21:25 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-405524e6768so36867385e9.2
        for <linux-input@vger.kernel.org>; Sun, 08 Oct 2023 10:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696785684; x=1697390484; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kW48Sb4Bbch5mX9IsPPf8zHzfaeHUCcfD7dXjhmMXKU=;
        b=PM02yNCdqKeW/XrCjQgMJZ82b9r8w/MdxxH7FA8Yv+pCWbmlB6mMYvwQZuW/jeK0h1
         PjXZ02uQorbmGBbkydTrOftiI6aMpD7o62EAXYBKZPeNbF2YSw7jZFwrwgASHP+WEYrW
         anxHlZW8kmfIR3ZGDHWTqSs6Y31T8nkAsrVQMh90ONHwgBXlrLA9b/5fGob7h71f4o4T
         TzBC/vxPmc9Jql0jG3P31eIaDREbtc3TFFf7ydI7SS1wIrhtN3HKTDpO4OWvGe7nAXvD
         G+4eP47rYNBZoSRDfA44d9/Ih197RmvO0Y/XWIjbck+3eitIhyT1T3gCCEd1Y9c7kJ7C
         MIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696785684; x=1697390484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kW48Sb4Bbch5mX9IsPPf8zHzfaeHUCcfD7dXjhmMXKU=;
        b=NepFLwRtuBjw7XXFnJZPz42tK9xzBGPTMQbEm8o6IpU4P9GMmEMxrxUCUShbHoIB4I
         KnFz/skeWtk0X5v6oCwB/kxV4N96E4SkYOSCccg6eKmgrdP9pQilTGsvW2RgHbykPrH9
         JRqlGJQYiVYePcQ+Q6cnGFZOclBYoNTR7IzpS8eOVC/5wOLZb7l9RJpnOwYSfTIVp74e
         Z/ky2TLubZcFECA5c3QihZU/opIcitd88KL/p7cOp/IHIq319jS3XGa+A6+CPsrL3T2F
         XW3afavc7TCU1nNeR62xmm4mJBUN8AilqbWFvyi4Qm8Tn8I5kvg5xL8VDc9RY4IPB/5d
         juig==
X-Gm-Message-State: AOJu0YxllhWdhz6mgXCfDF0TSOD54J/cah3NL9eNs9k9b1UsvItM0ugV
        AeEKWdHMpIpkU9nOaYLgnV/NZCwfA3o=
X-Google-Smtp-Source: AGHT+IHj2XMqZeFzyq8Wgq6dwmYfy3k8O29OfzY10bA1cIXywrjBkMDQSyJodBdSbnU5XIW+K5/GPQ==
X-Received: by 2002:a05:600c:2613:b0:401:d947:c8a9 with SMTP id h19-20020a05600c261300b00401d947c8a9mr11811968wma.19.1696785683699;
        Sun, 08 Oct 2023 10:21:23 -0700 (PDT)
Received: from fedora ([94.73.35.97])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c025300b00401d8181f8bsm11212813wmj.25.2023.10.08.10.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 10:21:23 -0700 (PDT)
Date:   Sun, 8 Oct 2023 19:21:21 +0200
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] HID: uclogic: Fix a work->entry not empty bug in
 __queue_work()
Message-ID: <ZSLlEXjpVWrdFGpt@fedora>
References: <20230921133824.605700-1-ruanjinjie@huawei.com>
 <20230921133824.605700-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921133824.605700-3-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 21, 2023 at 09:38:24PM +0800, Jinjie Ruan wrote:
> When CONFIG_HID_UCLOGIC=y and CONFIG_KUNIT_ALL_TESTS=y, launch
> kernel and then the below work->entry not empty bug occurs.
> 
> In hid_test_uclogic_exec_event_hook_test(), the filter->work is not
> initialized to be added to p.event_hooks->list, and then the
> schedule_work() in uclogic_exec_event_hook() will call __queue_work(),
> which check whether the work->entry is empty and cause the below
> warning call trace.
> 
> So call INIT_WORK() with a fake work to solve the issue. After applying
> this patch, the below work->entry not empty bug never occurs.
> 
>  WARNING: CPU: 0 PID: 2177 at kernel/workqueue.c:1787 __queue_work.part.0+0x780/0xad0
>  Modules linked in:
>  CPU: 0 PID: 2177 Comm: kunit_try_catch Tainted: G    B   W        N 6.6.0-rc2+ #30
>  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
>  RIP: 0010:__queue_work.part.0+0x780/0xad0
>  Code: 44 24 20 0f b6 00 84 c0 74 08 3c 03 0f 8e 52 03 00 00 f6 83 00 01 00 00 02 74 6f 4c 89 ef e8 c7 d8 f1 02 f3 90 e9 e5 f8 ff ff <0f> 0b e9 63 fc ff ff 89 e9 49 8d 57 68 4c 89 e6 4c 89 ff 83 c9 02
>  RSP: 0000:ffff888102bb7ce8 EFLAGS: 00010086
>  RAX: 0000000000000000 RBX: ffff888106b8e460 RCX: ffffffff84141cc7
>  RDX: 1ffff11020d71c8c RSI: 0000000000000004 RDI: ffff8881001d0118
>  RBP: dffffc0000000000 R08: 0000000000000001 R09: ffffed1020576f92
>  R10: 0000000000000003 R11: ffff888102bb7980 R12: ffff888106b8e458
>  R13: ffff888119c38800 R14: 0000000000000000 R15: ffff8881001d0100
>  FS:  0000000000000000(0000) GS:ffff888119c00000(0000) knlGS:0000000000000000
>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: ffff888119506000 CR3: 0000000005286001 CR4: 0000000000770ef0
>  DR0: ffffffff8fdd6ce0 DR1: ffffffff8fdd6ce1 DR2: ffffffff8fdd6ce3
>  DR3: ffffffff8fdd6ce5 DR6: 00000000fffe0ff0 DR7: 0000000000000600
>  PKRU: 55555554
>  Call Trace:
>   <TASK>
>   ? __warn+0xc9/0x260
>   ? __queue_work.part.0+0x780/0xad0
>   ? report_bug+0x345/0x400
>   ? handle_bug+0x3c/0x70
>   ? exc_invalid_op+0x14/0x40
>   ? asm_exc_invalid_op+0x16/0x20
>   ? _raw_spin_lock+0x87/0xe0
>   ? __queue_work.part.0+0x780/0xad0
>   ? __queue_work.part.0+0x249/0xad0
>   queue_work_on+0x48/0x50
>   uclogic_exec_event_hook.isra.0+0xf7/0x160
>   hid_test_uclogic_exec_event_hook_test+0x2f1/0x5d0
>   ? try_to_wake_up+0x151/0x13e0
>   ? uclogic_exec_event_hook.isra.0+0x160/0x160
>   ? _raw_spin_lock_irqsave+0x8d/0xe0
>   ? __sched_text_end+0xa/0xa
>   ? __sched_text_end+0xa/0xa
>   ? migrate_enable+0x260/0x260
>   ? kunit_try_run_case_cleanup+0xe0/0xe0
>   kunit_generic_run_threadfn_adapter+0x4a/0x90
>   ? kunit_try_catch_throw+0x80/0x80
>   kthread+0x2b5/0x380
>   ? kthread_complete_and_exit+0x20/0x20
>   ret_from_fork+0x2d/0x70
>   ? kthread_complete_and_exit+0x20/0x20
>   ret_from_fork_asm+0x11/0x20
>   </TASK>
> 
> Fixes: a251d6576d2a ("HID: uclogic: Handle wireless device reconnection")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/hid/hid-uclogic-core-test.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hid/hid-uclogic-core-test.c b/drivers/hid/hid-uclogic-core-test.c
> index 2bb916226a38..cb274cde3ad2 100644
> --- a/drivers/hid/hid-uclogic-core-test.c
> +++ b/drivers/hid/hid-uclogic-core-test.c
> @@ -56,6 +56,11 @@ static struct uclogic_raw_event_hook_test test_events[] = {
>  	},
>  };
>  
> +static void fake_work(struct work_struct *work)
> +{
> +
> +}
> +
>  static void hid_test_uclogic_exec_event_hook_test(struct kunit *test)
>  {
>  	struct uclogic_params p = {0, };
> @@ -77,6 +82,8 @@ static void hid_test_uclogic_exec_event_hook_test(struct kunit *test)
>  		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filter->event);
>  		memcpy(filter->event, &hook_events[n].event[0], filter->size);
>  
> +		INIT_WORK(&filter->work, fake_work);
> +
>  		list_add_tail(&filter->list, &p.event_hooks->list);
>  	}
>  
> -- 
> 2.34.1
> 
