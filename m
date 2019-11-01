Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB02DEC9E1
	for <lists+linux-input@lfdr.de>; Fri,  1 Nov 2019 21:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfKAUsH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 Nov 2019 16:48:07 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36754 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfKAUsH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 1 Nov 2019 16:48:07 -0400
Received: by mail-qt1-f194.google.com with SMTP id y10so7903772qto.3;
        Fri, 01 Nov 2019 13:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WbkXhr26XYd0AF1obLB0bhvMsDV/wAE5Um2xcjbSmZc=;
        b=dMMrN5NwUAfFqcKZvrysRquTSCfuaSsDXyTxAWMZOy1ARvC44afagLZJAKMyUj9dnE
         tK932SpxQ50JIlOTYp1kyVc3OEUnsJwnmesCypbWKzRx5WxJfN1ME0quDebrSSCqBxhu
         wYtTDkTdbCpDIdRBj5jFpN+rC76uLDklNPICXZ6301MTj+k+4VJYW0IhFDfHqZR15Gep
         q1SzSrwkZ/4b7HqwnfKXzfQWTADGlsBgt9nCsHHwCuiiMhQLBoVrfVKzzY1O3sSA4qyg
         cl6teHpl2ZqolYhDt6myjMFHk/bAtERcPeh7738ZLUQlFkrihXpuTCR3hvXdL4vnZ1Zj
         LDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WbkXhr26XYd0AF1obLB0bhvMsDV/wAE5Um2xcjbSmZc=;
        b=KX6yGZ3M+iT9jH8glzxeFSD9xMbQ+fno1CWMAFUpGe/rETlXoXffzATJ5TF3jpQ1/J
         HimIhtx+KfJM3mDKVVtkupXGD888uCzEbze19M6JSAyCj4k3IXBM0LNny9FpJO0v16PO
         g5Rc/yHmShlhRD+LoegGqxNhvgt7L7lzgIoLs0jDguXVkxSJhMbuXZuDOfKCtyVkBCke
         3NYlHNo5lzcOu3Af0O+glwMffsxD5AG8IDbqdaIeRicTK3beSbSUns4HP7eRU5BjDL36
         5lckgPY4lhfuqizA1g8xffxPpag7/a4r83kdrVGhLnn5obzO4dFNamaPD9HUbfC23Z96
         Tk6Q==
X-Gm-Message-State: APjAAAVGd7QWB52Zw1i8UOZXp0X6LPuRfdlQhPkx+/bJ64wv0fS87pwR
        81jpCxiY6PqGLVKCuTSO9jo=
X-Google-Smtp-Source: APXvYqyBDrpn/qo4CHUifK6KNQhm/sqT8FvN6KY9uvEIL5he7EJl0ACsDZ6k6LH32r1dU0cnXyBGAA==
X-Received: by 2002:ad4:4489:: with SMTP id m9mr12256740qvt.126.1572641286301;
        Fri, 01 Nov 2019 13:48:06 -0700 (PDT)
Received: from svens-asus.arcx.com ([184.94.50.30])
        by smtp.gmail.com with ESMTPSA id e3sm3818162qkg.136.2019.11.01.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 13:48:05 -0700 (PDT)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Adam Ford <aford173@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Date:   Fri,  1 Nov 2019 16:48:01 -0400
Message-Id: <20191101204801.16328-1-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190302141704.32547-1-marex@denx.de>
References: <20190302141704.32547-1-marex@denx.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dmitry / Marek,

There have been two attempts to add ILI2117 touch controller support.
I was about to add a third, but luckily I checked the mailing list
before writing any code :)

Adding this support would clearly be beneficial for the common good.
What can we do to get this in motion again?

Last time I checked, Marek posted a patch which added the 2117, but Dmitry
objected, because the code became too unwieldy. Dmitry then posted a cleanup
patch, which did not work for Marek. So everything came to a halt.
See:
https://patchwork.kernel.org/patch/10836651/
https://www.spinics.net/lists/linux-input/msg62670.html

Dmitry, would you perhaps be willing to accept Marek's patch, and perform the
cleanup later?

Marek, would you perhaps be willing to invest some time to debug Dmitry's
cleanup patch?

On my end, I've reviewed Dmitry's patch and it looks mostly ok. I saw one
difference with ILI210X which could explain Marek's results, but I can't be
sure - because I could not locate the 210X's register layout on the web.

In Dmitry's patch, we see:

	touch = ili210x_report_events(priv, touchdata);
	if (touch || chip->continue_polling(touchdata))
		schedule_delayed_work(&priv->dwork,
				      msecs_to_jiffies(priv->poll_period));

but this is not exactly equivalent to the original. Because in the original,
the 210X's decision to kick off delayed work is completely independent of
the value of touch.

Suggested replacement:

	touch = ili210x_report_events(priv, touchdata);
	if (chip->continue_polling)
		touch = chip->continue_polling(touchdata);

Sven
