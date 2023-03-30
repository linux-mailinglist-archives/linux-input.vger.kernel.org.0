Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4F866D0A93
	for <lists+linux-input@lfdr.de>; Thu, 30 Mar 2023 18:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbjC3QBB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Mar 2023 12:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjC3QBA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Mar 2023 12:01:00 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA122D307
        for <linux-input@vger.kernel.org>; Thu, 30 Mar 2023 09:00:51 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso20132405pjb.2
        for <linux-input@vger.kernel.org>; Thu, 30 Mar 2023 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680192051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndN3+GWy8wiNegcKyQXjM8GtRL7wqyotsSg3louAi+Y=;
        b=B+4E6zCM3cVbvx/Ya9MhixdwjJ2M5pFXN+uWzVzW8ahSxKL6Nlk4YMR8gQb2LQb4na
         ONESj/nRf3zYZhdUgHt71q3LSmG5FnInlOTKB43AqnRaiVDgzH6IOfdbgJLDvA1SxSjO
         ZcMY9FXTG/5whKP9/GGRf3w3eckoelDPbXIp0rHtVVh1O0SQu+qxMYaZRy+NOZ8AwtcO
         h6zq9qSO+NcVl2fxgvOcW4P3S3bMVK7vacW20vV6sqp/ijKbzXcPnSqSU8E70nCaZk/n
         WF6bkWSjsgRdtwZNLLTfzWzu1cfHV/RmBaeXFmYs6iKZ3Y6IVOx5PlcgUfSNN2ygnDE9
         LouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680192051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndN3+GWy8wiNegcKyQXjM8GtRL7wqyotsSg3louAi+Y=;
        b=X84kMUtWfQNchXg7T4i8orawKTKChtGtu6CfS+Htk9GKUmqq5BLGf4PyDnE+v6Bxkb
         5QwSRdXodCuuLX8cktGMkgnh/MbctG1StpGoI4p/1u5MVmLMKfhy0rHwylcIMqOf4In8
         8/ijKxrng0Ie6UWPquollRXeasZNNze3RpLRyZoW9871be+eyU12RqQbL/xJdzV1HZNf
         L45KDEBYFtQADSKHMPEjMVW9GU80WrXA3Biaqhrl4DEy4MKCqeYBJTxUYSJ4rDzB/Wpv
         Lm0FEJ33nR1C+KnOQcAokEoO92PodX0NUEPn/Nc16qdRvJjwcJSgQHeuiVMei4Q4aiAA
         Vg8g==
X-Gm-Message-State: AAQBX9eaas7bPc1DWqvwqEGVktTwLzNu0uBz4EcSbY44Qvx/FvfH/v/Y
        Dc+MHHzxf8oqN30JC9A/Q+0p+g+Q5BCU1F8I9iyvfQ==
X-Google-Smtp-Source: AKy350ZRFCaxo1XdHRaStzy2w+WauhrDw1erUDUR6mVqVnGireSA8/POZOMnlvpUoGDqOHndQJiPJs+v19qW2Gwzq3A=
X-Received: by 2002:a17:902:74c9:b0:1a0:48ff:539c with SMTP id
 f9-20020a17090274c900b001a048ff539cmr7929154plt.11.1680192050876; Thu, 30 Mar
 2023 09:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230330081831.2291351-1-javierm@redhat.com> <202303301815.kRKFM3NH-lkp@intel.com>
 <87a5zufq7n.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87a5zufq7n.fsf@minerva.mail-host-address-is-not-set>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Thu, 30 Mar 2023 09:00:39 -0700
Message-ID: <CAGS_qxot1_+J3YCykkk0H1fZM6Cn6Pv4SFT6iCf9J7td1aH9HQ@mail.gmail.com>
Subject: Re: [PATCH v2] Input: Add KUnit tests for some of the input core
 helper functions
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
        oe-kbuild-all@lists.linux.dev,
        Enric Balletbo i Serra <eballetbo@redhat.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        linux-kselftest@vger.kernel.org,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        David Gow <davidgow@google.com>, kunit-dev@googlegroups.com,
        Maxime Ripard <maxime@cerno.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 30, 2023 at 4:12=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> kernel test robot <lkp@intel.com> writes:
>
> Hello,
>
> [...]
>
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/clk/.kunitconfig: warning: ignored by one of the .gitignore =
files
> >    drivers/gpu/drm/tests/.kunitconfig: warning: ignored by one of the .=
gitignore files
> >    drivers/gpu/drm/vc4/tests/.kunitconfig: warning: ignored by one of t=
he .gitignore files
> >    drivers/hid/.kunitconfig: warning: ignored by one of the .gitignore =
files
> >>> drivers/input/tests/.kunitconfig: warning: ignored by one of the .git=
ignore files
>
> KUnit folks, what should we do about this? I believe the correct thing
> here would be for these dot-files to not be ignored by git.
>
> Not only to prevent these reports, but also to avoid the need to add
> them using `git add -f`, since is quite error prone and easy to miss.
>
> I was thinking about posting the following patch:
>
> From f1dc1733001682886458c23b676123635bc29da0 Mon Sep 17 00:00:00 2001
> From: Javier Martinez Canillas <javierm@redhat.com>
> Date: Thu, 30 Mar 2023 13:04:42 +0200
> Subject: [PATCH] .gitignore: Exclude KUnit config dot-files

Ah, I forgot/didn't realize lkp bot was complaining about .kunitconfig's.
Agreed, we should go with something like that.

As I noted in my reply on the patch, there was a previous patch to do
just the same thing here,
https://lore.kernel.org/linux-kselftest/20230127145708.12915-1-andriy.shevc=
henko@linux.intel.com/

I'm not sure who is intended to pick up the patch, but maybe bringing
up the fact this causes spurious warnings will help argue for the
change.

Thanks,
Daniel
