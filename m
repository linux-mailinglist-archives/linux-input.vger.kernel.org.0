Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01A58906C5
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 19:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfHPRY0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 13:24:26 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39381 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727500AbfHPRYZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 13:24:25 -0400
Received: by mail-pf1-f193.google.com with SMTP id f17so3439498pfn.6;
        Fri, 16 Aug 2019 10:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ngcVh8zrx60LXZVea+w+3KhZZLQW588vJoNhzWNNbZw=;
        b=S+ej47PlpzF4EQnmwkvkdAXiKugoKO2KNHDdctm3C3gk52iC1zdCU1nNSZcS8bPajh
         SsTR6g6S/a1zPxSArdj5fhnsgMEPeFABm4IDIYzbQ/6n2waKBhWnoboDVJJjajxXHxEU
         EFuN9lqZDDLrq4I0yom7RKSJLuf2M97TC8nKtTbLpjJl9VOhSA/TXsVO3FKS1JAMrhA/
         +KfWUjyDXriIJHanMlMR118SSzT+hx7YfP66nqB2ekW0G11TvbccViYi2JPyw9dv2u5j
         5oqe0ft6f8T7S0l8dc5WiiroGzxiUG1dyuEa91iaeHMtMHsFk5VVmPpDR6NCdQ/roCHk
         CgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ngcVh8zrx60LXZVea+w+3KhZZLQW588vJoNhzWNNbZw=;
        b=PfU9Lyby4KKsGBIyxd/w/1/Kv7s0rdGHQvlam5ddkCoCceAKqBBlYhv6hiPu999W3k
         0t+klNxHS80Cfjtkbt6XnxFi1NP+AM5HsRVVTZFG0zwgI5E7TATTNKCwL31BVJN2aaP+
         XSmcrASq+YEVZZmvC7WdAxGZZRu2LHpYvECTNCYUhTrVCtfecvr7cWdxHX6yGJt1KfiL
         kZpt4XvA6uD93iLJ7LZX0vFmEgVUFm+IlQRvIy9KpoVjthvSilSvdC7UzwYH3D14OFwg
         hC0vVQP3G45Z8SKKm2yp92A1BsEOeq29tUxDp9NonfZduQsjlpNQ+5qXolgGT5skrwQP
         rYDQ==
X-Gm-Message-State: APjAAAVfZzL4IRQ7t8p5YOYSr+3Cq0FMW3cZgsm1craV5m6H7GZ0uXjm
        DlKfs4sc8ECA3hxCx7C/AV8=
X-Google-Smtp-Source: APXvYqxmYjtZ8qZoW3pqorhENAO8Qi81BWqAQcRZvy1daRWpzTEbmLh/QknsvGfUTXJ7YBi56sIwyw==
X-Received: by 2002:a17:90a:bc4b:: with SMTP id t11mr8448790pjv.87.1565976264912;
        Fri, 16 Aug 2019 10:24:24 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o11sm7454547pfh.114.2019.08.16.10.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 10:24:24 -0700 (PDT)
Date:   Fri, 16 Aug 2019 10:24:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, george_davis@mentor.com
Subject: Re: [PATCH v1 36/63] Input: atmel_mxt_ts - configure and use gpios
 as real gpios
Message-ID: <20190816172422.GH121898@dtor-ws>
References: <20190816083525.19071-1-jiada_wang@mentor.com>
 <20190816083525.19071-2-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816083525.19071-2-jiada_wang@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 16, 2019 at 05:34:58PM +0900, Jiada Wang wrote:
> From: Kautuk Consul <kautuk_consul@mentor.com>
> 
> The upstream Atmel mXT driver implementation seems to handle the
> T19 GPIO/PWM object as a key pad. Keys can be defined in the
> device tree ("linux,gpio-keymap") and will be transported as key
> events to the Linux input device if GPIO state changes.
> 
> With our hardware, the GPIO pins of the touch controller are
> connected to a PWM/backlight controller and used as supervision
> inputs. We like to read the status of the pins by a script or an
> application in the sysfs.
> 
> Adding newer sysfs entries which shall be placed in the input
> class directory eg:
> /sys/class/input/input<n>/backlight_error1

No, if you want to export GPIO lines for external use create a gpiochip
instance and register it with GPIO subsystem. No ad-hoc sysfs please.

Thanks.

-- 
Dmitry
