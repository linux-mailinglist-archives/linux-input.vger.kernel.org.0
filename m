Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602F87BCF5F
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 19:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbjJHRVH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 13:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjJHRVG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 13:21:06 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9985EA6
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 10:21:04 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40684f53ef3so36756245e9.3
        for <linux-input@vger.kernel.org>; Sun, 08 Oct 2023 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696785663; x=1697390463; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2PcH0XRpLzFpR6JqUnYlWDUIfUvWY924fUy0c1vk5Q0=;
        b=ZgWUsgCIRf9M2FRj5FBE1erAL3EJkCl9kB4APDSg0h+oTbybTSfmxMMnH/ApTnuwkE
         eZ8fxs83qbKC6dbC+1FhF0EvIGhQe5XY0lg663XCdqJWOLq50v3ZCnWXtOU3MvkkXRA4
         x+jVf9WXPtBGEIpeETjs52dH+i+uWW78rV/tVWCoFte8hxpOFEPd/AHCe60T6wd7oGir
         C1W52US+MUdol/Yrqh7suK0WeAWlnc5NkwWvcBpvdC7m9Shy3F3UuiLsGCeUe6a30+KF
         3D3lKtBP91X9l3RrfX1Dux7KpdHO31TejIAcUg/s1xin6INQLtLvCXDKniCvkTtydqce
         G9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696785663; x=1697390463;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PcH0XRpLzFpR6JqUnYlWDUIfUvWY924fUy0c1vk5Q0=;
        b=m/Aex3TRqxPCVaMEsWegwSkeOgJ+c+90YJF+WaAotnUUJVp83tJ1lbHvif2oASXiO8
         v0eLFSejcM5dFC09Zv5FsYcs8qA4IkvIYIXXym6QXLsZL+kvHDE4DuyORl/u0DfqZLZP
         g49cdsmoyq1noH3AiaW+bJrOnkgdvN7InSerY4eeayrTP28of4ZhOHxvzcCE7CosGwPh
         aWFA8ezjvjivb8Nl84E07rlXxHatBuveLAluJ10LiXV5wqN/WUKw1mTIEy4LDDgntzJe
         0QphRUeWxURK6T3guOx4GTG/g3efru4f3W+/aj/Fpb5v9yrd6kwTZ2RGtTf/c1vvKS1O
         YKHQ==
X-Gm-Message-State: AOJu0Ywx6gUeeo8/bdEdmkMwF2dU5KFMqwTHcUwOXsLLfP6bWXXNPEg2
        f/pysCO0v9u532T4WZ3N1Y0=
X-Google-Smtp-Source: AGHT+IFepG6kJC43f+1iDNcN/HMM3MmxmSAEgA43Jbq4IQ6DBL6HeGIFrMoYbluMoPN02e3R1Vc4Zg==
X-Received: by 2002:a5d:6e85:0:b0:317:50b7:2ce3 with SMTP id k5-20020a5d6e85000000b0031750b72ce3mr11019871wrz.51.1696785662428;
        Sun, 08 Oct 2023 10:21:02 -0700 (PDT)
Received: from fedora ([94.73.35.97])
        by smtp.gmail.com with ESMTPSA id q14-20020a5d574e000000b0031aef72a021sm7313394wrw.86.2023.10.08.10.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 10:21:01 -0700 (PDT)
Date:   Sun, 8 Oct 2023 19:21:00 +0200
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Jinjie Ruan <ruanjinjie@huawei.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: uclogic: Fix user-memory-access bug in
 uclogic_params_ugee_v2_init_event_hooks()
Message-ID: <ZSLk/JfhtJOp6Z81@fedora>
References: <20230921133824.605700-1-ruanjinjie@huawei.com>
 <20230921133824.605700-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921133824.605700-2-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jinjie Ruan,

Thanks a lot for finding and fixing this bug.

On Thu, Sep 21, 2023 at 09:38:23PM +0800, Jinjie Ruan wrote:
> When CONFIG_HID_UCLOGIC=y and CONFIG_KUNIT_ALL_TESTS=y, launch kernel and
> then the below user-memory-access bug occurs.
> 
> In hid_test_uclogic_params_cleanup_event_hooks(),it call
> uclogic_params_ugee_v2_init_event_hooks() with the first arg=NULL, so
> when it calls uclogic_params_ugee_v2_has_battery(), the hid_get_drvdata()
> will access hdev->dev with hdev=NULL, which will cause below
> user-memory-access.
> 
> So add a fake_device with quirks member and call hid_set_drvdata()
> to assign hdev->dev->driver_data which avoids the null-ptr-def bug
> for drvdata->quirks in uclogic_params_ugee_v2_has_battery(). After applying
> this patch, the below user-memory-access bug never occurs.
> 
>  general protection fault, probably for non-canonical address 0xdffffc0000000329: 0000 [#1] PREEMPT SMP KASAN
>  KASAN: probably user-memory-access in range [0x0000000000001948-0x000000000000194f]
>  CPU: 5 PID: 2189 Comm: kunit_try_catch Tainted: G    B   W        N 6.6.0-rc2+ #30
>  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
>  RIP: 0010:uclogic_params_ugee_v2_init_event_hooks+0x87/0x600
>  Code: f3 f3 65 48 8b 14 25 28 00 00 00 48 89 54 24 60 31 d2 48 89 fa c7 44 24 30 00 00 00 00 48 c7 44 24 28 02 f8 02 01 48 c1 ea 03 <80> 3c 02 00 0f 85 2c 04 00 00 48 8b 9d 48 19 00 00 48 b8 00 00 00
>  RSP: 0000:ffff88810679fc88 EFLAGS: 00010202
>  RAX: dffffc0000000000 RBX: 0000000000000004 RCX: 0000000000000000
>  RDX: 0000000000000329 RSI: ffff88810679fd88 RDI: 0000000000001948
>  RBP: 0000000000000000 R08: 0000000000000000 R09: ffffed1020f639f0
>  R10: ffff888107b1cf87 R11: 0000000000000400 R12: 1ffff11020cf3f92
>  R13: ffff88810679fd88 R14: ffff888100b97b08 R15: ffff8881030bb080
>  FS:  0000000000000000(0000) GS:ffff888119e80000(0000) knlGS:0000000000000000
>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: 0000000000000000 CR3: 0000000005286001 CR4: 0000000000770ee0
>  DR0: ffffffff8fdd6cf4 DR1: ffffffff8fdd6cf5 DR2: ffffffff8fdd6cf6
>  DR3: ffffffff8fdd6cf7 DR6: 00000000fffe0ff0 DR7: 0000000000000600
>  PKRU: 55555554
>  Call Trace:
>   <TASK>
>   ? die_addr+0x3d/0xa0
>   ? exc_general_protection+0x144/0x220
>   ? asm_exc_general_protection+0x22/0x30
>   ? uclogic_params_ugee_v2_init_event_hooks+0x87/0x600
>   ? sched_clock_cpu+0x69/0x550
>   ? uclogic_parse_ugee_v2_desc_gen_params+0x70/0x70
>   ? load_balance+0x2950/0x2950
>   ? rcu_trc_cmpxchg_need_qs+0x67/0xa0
>   hid_test_uclogic_params_cleanup_event_hooks+0x9e/0x1a0
>   ? uclogic_params_ugee_v2_init_event_hooks+0x600/0x600
>   ? __switch_to+0x5cf/0xe60
>   ? migrate_enable+0x260/0x260
>   ? __kthread_parkme+0x83/0x150
>   ? kunit_try_run_case_cleanup+0xe0/0xe0
>   kunit_generic_run_threadfn_adapter+0x4a/0x90
>   ? kunit_try_catch_throw+0x80/0x80
>   kthread+0x2b5/0x380
>   ? kthread_complete_and_exit+0x20/0x20
>   ret_from_fork+0x2d/0x70
>   ? kthread_complete_and_exit+0x20/0x20
>   ret_from_fork_asm+0x11/0x20
>   </TASK>
>  Modules linked in:
>  Dumping ftrace buffer:
>     (ftrace buffer empty)
>  ---[ end trace 0000000000000000 ]---
>  RIP: 0010:uclogic_params_ugee_v2_init_event_hooks+0x87/0x600
>  Code: f3 f3 65 48 8b 14 25 28 00 00 00 48 89 54 24 60 31 d2 48 89 fa c7 44 24 30 00 00 00 00 48 c7 44 24 28 02 f8 02 01 48 c1 ea 03 <80> 3c 02 00 0f 85 2c 04 00 00 48 8b 9d 48 19 00 00 48 b8 00 00 00
>  RSP: 0000:ffff88810679fc88 EFLAGS: 00010202
>  RAX: dffffc0000000000 RBX: 0000000000000004 RCX: 0000000000000000
>  RDX: 0000000000000329 RSI: ffff88810679fd88 RDI: 0000000000001948
>  RBP: 0000000000000000 R08: 0000000000000000 R09: ffffed1020f639f0
>  R10: ffff888107b1cf87 R11: 0000000000000400 R12: 1ffff11020cf3f92
>  R13: ffff88810679fd88 R14: ffff888100b97b08 R15: ffff8881030bb080
>  FS:  0000000000000000(0000) GS:ffff888119e80000(0000) knlGS:0000000000000000
>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: 0000000000000000 CR3: 0000000005286001 CR4: 0000000000770ee0
>  DR0: ffffffff8fdd6cf4 DR1: ffffffff8fdd6cf5 DR2: ffffffff8fdd6cf6
>  DR3: ffffffff8fdd6cf7 DR6: 00000000fffe0ff0 DR7: 0000000000000600
>  PKRU: 55555554
>  Kernel panic - not syncing: Fatal exception
>  Dumping ftrace buffer:
>     (ftrace buffer empty)
>  Kernel Offset: disabled
>  Rebooting in 1 seconds..
> 
> Fixes: a251d6576d2a ("HID: uclogic: Handle wireless device reconnection")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/hid/hid-uclogic-params-test.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-uclogic-params-test.c b/drivers/hid/hid-uclogic-params-test.c
> index 678f50cbb160..3938bae25982 100644
> --- a/drivers/hid/hid-uclogic-params-test.c
> +++ b/drivers/hid/hid-uclogic-params-test.c
> @@ -174,12 +174,22 @@ static void hid_test_uclogic_parse_ugee_v2_desc(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, params->frame_type, frame_type);
>  }
>  
> +struct fake_device {
> +	unsigned long quirks;
> +};
> +
>  static void hid_test_uclogic_params_cleanup_event_hooks(struct kunit *test)
>  {
>  	int res, n;
> +	struct hid_device *hdev;
> +	struct fake_device *fake_dev;
>  	struct uclogic_params p = {0, };
>  
> -	res = uclogic_params_ugee_v2_init_event_hooks(NULL, &p);
> +	hdev = kzalloc(sizeof(struct hid_device), GFP_KERNEL);
> +	fake_dev = kzalloc(sizeof(struct fake_device), GFP_KERNEL);

Intead of using `kzalloc()` to allocate memory for `hdev` and `fake_dev`
we should use `kunit_kzalloc()`.

It has 2 main advatages:
- If an assertion fails, the memory is freed
- No need for `kfree()`

> +	hid_set_drvdata(hdev, fake_dev);
> +
> +	res = uclogic_params_ugee_v2_init_event_hooks(hdev, &p);
>  	KUNIT_ASSERT_EQ(test, res, 0);
>  
>  	/* Check that the function can be called repeatedly */
> @@ -187,6 +197,9 @@ static void hid_test_uclogic_params_cleanup_event_hooks(struct kunit *test)
>  		uclogic_params_cleanup_event_hooks(&p);
>  		KUNIT_EXPECT_PTR_EQ(test, p.event_hooks, NULL);
>  	}
> +
> +	kfree(fake_dev);
> +	kfree(hdev);

This 2 lines can be removed if `kunit_kzalloc()` is used.

>  }
>  
>  static struct kunit_case hid_uclogic_params_test_cases[] = {
> -- 
> 2.34.1
> 

Once the `kunit_kzalloc()` change is appliyed:
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
