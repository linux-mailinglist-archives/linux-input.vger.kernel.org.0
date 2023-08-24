Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C98578751F
	for <lists+linux-input@lfdr.de>; Thu, 24 Aug 2023 18:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235609AbjHXQUV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Aug 2023 12:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242498AbjHXQUE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Aug 2023 12:20:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB9819B3
        for <linux-input@vger.kernel.org>; Thu, 24 Aug 2023 09:20:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EAC3367343
        for <linux-input@vger.kernel.org>; Thu, 24 Aug 2023 16:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37EAEC433C8;
        Thu, 24 Aug 2023 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692894001;
        bh=QpoF1cEEEy8LqOyJhHQ1c6WOYOkHPmU9dyus6KFJp1s=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Ys/Q+oYsv2iXIHcPPY8/Z4NvIqcc0zRO+FHaACYi5zqvBfmQOxL4A89orDbiI2ZPd
         JZqC6VwFhvNfLbuQ3V+EeEnoJWn+NuvaVmZ1/woBw8EDA70LONlmTLZqaLlPBg3FEu
         kbnotAjzT9jSUSe2ARDTqLn+1jHa0FZALFcl/MJ65TCA787atYrbgsL4tK5bXMgTbG
         m9VFj8N96U+eW5G4IqFRMtZwSTLaib3oX1ymukI8glYweFOqWIQTZat3DFJBcLvdZu
         kPQigQwWTizuvbnlwFHeV8O6cCbflCI5r+FYidyG652lu6CYERb2iOVKpaPGrezuYk
         178YSuoYGJgzQ==
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     linux-input@vger.kernel.org,
        Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>
In-Reply-To: <20230824061308.222021-1-sergeantsagara@protonmail.com>
References: <20230824061308.222021-1-sergeantsagara@protonmail.com>
Subject: Re: [PATCH HID 0/3] Fix devm references used in HID drivers when
 allocating input_dev name
Message-Id: <169289399997.4109803.6264352745045825214.b4-ty@kernel.org>
Date:   Thu, 24 Aug 2023 18:19:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 24 Aug 2023 06:13:52 +0000, Rahul Rameshbabu wrote:
> Maxime Ripard analyzed the following situation involving a use-after-free caused
> by incorrect devres management.
> 
>   1. input_dev name allocated as a resource referring to the same input_dev
>      instance
>   2. The input_dev is eventually unregistered
>   3. Unregistering the device first involves releasing devres managed resources
>      tied to the input_dev
>   4. A uevent is then fired for the input_dev, referencing various members of
>      the input_dev including the name
>   5. This leads to a use-after-free in the context of the triggered uevent
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.6/devm-fixes), thanks!

[1/3] HID: uclogic: Correct devm device reference for hidinput input_dev name
      https://git.kernel.org/hid/hid/c/dd613a4e45f8
[2/3] HID: multitouch: Correct devm device reference for hidinput input_dev name
      https://git.kernel.org/hid/hid/c/479439463529
[3/3] HID: nvidia-shield: Reference hid_device devm allocation of input_dev name
      https://git.kernel.org/hid/hid/c/197d3143520f

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>

