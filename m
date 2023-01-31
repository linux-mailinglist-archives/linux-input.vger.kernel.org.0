Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0D9682F88
	for <lists+linux-input@lfdr.de>; Tue, 31 Jan 2023 15:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbjAaOoG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Jan 2023 09:44:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbjAaOoF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Jan 2023 09:44:05 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5695A18171
        for <linux-input@vger.kernel.org>; Tue, 31 Jan 2023 06:44:04 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id b5so8034134plz.5
        for <linux-input@vger.kernel.org>; Tue, 31 Jan 2023 06:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hpvzkk4KiAncwiWVfbjry37FVWQG/VY55zGloY5qlYc=;
        b=k44mBuxhrbOWvUKRU60kcSQDG+yzJFJZvjRbuTECNupanwlHqjg4kmCnRip9L0Hd9G
         euguGd1P2YtLV3i6ZJw9+pC6xdr2PnW/qJ05lxEaKPrqJV3sJbRqFAKb79+y7bTUX/xh
         KhMMNyRnfZNkv677L65PG4030wyKO9hdkZDOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpvzkk4KiAncwiWVfbjry37FVWQG/VY55zGloY5qlYc=;
        b=CG3PHgcx7gSzDVV5IqOH8M7Vbr/eEMHq+77k/Iiu4WeptOHi1miY0mc3fUAbDpDcNr
         UNeIJpBMube80D+++UTQwR3+gjycZD33Do1gH2S3mWlNEwoLSuA5j8MpHDkoBhRqxhc1
         mEarj1rb3XYEIhsjbmK+ipucCiYtW+XOddL/lNTpK38nxlYkEwC77ItEX85RJ7m7bTYr
         B3UzSTa2emCZ1vh8j/23/7sfhD1hcF++b7QiaaT9WKEDUi/XkSAl3ezgbiMh2otsubK0
         EBBo1A8dFAnDoX0lWmwJo00IE9YZhCk005wmQ4/P7ajcJdjT25csTCO91bzVhjHnAkjI
         mDKA==
X-Gm-Message-State: AFqh2kpSIK5ucu5XDnQLDMCHDlhC7o/nCDHFn0WDMbhtFG1n7DiQplX+
        2/tgZeHV1XMBUztD6cur3ELGVRUv0NebmW3FbHso0RSDMVHREw==
X-Google-Smtp-Source: AMrXdXu2koNIdQLcIVOpyAShjiIbJQ2nj2DAQAqUeajLFYgXdYc3NF39BwfEtlvtkWqcheZF4mJAtHhpoeKZY0k443U=
X-Received: by 2002:a17:90a:2882:b0:22b:b832:4125 with SMTP id
 f2-20020a17090a288200b0022bb8324125mr6477120pjd.146.1675176243849; Tue, 31
 Jan 2023 06:44:03 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMycsUQ3aWbAHa6fnSwmQpTt9PhagY14_k2sKGC+vGiqGg@mail.gmail.com>
In-Reply-To: <CAKXUXMycsUQ3aWbAHa6fnSwmQpTt9PhagY14_k2sKGC+vGiqGg@mail.gmail.com>
From:   Allen Ballway <ballway@chromium.org>
Date:   Tue, 31 Jan 2023 09:43:52 -0500
Message-ID: <CAEs41JBMqSCk4U4aQc08DRL5hHDteRmdt1-TGQg0-niko5MF_w@mail.gmail.com>
Subject: Re: Dependency on non-existing config I2C_DMI_CORE in commit
 a2f416bf062a ("HID: multitouch: Add quirks for flipped axes")
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     linux-input@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lukas,

Thanks for catching this, that's definitely a mistake in my code.
That was supposed to be CONFIG_I2C_HID_CORE.

Should I send a follow-up patch for this, or another revision for the patch?
It looks like it hasn't been pulled into the mainline branch yet and I'm not
familiar with updating it while in a maintainer branch.

Thanks,
Allen

On Mon, Jan 30, 2023 at 3:44 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Dear Allen,
>
> with commit a2f416bf062a ("HID: multitouch: Add quirks for flipped
> axes"), you add code that is dependent on the CONFIG_I2C_DMI_CORE.
> However, this config symbol has not been defined anywhere in the
> kernel repository. Is this a mistake in your code and you intended to
> refer to another config symbol? Is there another patch to come that
> adds this config symbol? Or is this a config symbol that only exists
> in some out-of-tree repository?
>
> Something might be odd here, because this code is effectively dead now
> with being dependent on a non-existing config symbol.
>
> Best regards,
>
> Lukas
