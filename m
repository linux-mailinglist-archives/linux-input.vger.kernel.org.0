Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5AC8605E9D
	for <lists+linux-input@lfdr.de>; Thu, 20 Oct 2022 13:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiJTLSC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Oct 2022 07:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiJTLSB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Oct 2022 07:18:01 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868D11ACAAD
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 04:18:00 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id y20so8692414uao.8
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SwRqOKLQj0/Xq8oBlan9WmyUy+o6GvIxuV89KZTsH50=;
        b=ED5hikbDP1RKUt7WEy5mrsr88SOWQGWj+D8HT4vJM7niAKLqfFunDUCRVuKeO0ZNQk
         REfa3oSU8/7VBxNM48i1CbAsupQPnar6wO0aPHEc65/1H1r5lOzYclwIBAf51zrSFCYL
         L2gGBZAD2DImIYqjVwOgPG00kRBWQ9A6i2UheW4tir1kpsrKWMHORhmCg//gtuy5tttG
         6iDiq1aVdmMk3egJnDRpIGkaO9103xuD3sHc2cleMXOV24lTSuHcl0W7AHY64TxWvviO
         IM36GoiI52FsGNjVV4tbV8JJh9HKeUUsUhrPTlw6delMhybwGCeeXZgzMBv5N0DOqGWi
         dD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwRqOKLQj0/Xq8oBlan9WmyUy+o6GvIxuV89KZTsH50=;
        b=qU0WwEn7g1S0tGldAV/VO53ib4hu77LrDhEfNI9oAJ9F+CqJVQ86pAg5FDPsKtPWTW
         K821saGKLzcm9qTrmP0d0BR1iVB/vxYlRfeuowYUc8hn79Ap1AtDZ2MIrMHNVN55/8H6
         7F8ZwqCQYkcbcUAx8/QYvO4JovtsWGYxoSRDrw5jIeRKjTSvcFRrVoulQiId2TXAwsrq
         dx4F98sKxysN+CLmbgYQmnkD5T+2Tj6iWwCP4DNvhOX2maAu45YwsdLxZExWArnl5Hsl
         uv1PZ3x4T38wwGhLJaSzzjMtT01aZC69ziAj9LaZc/CVQ4qOiyVVci0YnZkssuhrs+3S
         SiOg==
X-Gm-Message-State: ACrzQf3i+Ro21IgiJIAYw2ha3ksAPsSgoU9SI7KmU8qNfDcGPTlbmJ/Z
        NK9niFsjgBqttixoLGTbRszzlyvrDKuugzP4WzmBqA==
X-Google-Smtp-Source: AMsMyM5rX7qIHDZSvX38KSmq37iD0nlk3DPHuFt6jZ7wVNSqOOAwmL0t+n94gq+v/20iWZ2reKS9ClaNobU92VYg4pQ=
X-Received: by 2002:a67:ac0c:0:b0:3a9:e899:3b9b with SMTP id
 v12-20020a67ac0c000000b003a9e8993b9bmr755932vse.9.1666264678974; Thu, 20 Oct
 2022 04:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221019152947.3857217-1-arnd@kernel.org> <20221019152947.3857217-8-arnd@kernel.org>
In-Reply-To: <20221019152947.3857217-8-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Oct 2022 13:17:48 +0200
Message-ID: <CAMRc=Mc8vKhB8phH6pwLOo=zdZWMxuCsO=aY_Nj8cG92V6eGyw@mail.gmail.com>
Subject: Re: [PATCH 07/14] input: remove davinci keyboard driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Sekhar Nori <nsekhar@ti.com>, linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 19, 2022 at 5:36 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The dm365evm board was removed, and no other users of this
> device exist.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
