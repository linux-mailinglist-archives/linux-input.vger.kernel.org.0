Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DB532250F
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 06:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbhBWFIj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 00:08:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbhBWFIi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 00:08:38 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859CDC06174A;
        Mon, 22 Feb 2021 21:07:58 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id ba1so9135524plb.1;
        Mon, 22 Feb 2021 21:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SYGync7saJqpTp8on5YxPwCqbhgl0f35zf1jfu9WQ0M=;
        b=ZHuPmI//IrwY1V1bvqk4/reYcmqQg5g5gP7ye1B5d6sMIgF67pdr4HVi5ks8ayQ0xE
         DRoGoT9/4IbkoHx3e3pVkhbldSticcekbxPgFcibD3qwUsii4fW2jpH4cwAAHthFRUkV
         w58paOg4zD4Oi0N0ow23pcCFl6JTJLqdDSCZ0En3eHNMQo+j09EAqVVvyNE6dJFfYBv5
         0PH10kwCjuR6nlfj9N/3JHntycM8Sg1nKac2zKVTpytL/xnTuCbB4HqeomMtGY9c1RcK
         RnMpkfE5jwvoh+hn4xxVpt1gtqENkyhtgG2SsrPQnZQht/GYnMsSMLlyXv4ENHatZPSD
         n+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SYGync7saJqpTp8on5YxPwCqbhgl0f35zf1jfu9WQ0M=;
        b=WkYdW3/O1NAD8lPLfK7ENM7lkAbh8jGgvnXfmqiQjHxI1iLuAAlgFy2yaBR47L8+0I
         dWtClzhuM2RHKhPptIee9jFwlka+6j3E71ckGxpyAKi22SvmQORPdBMSO5ia3hgEML1u
         +SEO4loQE3xbBJi59Zcq2gvnmsdhiekVPsfSQ8Lsw9GB/+4n3XSUx9zTIVqsPVnR3V4X
         a/iKRQQFpubnnM7jlDsUWcn1/MeWTTdfh4mZZFyvn+7X6DXef9hISIZpqHz29L+YFLn3
         sTmX8yBzonaCPyCPivS7fktexSMJxLGYk/iAD9eEZydNLF+B7xXi3UB7gQ2pdQcQEQLd
         IxGw==
X-Gm-Message-State: AOAM532V6UQiLELHmxiFqf5a9OkXaMaPXGSgUNR+3t7gGCfxT690Npkt
        1PKmR6uaLxcW1cwLXyuvxR8=
X-Google-Smtp-Source: ABdhPJyBlJfHH+H6khcIVDi1CcnzuKjdpb5HIYyjXCI6Y0mCVsRqgbiJtmDko7c1HaEwzeBqZLMx5Q==
X-Received: by 2002:a17:902:c204:b029:e3:eb55:16b8 with SMTP id 4-20020a170902c204b02900e3eb5516b8mr11131272pll.83.1614056878078;
        Mon, 22 Feb 2021 21:07:58 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bc19:4f46:855:edfc])
        by smtp.gmail.com with ESMTPSA id p4sm12443868pfn.46.2021.02.22.21.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 21:07:57 -0800 (PST)
Date:   Mon, 22 Feb 2021 21:07:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Philip Chen <philipchen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, swboyd@chromium.org,
        dianders@chromium.org, Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rajat Jain <rajatja@google.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH v7 2/2] Input: cros-ec-keyb - Expose function row
 physical map to userspace
Message-ID: <YDSNqndb/GasqFs5@google.com>
References: <20210115122412.v7.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <20210115122412.v7.2.I6542d7d9d0b246e7079bb16b41e697b2ac4b4e39@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115122412.v7.2.I6542d7d9d0b246e7079bb16b41e697b2ac4b4e39@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 15, 2021 at 12:24:30PM -0800, Philip Chen wrote:
> The top-row keys in a keyboard usually have dual functionalities.
> E.g. A function key "F1" is also an action key "Browser back".
> 
> Therefore, when an application receives an action key code from
> a top-row key press, the application needs to know how to correlate
> the action key code with the function key code and do the conversion
> whenever necessary.
> 
> Since the userpace already knows the key scanlines (row/column)
> associated with a received key code. Essentially, the userspace only
> needs a mapping between the key row/column and the matching physical
> location in the top row.
> 
> So, enhance the cros-ec-keyb driver to create such a mapping
> and expose it to userspace in the form of a function_row_physmap
> attribute. The attribute would be a space separated ordered list of
> row/column codes for the keys in the function row, in a left-to-right
> order.
> 
> The attribute will only be present when the device has a custom design
> for the top-row keys.
> 
> Signed-off-by: Philip Chen <philipchen@chromium.org>

Applied, thank you.

-- 
Dmitry
