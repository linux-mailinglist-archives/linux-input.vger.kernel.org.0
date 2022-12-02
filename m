Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8985B641180
	for <lists+linux-input@lfdr.de>; Sat,  3 Dec 2022 00:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbiLBXbJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Dec 2022 18:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233221AbiLBXbJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Dec 2022 18:31:09 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A04FDC852;
        Fri,  2 Dec 2022 15:31:08 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id h33so5574076pgm.9;
        Fri, 02 Dec 2022 15:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+uNqCEeu7dG5G3kIE8+ZSAPdqcoSCP8Xlv5kyhG8kWQ=;
        b=pJgo5YjBfXoi8sPZgHvGCYuBSc1wl41lqqO+9xWjElEt4rQUTJPMpYhBu6S5vfeZrm
         XxtLWb/cjDe1t6wpNHRB4WGg1ZcANn6cmMu08o3X0RwQ0jmB+l1EH6j5fUDCScXYibEo
         lApHDJzjv8fYKDx2D+mRMqaXgFmRgKlsbka4Ih2U0nbweo4W9QYl89/GkfX7Sn5piwvK
         8iZf3Be+OGlsPp77KSYY4KHa/qDyjNKfut8+CF1flqw9kuFstKUSJZX/zPhYaI6bytfm
         HAuzG3GHKkDRKu5LaMH8Euo7Zuz3FyIO/NXN7oXjpu8OvLCAVt0YLKOAB0SrNsDaRSZW
         epaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uNqCEeu7dG5G3kIE8+ZSAPdqcoSCP8Xlv5kyhG8kWQ=;
        b=NIuqZlcTME7CXsy2bCBRdSRz+7PrLboHPU6mN12SB9CTI+Ew5gWleT+nqFjvXTUQ1p
         oc2B/jfLHRL3+pG/x1i4Ry6Q9+kzHZEy7xuYS0dKCvUJWWIcToSeCMZqBxH4Yfw4aneq
         SqmbOpdMcuhBo1AZuPo1XJKZ1uC1pFFCbamNj8BWfvXO8k36SfgSSZOhKpXBB3XPQh2c
         FCklSrrVOexINHqaGlE+wgoyLmEH4S44JoR3fmiDyd0kEYDxHmXFksV80D6TnULworrt
         SIFTPAH9lxtG2D4Ap6C0KJF3p/nDudWCGVYUlZzY166BlsUcrG8/cdxzkc1gtzUgbxBw
         uFlA==
X-Gm-Message-State: ANoB5pl/sHx8LaK56o2YzjWnl3s7GzBpip7sy7YX7/R/7FCzDdDszzgm
        RXTmI6OYhIDbibN8Ru/N3mA=
X-Google-Smtp-Source: AA0mqf5hCaZLP6bBfCK1JottI3Az8xmaZRF5SwLCqq1E9h/ZmYYMRTnYBx4oYTPT4h6ODTmFCeQitw==
X-Received: by 2002:aa7:810e:0:b0:56b:f23a:7854 with SMTP id b14-20020aa7810e000000b0056bf23a7854mr59650325pfi.66.1670023867793;
        Fri, 02 Dec 2022 15:31:07 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:cc0e:e156:5def:3b2e])
        by smtp.gmail.com with ESMTPSA id f9-20020a170902684900b001887e30b9ddsm6011922pln.257.2022.12.02.15.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 15:31:07 -0800 (PST)
Date:   Fri, 2 Dec 2022 15:31:03 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: input: gpio-beeper: Convert to yaml schema
Message-ID: <Y4qKt4K7Wm3mkZxn@google.com>
References: <20221120012135.2085631-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221120012135.2085631-1-festevam@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Nov 19, 2022 at 10:21:35PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Convert the bindings from plain text to yaml schema.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thank you.

-- 
Dmitry
