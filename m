Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4279B2FC7A9
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 03:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbhATCSB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 21:18:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730603AbhATCRx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 21:17:53 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00644C061575;
        Tue, 19 Jan 2021 18:17:12 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id z21so14215791pgj.4;
        Tue, 19 Jan 2021 18:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t00TCy5wC+D/qG4tfIGdU9KwNyTzKMrXg9QaOPRF4Ro=;
        b=PAEasWe/eKvuH5ckT6Ewy3isYgo9T9iZXojfJkFRUNrZrWMGnetPLL7qG/zP+QJU+U
         FxCA47meW4jKiuf2TaW4UAFlGIxApus8zQGruX3tqXrlNbl5I3M3rcEHHNyvrfMteqNV
         7xN+6lYayp3j+eA8MLAioG+Iue3i0Ey3h6WNq+0M6hL/iHHyk0aXnMZrs0m1laDgJf/8
         7S45d1fmHJhO4cQ2PHB1PpGOl+TrheS//7FIVOzKy7nw7M9trm4Gv3QX8Ic1YMdPRRRL
         6EKHtlMGs3HXCOoFPFk6uGfWzct4hdeXbbNSqpU0VRRDiaq7v8DnTSZRKH3rynB6FDHU
         XhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t00TCy5wC+D/qG4tfIGdU9KwNyTzKMrXg9QaOPRF4Ro=;
        b=YlVMtinOAttQa7fOWHxy5Tu2i2u6J2iMoFzzJFRDcZ2KAuPJA3awPo6ccrPbNLIL21
         L5OmaSohTKB3AFUeuANOkcSSV5KaeYaCBhvOBTnu6UBU+QMeEthKGP1HipwOewNp93KV
         QOrUn8f1CeLuvhQT4/SPcZ+pSedPZOUnSxc7BIQ/MPZxIibrV3M5h/QZBBbn4rF0UBwr
         XYgseXAtDqpbNKXJcPOBD/AhWoo9ezNDsRBxxmIQ/oTW8JNqMwPqRYVoJeJnSa0xzJHt
         Zq/5kG/I/ONl/DbukWJ8mO2eW1ip4TtH3i7zztNAtQiLVJh9qgCo0o+4RhNJTGgmh7Cn
         4auw==
X-Gm-Message-State: AOAM531AwiTOJMjDLtruaQDDF+cCV2GjVTIPGY4KFqYVsNxAOv2jiDOw
        7ID3vIHuKuQWxdHsO0cIeM8=
X-Google-Smtp-Source: ABdhPJwgHSk1Ov4cHl9ao26GOKsNXQPq6Xf5/0h3Ik0npPPEKPBB5oIvpeD25qEdt7HB9+FnUr0RcA==
X-Received: by 2002:aa7:9af4:0:b029:19d:975a:3ef2 with SMTP id y20-20020aa79af40000b029019d975a3ef2mr7136388pfp.5.1611109032534;
        Tue, 19 Jan 2021 18:17:12 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id f7sm241450pjs.25.2021.01.19.18.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 18:17:11 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:17:09 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH 2/3] input/touchscreen: Add device tree support to
 wacom_i2c
Message-ID: <YAeSpUIzV/3dWPC+@google.com>
References: <20210117042428.1497-1-alistair@alistair23.me>
 <20210117042428.1497-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210117042428.1497-2-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 16, 2021 at 08:24:27PM -0800, Alistair Francis wrote:
> Allow the wacom-i2c device to be exposed via device tree.

The patch seems incomplete. I see we are reading and storing properties,
but we are not using them whatsoever, so I do not see the reason to have
this in this form.

Thanks.

-- 
Dmitry
