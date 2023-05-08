Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E500D6F9E53
	for <lists+linux-input@lfdr.de>; Mon,  8 May 2023 05:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbjEHDpS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 May 2023 23:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjEHDpQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 May 2023 23:45:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86DE59E0;
        Sun,  7 May 2023 20:45:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D5E361E4F;
        Mon,  8 May 2023 03:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A211C4339C;
        Mon,  8 May 2023 03:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683517514;
        bh=f2Av221AoBzvVpsH70Hd2B/gNLrcWY+8qXBN329HBxg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nEMBgVLhaQ/GoILqUrKV2WfNuBDu5mLPOOj9sViK68lLfyn6E0fZntmkvnEMNczw5
         EbF5rNVhHN+XhMIfqzf1UNOJAvGLFf1PZVgzcgIPbPUE+EwIJWNZrxKVVu1yFZrOhf
         s8S+L6xb14/7tsLMxJDA7y8wc3jJ9+7cIDk3pHrL6rtse3xqHds20s1LvdzMi69CX3
         sD1NUw/iq+udiMYY3F7egaakUU8HvudVxijwt2VMDUN+uQboAs0MBTyeA+XTCUEqzf
         NoXJ9Hu6Gkj4k8e+xl8irP1QcmcNT3m3V1HVwOj2I/NLdVEEvvhzuSZLo4r3peUdU6
         9jGWM/RANoSkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B4C7C395C8;
        Mon,  8 May 2023 03:45:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: google,cros-ec-keyb: Fix spelling error
From:   patchwork-bot+chrome-platform@kernel.org
Message-Id: <168351751430.5651.15940266526657898557.git-patchwork-notify@kernel.org>
Date:   Mon, 08 May 2023 03:45:14 +0000
References: <20230220135531.1987351-1-linus.walleij@linaro.org>
In-Reply-To: <20230220135531.1987351-1-linus.walleij@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        bleung@chromium.org, groeck@chromium.org,
        devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Dmitry Torokhov <dmitry.torokhov@gmail.com>:

On Mon, 20 Feb 2023 14:55:31 +0100 you wrote:
> The dependency had an obvious spelling error. Fix it.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/input/google,cros-ec-keyb.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - dt-bindings: google,cros-ec-keyb: Fix spelling error
    https://git.kernel.org/chrome-platform/c/c6f3b684c2c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


