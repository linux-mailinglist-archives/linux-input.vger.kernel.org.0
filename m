Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038BC2FC7B5
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 03:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbhATCWl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 21:22:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbhATCWd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 21:22:33 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA78DC0613C1;
        Tue, 19 Jan 2021 18:21:40 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id n10so14197364pgl.10;
        Tue, 19 Jan 2021 18:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vWHNRfwABbUraVqFkFTQr7XSIyiT1jtKh3OuTzrpthc=;
        b=k1qeSwGNN0GWH7GLKB8v8cxgETplSpoY362p64c0qcDPgJK/Lc4OaiGGmGsS5YDmjC
         AGorFHKhCe2Dr9cqTwPQ1tio3TBZ8RGShNrc8oYcNVO2QlRiHMmu/G0EKZ3vwve6Ag7E
         a0g3w9B6mfpSFAUJS9KzmU9VeuUSgewmmKJoGbuzs3h3tyTUBHDN+MqtkAXBW6TY7bDc
         cvR7plbCOi+Km1kqiLyXxw83VdDwlNqhXYGv3sbWbjahkt1tMmfxAhhgv34YOV4l6cMf
         J4Q6ZlGrYgCEN/JU++i3ZabdVHcP7DnxzQlLqt3ya8ayWJRXr1uaDhETDtJQVtwGe9Lk
         ccSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vWHNRfwABbUraVqFkFTQr7XSIyiT1jtKh3OuTzrpthc=;
        b=LZOEUbyDen6Joogd5FwAr0hRyUPNeXkAEvypxQY6i4O+TXe05JNFdTyx806rnISzmU
         2Kfb67/VgOGJUSG3pTIagK9K+aM8FMIgMx5gpjuIQLWID1JsIwKk+iJwufIsSYiB9dOl
         2uFe4AwiNa5kDWUGXy2Rw4hbHYZRciZhcQq2S/fJkavXALQaYJw+Ipl0YHydsxr0GQ3o
         rhs07DOKE0qVgSyzRzEqkkVnZkxEo49sPpc9Wwf4ukKmoIRYetyAK8FaJAAXFKm/tg8E
         tBmikuEI64wu01aWH/4+6TGlr+akz+ppgPYROBTKX/Ld4FKRr+XuJraLCXitHtFRJ3J/
         ZBag==
X-Gm-Message-State: AOAM531quiPO7oAucUNK/tbJEsbvDQI9gdnNtfdSFrrv2zNNn01uQaeq
        fTUatFsu/Ox9z0HF6Otiuh0=
X-Google-Smtp-Source: ABdhPJw4AP5mI8rMcc/PkA1EO0gn5sv8qzQDVbPBLJWFTzq0Fj2PKPxfL3d0fYdK3hHtZ7BMjgVAOQ==
X-Received: by 2002:a63:700f:: with SMTP id l15mr7106727pgc.214.1611109300198;
        Tue, 19 Jan 2021 18:21:40 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id r5sm350400pfl.165.2021.01.19.18.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 18:21:39 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:21:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Hilliard <james.hilliard1@gmail.com>,
        Daniel Ritz <daniel.ritz@gmx.ch>, linux-input@vger.kernel.org
Subject: Re: [PATCH 3/5] input: touchscreen: usbtouchscreen: Actually check
 return value of usb_submit_urb()
Message-ID: <YAeTsOUGdE9BEjtS@google.com>
References: <20210114152323.2382283-1-lee.jones@linaro.org>
 <20210114152323.2382283-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210114152323.2382283-4-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 14, 2021 at 03:23:21PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/usbtouchscreen.c: In function ‘nexio_read_data’:
>  drivers/input/touchscreen/usbtouchscreen.c:1052:50: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Daniel Ritz <daniel.ritz@gmx.ch>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
