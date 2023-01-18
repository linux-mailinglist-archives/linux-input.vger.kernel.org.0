Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDBC672077
	for <lists+linux-input@lfdr.de>; Wed, 18 Jan 2023 16:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjARPEF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Jan 2023 10:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbjARPDZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Jan 2023 10:03:25 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA85AB0
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 07:01:39 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4f7b55575f7so8498647b3.11
        for <linux-input@vger.kernel.org>; Wed, 18 Jan 2023 07:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m5GuKVC4pQj49C/fjSRZidC/mq+hHR2WXiau98BExSI=;
        b=YFxTn+0aMlGuM8qOPt+295N9LyLmFMU/l2XSqZZs4n53A1tfmeYsfxCELocIGNNd63
         TDAjTW9AaI8IPzLlpvTDQk5B6GisT42aDSg/l9Zlf1ValNq+CvqbkjO00BytXfkb4ah6
         0fSYxW32u2aoqF12F0SMYV2YhFPmwa0l5Ve+YGTxHIAl57IGyRq993fRLmEyF2uzZE9E
         LNIMTE9hnGdySe5UDVg9fkFR96tl96GV9PY91TDKYeGgiXHXADuY/pPvc/OShk6cMUFX
         Dn/hP42c6mWZ9SN/LgK75tYIgm+ZhHmANpbNLzLIt91R16JkCFxu5xH4eSl5aYPkvfiW
         kBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5GuKVC4pQj49C/fjSRZidC/mq+hHR2WXiau98BExSI=;
        b=wFJCA3plzrM2+pChsYJAT8D1mj2FC7/rmZKID80PA3M8YpLBq8uwvxB3XMG0RxkqKx
         IbF10HyyvztgWyHV+4yMAjiyih3lFiIKqmSZimte6iPEcE/YnMCygvJ98nrJ/AY/RdCM
         khcOkUGnUJDog/WaxKZO0Q3gkWAazRP30i1oxeTBlMUPl9kXB4qeWgBwq9Qs/l6Jomd4
         aosGvH8SU4cF+Kv3uo9N4LoISFrq6m32hIMCIa2c6AZn1cJ+eNRmATr+GWkwJZmv9Bec
         TgwIyunxOiMLQOW/rfyNgh6C265bycFgViwGDaP0Q4rZ0bSqtjbo1/EqhGp/neAjgUMu
         ihvg==
X-Gm-Message-State: AFqh2krhIfeJlOkxKz6wVqzKG/+ZUf4yjkikZ74dvHRHV4yAXwjI2Gtd
        M47+Z695DyDtGzwEFCCoD+S/ofP4ZRiRb0/OZ9nHUbreCO7qP79e
X-Google-Smtp-Source: AMrXdXsqKwUbP8nL/iwFdRJ+SsmKRYq2SOn3EZXbhFPP25F7tic0BmRJR86ghf7B6XvuS2SuKFsE6Y5FczSzBU0PhII=
X-Received: by 2002:a0d:c384:0:b0:483:3c9b:37d6 with SMTP id
 f126-20020a0dc384000000b004833c9b37d6mr779217ywd.382.1674054098693; Wed, 18
 Jan 2023 07:01:38 -0800 (PST)
MIME-Version: 1.0
From:   Jonathan Denose <jdenose@google.com>
Date:   Wed, 18 Jan 2023 09:01:27 -0600
Message-ID: <CAMCVhVPHf9j0rYzRCdN+QQTMnE+BO1B08wDyrC2Pg0b_PkU7YA@mail.gmail.com>
Subject: Alps touchpad intermittently recognized as generic mouse
To:     linux-input@vger.kernel.org
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

Hello,

I have a Dell Vostro 3550 which fails to initialize the AlpsPS/2
driver for its touchpad and then falls back to the generic PS/2 driver
which doesn't allow for two finger vertical scrolling. I have looked
through the driver code and found the failure to happen for address
0x0006 on this line in some cases and this other line in other cases.
Sometimes the initialize doesn't fail at all and the AlpsPS/2 driver
is used and the touchpad works correctly with vertical scroll.

I have found that this touchpad and driver work fine on the same
device running Ubuntu. I am currently using kernel 5.10 running
ChromeOS.

Some more info for the touchpad:
E6 report: 00 00 64
E7 report: 73 02 64
EC report: 88 07 9d

Any help in resolving this issue would be greatly appreciated!

Thank you,
Jonathan
