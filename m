Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724E731FF3D
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 20:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhBSTN0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Feb 2021 14:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhBSTNZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Feb 2021 14:13:25 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED8FAC061756;
        Fri, 19 Feb 2021 11:12:44 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id e9so3890921plh.3;
        Fri, 19 Feb 2021 11:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xHL0tcHTSbkROx1RrvQTYjKwNbQ4sW6lJ5aTU43rCIw=;
        b=KYmXa/Q4n0R52taiNdJf/nwL7etIdULvA82reWG/HosC4LGgR79RhasxU63VqiYsPI
         +VI5l2SGoXn95lNSI+65kUt9vzQ57AqReq5uKX/T9ZU18sKTQFiG/ZcBXILG073ho4gN
         Ht+ekVV3NAL475uKkMSGrZOw+FdQFlGtvXe3NEs7iVa3Tuvm9ui9Nt3Z76kQ8Yj/TLlV
         rza8DouePj5Pf1u5sHOYcGSZrYf429zBeG3L+t/MCvPNnJMkJs5DJGveX2kNwCYPUm9E
         eF/TmbpMPgguoho4W9cd43Rs+nUSCSmF6/ANl8usZb3WNkXkJ5BD1zdbL5vOS3mZO/PE
         HWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xHL0tcHTSbkROx1RrvQTYjKwNbQ4sW6lJ5aTU43rCIw=;
        b=HIH5h7/g+xkOAI487PS0vkEvaXankkaVt+6QqNNWXo3q/AHCUXz0ci3ib0cI9R7IoD
         DxTVEplje3DNlwVERpYoiKWChP/rubnmxK1CVEK95C+K2BaHAW0S8G9cToBGCVqowfBT
         oaGx2Tyd8FYNqfGDqWBMsipiJwU8hizaDnSjxEOZ9lHgCwVCD3zadDrLvcic2jTCCmoX
         VWIR5XkGT6vi8ROGT2WQTwKMjvajIOIaaj997lUrwwg4ehzbYzohjmvfR8gp02+6qIrE
         0sDkcr0A24XQDlOOE/hpMAWnpjP9s9Mcax5MykZwb0pqZ4oL09XjbJa0+ohIE6LBekqk
         RJKw==
X-Gm-Message-State: AOAM5322ALgEmi4w6qqH/xGBGAlQqB79JaLPmWOFRfVkZl7gZ0xzvTua
        EBE0CPAtBH0nQ7ZN/D58saZUD3wnw8w=
X-Google-Smtp-Source: ABdhPJwbGJqK4z8CD+NbJMbo0tiKt2fonW8LWvYQJiKZkqmupHu8kAesXYTBdplRYFEqltap4zFuXg==
X-Received: by 2002:a17:902:704c:b029:e3:1bd3:6318 with SMTP id h12-20020a170902704cb02900e31bd36318mr10368729plt.20.1613761964501;
        Fri, 19 Feb 2021 11:12:44 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7d43:dae1:3b24:51b7])
        by smtp.gmail.com with ESMTPSA id 188sm8766404pfc.98.2021.02.19.11.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 11:12:43 -0800 (PST)
Date:   Fri, 19 Feb 2021 11:12:41 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: applespi: Fix occasional crc errors under
 load.
Message-ID: <YDANqSjtjwSYvqsj@google.com>
References: <20210217190718.11035-1-ronald@innovation.ch>
 <20210217190718.11035-2-ronald@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210217190718.11035-2-ronald@innovation.ch>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Feb 17, 2021 at 11:07:17AM -0800, Ronald Tschalär wrote:
> For some reason, when the system is under heavy CPU load, the read
> following the write sometimes occurs unusually quickly, resulting in
> the read data not being quite ready and hence a bad packet getting read.
> Adding another delay after reading the status message appears to fix
> this.
> 
> Signed-off-by: Ronald Tschalär <ronald@innovation.ch>

Applied, thank you.

-- 
Dmitry
