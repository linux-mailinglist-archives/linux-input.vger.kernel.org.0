Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE62429B07
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 03:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234330AbhJLBd7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Oct 2021 21:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbhJLBd7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Oct 2021 21:33:59 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AAB7C061570;
        Mon, 11 Oct 2021 18:31:58 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 133so12376360pgb.1;
        Mon, 11 Oct 2021 18:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JN8v54LeipJeYyNhtrVL0FNG8zho/hvYlwrieKnepzs=;
        b=BzaYLFpQc+z52UONCvo4bZd+CrTBA9Dzn/UB6HG75CaHtyZMepabEhDz+bv6+sDAKg
         XMgNfImSJDygOyU7BshTJKyXcUh8ht4rxuVm45ogkUuh/0vRJm4PBqs3jEtrTxqAEiKY
         CAqVOr60shv/fq/ZKjo/9HXjy4Xi7rtrTREihf76WCu+fvuqpdE0KWCpre6SFsU10OD9
         yHQfSCfHVEq4GGxvKTsaGF25gqeGONORtdzHQMx/TTt2KQnr21RG63zvYQJdok3bw3qc
         uhPLWL4+7Ne/0YycU83oeFMcn2apu2czQUXg221jWnab1VED7m/Da6LCfIq/UHJFKf8p
         sslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JN8v54LeipJeYyNhtrVL0FNG8zho/hvYlwrieKnepzs=;
        b=OATxm/63DPGSw91MErd9BFKRIzWLKkV/3T3h+1FO5aJjWmlJAUBvl7/q+82tVpQHbE
         NzUrFkWlNA2R5nK8tRIfHVj2iur69RsrjgspATHYvdx0QSOluOaaalOZGZV6z/9nQJ0W
         1aoS+u8cK+67aceeo24FqRw9kj0ZVoAWR6HeCrITmyX0PV1w+fL8By0J+wUwtam7yNoU
         /LAPUMO0vEtEHuTHFQRmS043Cf/YBiw0kpTANpapoAo9xqDMN+kEgtiJi78550H9RCFZ
         1v3q4AMv0x/8yZHxwUAOBbHMW9Ye5YSOx/9wtieiKWO2rw0ccgNMgP5YTP6smWT50XKJ
         rqdA==
X-Gm-Message-State: AOAM532HD92lUAbP1VM7/fzlmXmu/vUxmkxEjtIVaz0RNO0QSIyUK7Yb
        /HP2csNBpCDuj0FrxUJYhZDuwhYvT0E=
X-Google-Smtp-Source: ABdhPJzG8qEmeMxB+6MmceSNqyBMtE3x246SMKFqZPgKrTdYqKYpUU+ZoG1sb5ZhxJ072ioVCcsTDQ==
X-Received: by 2002:a63:3e4a:: with SMTP id l71mr20070375pga.318.1634002317366;
        Mon, 11 Oct 2021 18:31:57 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:10fb:4b55:2926:7ada])
        by smtp.gmail.com with ESMTPSA id o6sm9047141pfp.79.2021.10.11.18.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:31:56 -0700 (PDT)
Date:   Mon, 11 Oct 2021 18:31:53 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     John Keeping <john@metanate.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Andrej Valek <andrej.valek@siemens.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: st1232 - prefer asynchronous probing
Message-ID: <YWTlidGfIGXukwCC@google.com>
References: <20211007111217.1935858-1-john@metanate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007111217.1935858-1-john@metanate.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 07, 2021 at 12:12:16PM +0100, John Keeping wrote:
> The device may take up to 100ms to become responsive during probe, so
> prefer asynchronous probing to avoid delaying the rest of the system.
> 
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: John Keeping <john@metanate.com>

Applied, thank you.

-- 
Dmitry
