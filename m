Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67856547C2
	for <lists+linux-input@lfdr.de>; Thu, 22 Dec 2022 22:19:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbiLVVTO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Dec 2022 16:19:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235692AbiLVVTL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Dec 2022 16:19:11 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C46C1F2E6
        for <linux-input@vger.kernel.org>; Thu, 22 Dec 2022 13:19:10 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id k79so2059320pfd.7
        for <linux-input@vger.kernel.org>; Thu, 22 Dec 2022 13:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1XuZDapnjW9x4Ghmr7KHURBx8GumvQG8SWx8tKBnug=;
        b=kDPBXCPtqAzPt9K2Cxdc7BpsZhYbJlVuULaLsYtgogy/zPL0zbqKUzqoLew6ss4gWZ
         2f/55pQ4Z2AAkb+Q7NjIrH0Kjsu9W/DBE1ZT0PEuZsqIOF+tu1xfeFCGgme+V4v8XAKd
         mWj+bUQaGKxlnzFCd6o+L/66VjB853amOw9bj9zHynKJNznntVq4MApMQQwqQhGhDbZ1
         VkzzQ15IQG327I3FWcP27kBuYjyQ55BEl6gf07f8fxLnRx6lCl9aO2JGJbomtm8e9mqf
         XwSNcEf8OHUzGnDmds2ge2jfE5gLwmFGa3s7SUauOsT3gzwDB7o+swHik5F9Tm8gBXut
         qlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1XuZDapnjW9x4Ghmr7KHURBx8GumvQG8SWx8tKBnug=;
        b=Um44/ULZbgQ/DHfVuPrvuwgzm1svBqwx4R2Z46rutBS8yBiYFrxvNZ4+tNIV8aKAO8
         G68gMsiTf0RTrgIE+yV/2jZVXB/eqbLa3Zd9uKebqWrLUrgHoINhxFQdpOFk9EoZGs6B
         24+04nFqh7msiJU1VqBwpHE3N38FvqZwWTA14LFXI4/Xo7bTNbQwygdawdxtQtNsFpVL
         gKrcd+KKdchgzLhDCUiRkjysWYXgWyiBEen1ugwE+X/5IHJkic9WIWZrx7mlMK06dj6N
         7I7+fWMZ+kFA1UAMPGDYgCwgCpHZOmAFNFdN9QepU9CoSkP61b2ul6hZg8RHOr6XhT8o
         UbJA==
X-Gm-Message-State: AFqh2kqW+sm3BxdSqcZLihweyvu+RvLqwO7aLDlWXfS8MLDRWzHFcUlh
        ypXDPt1sXTwATLLMkrHjYdIECJ4JqursWTkkKTtORA==
X-Google-Smtp-Source: AMrXdXtTlZFbTsfe2pzy5yWcHLwYYlm3Z+chhRbUSUK6FyW470BH2knm3VuEKbn8szORGY8WSwjcfke9zV3jvLgb7MI=
X-Received: by 2002:a63:131d:0:b0:492:703:3f03 with SMTP id
 i29-20020a63131d000000b0049207033f03mr551755pgl.403.1671743949272; Thu, 22
 Dec 2022 13:19:09 -0800 (PST)
MIME-Version: 1.0
References: <202212230026.gBHQvZbI-lkp@intel.com> <69d201656df475ed869acfb833712c1ba081cfc6.camel@gmx.net>
In-Reply-To: <69d201656df475ed869acfb833712c1ba081cfc6.camel@gmx.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 22 Dec 2022 13:18:58 -0800
Message-ID: <CAKwvOdmzEn27Un5ayucWcT6W0JddS6Tgg-Z3D4d_3sBqjSs=DA@mail.gmail.com>
Subject: Re: [hid:for-6.3/hid-sensor 2/4] drivers/hid/hid-sensor-custom.c:960:12:
 warning: stack frame size (1104) exceeds limit (1024) in 'hid_sensor_custom_probe'
To:     Philipp Jungkamp <p.jungkamp@gmx.net>
Cc:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 22, 2022 at 1:16 PM Philipp Jungkamp <p.jungkamp@gmx.net> wrote:
>
> Hello,
>
> does this mean the problem lies in 'hid_sensor_custom_probe' itself or
> could this also be caused by local variables in nested functions.
>
> I suspect the problem lies in 'hid_sensor_custom_get_known' where I put
> an instance of 'struct hid_sensor_custom_properties' on the stack.
>
> This struct is way too large (I didn't know there was a upper stack
> limit of 1024). It's current size is sizeof(u16) * 3 *
> HID_CUSTOM_MAX_FEATURE_BYTES = 384.
>
> Would allocating it for the scope of 'hid_sensor_custom_get_known' make
> sense?

Yes.

>
> Which kind of kernel allocation functions should I use here?

kmalloc, kcalloc? GFP_KERNEL

>
> Regards,
> Philipp Jungkamp
>
> On Fri, 2022-12-23 at 01:07 +0800, kernel test robot wrote:
> > tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-
> > 6.3/hid-sensor
> > head:   c8aca355bdd56e5dad55897cc419ea5d3e4c0e58
> > commit: 48c79bb0abc0429751c0de6616224f8e4aa891cf [2/4] HID: hid-
> > sensor-custom: Add LISS custom sensors
> > config: i386-allyesconfig
> > compiler: clang version 14.0.6
> > (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e3
> > 7457cb1d1)
> > reproduce (this is a W=1 build):
> >         wget
> > https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> >  -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         #
> > https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?id=48c79bb0abc0429751c0de6616224f8e4aa891cf
> >         git remote add hid
> > https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> >         git fetch --no-tags hid for-6.3/hid-sensor
> >         git checkout 48c79bb0abc0429751c0de6616224f8e4aa891cf
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> > W=1 O=build_dir ARCH=i386 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross
> > W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hid/
> > drivers/net/wireless/mediatek/mt76/mt7915/ drivers/video/backlight/
> >
> > If you fix the issue, kindly add following tag where applicable
> > > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > > > drivers/hid/hid-sensor-custom.c:960:12: warning: stack frame size
> > > > (1104) exceeds limit (1024) in 'hid_sensor_custom_probe' [-
> > > > Wframe-larger-than]
> >    static int hid_sensor_custom_probe(struct platform_device *pdev)
> >               ^
> >    1 warning generated.
> >
> >
> > vim +/hid_sensor_custom_probe +960 drivers/hid/hid-sensor-custom.c
> >
> > 239319670e2a7c Ye Xiang            2020-12-15   959
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  @960  static int
> > hid_sensor_custom_probe(struct platform_device *pdev)
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   961  {
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   962     struct
> > hid_sensor_custom *sensor_inst;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   963     struct
> > hid_sensor_hub_device *hsdev = pdev->dev.platform_data;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   964     int ret;
> > 98c062e8245199 Philipp Jungkamp    2022-11-25   965     const struct
> > hid_sensor_custom_match *match;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   966
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   967     sensor_inst =
> > devm_kzalloc(&pdev->dev, sizeof(*sensor_inst),
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 968                                GFP_KERNEL);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   969     if
> > (!sensor_inst)
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 970             return -ENOMEM;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   971
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   972     sensor_inst-
> > >callbacks.capture_sample = hid_sensor_capture_sample;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   973     sensor_inst-
> > >callbacks.send_event = hid_sensor_send_event;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   974     sensor_inst-
> > >callbacks.pdev = pdev;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   975     sensor_inst-
> > >hsdev = hsdev;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   976     sensor_inst-
> > >pdev = pdev;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 977     mutex_init(&sensor_inst->mutex);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 978     platform_set_drvdata(pdev, sensor_inst);
> > 239319670e2a7c Ye Xiang            2020-12-15   979
> > 98c062e8245199 Philipp Jungkamp    2022-11-25   980     ret =
> > hid_sensor_custom_get_known(hsdev, &match);
> > 98c062e8245199 Philipp Jungkamp    2022-11-25   981     if (!ret) {
> > 239319670e2a7c Ye Xiang            2020-12-15
> > 982             sensor_inst->custom_pdev =
> > 98c062e8245199 Philipp Jungkamp    2022-11-25
> > 983                     hid_sensor_register_platform_device(pdev,
> > hsdev, match);
> > 239319670e2a7c Ye Xiang            2020-12-15   984
> > 239319670e2a7c Ye Xiang            2020-12-15   985             ret =
> > PTR_ERR_OR_ZERO(sensor_inst->custom_pdev);
> > 239319670e2a7c Ye Xiang            2020-12-15   986             if
> > (ret) {
> > 239319670e2a7c Ye Xiang            2020-12-15
> > 987                     dev_err(&pdev->dev,
> > 239319670e2a7c Ye Xiang            2020-12-15
> > 988                             "register_platform_device failed\n");
> > 239319670e2a7c Ye Xiang            2020-12-15
> > 989                     return ret;
> > 239319670e2a7c Ye Xiang            2020-12-15   990             }
> > 239319670e2a7c Ye Xiang            2020-12-15   991
> > 239319670e2a7c Ye Xiang            2020-12-15
> > 992             return 0;
> > 239319670e2a7c Ye Xiang            2020-12-15   993     }
> > 239319670e2a7c Ye Xiang            2020-12-15   994
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   995     ret =
> > sensor_hub_register_callback(hsdev, hsdev->usage,
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 996                                        &sensor_inst->callbacks);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10   997     if (ret < 0)
> > {
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 998             dev_err(&pdev->dev, "callback reg failed\n");
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 999             return ret;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1000     }
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1001
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1002     ret =
> > sysfs_create_group(&sensor_inst->pdev->dev.kobj,
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 1003                              &enable_sensor_attr_group);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1004     if (ret)
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1005             goto
> > err_remove_callback;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1006
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1007     ret =
> > hid_sensor_custom_add_attributes(sensor_inst);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1008     if (ret)
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1009             goto
> > err_remove_group;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1010
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1011     ret =
> > hid_sensor_custom_dev_if_add(sensor_inst);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1012     if (ret)
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1013             goto
> > err_remove_attributes;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1014
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1015     return 0;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1016
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1017
> > err_remove_attributes:
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 1018     hid_sensor_custom_remove_attributes(sensor_inst);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1019
> > err_remove_group:
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 1020     sysfs_remove_group(&sensor_inst->pdev->dev.kobj,
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 1021                        &enable_sensor_attr_group);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1022
> > err_remove_callback:
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10
> > 1023     sensor_hub_remove_callback(hsdev, hsdev->usage);
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1024
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1025     return ret;
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1026  }
> > 4a7de0519df5e8 Srinivas Pandruvada 2015-04-10  1027
> >
> > :::::: The code at line 960 was first introduced by commit
> > :::::: 4a7de0519df5e8fb89cef6ee062330ffe4b50a4d HID: sensor: Custom
> > and Generic sensor support
> >
> > :::::: TO: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > :::::: CC: Jiri Kosina <jkosina@suse.cz>
> >
>


-- 
Thanks,
~Nick Desaulniers
