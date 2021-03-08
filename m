Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBB93307A7
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 06:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbhCHFoW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 00:44:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234603AbhCHFoD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 00:44:03 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F9DC06174A
        for <linux-input@vger.kernel.org>; Sun,  7 Mar 2021 21:44:03 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id x29so5719366pgk.6
        for <linux-input@vger.kernel.org>; Sun, 07 Mar 2021 21:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SE772XdwyZI+NAOjCNlNFPQv9RN62eu1FEaew+dK14E=;
        b=oOGBLJV1SzgRUoiZ0onHpTRiuSPlPr+BOimLWYQAHutKYOycAESNZTJCKbQqHAp5ax
         FioIOTXES6AsEryo/vLJvJh9WIVOpwjQA3GrfS7csgcvQEqbtRpjU6cAtqft28NTD5NT
         ciXDsF3b+l7ihO30NrTcufMC2bLiFP1/iwWQe/kopDQ74NUih3l0zR0KadhcvTDt0viz
         FCdw09Ye43lfk3Q/zlEfjxypF/vZh9tB56xD+mjw9ebMsvQ6E/67rn1ImkHYD/k8zRvv
         L3Mo4Nnj+xrFeQ+LoCVbPl6z7pgaeH9myp6YkXWMXb/9QLogybwzqX7USpTMhr7/CGu8
         3Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SE772XdwyZI+NAOjCNlNFPQv9RN62eu1FEaew+dK14E=;
        b=U1bQxx1RZS7TQBo3nTqq7vkzoLa/dgWCAfBGAwEPsJHv38LzwubOK3XedtUAZYYRPw
         rLUe/9JxRJ5A90S2NyvH2cds7KMH/naIqh4tp0o7Heq4NrSUJLji3FnzvZCVM5i5vxJy
         Wy7rLVBa3MDIqXHGPbfn2kD/4vc4xiaX7YRQexEYJ5NqM04DCoappuHBKW3Qohh//369
         SqPN5oN0gUyOuvY+5O5eT0wbByGf8tUAAx1oh66/7B0QegQ/CSoih0yMriLHgCaK4jHd
         B8ABITI9RXPyRJ75uZqVOxAlutUgSiYuA+BNJdTetGaD81HDuFxRmSFUEFfZA+GOxyU0
         441Q==
X-Gm-Message-State: AOAM531YqshBkFyBJZFqK+O+Vcnyy8W4SxaLxe7gT/L7FzKJ+Z/az5BV
        cBzud6Okqo0YDBXrmHLaNEk=
X-Google-Smtp-Source: ABdhPJz0cKMJ2U+x0kIc86LgrZ9k0ywC0QOFPA22thlci8AqhqTMBv5pPZJ8zihoT3zz13BuUYl8LA==
X-Received: by 2002:a63:5464:: with SMTP id e36mr19241421pgm.223.1615182243417;
        Sun, 07 Mar 2021 21:44:03 -0800 (PST)
Received: from google.com ([2620:15c:202:201:39e0:7b5c:9fa7:f6e0])
        by smtp.gmail.com with ESMTPSA id b14sm9265154pji.14.2021.03.07.21.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 21:44:02 -0800 (PST)
Date:   Sun, 7 Mar 2021 21:43:58 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH v3 2/5] Input: exc3000 - factor out vendor data request
Message-ID: <YEW5nqi1MsmVqI29@google.com>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
 <20210125182527.1225245-3-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125182527.1225245-3-l.stach@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 25, 2021 at 07:25:24PM +0100, Lucas Stach wrote:
> Factor out the vendor data i2c request handling to make it reusable
> for other functions. Also don't cache the model and firmware version
> string in the device private data as we never use the cached version,
> but always read from the device.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thank you.

-- 
Dmitry
