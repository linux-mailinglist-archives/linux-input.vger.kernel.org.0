Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6330A7DAA89
	for <lists+linux-input@lfdr.de>; Sun, 29 Oct 2023 03:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjJ2CyX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Oct 2023 22:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ2CyW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Oct 2023 22:54:22 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F9FCC;
        Sat, 28 Oct 2023 19:54:20 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-577e62e2adfso2325065a12.2;
        Sat, 28 Oct 2023 19:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698548060; x=1699152860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c8Ad4IK0kybFM1k7TSKyGMSMPkHhzxeJmmhckcgCxTs=;
        b=VRjEeplTlHJG+1oPW7VaXi79RrZhjVrXsK37Q7KMhRTk6l2hXoQyY+xkqctXwtd1H9
         TXrnSIZpuz8TeWGKhn8iaETUOqghco5pLO7qc30JOvmYK7ZkpOeJN62QLXb62ghEubmb
         LqCb/beHdtGKNJnXvGiaIdVLNizN0xZitVf1qOXY7Kc9lEyKisSac8/aK269XFlnW5JF
         C5xcOhCR5ggydArp/ulKMD+x2Px5fZu+1/WCwCx6fZryp0aJJwMhY+Se//CbNzNWOKaJ
         kUnmPqIP5864olzVemqvtLaD7wdlLImFQqo7+JllUDlBjIxF8rFHmwkPnbAQ7aebo7gF
         dduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698548060; x=1699152860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8Ad4IK0kybFM1k7TSKyGMSMPkHhzxeJmmhckcgCxTs=;
        b=TNG4QSQsiyi4JUc/V6XVaV+YBbWK6dB6C2JtEYpDHjhMHG9MJj4Gs5wbgrLeqXDikU
         +wdk2TrUxIsnToYE8xa+b3TgxLweQvGbPaER83kgrw7ySTCWbkkxvxUWeL57LLPgYMnL
         RJYYsotXNlXMs/6KKfqp/UVs2233GeNbfaeiZl97sMM8c2se2d7bAUrCq/irTO1MTTm5
         IGH2AxpqDws+7CVrCVFutbxNMWBsj2r+djjB3SEry+1+a0lgC/4YsyNtki19Lsw7JAgn
         ltJOIwp008Veomj8SiUCynU2XNH5cVO1X3cosWQxg14PwdS81D/I7IXx6og2UVpt3Gjq
         6tKg==
X-Gm-Message-State: AOJu0YxEOPFPR/5BSQY8cYzuuU5vQeXxHrB6jaOl5g6HOM8H4rAq7HA6
        WUX1XG8mdcQNeFlCJQoxyME=
X-Google-Smtp-Source: AGHT+IH1ZIjgKbDJu+Sz7YzWme1WJLgfKnF/NCTVyOfOOjc8KwHzbgtC8BAdZ3gnqrF3EwzvfM1q/g==
X-Received: by 2002:a17:902:f1d1:b0:1cc:2456:c17a with SMTP id e17-20020a170902f1d100b001cc2456c17amr3193184plc.33.1698548059529;
        Sat, 28 Oct 2023 19:54:19 -0700 (PDT)
Received: from google.com ([205.220.129.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001c60635c13esm3798662plg.115.2023.10.28.19.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 19:54:18 -0700 (PDT)
Date:   Sun, 29 Oct 2023 02:54:01 +0000
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Christopher Heiny <cheiny@synaptics.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics-rmi4 - fix use after free in
 rmi_unregister_function()
Message-ID: <ZT3JSaeOOHYZpKb8@google.com>
References: <706efd36-7561-42f3-adfa-dd1d0bd4f5a1@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <706efd36-7561-42f3-adfa-dd1d0bd4f5a1@moroto.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 27, 2023 at 03:18:28PM +0300, Dan Carpenter wrote:
> The put_device() calls rmi_release_function() which frees "fn" so the
> dereference on the next line "fn->num_of_irqs" is a use after free.
> Move the put_device() to the end to fix this.
> 
> Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thank you.

-- 
Dmitry
