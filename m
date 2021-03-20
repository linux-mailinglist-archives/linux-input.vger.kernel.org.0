Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402F1342A32
	for <lists+linux-input@lfdr.de>; Sat, 20 Mar 2021 04:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhCTDhm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Mar 2021 23:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhCTDhM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Mar 2021 23:37:12 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE81C061761;
        Fri, 19 Mar 2021 20:37:01 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x126so7200948pfc.13;
        Fri, 19 Mar 2021 20:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F2NpDde5JfVs/08cIpDIKMl9ReyCVFlJWiAxllrxO/o=;
        b=ojNJR9L79KsnenlcL8sVyKfkANP5c0OQisLGgvYN1Sp7ppi2457mZJCSbRfeF4bhiu
         w8JJM/ORy+N32von6u5molA0CXO0DI/A+d8tco23CgjSR+l9LmpbQMYjmgWFbjgFATTZ
         uNO5zDqIFj9+j8MhLpTBzgQDOCKo+39o4Zv9SYJTnZH03fKyCif785iCAafuYYJfvaMF
         UZnDvG24DGUe21XXIKBQLf/l6mQaBLNEhMeYP9oDjGqYTgCmOkViBCPVWa58fqLaNTEe
         Zp8aD27T0jtgPFlIWh/17ROyhOsOHbOxhGUmIvQsDB0TwoaXD3CZKksjOtzi2tpn5uYL
         wtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F2NpDde5JfVs/08cIpDIKMl9ReyCVFlJWiAxllrxO/o=;
        b=Boavqk/ONtTqDmZJzj4J/ZiQUichUtEBhtBGTvBcF/I9YpwtR6WpUNQz3ZU7Cd16tD
         3//o2iW99reTrnGQ4EmD5ZJLsqi+9DNze5u7x1+XXXKOxHU+NBz7jzExO87Tjvw9LFnj
         Qvwh4Q6OTO3j+/1RHDS6MnLxGlPeDvbRfcZfKGkfCrrLIso0qQGfbLW5Pp/LUh6F9WDT
         0PMnXmnFQzAsj7oatQic6knZKHcIoVXwZ8DcfuDZ8NtibelQiP74mvKIcD37mIpLBV/u
         mK1MVSjMo9Uto7bymAneU/PZlwiE09BG337F7vSLxqNy0ZmyPVqHPDjpJGsj9xrigHx9
         lsQQ==
X-Gm-Message-State: AOAM53336/zDn5ba12WOWH/QjDfp54YwcKfoUyUecQxRotWc0k9lM6nG
        oLqa0vRonxkauLcIN0XQlKQ=
X-Google-Smtp-Source: ABdhPJz/Mzv3lcTWIcJB/eu2sj7N9x6bfZzgkKOYsIHOcNcDxQDAfWM7y+kinqJzkx7zq7dcl8mlNw==
X-Received: by 2002:a62:160c:0:b029:20a:7b41:f10f with SMTP id 12-20020a62160c0000b029020a7b41f10fmr11899212pfw.67.1616211421008;
        Fri, 19 Mar 2021 20:37:01 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a468:a574:c1f5:b1a1])
        by smtp.gmail.com with ESMTPSA id i22sm6211094pjz.56.2021.03.19.20.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 20:36:59 -0700 (PDT)
Date:   Fri, 19 Mar 2021 20:36:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ims-pcu - drop redundant driver-data assignment
Message-ID: <YFVt2X3He5OT3+ju@google.com>
References: <20210318155525.22496-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318155525.22496-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 18, 2021 at 04:55:25PM +0100, Johan Hovold wrote:
> The driver data for the data interface has already been set by
> usb_driver_claim_interface() so drop the subsequent redundant
> assignment.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Applied, thank you.

-- 
Dmitry
