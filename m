Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20890696B59
	for <lists+linux-input@lfdr.de>; Tue, 14 Feb 2023 18:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjBNRW5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Feb 2023 12:22:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBNRW4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Feb 2023 12:22:56 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C05C7DA3
        for <linux-input@vger.kernel.org>; Tue, 14 Feb 2023 09:22:53 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id sa10so41811811ejc.9
        for <linux-input@vger.kernel.org>; Tue, 14 Feb 2023 09:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QXzOct/9awTTP6Vfra6idMPvdz9sciZM8UCJeQQTcOo=;
        b=KFdC1vzUNwP77kxIlaSFlFhX5/E7E4gn6poQBMs07GJKmG98m7LjUbwO7RZ2BD0Yma
         tYGfFg9NLGIDa0ojvHMhWgjkF7wF1J4M8/izkK9guwlGgEWnLXp4jfyhtWpV8+ia99j1
         ES1Yam62m1vzgmauTGbcO6WjiJ5HT9DMmJLBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXzOct/9awTTP6Vfra6idMPvdz9sciZM8UCJeQQTcOo=;
        b=qdE8WNw8g3nT/jYRbjfcv1JdE+6SMgMMKqub0ayBLyOmzJzq0u6q09OyBgpxx0wNz8
         UbOAdABrlxN78COwPWzsUQW28q4twXVkkQN2hYSUNzm5+D9cVErgXWw4V76YLc5uy4lW
         0mrK5J+JOwf35YSTQO0xxKSSoZlQUuPq/DT7foKuQX2L0pyy4YQJUo0gYD4u5cti2j+Q
         k369NCkrw+ZZgpn7YFwie6NMJ6zXIpjlAlcTeIPLUDZJzRV/Xxv+P4yzvvwFppZIzylP
         UJIzb+AdZr+GNuT5tSSjIuiqWjwMdulf/xGRt/MOee8Mjhc069+doybIZfmQqAzENx2o
         fjLA==
X-Gm-Message-State: AO0yUKV9/WhJfE7lBh3I4yeBXuHScR1DqJ5v3YzFlS5JFDzTyQ0gDrwe
        LpCKexWkkPVMEmbPbX/Y8D0TnlFItsLPyRH8mk2y2Q==
X-Google-Smtp-Source: AK7set+pJ1AjyIDx0YVL8hLS/E81NKam1i082k+Kd046jktWo71h8P0tvxnWqM8XTx44vTMWYYk1i5XpJgn7BKrRNWw=
X-Received: by 2002:a17:906:6b91:b0:879:b98d:eb08 with SMTP id
 l17-20020a1709066b9100b00879b98deb08mr1616327ejr.3.1676395371586; Tue, 14 Feb
 2023 09:22:51 -0800 (PST)
MIME-Version: 1.0
References: <20230125-hid-unregister-leds-v3-2-0a52ac225e00@diag.uniroma1.it> <202302141039.anZLT940-lkp@intel.com>
In-Reply-To: <202302141039.anZLT940-lkp@intel.com>
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Tue, 14 Feb 2023 18:22:40 +0100
Message-ID: <CAEih1qWcM1o5zgAt1oW+y6Xz828MMfmTHAVL-D-DeQXgnKTcOA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: asus: use spinlock to safely schedule workers
To:     Dan Carpenter <error27@gmail.com>
Cc:     oe-kbuild@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hanno Zulla <kontakt@hanno.de>,
        Carlo Caione <carlo@endlessm.com>, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>, Jakob Koschel <jkl820.git@gmail.com>,
        Roderick Colenbrander <roderick@gaikai.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 14 Feb 2023 at 08:58, Dan Carpenter <error27@gmail.com> wrote:
>
> Hi Pietro,
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Pietro-Borrello/HID-bigben-use-spinlock-to-safely-schedule-workers/20230210-080058
> base:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
> patch link:    https://lore.kernel.org/r/20230125-hid-unregister-leds-v3-2-0a52ac225e00%40diag.uniroma1.it
> patch subject: [PATCH v3 2/2] HID: asus: use spinlock to safely schedule workers
> config: riscv-randconfig-m031-20230212 (https://download.01.org/0day-ci/archive/20230214/202302141039.anZLT940-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 12.1.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202302141039.anZLT940-lkp@intel.com/
>
> smatch warnings:
> drivers/hid/hid-asus.c:532 asus_kbd_backlight_work() warn: sleeping in atomic context
>
> vim +532 drivers/hid/hid-asus.c
>
> af22a610bc3850 Carlo Caione    2017-04-06  521  static void asus_kbd_backlight_work(struct work_struct *work)
> af22a610bc3850 Carlo Caione    2017-04-06  522  {
> af22a610bc3850 Carlo Caione    2017-04-06  523          struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> af22a610bc3850 Carlo Caione    2017-04-06  524          u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> af22a610bc3850 Carlo Caione    2017-04-06  525          int ret;
> 31e578b641b3b3 Pietro Borrello 2023-02-09  526          unsigned long flags;
> af22a610bc3850 Carlo Caione    2017-04-06  527
> 31e578b641b3b3 Pietro Borrello 2023-02-09  528          spin_lock_irqsave(&led->lock, flags);
>                                                         ^^^^^^^^^^^^^^^^^
> Holding a spinlock.
>
> af22a610bc3850 Carlo Caione    2017-04-06  529
> af22a610bc3850 Carlo Caione    2017-04-06  530          buf[4] = led->brightness;
> af22a610bc3850 Carlo Caione    2017-04-06  531
> af22a610bc3850 Carlo Caione    2017-04-06 @532          ret = asus_kbd_set_report(led->hdev, buf, sizeof(buf));
>                                                               ^^^^^^^^^^^^^^^^^^^
> asus_kbd_set_report() does a GFP_KERNEL allocation.
>
>
> af22a610bc3850 Carlo Caione    2017-04-06  533          if (ret < 0)
> af22a610bc3850 Carlo Caione    2017-04-06  534                  hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> 31e578b641b3b3 Pietro Borrello 2023-02-09  535
> 31e578b641b3b3 Pietro Borrello 2023-02-09  536          spin_unlock_irqrestore(&led->lock, flags);
> af22a610bc3850 Carlo Caione    2017-04-06  537  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>

Hello,
Thank you, but the issue has already been fixed in v4.
Link: https://lore.kernel.org/lkml/20230125-hid-unregister-leds-v4-3-7860c5763c38@diag.uniroma1.it/T/#m8983ca3d0fbf656a40011a77c8988e3d16cac671

Best regards,
Pietro
