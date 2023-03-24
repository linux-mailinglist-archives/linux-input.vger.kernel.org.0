Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933EB6C74F7
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 02:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCXBYK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 21:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjCXBYJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 21:24:09 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68047FF22
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:24:08 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id q102so227317pjq.3
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679621048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U6g2YviX1tlMR1JZxaAS6g8K5yywZPtfVvgyf/xYSZ0=;
        b=X0JFCiFWVvU0fhFm3q+giGDwBwRwudurEE1lxdavdesGKPs36BtVgDtay4NY+QZm32
         EgC/2X5YP3Qo+FKuskJPxNdGJvuL1n4Lt5Z5RkqfeB+fmg6A1jH7/95myqZe5dOmSNXl
         CgXff2RbbnwO6hjsQo1TOBtW7y6PwE+Sr6PK/8j0qz6OGhTy7hDzW4s3SuGFbpRifDOl
         4jGLAlqx7UOhvOS1zW/goc7dSiBsOI19UyLSkz+gAI7SMsvtgncqmsW10kA3zphL05p7
         SRCKU1yWNaU4AdlvAFJ2Jra7SlN4/N35i0CzUoWkRmYcYNePsIDQ7ut+EczT0dh9fCd3
         z6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679621048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6g2YviX1tlMR1JZxaAS6g8K5yywZPtfVvgyf/xYSZ0=;
        b=LJBFv9Jo2hly6ZPNLTcUHZmUncOqlSmQB69zdbYswgN/swqkTVnfcbYEsFsxVPtxjj
         dMf4vkWXX6bqfQnsSFNdC1bIwbPlKhtUw0fUP1BBz8wC/ke9w8+SePQbEWt5NCj2CYC3
         RB+DB94KTg0B6hqPuEQpDPgiXPPF1HcrOWeVd6/2whlGKwK8DD7GJ1Tu8E1Pj/TB6Agt
         Rk9bteRjUK0+hnwu/dxFkfdPkC6QASY5hDrqKT3TQ+AB0DMaIDAkwpxxsgilL8zmEwQc
         VY8hOGfDGcSSKnud2aL0zugMzosAensnrINBB0axS901gtFLvlSgbcPGf72/fPtrXBim
         PAyg==
X-Gm-Message-State: AAQBX9f53U+Cq4SPVqZkHdXfEUMdDU9kgaNgIbwUi/YHos9dBjocAQJ1
        ua/R/xHXCqAO1/bx3T0KQnn6JPGacnI=
X-Google-Smtp-Source: AKy350YurVnQT/v/H2CBxv6xBeJ+x04xjuXcC1NpuSq6WZAFX/infJcEEC1hAqL4HlHshTh6veIrMg==
X-Received: by 2002:a17:90b:4c8b:b0:23f:44da:208d with SMTP id my11-20020a17090b4c8b00b0023f44da208dmr873986pjb.47.1679621047599;
        Thu, 23 Mar 2023 18:24:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f5e9:5a97:54ee:6f66])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902a9c400b0019f3da8c2a4sm12886620plr.69.2023.03.23.18.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 18:24:07 -0700 (PDT)
Date:   Thu, 23 Mar 2023 18:24:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 1/3] Input: xpad - Treat Qanba controllers as Xbox360
 controllers
Message-ID: <ZBz7tKvsZ53tc4D8@google.com>
References: <20230203022758.3982393-1-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203022758.3982393-1-vi@endrift.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 02, 2023 at 06:27:56PM -0800, Vicki Pfau wrote:
> From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
> 
> They act that way in PC mode.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Sorry, this patch is a complete mess with regard to the sender, the
author, and the person giving their signed-off-by.

> ---
>  drivers/input/joystick/xpad.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 2959d80f7fdb..bb65c8268963 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -492,6 +492,7 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
>  	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
>  	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
> +	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
>  	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
>  	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
>  	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
> -- 
> 2.39.1
> 

Thanks.

-- 
Dmitry
