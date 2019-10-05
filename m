Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E43E3CC9DD
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2019 14:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbfJEMRg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 08:17:36 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35161 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfJEMRg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Oct 2019 08:17:36 -0400
Received: by mail-wr1-f66.google.com with SMTP id v8so10144081wrt.2;
        Sat, 05 Oct 2019 05:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3zd+V+RmC0XBjJLG/tJ4b5ULCb6ekikQ2mIQfiu1wGU=;
        b=Im652tskmjY3fkD4uIinJtQQBkZholkNs7KR6f5n1L+HxMUWoz+cIKHufv9TL5rHb6
         /RIXSDlJzlKalhA01KzGVjjshe6ANNHDwuZE5n+4BIkBt6kUwBJrQUkhxmC+McstIp3t
         Pr/aIG+XzI4JrEa2lL6amKZ9QyG3fepoquMvu9exkbce8idORab57uzYby09ITkwODJJ
         XhU5y5v3u5KM0/x6b70RufOPKIZdLNgn28aB34ejyRMruJ5X8mulljziWMVmGlHsPwU4
         hOpk6/O2T8aza+zsbdLzCiF2/pxOnTxS98qZVGLush+grl0y7kgI+aYTE+LBgk0b6V+Q
         yYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3zd+V+RmC0XBjJLG/tJ4b5ULCb6ekikQ2mIQfiu1wGU=;
        b=CU1G5+cDKB2R3c4jZSz0Oj9iOzdeFNKuySDNl/C/1F/b6NDMR0IcuW03KSYPfAiPMo
         7LFQNQbQkNlGc0DVpW73D9udIo8JTykHYhukO9NCFZ+jJWcIQenH7dQ64oY8t4iXr5c3
         yImbR5dF0PKFa67sqECCsCOzvbqXdsCZvgwQzZwns1Krb84mxCNHI8LlceMpZhKnwwto
         QNYilxwjQ1Fn5Xfoe0mcBgrYCpXjT+nVgkdsfBcKWNNDLvnelkm1D7WG1LnmFbVenGZ0
         hz2jEQ1bEbkjxkwWSuDI1U2bF+/6AvSRT1UMG5R4AckQE1fM1N8mv9AAJ28Q62jVdtJE
         4fdQ==
X-Gm-Message-State: APjAAAWoFpsI4gnIrn9Zb6HwC6taKBZkGj1JqeDS0Tdv+dZEGSEwukdd
        3F7Jwm3ebgp+lpyRvqXTeufzM0/L
X-Google-Smtp-Source: APXvYqygauiEkGYMGkFZZsLBAhyxB8/ldgqCyXhmzwQVsOs1V6lPRi7mqDPEzKw6iFMmNsfEy5+KQg==
X-Received: by 2002:adf:ce91:: with SMTP id r17mr14538218wrn.97.1570277851559;
        Sat, 05 Oct 2019 05:17:31 -0700 (PDT)
Received: from [192.168.2.202] (p5487B13B.dip0.t-ipconnect.de. [84.135.177.59])
        by smtp.gmail.com with ESMTPSA id c21sm6253055wmb.46.2019.10.05.05.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 05:17:30 -0700 (PDT)
Subject: Re: [PATCH 5.4 regression fix] Input: soc_button_array - partial
 revert of support for newer surface devices
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191005105551.353273-1-hdegoede@redhat.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <222c364a-bc2b-5960-3fe4-7d1ce222e3e2@gmail.com>
Date:   Sat, 5 Oct 2019 14:17:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191005105551.353273-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

sorry for the inconvenience this change has caused.

On 10/5/19 12:55 PM, Hans de Goede wrote:
> Note ideally this seamingly unrelated change would have been made in a
> separate commit, with a message explaining the what and why of this
> change.

Would I have known the impact, then yes. This change was added due to
some reported instances where it seems that soc_button_array would
occasionally load on MSHW0040 before the GPIO controller was ready,
causing power and volume buttons to not work.

> I guess this change may have been added to deal with -EPROBE_DEFER errors,

Correct. After a comment mentioned that gpiod_get() returning
-EPROBE_DEFER would be the proper way to detect this, I decided on this
change.

Might I suggest the following addition:

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
  drivers/input/misc/soc_button_array.c | 25 ++++++++++++++++++++-----
  1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 97e3639e99d0..a0f0c977b790 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -92,11 +92,18 @@ soc_button_device_create(struct platform_device *pdev,
  			continue;
  
  		gpio = soc_button_lookup_gpio(&pdev->dev, info->acpi_index);
-		if (gpio < 0 && gpio != -ENOENT) {
-			error = gpio;
-			goto err_free_mem;
-		} else if (!gpio_is_valid(gpio)) {
-			/* Skip GPIO if not present */
+		if (!gpio_is_valid(gpio)) {
+			/*
+			 * Skip GPIO if not present. Note we deliberately
+			 * ignore -EPROBE_DEFER errors here. On some devices
+			 * Intel is using so called virtual GPIOs which are not
+			 * GPIOs at all but some way for AML code to check some
+			 * random status bits without need a custom opregion.
+			 * In some cases the resources table we parse points to
+			 * such a virtual GPIO, since these are not real GPIOs
+			 * we do not have a driver for these so they will never
+			 * show up, therefor we ignore -EPROBE_DEFER.
+			 */
  			continue;
  		}
  
@@ -429,6 +436,14 @@ static int soc_device_check_MSHW0040(struct device *dev)
  
  	dev_dbg(dev, "OEM Platform Revision %llu\n", oem_platform_rev);
  
+	/*
+	 * Explicitly check if GPIO controller is ready. This check is done here
+	 * to avoid issues with virtual GPIOs on other chips, as elaborated above.
+	 * We are at least expecting one GPIO pin for the power button (index 0).
+	 */
+	if (soc_button_lookup_gpio(dev, 0) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
  	return 0;
  }
  
-- 
2.23.0

