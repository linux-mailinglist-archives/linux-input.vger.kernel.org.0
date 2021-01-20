Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0AC2FC7BF
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 03:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbhATCX7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 21:23:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbhATCXx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 21:23:53 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D65C061575;
        Tue, 19 Jan 2021 18:23:12 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id n25so14238764pgb.0;
        Tue, 19 Jan 2021 18:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=StpCu+IHYop8esMbifLbJyHzUE10EVp4PJ3Hqqe+spQ=;
        b=FZA8tKgJfktKMi2XRhlF3pXufbM5bUxNYy04rrKHS+uTPrRgI14BfLMTZYEhVbVJen
         urkYb0qC6cWCAQcNAmEMhuOB/OOxhQBzT1OmRWK00NNlTzdmo5oBYI9aKcYSj0I4zqeC
         m/Q0Y9F0xE5e62x3pbqr6VThv5hTnKSHvVR6+qAMqhN6CzUwfKzAdKfKExBpQZ8ObI9d
         8Uqhb2wMJ1VFkmeg6cv+qxpsdvAyynV20AGm8QzQZk7nLX2yQp9fFZZ9rh/kaTRXY/Ee
         wDbZIRjoUVLoHozg8MKxupEWDpWppJjzJ7ghP+4Fn4oeiKVzinPBHnlXQX9N+NmdYVaH
         kW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=StpCu+IHYop8esMbifLbJyHzUE10EVp4PJ3Hqqe+spQ=;
        b=AoYvR+UW9yujZNLfvKPUf6Fo8pPuxOHIW4kbgCklwlHPJfq0FO4zgIrjygleg6zO4x
         xW9XmvmCancKzgW5xc/nWAGaXA7JKocCt9bzATMqlEbxCJNS0qUp7pFCx0jWeiZUWGdi
         Xhn1lS6U9JwIqDml0/rNq/4e9z/SN9k1u5zfeRU4hL2rUr+q2TfBskCut9GfDBP3tvLJ
         U7TOzevMla9oLOFkWm8Nm4LKXiHWNsXOVXXxeXme7pqRwEDEgb1w8byHLcWET/HUOBhD
         gjCB3U6Rm+0KblOhQ6etI8cRp8nHQdRN9lD19mCJkMy/CO5YYGvBlNoo2NEnO809SSnl
         B9xg==
X-Gm-Message-State: AOAM531ySxPfV1x+AQ/8GlXNV3IDIOAE3yNl8YaW/xOHfyIWe0yeKsA6
        V35TlXqMuoiO2kZlo0XEFEe7EAEn2YM=
X-Google-Smtp-Source: ABdhPJyOMYCAwGTt/Yj5KEjDXJBTJxPKzd+QF8+l11mRe6wLa3nw5hxE8clFF+X4Rsl/tzyuE6Vk+Q==
X-Received: by 2002:aa7:8b51:0:b029:1ae:687f:d39b with SMTP id i17-20020aa78b510000b02901ae687fd39bmr6866300pfd.50.1611109392483;
        Tue, 19 Jan 2021 18:23:12 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id n7sm371663pfn.141.2021.01.19.18.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 18:23:11 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:23:09 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 4/5] input: touchscreen: surface3_spi: Remove set but
 unused variable 'timestamp'
Message-ID: <YAeUDTUiUA+ntcBo@google.com>
References: <20210114152323.2382283-1-lee.jones@linaro.org>
 <20210114152323.2382283-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210114152323.2382283-5-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 14, 2021 at 03:23:22PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/surface3_spi.c: In function ‘surface3_spi_process_touch’:
>  drivers/input/touchscreen/surface3_spi.c:97:6: warning: variable ‘timestamp’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
