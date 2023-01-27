Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C59AC67F192
	for <lists+linux-input@lfdr.de>; Fri, 27 Jan 2023 23:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjA0W6f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Jan 2023 17:58:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbjA0W6e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Jan 2023 17:58:34 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84A5D7E06C
        for <linux-input@vger.kernel.org>; Fri, 27 Jan 2023 14:58:30 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso10077261pjg.2
        for <linux-input@vger.kernel.org>; Fri, 27 Jan 2023 14:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NAuEPe5Fm3duGs4DCCXetocKtRFyGeUA3RnOr/4KXCw=;
        b=eru1HYk6LwctM/6B2LL3sBGZ3/0bJmivo3aoZY5W5S8xfNjI6bRH/mt87zjsvfsBLS
         OwI9DfsSsDJlufSuywzV2FzJahIJHpFp4+esN3r3TdfeYZWAjyLH1MNbNkJ+fSnItrES
         SQ0ojeXs08BelsOLDtaV65K0gr9choTyZg6FwYLQc/e4lZ7rezoMTaxS//sV5yWWw1sr
         7rATurTQPn9qjGG0lD97SKiiBN1MOwDvPtB9pbN03EBkX+9NSmGO0nUvcKTcHAC+nR6A
         1wPH9uWhRkndZolP8g8tXdGfXhG2dVbCr6lrlc4K9hjUQjxNjhQDyetbO/9FkjwNJUYd
         CPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAuEPe5Fm3duGs4DCCXetocKtRFyGeUA3RnOr/4KXCw=;
        b=gVVJZDgCLLjSHY+rqMYm16DW2OMxU4qgnQxrhMsbXyLsdPgpNBq7xVdIio7iKMy0FI
         2Bb7zoVZTuS9k90aqVUWZWgLORmy8EECB8bReteU7lzdi5fUac25m0vVUkrCWotEqU7n
         uhGUDtltm4SLRcUQC+0AjWfc1g7xenNVfvrn3hHgPGN//veeiRv7epVJ50HVbrw1IiRv
         SSuc+CjC5Z4jOqF5+iiCoadUYOQ76Yquw83F+K0EOwkqNiWs8YjFApT23X7xM6qf79/5
         EkwgNZV6k64AxxmNq/5hTXYpargmUE27sC75VpyUx2dyJH97sFINzNqy9q+64P3CumFR
         YNBg==
X-Gm-Message-State: AO0yUKX9fvbkgrhGThy4yQH40l3uwHeRlDG/Ip73d1cESdBXo1NB0RZn
        pvs2PtQPAAIhb5TkXnEvhFntbEW2XYc=
X-Google-Smtp-Source: AK7set8hNW2HjVi5vP8k8Ch+1iDO/D5Jnb4EmWrFocmqt+RbYQMzBV0JZ/8wQ+h7dqpbq/x/TYnPkg==
X-Received: by 2002:a17:903:1106:b0:196:40ff:97b5 with SMTP id n6-20020a170903110600b0019640ff97b5mr8908183plh.40.1674860309861;
        Fri, 27 Jan 2023 14:58:29 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:f44a:5afb:bb52:dec3])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902c94600b0019625428cefsm3333806pla.281.2023.01.27.14.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 14:58:29 -0800 (PST)
Date:   Fri, 27 Jan 2023 14:58:26 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     John Butler <radon86dev@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add 8BitDo Pro 2 Wired Controller support
Message-ID: <Y9RXEpfd9mJiEUa9@google.com>
References: <20230124005206.80706-1-radon86dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124005206.80706-1-radon86dev@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 24, 2023 at 12:52:06AM +0000, John Butler wrote:
> Add VID and PID to the xpad_device table to allow driver
> to use the 8BitDo Pro 2 Wired Controller, which is
> XTYPE_XBOX360 compatible by default.
> 
> Signed-off-by: John Butler <radon86dev@gmail.com>
> Cc: linux-input@vger.kernel.org

Applied, thank you.

-- 
Dmitry
