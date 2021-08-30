Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5578E3FBE10
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 23:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237338AbhH3VYT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 17:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhH3VYS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 17:24:18 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B654FC061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 14:23:24 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so898670pjq.1
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 14:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CLZjkzdd1qUAk5AYaYClOL1eGsmDDhV/SUTeqLBTABU=;
        b=VPGa2wH8SDlj0Bw3quxqNlpAgQLAtiu6BLHTdEHqriBf4LbweOTesfOH0GhiSgqPqx
         LWJ61yR0x8/79NNVJv9osioaPvpyNqh7iIlWzf2xUwYYR5xOReKY3la6jJ1vhifTbtXZ
         tg3I2F4GKVSfnopxjKv4tyiX+uRgab0JvpBlOkHdnkmI8CNoq2j5gjubt2CTx5MPkK6z
         evmMQvjNAFveCWhbbEgej1KJLFCxkIaUXBiQAph9tCynkW/fxbclJE2Nr/FJE3etDRDG
         XjSMQZO1Jj77CbELtRDoj8WkOsX4d6/vzIkYp+elbFR3RSp62wznMjak1QlLE1FwEPhc
         xRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CLZjkzdd1qUAk5AYaYClOL1eGsmDDhV/SUTeqLBTABU=;
        b=MbgrRX3dazUAw51IyUupSJ7k6LSRpD0fELOnrVOkoTV120+NmntK2GlmulHp7B05zk
         9fbda+pHvFl3BJxfBcP2ZggiYexjL3MdWyi4ZbGeqOXqrcsb9PT6DZ/aY9FyJKNiQ8Uf
         uR9A4wfJpCRLL6TSGoBiiqtCzdSyrrnFvjOCM5/GzpAa5gr/m7iKR4f/M5ew2OJBzKSa
         dzlTOodI8dINrN7m19ayqn6rC3k/iMgPcnUvYlP9lvddAfdvwbU29ARnYwWn9OEJDmNZ
         HrTYuv2sAKEbG+dzXNGkAWVN89zrD0B6BPoVlHYBZJUdkpyL8mQd2me0C6QO9BlRKjOA
         tCYA==
X-Gm-Message-State: AOAM5338jJWiyzL8VCMy2moLiH6KjuwUayhrpCCWYjRH3Ra+rDWt/oPE
        jV2tSpMGM9bfgKzEQ13JyII=
X-Google-Smtp-Source: ABdhPJz82QMMbgM06aPq5s6nI6XJ3Rbkmo5sb7yxKUjjvQhC92ZQh77VsoNiafHGsIEGedvq0SdyHw==
X-Received: by 2002:a17:90a:6b4d:: with SMTP id x13mr1243009pjl.88.1630358604158;
        Mon, 30 Aug 2021 14:23:24 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id fh2sm382896pjb.12.2021.08.30.14.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 14:23:23 -0700 (PDT)
Date:   Mon, 30 Aug 2021 14:23:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Alexandru Ardelean <Alexandru.ardelean@analog.com>
Subject: Re: [PATCH] Input: adp5589-keys - Use the right header
Message-ID: <YS1MSHcO99KUoTsW@google.com>
References: <20210816232707.485031-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816232707.485031-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 17, 2021 at 01:27:07AM +0200, Linus Walleij wrote:
> This keyboard driver is implementing a GPIO driver, so it need
> to include <linux/gpio/driver.h> and not the legacy <linux/gpio.h>
> header.
> 
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Alexandru Ardelean <Alexandru.ardelean@analog.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
