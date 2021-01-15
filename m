Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33772F86CA
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 21:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729905AbhAOUfY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jan 2021 15:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729094AbhAOUfX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jan 2021 15:35:23 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB07C061794
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 12:34:43 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id y8so5295865plp.8
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 12:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=4hMQzIP7zncuEyTAF7vrSSyWWXAfnsAF2txZ6DpQGl0=;
        b=lV+8rLzVC+fHAT1RWHN1CqmepqVfLE7nL2pb0A4UtoCnS2X9fb9QSl7Xnmd8FzGpfe
         N4aGc4YXEKfiApjhdY95uV63VYCRla77pGl4+Cdtm0C4KBZTWJRv8DOpJAY/bIxpAxS4
         W56HkqP4Uhx43E/HMYYn6Ejirix+1jpb+WNWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=4hMQzIP7zncuEyTAF7vrSSyWWXAfnsAF2txZ6DpQGl0=;
        b=STbXZOJDh9iWH+0CtPz2ChMGRO0H9utIh7BJABsFVfdAHLlHXGnHjUWy+11c3mTunK
         x0YbuxgC3/Kjt4NsegkYm1NOs5+CtZpK+iWDXUjp4vJp3UYRh8HoDCAYEP4fozDN/l3T
         tPwvksdKlTGrKiPvT07D+bqBmSSBG5vbUkcdbUG7plq+WV/EM8LSOTSUiHMgyZBfIYlF
         TDIB6HF7FpdkWowhs0quThOSkU7W7She4FN2pKXFG7aJGu+I5eryKu8YxM2/0mav/V1d
         oBJBoAR9ul5Q0ne7DaBtI0XpoSq3U8sVZOY1S1gnw9YsjIgp+FnTnRsdIVHJw7fx5DAL
         uqVQ==
X-Gm-Message-State: AOAM5305TuVAi2HCTo5Il7I7yiT4Ppem5e9rWxS3CahtP2BHs8oebZ2O
        30qabXXPp9xgyYgCw0t+sZjetg==
X-Google-Smtp-Source: ABdhPJz1nLXYFEaOAioEotXUO7q1rW8sjhz58pZi0ECZu2DClr0YJtYPz2CVbPVeTj5KSnfS1O7nzg==
X-Received: by 2002:a17:902:8607:b029:db:eb10:eebb with SMTP id f7-20020a1709028607b02900dbeb10eebbmr14524055plo.43.1610742883241;
        Fri, 15 Jan 2021 12:34:43 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id y8sm1731960pfq.106.2021.01.15.12.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 12:34:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210115122412.v7.2.I6542d7d9d0b246e7079bb16b41e697b2ac4b4e39@changeid>
References: <20210115122412.v7.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid> <20210115122412.v7.2.I6542d7d9d0b246e7079bb16b41e697b2ac4b4e39@changeid>
Subject: Re: [PATCH v7 2/2] Input: cros-ec-keyb - Expose function row physical map to userspace
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dianders@chromium.org, Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rajat Jain <rajatja@google.com>, linux-input@vger.kernel.org
To:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>,
        dmitry.torokhov@gmail.com
Date:   Fri, 15 Jan 2021 12:34:41 -0800
Message-ID: <161074288129.3661239.8671522224671695448@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Philip Chen (2021-01-15 12:24:30)
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
> row/column codes for the keys in the function row, in a left-to-right
> order.
>=20
> The attribute will only be present when the device has a custom design
> for the top-row keys.
>=20
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
