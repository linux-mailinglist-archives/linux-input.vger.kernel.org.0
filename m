Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30EE32F70AC
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 03:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbhAOCjv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 21:39:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbhAOCjv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 21:39:51 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B64AC061757
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 18:39:05 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id i5so5095407pgo.1
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 18:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fRDLUAnMV4W5LTd7YwU8Eg9d/U3dd23J9T5poIBKzTo=;
        b=jLBlylEfglXyMt337Jovv+Tj4cspqn1eEHvm6tZ3FHWdMeiMEE0oWQTFuT8BagEg3P
         5DwygBEYcPvWQ0xIXXTzjZ6QI4nkturzNVxKVs647SLxgCSUd5WriTXfpjKbGp5x97rP
         j/D0A0wVQJk31MUwH1owYyHKzQwHcB9ZKYdWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fRDLUAnMV4W5LTd7YwU8Eg9d/U3dd23J9T5poIBKzTo=;
        b=qgXfJUepnxLnZAo4C6FsksRT5iJudmTdqxG9jE/ldtc5I9k8dNfqMbkEKZOq4wBtzX
         MUQC6jB2o0FqEEjVHcqjBAo8/g3WWzswq5cCXtaStGBdxOHIx3PvJqmWOBICUH5L7aUH
         Je3SIxxj9BJ4su+QiMbZuSgSA0D/W1t5zCgrZm4Y2R4GpR8/r15ZuTBdnaGmhoV8ABSo
         hk9eeRbKBtm22FlFOfwC/5LchofoqJ9ljkOCK7E8piuJQTAKMc4L26Nqoj5tbVghYZym
         7llxFvbP52Mj4PIOLQb5TFsSykWmzv5c+PTyYpmu7KfT7J4EAmK2SL6KA2Buj4Z+7bjv
         QDPg==
X-Gm-Message-State: AOAM533y4ZNj1rWtvOMz2cXN8Z9SWDLTbmvMqrjSx0dlVHKHyImcIjkF
        34w1Uz08O/qGBWnqKHkic+dJGw==
X-Google-Smtp-Source: ABdhPJx5jSeXLUAkNliCTE5Rl1V0h6B0hP37E5oRYNx00LoRSNaRtQDIOXUMdWG9+VXsEeOYNACLHw==
X-Received: by 2002:aa7:95b6:0:b029:1ae:8a7b:59ac with SMTP id a22-20020aa795b60000b02901ae8a7b59acmr10373413pfk.15.1610678345177;
        Thu, 14 Jan 2021 18:39:05 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id s7sm6086154pfh.207.2021.01.14.18.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 18:39:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114183010.v6.2.I2c219435b0d06a84411ae35c3154e123c52fcd7d@changeid>
References: <20210114183010.v6.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid> <20210114183010.v6.2.I2c219435b0d06a84411ae35c3154e123c52fcd7d@changeid>
Subject: Re: [PATCH v6 2/2] Input: cros-ec-keyb - Expose function row physical map to userspace
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dianders@chromium.org, Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org
To:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>,
        dmitry.torokhov@gmail.com
Date:   Thu, 14 Jan 2021 18:39:03 -0800
Message-ID: <161067834304.3661239.10444715775164261177@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Philip Chen (2021-01-14 18:30:31)
> The top-row keys in a keyboard usually have dual functionalities.
> E.g. A function key "F1" is also an action key "Browser back".
>=20
> Therefore, when an application receives an action key code from
> a top-row key press, the application needs to know how to correlate
> the action key code with the function key code and do the conversion
> whenever necessary.
>=20
> Since the userpace already knows the key scanlines (row/column)
> associated with a received key code. Essentially, the userspace only
> needs a mapping between the key row/column and the matching physical
> location in the top row.
>=20
> So, enhance the cros-ec-keyb driver to create such a mapping
> and expose it to userspace in the form of a function_row_physmap
> attribute. The attribute would be a space separated ordered list of
> row/column codes, for the keys in the function row, in a left-to-right
> order.
>=20
> The attribute will only be present when the device has a custom design
> for the top-row keys.
>=20
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
